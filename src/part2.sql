--function

CREATE OR REPLACE FUNCTION public.get_margin(typ integer DEFAULT 1, len integer DEFAULT 15, OUT "Customer_ID" integer,
                                             OUT "Group_ID" integer, OUT "Group_Margin" numeric) RETURNS SETOF record
    LANGUAGE plpgsql
AS
$$
BEGIN
    IF typ = 1 THEN
        RETURN QUERY SELECT t1."Customer_ID", t1."Group_ID", SUM("Group_Summ_Paid" - "Group_Cost")
                     FROM purchase_history t1
                              CROSS JOIN analysis t2
                     WHERE "Transaction_DateTime" BETWEEN t2."Analysis_Formation" - MAKE_INTERVAL(days=>len) AND t2."Analysis_Formation"
                     GROUP BY 1, 2;
    ELSE
        RETURN QUERY WITH s1 AS (SELECT t1."Customer_ID",
                                        t1."Group_ID",
                                        "Transaction_ID",
                                        ROW_NUMBER()
                                        OVER (PARTITION BY t1."Customer_ID",t1."Group_ID" ORDER BY "Transaction_DateTime" DESC) AS nm
                                 FROM purchase_history t1)
                     SELECT t1."Customer_ID", t1."Group_ID", SUM("Group_Summ_Paid" - "Group_Cost")
                     FROM purchase_history t1
                              INNER JOIN s1 t2
                                         ON t1."Transaction_ID" = t2."Transaction_ID" AND t1."Group_ID" = t2."Group_ID"
                     WHERE nm <= len
                     GROUP BY 1, 2;
    END IF;
END
$$;

--Client view
CREATE OR REPLACE VIEW public.clients_view AS
WITH sss AS (WITH ss AS (WITH s AS (SELECT cc."Customer_ID",
                                           AVG("Transaction_Summ")                                   AS av,
                                           MAX("Transaction_DateTime") - MIN("Transaction_DateTime") AS cfi,
                                           COUNT(*)                                                  AS cnt,
                                           ta."Analysis_Formation" - MAX("Transaction_DateTime")     AS cipi
                                    FROM customer t1
                                             INNER JOIN customer_card cc ON t1."Customer_ID" = cc."Customer_ID"
                                             INNER JOIN transaction t ON cc."Customer_Card_ID" = t."Customer_Card_ID"
                                             CROSS JOIN analysis ta
                                    GROUP BY ta."Analysis_Formation", 1
                                    ORDER BY 2 DESC)
                         SELECT *,
                                CASE
                                    WHEN PERCENT_RANK() OVER (ORDER BY av DESC) <= 0.1 THEN 'High'
                                    WHEN PERCENT_RANK() OVER (ORDER BY av DESC) <= 0.35 THEN 'Medium'
                                    ELSE 'Low'
                                    END                               AS "Customer_Average_Check_Segment",
                                EXTRACT(EPOCH FROM cfi) / 86400 / cnt AS "Customer_Frequency",
                                EXTRACT(EPOCH FROM cipi) / 86400      AS "Customer_Inactive_Period"
                         FROM s)
             SELECT *,
                    CASE
                        WHEN PERCENT_RANK() OVER (ORDER BY "Customer_Frequency") <= 0.1 THEN 'Often'
                        WHEN PERCENT_RANK() OVER (ORDER BY "Customer_Frequency") <= 0.35 THEN 'Occasionally'
                        ELSE 'Rarely'
                        END AS "Customer_Frequency_Segment",
                    CASE
                        WHEN "Customer_Inactive_Period" / "Customer_Frequency" <= 2 THEN 'Low'
                        WHEN "Customer_Inactive_Period" / "Customer_Frequency" < 5 THEN 'Medium'
                        ELSE 'High'
                        END AS "Customer_Churn_Segment"
             FROM ss),
     fmagaz AS (WITH aa AS (WITH a AS (SELECT *,
                                              ROW_NUMBER()
                                              OVER (PARTITION BY "Customer_ID" ORDER BY "Transaction_DateTime" DESC) AS rn
                                       FROM transaction t1
                                                INNER JOIN customer_card cc ON t1."Customer_Card_ID" = cc."Customer_Card_ID")
                            SELECT "Customer_ID", "Transaction_Store_ID"
                            FROM a
                            WHERE rn <= 3
                            GROUP BY "Customer_ID", "Transaction_Store_ID"
                            HAVING COUNT(*) = 3),
                     bb AS (WITH b AS (SELECT "Customer_ID",
                                              "Transaction_Store_ID",
                                              COUNT(*)::numeric / COUNT(*) OVER (PARTITION BY "Customer_ID") tri,
                                              MAX("Transaction_DateTime") AS                                 dmax
                                       FROM transaction t1
                                                INNER JOIN customer_card cc ON t1."Customer_Card_ID" = cc."Customer_Card_ID"
                                       GROUP BY 1, 2)
                            SELECT *, ROW_NUMBER() OVER (PARTITION BY "Customer_ID" ORDER BY tri DESC,dmax DESC) AS rn
                            FROM b)
                SELECT bb."Customer_ID", COALESCE(aa."Transaction_Store_ID", bb."Transaction_Store_ID") AS magaz
                FROM bb
                         LEFT JOIN aa ON bb."Customer_ID" = aa."Customer_ID"
                WHERE rn = 1
                ORDER BY bb."Customer_ID", bb."Transaction_Store_ID", tri)
SELECT sss."Customer_ID",
       av                                                AS "Customer_Average_Check",
       sss."Customer_Average_Check_Segment",
       "Customer_Frequency",
       "Customer_Frequency_Segment",
       "Customer_Inactive_Period",
       "Customer_Inactive_Period" / "Customer_Frequency" AS "Customer_Churn_Rate",
       "Customer_Churn_Segment",
       CASE
           WHEN ("Customer_Average_Check_Segment" = 'Low'::text) THEN 0
           WHEN ("Customer_Average_Check_Segment" = 'Medium'::text) THEN 9
           ELSE 18
           END +
       CASE
           WHEN ("Customer_Frequency_Segment" = 'Rarely'::text) THEN 0
           WHEN ("Customer_Frequency_Segment" = 'Occasionally'::text)
               THEN 3
           ELSE 6
           END +
       CASE
           WHEN ("Customer_Churn_Segment" = 'Low'::text) THEN 1
           WHEN ("Customer_Churn_Segment" = 'Medium'::text) THEN 2
           ELSE 3
           END                                           AS "Customer_Segment",
       magaz                                             AS "Customer_Primary_Store"
FROM sss
         INNER JOIN fmagaz ON sss."Customer_ID" = fmagaz."Customer_ID";

--Purchase history view

CREATE OR REPLACE VIEW public.purchase_history AS
SELECT t3."Customer_ID",
       t1."Transaction_ID",
       t1."Transaction_DateTime",
       t5."Group_ID",
       SUM((t6."SKU_Purchase_Price" * t2."SKU_Amount")) AS "Group_Cost",
       SUM(t2."SKU_Summ")                               AS "Group_Summ",
       SUM(t2."SKU_Summ_Paid")                          AS "Group_Summ_Paid"
FROM ((((public.transaction t1
    JOIN public.cheque t2 ON ((t1."Transaction_ID" = t2."Transaction_ID")))
    JOIN public.customer_card t3 ON ((t1."Customer_Card_ID" = t3."Customer_Card_ID")))
    JOIN public.sku t5 ON ((t2.sku_id = t5.sku_id)))
    JOIN public.store t6 ON (((t1."Transaction_Store_ID" = t6."Transaction_Store_ID") AND (t5.sku_id = t6.sku_id))))
WHERE "Transaction_DateTime" <= (SELECT "Analysis_Formation" FROM analysis)
GROUP BY t3."Customer_ID", t1."Transaction_ID", t1."Transaction_DateTime", t5."Group_ID";


--periods view

CREATE OR REPLACE VIEW public.periods
            ("Customer_ID", "Group_ID", "First_Group_Purchase_Date", "Last_Group_Purchase_Date", "Group_Purchase",
             "Group_Frequency", "Group_Min_Discount")
AS
WITH mind AS (SELECT t1_1."Customer_ID",
                     t1_1."Group_ID",
                     MIN(t2_1."SKU_Discount" / t2_1."SKU_Summ") AS minpd
              FROM purchase_history t1_1
                       JOIN cheque t2_1 ON t1_1."Transaction_ID" = t2_1."Transaction_ID"
                       JOIN sku t3 ON t2_1.sku_id = t3.sku_id AND t3."Group_ID" = t1_1."Group_ID"
              WHERE t2_1."SKU_Discount" > 0::numeric
              GROUP BY t1_1."Customer_ID", t1_1."Group_ID"
              ORDER BY t1_1."Customer_ID", t1_1."Group_ID"),
     alld AS (WITH data AS (SELECT t1_1."Customer_ID",
                                   t1_1."Group_ID",
                                   t1_1."Transaction_DateTime",
                                   t1_1."Transaction_ID"
                            FROM purchase_history t1_1
                                     JOIN cheque t2_1 ON t1_1."Transaction_ID" = t2_1."Transaction_ID"
                                     JOIN sku t3 ON t2_1.sku_id = t3.sku_id AND t3."Group_ID" = t1_1."Group_ID"
                            GROUP BY t1_1."Customer_ID", t1_1."Group_ID", t1_1."Transaction_DateTime",
                                     t1_1."Transaction_ID")
              SELECT data."Customer_ID",
                     data."Group_ID",
                     MIN(data."Transaction_DateTime")                                AS "First_Group_Purchase_Date",
                     MAX(data."Transaction_DateTime")                                AS "Last_Group_Purchase_Date",
                     COUNT(*)                                                        AS "Group_Purchase",
                     (TO_CHAR(MAX(data."Transaction_DateTime") - MIN(data."Transaction_DateTime"),
                              'DD'::text)::numeric + 1::numeric) / COUNT(*)::numeric AS "Group_Frequency"
              FROM data
              GROUP BY data."Customer_ID", data."Group_ID")
SELECT t1."Customer_ID",
       t1."Group_ID",
       t1."First_Group_Purchase_Date",
       t1."Last_Group_Purchase_Date",
       t1."Group_Purchase",
       t1."Group_Frequency",
       COALESCE(t2.minpd, 0::numeric) AS "Group_Min_Discount"
FROM alld t1
         LEFT JOIN mind t2 ON t2."Group_ID" = t1."Group_ID" AND t2."Customer_ID" = t1."Customer_ID";

--Groups view

CREATE OR REPLACE VIEW public.groups
            ("Customer_ID", "Group_ID", "Group_Affinity_Index", "Group_Churn_Rate", "Group_Stability_Index",
             "Group_Margin", "Group_Discount_Share", "Group_Minimum_Discount", "Group_Average_Discount")
AS
WITH allg AS (SELECT DISTINCT t3_1."Customer_ID",
                              t5_1."Group_ID"
              FROM transaction t1_1
                       JOIN cheque t2_1 ON t1_1."Transaction_ID" = t2_1."Transaction_ID"
                       JOIN customer_card t3_1 ON t1_1."Customer_Card_ID" = t3_1."Customer_Card_ID"
                       JOIN sku t5_1 ON t2_1.sku_id = t5_1.sku_id
              WHERE t1_1."Transaction_DateTime" < ((SELECT analysis."Analysis_Formation"
                                                    FROM analysis))),
     group_stability_index_v AS (WITH days AS (SELECT t1_2."Customer_ID",
                                                      t1_2."Group_ID",
                                                      TO_CHAR(t1_2."Transaction_DateTime" -
                                                              LAG(t1_2."Transaction_DateTime", 1)
                                                              OVER (PARTITION BY t1_2."Customer_ID", t1_2."Group_ID" ORDER BY t1_2."Transaction_DateTime"),
                                                              'DD'::text)::integer AS num
                                               FROM purchase_history t1_2
                                                        JOIN periods t2_2 ON t1_2."Customer_ID" = t2_2."Customer_ID" AND
                                                                             t1_2."Group_ID" = t2_2."Group_ID"
                                               WHERE t1_2."Transaction_DateTime" <
                                                     ((SELECT analysis."Analysis_Formation"
                                                       FROM analysis))
                                               ORDER BY t1_2."Customer_ID", t1_2."Group_ID",
                                                        t1_2."Transaction_DateTime")
                                 SELECT t1_1."Customer_ID",
                                        t1_1."Group_ID",
                                        AVG(
                                                    CASE
                                                        WHEN (t1_1.num::numeric - t2_1."Group_Frequency") > 0::numeric
                                                            THEN t1_1.num::numeric - t2_1."Group_Frequency"
                                                        ELSE (t1_1.num::numeric - t2_1."Group_Frequency") * '-1'::integer::numeric
                                                        END / t2_1."Group_Frequency") AS "Group_Stability_Index"
                                 FROM days t1_1
                                          JOIN periods t2_1 ON t2_1."Group_ID" = t1_1."Group_ID" AND
                                                               t1_1."Customer_ID" = t2_1."Customer_ID"
                                 GROUP BY t1_1."Customer_ID", t1_1."Group_ID"),
     di AS (WITH disco AS (SELECT t3_1."Customer_ID",
                                  t1_1."Transaction_ID",
                                  t5_1."Group_ID"
                           FROM transaction t1_1
                                    JOIN cheque t2_1 ON t1_1."Transaction_ID" = t2_1."Transaction_ID"
                                    JOIN customer_card t3_1 ON t1_1."Customer_Card_ID" = t3_1."Customer_Card_ID"
                                    JOIN sku t5_1 ON t2_1.sku_id = t5_1.sku_id
                           WHERE t1_1."Transaction_DateTime" < ((SELECT analysis."Analysis_Formation"
                                                                 FROM analysis))
                           GROUP BY t3_1."Customer_ID", t1_1."Transaction_ID", t5_1."Group_ID"
                           HAVING SUM(t2_1."SKU_Discount") > 0::numeric)
            SELECT disco."Customer_ID",
                   disco."Group_ID",
                   COUNT(*) AS dicount
            FROM disco
            GROUP BY disco."Customer_ID", disco."Group_ID"),
     avg_disc AS (SELECT cc."Customer_ID",
                         s."Group_ID",
                         AVG(c."SKU_Summ_Paid" / c."SKU_Summ") AS av
                  FROM transaction t1_1
                           JOIN cheque c ON t1_1."Transaction_ID" = c."Transaction_ID"
                           JOIN customer_card cc ON t1_1."Customer_Card_ID" = cc."Customer_Card_ID"
                           JOIN sku s ON c.sku_id = s.sku_id
                  WHERE c."SKU_Discount" > 0::numeric
                  GROUP BY cc."Customer_ID", s."Group_ID")
SELECT t1."Customer_ID",
       t1."Group_ID",
       t3."Group_Purchase"::numeric / ((SELECT COUNT(*) AS count
                                        FROM (SELECT DISTINCT purchase_history."Transaction_ID"
                                              FROM purchase_history
                                              WHERE purchase_history."Customer_ID" = t1."Customer_ID"
                                                AND purchase_history."Transaction_DateTime" >=
                                                    t3."First_Group_Purchase_Date"
                                                AND purchase_history."Transaction_DateTime" <=
                                                    t3."Last_Group_Purchase_Date") sq))::numeric AS "Group_Affinity_Index",
       TO_CHAR(t2."Analysis_Formation" - t3."Last_Group_Purchase_Date", 'DD'::text)::integer::numeric /
       t3."Group_Frequency"                                                                      AS "Group_Churn_Rate",
       COALESCE(t4."Group_Stability_Index", 0::numeric)                                          AS "Group_Stability_Index",
       t5."Group_Margin",
       t6.dicount::numeric / t3."Group_Purchase"::numeric                                        AS "Group_Discount_Share",
       t3."Group_Min_Discount"                                                                   AS "Group_Minimum_Discount",
       t7.av                                                                                     AS "Group_Average_Discount"
FROM allg t1
         CROSS JOIN analysis t2
         JOIN periods t3 ON t1."Group_ID" = t3."Group_ID" AND t1."Customer_ID" = t3."Customer_ID"
         JOIN group_stability_index_v t4 ON t1."Group_ID" = t4."Group_ID" AND t1."Customer_ID" = t4."Customer_ID"
         JOIN get_margin(1, 100000) t5("Customer_ID", "Group_ID", "Group_Margin")
              ON t1."Group_ID" = t5."Group_ID" AND t1."Customer_ID" = t5."Customer_ID"
         JOIN di t6 ON t1."Group_ID" = t6."Group_ID" AND t1."Customer_ID" = t6."Customer_ID"
         JOIN avg_disc t7 ON t1."Group_ID" = t7."Group_ID" AND t1."Customer_ID" = t7."Customer_ID";

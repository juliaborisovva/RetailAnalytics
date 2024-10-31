CREATE OR REPLACE FUNCTION public.part4(method integer, first_date date DEFAULT NULL::date,
                                        last_date date DEFAULT NULL::date,
                                        tr_count integer DEFAULT NULL::integer, kavgc numeric DEFAULT 1,
                                        max_idx_o numeric DEFAULT NULL::numeric, maxdtr numeric DEFAULT NULL::numeric,
                                        dmrg numeric DEFAULT NULL::numeric, OUT "Customer_ID" integer,
                                        OUT "Required_Check_Measure" numeric, OUT "Group_Name" character varying,
                                        OUT "Offer_Discount_Depth" numeric) RETURNS SETOF record
    LANGUAGE plpgsql
AS
$$
DECLARE
    row  record;
    qu   character varying;
    cr   integer = 0;
    mind numeric;
    mavg numeric;
BEGIN
    IF method = 1 THEN
        qu := 'SELECT t1."Customer_ID", t1."Group_ID",avg("Transaction_Summ") AS ag FROM purchase_history t1
            CROSS JOIN analysis t2
            inner join transaction t3 ON t1."Transaction_ID" = t3."Transaction_ID"
            WHERE t3."Transaction_DateTime" BETWEEN ''' || first_date || ''' AND ''' || last_date || '''::DATE + make_interval(hours => 23, mins => 59)
            GROUP BY 1,2 ';
    ELSE

        qu := 'WITH s1 AS (SELECT t1."Customer_ID", "Transaction_Summ", "Transaction_DateTime",
                     ROW_NUMBER() OVER (PARTITION BY t1."Customer_ID" ORDER BY "Transaction_DateTime" DESC) AS nm
              FROM transaction t2
              JOIN customer_card t1 ON t2."Customer_Card_ID" = t1."Customer_Card_ID"
              ORDER BY t1."Customer_Card_ID", "Transaction_DateTime" DESC)
        SELECT t1."Customer_ID", t1."Group_ID", avg("Transaction_Summ") AS ag
        FROM purchase_history t1
                 INNER JOIN s1 t2 ON t1."Customer_ID" = t2."Customer_ID"
        WHERE nm <= ' || tr_count || '
        GROUP BY 1, 2';
    END IF;

    qu := '
        WITH s AS (' || qu || ')
        SELECT t1.*,
               t2."Group_ID",
                t3."Group_Name",
               "Group_Affinity_Index",
               "Group_Churn_Rate",
               "Group_Discount_Share",
               "Group_Average_Discount",
               "Group_Minimum_Discount",
               "Group_Margin","Group_Stability_Index"
        FROM s t1
                 INNER JOIN "group" t3 ON t1."Group_ID" = t3."Group_ID"
                 INNER JOIN groups t2 ON t1."Customer_ID" = t2."Customer_ID" AND t1."Group_ID" = t2."Group_ID" ' ||
          '
        WHERE "Group_Churn_Rate" <= ' || max_idx_o || '
          AND "Group_Discount_Share" < ' || maxdtr / 100 || '
        ORDER BY "Customer_ID", "Group_Minimum_Discount", "Group_Affinity_Index" desc';

    FOR row IN EXECUTE qu
        LOOP
            IF row."Customer_ID" <> cr THEN

                "Customer_ID" = row."Customer_ID";
                "Required_Check_Measure" = row.ag * kavgc;
                "Group_Name" = row."Group_Name";

                SELECT AVG("Group_Summ_Paid" - "Group_Cost")
                INTO mavg
                FROM purchase_history t1
                         CROSS JOIN analysis t2
                WHERE t1."Customer_ID" = row."Customer_ID"
                  AND t1."Group_ID" = row."Group_ID";

                "Offer_Discount_Depth" := mavg * (dmrg / 100);
                mind := (FLOOR((row."Group_Minimum_Discount"::numeric(10, 2) * 100) / 5) * 0.05);
                IF (mavg > 0 AND row."Group_Minimum_Discount"::numeric(10, 2) > 0 AND
                    mind * mavg < "Offer_Discount_Depth") THEN
                    cr := row."Customer_ID";
                    IF mind = 0 THEN mind = 0.05; END IF;
                    "Offer_Discount_Depth" := mind * 100;
                    RETURN NEXT;
                END IF;

            END IF;
        END LOOP;
END
$$;

SELECT *
FROM part4(2, '2022-06-16', '2022-06-16', 100, 1.15, 3, 70, 30);
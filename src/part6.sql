CREATE OR REPLACE FUNCTION public.part6(group_count integer, maxio numeric, maxis numeric, maxdsku integer,
                                        dmarge integer,
                                        OUT "Customer_ID" integer, OUT "SKU_Name" character varying,
                                        OUT "Offer_Discount_Depth" numeric) RETURNS SETOF record
    LANGUAGE plpgsql
AS
$$
DECLARE
    row  record;
    dsku numeric;
    mind numeric;
BEGIN
    FOR row IN
        WITH rws AS (WITH maxmg AS (WITH mg AS (SELECT t3."sku_id",
                                                       "Group_ID",
                                                       "SKU_Retail_Price",
                                                       "SKU_Purchase_Price",
                                                       MAX("SKU_Retail_Price" - "SKU_Purchase_Price")
                                                       OVER (PARTITION BY t3."Group_ID") AS mcm
                                                FROM store t1
                                                         INNER JOIN sku t3 ON t1.sku_id = t3.sku_id)
                                    SELECT *
                                    FROM mg
                                    WHERE "SKU_Retail_Price" - "SKU_Purchase_Price" = mcm)
                     SELECT t1."Customer_ID",
                            t2.*,
                            ROW_NUMBER()
                            OVER (PARTITION BY t1."Customer_ID" ORDER BY t1."Group_Affinity_Index") AS group_num,
                            "Group_Minimum_Discount",
                            t3."SKU_Name",
                            "Group_Churn_Rate",
                            "Group_Stability_Index",
                            "Group_Affinity_Index"
                     FROM groups t1
                              INNER JOIN maxmg t2
                                         ON t1."Group_ID" = t2."Group_ID"
                              INNER JOIN sku t3 ON t2.sku_id = t3.sku_id
                     WHERE "Group_Churn_Rate" <= maxio
                       AND "Group_Stability_Index" < maxis
                     ORDER BY "Customer_ID", "Group_Affinity_Index")
        SELECT rws.*
        FROM rws
                 INNER JOIN clients_view ON rws."Customer_ID" = clients_view."Customer_ID" AND
                                            "Customer_Average_Check_Segment" = 'Low'
        WHERE group_num <= group_count
        LOOP
            WITH sku_cnt AS (WITH sku_list AS (SELECT DISTINCT t1."Transaction_ID"
                                               FROM cheque t1
                                                        INNER JOIN transaction t2 ON t2."Transaction_ID" = t1."Transaction_ID"
                                                        INNER JOIN customer_card t3 ON t2."Customer_Card_ID" = t3."Customer_Card_ID"
                                               WHERE sku_id = row.sku_id
                                                 AND t3."Customer_ID" = row."Customer_ID")
                             SELECT COUNT(*)::numeric AS s_count
                             FROM sku_list),
                 group_cnt AS (WITH group_list AS (SELECT DISTINCT t1."Transaction_ID"
                                                   FROM cheque t1
                                                            INNER JOIN sku t2 ON t1.sku_id = t2.sku_id
                                                            INNER JOIN transaction t4 ON t4."Transaction_ID" = t1."Transaction_ID"
                                                            INNER JOIN customer_card t3 ON t4."Customer_Card_ID" = t3."Customer_Card_ID"
                                                   WHERE "Group_ID" = row."Group_ID"
                                                     AND t3."Customer_ID" = row."Customer_ID")
                               SELECT COUNT(*)::numeric AS g_count
                               FROM group_list)
            SELECT s_count / g_count
            INTO dsku
            FROM sku_cnt,
                 group_cnt;
            IF dsku <= maxdsku::numeric / 100 THEN
                mind := (FLOOR((row."Group_Minimum_Discount" * 100) / 5) * 5)::numeric / 100;
                RAISE INFO '% >= %',((dmarge::numeric / 100) * row.mcm) / row."SKU_Retail_Price",mind;
                IF CEIL(((((dmarge::numeric / 100) * row.mcm) / row."SKU_Retail_Price") * 100) / 5) * 5 / 100
                    >= mind THEN
                    "Customer_ID" := row."Customer_ID";
                    "SKU_Name" := row."SKU_Name";
                    IF mind = 0 THEN mind = 0.05; END IF;
                    "Offer_Discount_Depth" := mind * 100;
                    RETURN NEXT;
                END IF;
            END IF;
        END LOOP;
END
$$;

SELECT *
FROM part6(5, 3, 0.5, 100, 30);

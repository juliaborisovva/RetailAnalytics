DROP FUNCTION IF EXISTS public.part5 CASCADE;


CREATE OR REPLACE FUNCTION public.part5(IN first_date timestamp WITHOUT TIME ZONE,
                                        IN sec_date timestamp WITHOUT TIME ZONE,
                                        IN transac integer, IN max_ind numeric, IN max_share_disc_trans numeric,
                                        IN margin_share numeric, OUT "Customer_ID" integer,
                                        OUT "Start_Date" timestamp WITHOUT TIME ZONE,
                                        OUT "End_Date" timestamp WITHOUT TIME ZONE,
                                        OUT "Required_Transactions_Count" numeric,
                                        OUT "Group_Name" character varying,
                                        OUT "Offer_Discount_Depth" numeric) RETURNS SETOF record
    LANGUAGE plpgsql
AS
$$
DECLARE
    row  record;
    mavg numeric;
    mind numeric;
    cr   integer = 0;
BEGIN
    "Start_Date" := first_date;
    "End_Date" := sec_date;
    FOR row IN SELECT (EXTRACT(EPOCH FROM (sec_date::timestamp WITHOUT TIME ZONE - first_date)) /
                       "Customer_Frequency")::integer + transac AS rtc,
                      g."Customer_ID"                           AS ci,
                      g."Group_ID"                              AS gi,
                      *
               FROM clients_view
                        INNER JOIN groups g ON clients_view."Customer_ID" = g."Customer_ID"
                        INNER JOIN "group" g2 ON g."Group_ID" = g2."Group_ID"
               WHERE "Group_Churn_Rate" <= max_ind
                 AND "Group_Discount_Share" < (max_share_disc_trans::numeric / 100)
               ORDER BY g."Customer_ID", "Group_Minimum_Discount"
        LOOP
            "Customer_ID" := row.ci;
            "Required_Transactions_Count" := row.rtc;
            "Group_Name" := row."Group_Name";

            SELECT AVG("Group_Summ_Paid" - "Group_Cost")
            INTO mavg
            FROM purchase_history t1
                     CROSS JOIN analysis t2
            WHERE t1."Customer_ID" = row.ci
              AND t1."Group_ID" = row.gi;
            "Offer_Discount_Depth" := mavg * (margin_share / 100);
            mind := (FLOOR((row."Group_Minimum_Discount"::numeric(10, 2) * 100) / 5) * 0.05);
            IF row.ci <> cr THEN
                IF (mavg > 0 AND row."Group_Minimum_Discount"::numeric(10, 2) > 0 AND
                    mind * mavg < "Offer_Discount_Depth") THEN
                    cr := row.ci;
                    IF mind = 0 THEN mind = 0.05; END IF;
                    "Offer_Discount_Depth" := mind * 100;
                    RETURN NEXT;
                END IF;
            END IF;
        END LOOP;
END
$$;

SELECT *
FROM public.part5('18-08-2022 00:00:00',
                  '18-08-2022 00:00:00',
                  1, 3,
                  70, 30);
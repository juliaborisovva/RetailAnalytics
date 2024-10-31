DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

CREATE TABLE public.analysis
(
    "Analysis_Formation" timestamp WITHOUT TIME ZONE
);

CREATE TABLE public.cheque
(
    "Transaction_ID" integer,
    sku_id           integer,
    "SKU_Amount"     numeric,
    "SKU_Summ"       numeric,
    "SKU_Summ_Paid"  numeric,
    "SKU_Discount"   numeric
);

CREATE TABLE public.customer
(
    "Customer_ID"            integer NOT NULL,
    "Customer_Name"          character varying,
    "Customer_Surname"       character varying,
    "Customer_Primary_Email" character varying,
    "Customer_Primary_Phone" character varying,
    CONSTRAINT "customer_Primary_Phone_check" CHECK ((("Customer_Primary_Phone")::text ~ '^((\+7)+([0-9]){10})$'::text)),
    CONSTRAINT "customer_Customer_Name_check" CHECK ((("Customer_Name")::text ~
                                                      '^([А-Я]{1}[а-яё\- ]{0,}|[A-Z]{1}[a-z\- ]{0,})$'::text)),
    CONSTRAINT "customer_Customer_Primary_Email_check" CHECK ((("Customer_Primary_Email")::text ~
                                                               '^((([0-9A-Za-z]{1}[-0-9A-z\.]{0,}[0-9A-Za-z]{1})|([0-9А-Яа-я]{1}[-0-9А-я\.]{0,}[0-9А-Яа-я]{1}))@([-A-Za-z]{1,}\.){1,2}[-A-Za-z]{2,})$'::text)),
    CONSTRAINT "customer_Customer_Surname_check" CHECK ((("Customer_Surname")::text ~
                                                         '^([А-Я]{1}[а-яё\- ]{0,}|[A-Z]{1}[a-z\- ]{0,})$'::text))
);

CREATE TABLE public.customer_card
(
    "Customer_Card_ID" integer NOT NULL,
    "Customer_ID"      integer
);

CREATE TABLE public.transaction
(
    "Transaction_ID"       integer NOT NULL,
    "Customer_Card_ID"     integer,
    "Transaction_Summ"     numeric,
    "Transaction_DateTime" timestamp WITHOUT TIME ZONE,
    "Transaction_Store_ID" integer
);


CREATE TABLE public."group"
(
    "Group_ID"   integer NOT NULL,
    "Group_Name" character varying
);


CREATE TABLE public.sku
(
    sku_id     integer NOT NULL,
    "SKU_Name" character varying,
    "Group_ID" integer
);

CREATE TABLE public.store
(
    "Transaction_Store_ID" integer NOT NULL,
    sku_id                 integer NOT NULL,
    "SKU_Purchase_Price"   numeric,
    "SKU_Retail_Price"     numeric
);


CREATE SEQUENCE public."customer_Customer_ID_seq";
ALTER SEQUENCE public."customer_Customer_ID_seq" OWNED BY public.customer."Customer_ID";

CREATE SEQUENCE public."customer_card_Customer_Card_ID_seq";
ALTER SEQUENCE public."customer_card_Customer_Card_ID_seq" OWNED BY public.customer_card."Customer_Card_ID";

CREATE SEQUENCE public."group_Group_ID_seq";
ALTER SEQUENCE public."group_Group_ID_seq" OWNED BY public."group"."Group_ID";

CREATE SEQUENCE public.sku_sku_id_seq;
ALTER SEQUENCE public.sku_sku_id_seq OWNED BY public.sku.sku_id;

CREATE SEQUENCE public."transaction_Transaction_ID_seq";
ALTER SEQUENCE public."transaction_Transaction_ID_seq" OWNED BY public.transaction."Transaction_ID";

ALTER TABLE ONLY public.customer
    ALTER COLUMN "Customer_ID" SET DEFAULT NEXTVAL('public."customer_Customer_ID_seq"'::regclass);
ALTER TABLE ONLY public.customer_card
    ALTER COLUMN "Customer_Card_ID" SET DEFAULT NEXTVAL('public."customer_card_Customer_Card_ID_seq"'::regclass);
ALTER TABLE ONLY public."group"
    ALTER COLUMN "Group_ID" SET DEFAULT NEXTVAL('public."group_Group_ID_seq"'::regclass);
ALTER TABLE ONLY public.sku
    ALTER COLUMN sku_id SET DEFAULT NEXTVAL('public.sku_sku_id_seq'::regclass);
ALTER TABLE ONLY public.transaction
    ALTER COLUMN "Transaction_ID" SET DEFAULT NEXTVAL('public."transaction_Transaction_ID_seq"'::regclass);


/*
--
-- Data for Name: analysis; Type: TABLE DATA; Schema: public; Owner: student
--

INSERT INTO public.analysis
VALUES ('2023-06-15 17:02:47');


--
-- Data for Name: cheque; Type: TABLE DATA; Schema: public; Owner: student
--

INSERT INTO public.cheque
VALUES (244, 6, 27, 4776.03, 4382.75, 0.00);
INSERT INTO public.cheque
VALUES (59, 24, 28, 16023.00, 14135.67, 1887.33);
INSERT INTO public.cheque
VALUES (162, 12, 19, 4515.54, 4483.79, 0.00);
INSERT INTO public.cheque
VALUES (20, 10, 44, 14784.00, 14784.00, 0.00);
INSERT INTO public.cheque
VALUES (260, 16, 38, 18217.96, 18217.96, 0.00);
INSERT INTO public.cheque
VALUES (126, 26, 19, 14109.02, 14109.02, 0.00);
INSERT INTO public.cheque
VALUES (107, 9, 8, 4704.00, 4704.00, 0.00);
INSERT INTO public.cheque
VALUES (95, 24, 6, 3433.50, 3107.34, 0.00);
INSERT INTO public.cheque
VALUES (24, 23, 15, 8425.20, 6957.72, 1467.48);
INSERT INTO public.cheque
VALUES (72, 29, 19, 13968.99, 13968.99, 0.00);
INSERT INTO public.cheque
VALUES (198, 23, 48, 30132.48, 30132.48, 0.00);
INSERT INTO public.cheque
VALUES (40, 24, 14, 8954.12, 7563.36, 1390.76);
INSERT INTO public.cheque
VALUES (46, 11, 27, 1997.46, 1731.43, 0.00);
INSERT INTO public.cheque
VALUES (204, 7, 10, 3251.30, 3251.30, 0.00);
INSERT INTO public.cheque
VALUES (208, 7, 42, 11599.14, 10076.43, 0.00);
INSERT INTO public.cheque
VALUES (176, 20, 15, 3614.10, 3061.88, 0.00);
INSERT INTO public.cheque
VALUES (244, 19, 46, 22091.96, 18553.73, 0.00);
INSERT INTO public.cheque
VALUES (146, 15, 11, 2293.61, 2293.61, 0.00);
INSERT INTO public.cheque
VALUES (62, 29, 10, 5417.30, 5154.21, 0.00);
INSERT INTO public.cheque
VALUES (235, 21, 2, 98.02, 98.02, 0.00);
INSERT INTO public.cheque
VALUES (228, 26, 4, 2970.32, 2970.32, 0.00);
INSERT INTO public.cheque
VALUES (232, 16, 18, 10478.70, 10478.70, 0.00);
INSERT INTO public.cheque
VALUES (64, 22, 9, 1053.45, 1053.45, 0.00);
INSERT INTO public.cheque
VALUES (273, 9, 18, 10584.00, 9650.05, 0.00);
INSERT INTO public.cheque
VALUES (79, 18, 25, 16697.00, 16697.00, 0.00);
INSERT INTO public.cheque
VALUES (236, 13, 14, 2462.32, 2038.46, 0.00);
INSERT INTO public.cheque
VALUES (83, 19, 47, 22572.22, 19153.30, 0.00);
INSERT INTO public.cheque
VALUES (46, 17, 21, 69.93, 69.93, 0.00);
INSERT INTO public.cheque
VALUES (21, 9, 7, 6247.50, 6247.50, 0.00);
INSERT INTO public.cheque
VALUES (30, 10, 16, 8160.00, 8160.00, 0.00);
INSERT INTO public.cheque
VALUES (197, 2, 18, 8820.00, 8364.16, 0.00);
INSERT INTO public.cheque
VALUES (272, 5, 30, 5673.90, 4807.06, 0.00);
INSERT INTO public.cheque
VALUES (88, 25, 25, 8699.50, 8699.50, 0.00);
INSERT INTO public.cheque
VALUES (50, 19, 4, 1415.52, 1305.67, 109.85);
INSERT INTO public.cheque
VALUES (70, 17, 15, 55.80, 55.70, 0.00);
INSERT INTO public.cheque
VALUES (76, 4, 27, 14343.75, 14343.75, 0.00);
INSERT INTO public.cheque
VALUES (74, 7, 19, 6177.47, 6177.47, 0.00);
INSERT INTO public.cheque
VALUES (238, 22, 25, 3270.50, 3270.50, 0.00);
INSERT INTO public.cheque
VALUES (112, 8, 10, 2826.30, 2613.08, 213.22);
INSERT INTO public.cheque
VALUES (242, 3, 25, 1540.75, 1540.75, 0.00);
INSERT INTO public.cheque
VALUES (211, 11, 42, 3107.16, 3107.16, 0.00);
INSERT INTO public.cheque
VALUES (242, 10, 40, 20400.00, 20400.00, 0.00);
INSERT INTO public.cheque
VALUES (244, 16, 6, 3903.84, 3903.84, 0.00);
INSERT INTO public.cheque
VALUES (153, 28, 42, 23010.12, 23010.12, 0.00);
INSERT INTO public.cheque
VALUES (254, 4, 26, 13812.50, 13812.50, 0.00);
INSERT INTO public.cheque
VALUES (43, 21, 28, 1533.84, 1533.84, 0.00);
INSERT INTO public.cheque
VALUES (22, 10, 13, 5631.60, 5631.60, 0.00);
INSERT INTO public.cheque
VALUES (29, 3, 1, 52.35, 52.35, 0.00);
INSERT INTO public.cheque
VALUES (181, 21, 31, 1519.31, 1519.31, 0.00);
INSERT INTO public.cheque
VALUES (234, 14, 42, 10827.18, 9307.00, 1520.18);
INSERT INTO public.cheque
VALUES (120, 20, 30, 7228.20, 7228.20, 0.00);
INSERT INTO public.cheque
VALUES (119, 20, 21, 5059.74, 5059.74, 0.00);
INSERT INTO public.cheque
VALUES (56, 21, 5, 245.05, 245.05, 0.00);
INSERT INTO public.cheque
VALUES (175, 6, 44, 9163.00, 7407.55, 0.00);
INSERT INTO public.cheque
VALUES (206, 23, 33, 20716.08, 17738.05, 0.00);
INSERT INTO public.cheque
VALUES (16, 3, 47, 1908.20, 1629.62, 278.58);
INSERT INTO public.cheque
VALUES (242, 7, 26, 8453.38, 8453.38, 0.00);
INSERT INTO public.cheque
VALUES (250, 18, 32, 21372.16, 21252.59, 119.57);
INSERT INTO public.cheque
VALUES (173, 5, 17, 2118.20, 2008.24, 0.00);
INSERT INTO public.cheque
VALUES (260, 28, 4, 1804.72, 1649.73, 0.00);
INSERT INTO public.cheque
VALUES (257, 10, 4, 1732.80, 1614.17, 118.63);
INSERT INTO public.cheque
VALUES (114, 12, 29, 7702.98, 6737.04, 0.00);
INSERT INTO public.cheque
VALUES (35, 5, 9, 1445.85, 1445.85, 0.00);
INSERT INTO public.cheque
VALUES (247, 5, 1, 160.65, 160.65, 0.00);
INSERT INTO public.cheque
VALUES (281, 20, 49, 9722.58, 8238.90, 0.00);
INSERT INTO public.cheque
VALUES (15, 8, 31, 8761.53, 8471.39, 0.00);
INSERT INTO public.cheque
VALUES (224, 22, 11, 1287.55, 1130.34, 0.00);
INSERT INTO public.cheque
VALUES (54, 28, 39, 21366.54, 19880.59, 0.00);
INSERT INTO public.cheque
VALUES (127, 1, 31, 13175.00, 12818.92, 0.00);
INSERT INTO public.cheque
VALUES (253, 13, 16, 2317.44, 2317.44, 0.00);
INSERT INTO public.cheque
VALUES (220, 2, 14, 10412.50, 9357.02, 0.00);
INSERT INTO public.cheque
VALUES (84, 9, 46, 41055.00, 33124.73, 0.00);
INSERT INTO public.cheque
VALUES (266, 2, 4, 2975.00, 2975.00, 0.00);
INSERT INTO public.cheque
VALUES (50, 14, 21, 4458.30, 4192.51, 0.00);
INSERT INTO public.cheque
VALUES (142, 19, 39, 13801.32, 13290.82, 0.00);
INSERT INTO public.cheque
VALUES (170, 6, 18, 2469.60, 2321.17, 0.00);
INSERT INTO public.cheque
VALUES (237, 3, 24, 1479.12, 1479.12, 0.00);
INSERT INTO public.cheque
VALUES (25, 28, 36, 16242.48, 16242.48, 0.00);
INSERT INTO public.cheque
VALUES (104, 14, 11, 2835.69, 2395.62, 440.07);
INSERT INTO public.cheque
VALUES (78, 5, 10, 1246.00, 1246.00, 0.00);
INSERT INTO public.cheque
VALUES (9, 23, 26, 14603.68, 14582.00, 0.00);
INSERT INTO public.cheque
VALUES (190, 29, 29, 19076.78, 19076.78, 0.00);
INSERT INTO public.cheque
VALUES (273, 21, 15, 605.40, 485.76, 119.64);
INSERT INTO public.cheque
VALUES (273, 6, 43, 5899.60, 5899.60, 0.00);
INSERT INTO public.cheque
VALUES (71, 16, 42, 20135.64, 19975.24, 0.00);
INSERT INTO public.cheque
VALUES (154, 3, 42, 2588.46, 2588.46, 0.00);
INSERT INTO public.cheque
VALUES (92, 27, 14, 1492.40, 1347.94, 144.46);
INSERT INTO public.cheque
VALUES (173, 20, 26, 5158.92, 5158.92, 0.00);
INSERT INTO public.cheque
VALUES (98, 9, 1, 588.00, 588.00, 0.00);
INSERT INTO public.cheque
VALUES (129, 8, 38, 10739.94, 10739.94, 0.00);
INSERT INTO public.cheque
VALUES (108, 21, 30, 1643.40, 1643.40, 0.00);
INSERT INTO public.cheque
VALUES (98, 16, 50, 23971.00, 23971.00, 0.00);
INSERT INTO public.cheque
VALUES (244, 3, 47, 2460.45, 2460.45, 0.00);
INSERT INTO public.cheque
VALUES (72, 26, 40, 33197.60, 33197.60, 0.00);
INSERT INTO public.cheque
VALUES (241, 16, 40, 19176.80, 19176.80, 0.00);
INSERT INTO public.cheque
VALUES (254, 16, 31, 18046.65, 18046.65, 0.00);
INSERT INTO public.cheque
VALUES (147, 20, 5, 1204.70, 1204.70, 0.00);
INSERT INTO public.cheque
VALUES (63, 22, 48, 4626.72, 4626.72, 0.00);
INSERT INTO public.cheque
VALUES (122, 9, 38, 22344.00, 21614.61, 0.00);
INSERT INTO public.cheque
VALUES (152, 25, 7, 2435.86, 2435.86, 0.00);
INSERT INTO public.cheque
VALUES (151, 15, 34, 7089.34, 6417.43, 0.00);
INSERT INTO public.cheque
VALUES (257, 3, 13, 680.55, 609.57, 0.00);
INSERT INTO public.cheque
VALUES (116, 30, 17, 9948.06, 9396.65, 0.00);
INSERT INTO public.cheque
VALUES (33, 15, 8, 1373.68, 1373.68, 0.00);
INSERT INTO public.cheque
VALUES (15, 23, 19, 10671.92, 10408.65, 0.00);
INSERT INTO public.cheque
VALUES (72, 1, 8, 2888.00, 2869.40, 18.60);
INSERT INTO public.cheque
VALUES (238, 28, 29, 17756.99, 17756.99, 0.00);
INSERT INTO public.cheque
VALUES (246, 3, 40, 2094.00, 1971.43, 0.00);
INSERT INTO public.cheque
VALUES (164, 17, 12, 39.96, 39.96, 0.00);
INSERT INTO public.cheque
VALUES (217, 14, 30, 6369.00, 5817.90, 0.00);
INSERT INTO public.cheque
VALUES (217, 17, 49, 134.26, 134.26, 0.00);
INSERT INTO public.cheque
VALUES (80, 12, 6, 1425.96, 1425.96, 0.00);
INSERT INTO public.cheque
VALUES (263, 10, 41, 20910.00, 20910.00, 0.00);
INSERT INTO public.cheque
VALUES (185, 5, 14, 1744.40, 1744.40, 0.00);
INSERT INTO public.cheque
VALUES (236, 2, 15, 11156.25, 10066.06, 0.00);
INSERT INTO public.cheque
VALUES (162, 1, 2, 850.00, 709.57, 0.00);
INSERT INTO public.cheque
VALUES (67, 18, 30, 24330.00, 21119.21, 3210.79);
INSERT INTO public.cheque
VALUES (269, 26, 32, 26558.08, 26558.08, 0.00);
INSERT INTO public.cheque
VALUES (125, 17, 47, 128.78, 128.78, 0.00);
INSERT INTO public.cheque
VALUES (174, 21, 15, 735.15, 735.15, 0.00);
INSERT INTO public.cheque
VALUES (19, 28, 40, 24492.40, 24492.40, 0.00);
INSERT INTO public.cheque
VALUES (106, 17, 13, 35.62, 28.86, 0.00);
INSERT INTO public.cheque
VALUES (273, 4, 3, 1050.00, 1018.08, 0.00);
INSERT INTO public.cheque
VALUES (229, 16, 37, 24073.68, 20170.76, 0.00);
INSERT INTO public.cheque
VALUES (166, 8, 47, 13283.61, 11738.83, 0.00);
INSERT INTO public.cheque
VALUES (196, 16, 6, 2876.52, 2876.52, 0.00);
INSERT INTO public.cheque
VALUES (280, 29, 6, 4411.26, 4129.31, 0.00);
INSERT INTO public.cheque
VALUES (240, 4, 14, 7437.50, 7437.50, 0.00);
INSERT INTO public.cheque
VALUES (102, 19, 37, 13093.56, 13093.56, 0.00);
INSERT INTO public.cheque
VALUES (202, 29, 46, 24919.58, 24919.58, 0.00);
INSERT INTO public.cheque
VALUES (283, 17, 16, 53.28, 53.28, 0.00);
INSERT INTO public.cheque
VALUES (206, 19, 47, 22572.22, 21132.41, 0.00);
INSERT INTO public.cheque
VALUES (179, 14, 26, 6702.54, 6702.54, 0.00);
INSERT INTO public.cheque
VALUES (36, 9, 30, 26775.00, 24946.76, 0.00);
INSERT INTO public.cheque
VALUES (103, 11, 6, 443.88, 443.88, 0.00);
INSERT INTO public.cheque
VALUES (153, 5, 1, 189.13, 189.13, 0.00);
INSERT INTO public.cheque
VALUES (150, 14, 35, 7430.50, 7223.07, 0.00);
INSERT INTO public.cheque
VALUES (14, 21, 38, 2081.64, 1681.79, 399.85);
INSERT INTO public.cheque
VALUES (186, 10, 18, 9180.00, 7510.96, 0.00);
INSERT INTO public.cheque
VALUES (75, 3, 40, 2094.00, 1798.23, 0.00);
INSERT INTO public.cheque
VALUES (241, 30, 14, 6036.66, 6036.66, 0.00);
INSERT INTO public.cheque
VALUES (21, 25, 36, 15211.80, 15211.80, 0.00);
INSERT INTO public.cheque
VALUES (105, 19, 8, 2831.04, 2831.04, 0.00);
INSERT INTO public.cheque
VALUES (133, 10, 9, 4590.00, 4590.00, 0.00);
INSERT INTO public.cheque
VALUES (229, 19, 21, 10085.46, 9771.93, 0.00);
INSERT INTO public.cheque
VALUES (97, 3, 15, 609.00, 609.00, 0.00);
INSERT INTO public.cheque
VALUES (254, 18, 9, 7299.00, 7041.00, 0.00);
INSERT INTO public.cheque
VALUES (208, 24, 4, 2558.32, 2558.32, 0.00);
INSERT INTO public.cheque
VALUES (41, 28, 35, 21430.85, 21430.85, 0.00);
INSERT INTO public.cheque
VALUES (91, 4, 2, 1062.50, 930.64, 131.86);
INSERT INTO public.cheque
VALUES (270, 5, 40, 4984.00, 4984.00, 0.00);
INSERT INTO public.cheque
VALUES (253, 11, 16, 974.88, 974.88, 0.00);
INSERT INTO public.cheque
VALUES (53, 20, 33, 6547.86, 6547.86, 0.00);
INSERT INTO public.cheque
VALUES (281, 30, 35, 15091.65, 13343.53, 0.00);
INSERT INTO public.cheque
VALUES (116, 16, 13, 8458.32, 8315.40, 0.00);
INSERT INTO public.cheque
VALUES (269, 9, 7, 5306.70, 4782.62, 0.00);
INSERT INTO public.cheque
VALUES (131, 1, 30, 12750.00, 12691.57, 0.00);
INSERT INTO public.cheque
VALUES (189, 5, 33, 4111.80, 4111.80, 0.00);
INSERT INTO public.cheque
VALUES (156, 5, 29, 5484.77, 5104.82, 379.95);
INSERT INTO public.cheque
VALUES (17, 15, 28, 5838.28, 5838.28, 0.00);
INSERT INTO public.cheque
VALUES (7, 4, 8, 4250.00, 3734.00, 516.00);
INSERT INTO public.cheque
VALUES (79, 12, 10, 1957.20, 1957.20, 0.00);
INSERT INTO public.cheque
VALUES (93, 18, 41, 33251.00, 33251.00, 0.00);
INSERT INTO public.cheque
VALUES (164, 8, 40, 11305.20, 11305.20, 0.00);
INSERT INTO public.cheque
VALUES (234, 14, 13, 3351.27, 3351.27, 0.00);
INSERT INTO public.cheque
VALUES (40, 16, 20, 13012.80, 12668.82, 0.00);
INSERT INTO public.cheque
VALUES (39, 3, 12, 739.56, 739.56, 0.00);
INSERT INTO public.cheque
VALUES (134, 23, 32, 14801.92, 13024.18, 0.00);
INSERT INTO public.cheque
VALUES (251, 23, 46, 25837.28, 24919.93, 0.00);
INSERT INTO public.cheque
VALUES (51, 8, 20, 3724.00, 3541.39, 182.61);
INSERT INTO public.cheque
VALUES (218, 24, 20, 11445.00, 11445.00, 0.00);
INSERT INTO public.cheque
VALUES (189, 12, 31, 6067.32, 6067.32, 0.00);
INSERT INTO public.cheque
VALUES (106, 15, 32, 5494.72, 5161.23, 333.49);
INSERT INTO public.cheque
VALUES (64, 2, 8, 5950.00, 4972.40, 0.00);
INSERT INTO public.cheque
VALUES (54, 18, 21, 17031.00, 14815.95, 0.00);
INSERT INTO public.cheque
VALUES (143, 7, 22, 7152.86, 6978.70, 0.00);
INSERT INTO public.cheque
VALUES (24, 2, 21, 15618.75, 15618.75, 0.00);
INSERT INTO public.cheque
VALUES (146, 19, 24, 10313.04, 9900.03, 0.00);
INSERT INTO public.cheque
VALUES (101, 10, 11, 5610.00, 5610.00, 0.00);
INSERT INTO public.cheque
VALUES (154, 22, 24, 2809.20, 2809.20, 0.00);
INSERT INTO public.cheque
VALUES (30, 28, 13, 7122.18, 7122.18, 0.00);
INSERT INTO public.cheque
VALUES (92, 6, 32, 4390.40, 3999.23, 0.00);
INSERT INTO public.cheque
VALUES (36, 12, 47, 11170.02, 11020.57, 0.00);
INSERT INTO public.cheque
VALUES (192, 23, 46, 25837.28, 25837.28, 0.00);
INSERT INTO public.cheque
VALUES (237, 22, 22, 2575.10, 2575.10, 0.00);
INSERT INTO public.cheque
VALUES (9, 13, 19, 3341.72, 3341.72, 0.00);
INSERT INTO public.cheque
VALUES (256, 16, 21, 12225.15, 12225.15, 0.00);
INSERT INTO public.cheque
VALUES (112, 15, 23, 4795.73, 4795.73, 0.00);
INSERT INTO public.cheque
VALUES (18, 6, 33, 6872.25, 6413.15, 0.00);
INSERT INTO public.cheque
VALUES (123, 3, 8, 493.04, 440.16, 52.88);
INSERT INTO public.cheque
VALUES (187, 13, 26, 3765.84, 3765.84, 0.00);
INSERT INTO public.cheque
VALUES (100, 19, 35, 15039.85, 13501.02, 1538.83);
INSERT INTO public.cheque
VALUES (70, 24, 2, 1279.16, 1279.16, 0.00);
INSERT INTO public.cheque
VALUES (166, 10, 40, 20400.00, 20400.00, 0.00);
INSERT INTO public.cheque
VALUES (31, 21, 36, 1764.36, 1764.36, 0.00);
INSERT INTO public.cheque
VALUES (135, 2, 30, 18952.50, 18952.50, 0.00);
INSERT INTO public.cheque
VALUES (115, 23, 44, 20352.64, 17428.84, 2923.80);
INSERT INTO public.cheque
VALUES (176, 13, 20, 3517.60, 3022.31, 0.00);
INSERT INTO public.cheque
VALUES (169, 6, 29, 5129.81, 4678.78, 451.03);
INSERT INTO public.cheque
VALUES (18, 14, 17, 4382.43, 3615.07, 767.36);
INSERT INTO public.cheque
VALUES (162, 29, 47, 30917.54, 26788.82, 4128.72);
INSERT INTO public.cheque
VALUES (283, 22, 13, 1521.65, 1420.17, 0.00);
INSERT INTO public.cheque
VALUES (257, 20, 30, 8078.70, 8078.70, 0.00);
INSERT INTO public.cheque
VALUES (61, 15, 14, 3262.56, 3262.56, 0.00);
INSERT INTO public.cheque
VALUES (248, 10, 18, 9180.00, 9180.00, 0.00);
INSERT INTO public.cheque
VALUES (100, 17, 4, 13.32, 12.32, 0.00);
INSERT INTO public.cheque
VALUES (168, 27, 45, 4797.00, 3977.00, 0.00);
INSERT INTO public.cheque
VALUES (280, 17, 44, 163.68, 163.68, 0.00);
INSERT INTO public.cheque
VALUES (110, 22, 2, 234.10, 226.50, 7.60);
INSERT INTO public.cheque
VALUES (254, 11, 11, 813.78, 662.94, 0.00);
INSERT INTO public.cheque
VALUES (81, 25, 15, 6338.25, 6338.25, 0.00);
INSERT INTO public.cheque
VALUES (283, 12, 6, 1425.96, 1425.96, 0.00);
INSERT INTO public.cheque
VALUES (32, 20, 21, 5059.74, 4907.39, 0.00);
INSERT INTO public.cheque
VALUES (70, 13, 44, 8649.08, 8649.08, 0.00);
INSERT INTO public.cheque
VALUES (103, 12, 43, 10219.38, 10219.38, 0.00);
INSERT INTO public.cheque
VALUES (138, 16, 38, 22121.70, 19148.25, 0.00);
INSERT INTO public.cheque
VALUES (189, 12, 5, 978.60, 903.03, 75.57);
INSERT INTO public.cheque
VALUES (118, 6, 13, 2707.25, 2239.83, 0.00);
INSERT INTO public.cheque
VALUES (215, 3, 12, 628.20, 628.20, 0.00);
INSERT INTO public.cheque
VALUES (13, 19, 13, 6243.38, 6088.84, 154.54);
INSERT INTO public.cheque
VALUES (82, 13, 34, 5979.92, 5596.61, 0.00);
INSERT INTO public.cheque
VALUES (236, 9, 24, 21420.00, 21420.00, 0.00);
INSERT INTO public.cheque
VALUES (272, 1, 22, 9350.00, 8982.02, 0.00);
INSERT INTO public.cheque
VALUES (76, 5, 29, 5484.77, 5212.04, 0.00);
INSERT INTO public.cheque
VALUES (224, 12, 12, 2851.92, 2851.92, 0.00);
INSERT INTO public.cheque
VALUES (78, 6, 7, 960.40, 960.40, 0.00);
INSERT INTO public.cheque
VALUES (99, 17, 9, 33.48, 33.31, 0.00);
INSERT INTO public.cheque
VALUES (235, 17, 3, 9.99, 8.98, 0.00);
INSERT INTO public.cheque
VALUES (196, 24, 40, 18850.80, 18772.31, 78.49);
INSERT INTO public.cheque
VALUES (39, 12, 31, 7367.46, 7367.46, 0.00);
INSERT INTO public.cheque
VALUES (59, 14, 3, 773.37, 654.85, 0.00);
INSERT INTO public.cheque
VALUES (63, 28, 18, 8121.24, 6927.46, 1193.78);
INSERT INTO public.cheque
VALUES (148, 1, 49, 20825.00, 20825.00, 0.00);
INSERT INTO public.cheque
VALUES (239, 20, 12, 3231.48, 3147.03, 0.00);
INSERT INTO public.cheque
VALUES (216, 30, 5, 2925.90, 2356.30, 0.00);
INSERT INTO public.cheque
VALUES (154, 5, 49, 9267.37, 9267.37, 0.00);
INSERT INTO public.cheque
VALUES (161, 6, 24, 4998.00, 4998.00, 0.00);
INSERT INTO public.cheque
VALUES (103, 24, 17, 9728.25, 9728.25, 0.00);
INSERT INTO public.cheque
VALUES (151, 23, 16, 8986.88, 8347.64, 639.24);
INSERT INTO public.cheque
VALUES (244, 9, 46, 34872.60, 28289.99, 0.00);
INSERT INTO public.cheque
VALUES (246, 9, 4, 3032.40, 2724.80, 0.00);
INSERT INTO public.cheque
VALUES (80, 26, 6, 4455.48, 4455.48, 0.00);
INSERT INTO public.cheque
VALUES (74, 20, 37, 8914.78, 8914.78, 0.00);
INSERT INTO public.cheque
VALUES (259, 17, 18, 49.32, 49.32, 0.00);
INSERT INTO public.cheque
VALUES (8, 5, 39, 4859.40, 4859.40, 0.00);
INSERT INTO public.cheque
VALUES (277, 9, 3, 2274.30, 1909.74, 364.56);
INSERT INTO public.cheque
VALUES (112, 13, 6, 1055.28, 1055.28, 0.00);
INSERT INTO public.cheque
VALUES (133, 19, 34, 14610.14, 14610.14, 0.00);
INSERT INTO public.cheque
VALUES (55, 9, 44, 39270.00, 39270.00, 0.00);
INSERT INTO public.cheque
VALUES (12, 8, 19, 5369.97, 5369.97, 0.00);
INSERT INTO public.cheque
VALUES (264, 6, 28, 3841.60, 3841.60, 0.00);
INSERT INTO public.cheque
VALUES (273, 7, 29, 6211.80, 5167.66, 0.00);
INSERT INTO public.cheque
VALUES (95, 26, 25, 18564.50, 18549.51, 14.99);
INSERT INTO public.cheque
VALUES (144, 21, 31, 1251.16, 1251.16, 0.00);
INSERT INTO public.cheque
VALUES (45, 27, 32, 4142.08, 4142.08, 0.00);
INSERT INTO public.cheque
VALUES (222, 13, 20, 2896.80, 2896.80, 0.00);
INSERT INTO public.cheque
VALUES (157, 19, 35, 15039.85, 13334.49, 0.00);
INSERT INTO public.cheque
VALUES (169, 6, 26, 4599.14, 4226.62, 0.00);
INSERT INTO public.cheque
VALUES (21, 26, 33, 24505.14, 21441.19, 3063.95);
INSERT INTO public.cheque
VALUES (124, 15, 2, 417.02, 417.02, 0.00);
INSERT INTO public.cheque
VALUES (15, 22, 47, 5501.35, 5501.35, 0.00);
INSERT INTO public.cheque
VALUES (235, 6, 23, 4789.75, 4750.42, 39.33);
INSERT INTO public.cheque
VALUES (6, 21, 31, 1698.18, 1477.20, 0.00);
INSERT INTO public.cheque
VALUES (40, 24, 15, 9593.70, 9593.70, 0.00);
INSERT INTO public.cheque
VALUES (256, 3, 8, 493.04, 459.87, 0.00);
INSERT INTO public.cheque
VALUES (142, 19, 28, 9908.64, 9908.64, 0.00);
INSERT INTO public.cheque
VALUES (53, 8, 18, 3351.60, 2950.97, 0.00);
INSERT INTO public.cheque
VALUES (256, 29, 34, 22365.88, 20452.53, 0.00);
INSERT INTO public.cheque
VALUES (262, 8, 14, 3360.98, 3360.98, 0.00);
INSERT INTO public.cheque
VALUES (31, 23, 15, 8425.20, 7294.95, 0.00);
INSERT INTO public.cheque
VALUES (214, 7, 49, 15931.37, 15931.37, 0.00);
INSERT INTO public.cheque
VALUES (123, 18, 34, 27574.00, 27574.00, 0.00);
INSERT INTO public.cheque
VALUES (23, 11, 36, 2976.84, 2976.84, 0.00);
INSERT INTO public.cheque
VALUES (148, 15, 43, 8965.93, 8965.93, 0.00);
INSERT INTO public.cheque
VALUES (269, 5, 35, 5622.75, 5622.75, 0.00);
INSERT INTO public.cheque
VALUES (61, 17, 37, 137.64, 116.27, 21.37);
INSERT INTO public.cheque
VALUES (39, 28, 36, 19722.96, 19722.96, 0.00);
INSERT INTO public.cheque
VALUES (158, 10, 34, 11424.00, 11424.00, 0.00);
INSERT INTO public.cheque
VALUES (262, 26, 13, 10789.22, 10714.89, 0.00);
INSERT INTO public.cheque
VALUES (218, 3, 29, 1787.27, 1787.27, 0.00);
INSERT INTO public.cheque
VALUES (242, 6, 5, 1041.25, 1041.25, 0.00);
INSERT INTO public.cheque
VALUES (222, 3, 2, 81.20, 81.20, 0.00);
INSERT INTO public.cheque
VALUES (225, 18, 26, 23566.66, 19868.95, 0.00);
INSERT INTO public.cheque
VALUES (40, 17, 37, 137.64, 136.34, 0.00);
INSERT INTO public.cheque
VALUES (37, 15, 9, 2097.36, 2024.38, 0.00);
INSERT INTO public.cheque
VALUES (169, 26, 2, 1659.88, 1447.62, 212.26);
INSERT INTO public.cheque
VALUES (210, 21, 49, 2684.22, 2684.22, 0.00);
INSERT INTO public.cheque
VALUES (25, 13, 9, 1303.56, 1303.56, 0.00);
INSERT INTO public.cheque
VALUES (23, 17, 41, 152.52, 152.52, 0.00);
INSERT INTO public.cheque
VALUES (91, 13, 45, 7914.60, 7389.61, 524.99);
INSERT INTO public.cheque
VALUES (104, 28, 38, 20818.68, 18916.09, 0.00);
INSERT INTO public.cheque
VALUES (251, 26, 17, 12623.86, 12623.86, 0.00);
INSERT INTO public.cheque
VALUES (228, 19, 7, 3007.97, 3007.97, 0.00);
INSERT INTO public.cheque
VALUES (125, 5, 31, 3862.60, 3862.60, 0.00);
INSERT INTO public.cheque
VALUES (263, 9, 3, 2677.50, 2677.50, 0.00);
INSERT INTO public.cheque
VALUES (235, 27, 25, 3236.00, 3236.00, 0.00);
INSERT INTO public.cheque
VALUES (46, 9, 30, 26775.00, 26775.00, 0.00);
INSERT INTO public.cheque
VALUES (187, 16, 5, 2397.10, 2397.10, 0.00);
INSERT INTO public.cheque
VALUES (34, 6, 27, 5622.75, 5622.75, 0.00);
INSERT INTO public.cheque
VALUES (89, 8, 25, 7065.75, 7065.75, 0.00);
INSERT INTO public.cheque
VALUES (110, 27, 7, 906.08, 804.68, 0.00);
INSERT INTO public.cheque
VALUES (25, 19, 17, 6015.96, 6015.96, 0.00);
INSERT INTO public.cheque
VALUES (213, 27, 16, 2314.72, 2238.69, 0.00);
INSERT INTO public.cheque
VALUES (253, 11, 21, 1279.53, 1279.53, 0.00);
INSERT INTO public.cheque
VALUES (281, 9, 43, 25284.00, 25284.00, 0.00);
INSERT INTO public.cheque
VALUES (44, 2, 43, 31981.25, 29385.01, 0.00);
INSERT INTO public.cheque
VALUES (212, 2, 37, 18130.00, 18130.00, 0.00);
INSERT INTO public.cheque
VALUES (62, 29, 34, 18418.82, 17331.63, 0.00);
INSERT INTO public.cheque
VALUES (13, 14, 21, 6050.52, 6043.49, 0.00);
INSERT INTO public.cheque
VALUES (29, 5, 19, 3052.35, 3052.35, 0.00);
INSERT INTO public.cheque
VALUES (13, 21, 26, 1424.28, 1162.97, 261.31);
INSERT INTO public.cheque
VALUES (63, 7, 7, 1499.40, 1490.60, 0.00);
INSERT INTO public.cheque
VALUES (280, 22, 39, 5101.98, 4643.27, 458.71);
INSERT INTO public.cheque
VALUES (90, 27, 47, 6083.68, 4935.06, 0.00);
INSERT INTO public.cheque
VALUES (241, 8, 48, 8937.60, 8937.60, 0.00);
INSERT INTO public.cheque
VALUES (148, 6, 6, 1249.50, 1141.28, 0.00);
INSERT INTO public.cheque
VALUES (261, 6, 20, 2744.00, 2535.81, 0.00);
INSERT INTO public.cheque
VALUES (117, 1, 14, 5054.00, 4282.92, 771.08);
INSERT INTO public.cheque
VALUES (151, 19, 50, 21485.50, 21485.50, 0.00);
INSERT INTO public.cheque
VALUES (68, 20, 47, 11324.18, 11324.18, 0.00);
INSERT INTO public.cheque
VALUES (212, 29, 20, 10834.60, 10834.60, 0.00);
INSERT INTO public.cheque
VALUES (165, 2, 15, 7350.00, 6926.68, 0.00);
INSERT INTO public.cheque
VALUES (9, 27, 43, 5565.92, 4649.74, 0.00);
INSERT INTO public.cheque
VALUES (17, 9, 17, 15172.50, 15172.50, 0.00);
INSERT INTO public.cheque
VALUES (152, 19, 18, 6369.84, 5903.03, 0.00);
INSERT INTO public.cheque
VALUES (31, 29, 2, 1315.64, 1315.64, 0.00);
INSERT INTO public.cheque
VALUES (93, 23, 9, 5055.12, 5055.12, 0.00);
INSERT INTO public.cheque
VALUES (258, 19, 42, 18047.82, 18047.82, 0.00);
INSERT INTO public.cheque
VALUES (36, 13, 6, 1055.28, 1055.28, 0.00);
INSERT INTO public.cheque
VALUES (267, 6, 35, 4802.00, 4802.00, 0.00);
INSERT INTO public.cheque
VALUES (237, 28, 12, 6574.32, 5897.03, 677.29);
INSERT INTO public.cheque
VALUES (160, 9, 13, 11602.50, 11602.50, 0.00);
INSERT INTO public.cheque
VALUES (46, 3, 45, 2773.35, 2773.35, 0.00);
INSERT INTO public.cheque
VALUES (139, 20, 12, 2891.28, 2891.28, 0.00);
INSERT INTO public.cheque
VALUES (109, 21, 6, 242.16, 241.50, 0.00);
INSERT INTO public.cheque
VALUES (230, 30, 3, 1570.74, 1570.74, 0.00);
INSERT INTO public.cheque
VALUES (37, 14, 11, 3169.32, 2918.43, 250.89);
INSERT INTO public.cheque
VALUES (171, 16, 25, 14553.75, 14553.75, 0.00);
INSERT INTO public.cheque
VALUES (133, 5, 44, 8321.72, 7562.14, 0.00);
INSERT INTO public.cheque
VALUES (177, 17, 32, 87.68, 70.33, 17.35);
INSERT INTO public.cheque
VALUES (248, 30, 38, 19896.04, 16637.45, 3258.59);
INSERT INTO public.cheque
VALUES (144, 22, 38, 3662.82, 2939.45, 0.00);
INSERT INTO public.cheque
VALUES (46, 12, 6, 1425.96, 1222.62, 0.00);
INSERT INTO public.cheque
VALUES (156, 4, 9, 4781.25, 4781.25, 0.00);
INSERT INTO public.cheque
VALUES (156, 7, 49, 15931.37, 15931.37, 0.00);
INSERT INTO public.cheque
VALUES (16, 10, 9, 3024.00, 2503.65, 520.35);
INSERT INTO public.cheque
VALUES (49, 25, 16, 5567.68, 4901.76, 0.00);
INSERT INTO public.cheque
VALUES (181, 9, 4, 3570.00, 3570.00, 0.00);
INSERT INTO public.cheque
VALUES (158, 15, 25, 4292.75, 4084.51, 0.00);
INSERT INTO public.cheque
VALUES (131, 4, 20, 10625.00, 10625.00, 0.00);
INSERT INTO public.cheque
VALUES (170, 12, 7, 1370.04, 1370.04, 0.00);
INSERT INTO public.cheque
VALUES (51, 30, 36, 15522.84, 15522.84, 0.00);
INSERT INTO public.cheque
VALUES (216, 9, 31, 23501.10, 23501.10, 0.00);
INSERT INTO public.cheque
VALUES (102, 6, 37, 5076.40, 5076.40, 0.00);
INSERT INTO public.cheque
VALUES (101, 2, 22, 16362.50, 16362.50, 0.00);
INSERT INTO public.cheque
VALUES (247, 19, 33, 15848.58, 15848.58, 0.00);
INSERT INTO public.cheque
VALUES (185, 26, 20, 12230.60, 12230.60, 0.00);
INSERT INTO public.cheque
VALUES (169, 17, 39, 145.08, 130.28, 14.80);
INSERT INTO public.cheque
VALUES (160, 17, 45, 149.85, 137.99, 0.00);
INSERT INTO public.cheque
VALUES (208, 23, 27, 16949.52, 14043.21, 0.00);
INSERT INTO public.cheque
VALUES (37, 18, 12, 10876.92, 10876.92, 0.00);
INSERT INTO public.cheque
VALUES (96, 25, 16, 6760.80, 6307.92, 452.88);
INSERT INTO public.cheque
VALUES (168, 23, 36, 16652.16, 13481.58, 0.00);
INSERT INTO public.cheque
VALUES (282, 29, 38, 20585.74, 20585.74, 0.00);
INSERT INTO public.cheque
VALUES (159, 30, 23, 9917.37, 8349.82, 0.00);
INSERT INTO public.cheque
VALUES (138, 9, 44, 39270.00, 39270.00, 0.00);
INSERT INTO public.cheque
VALUES (146, 4, 36, 19125.00, 15879.15, 0.00);
INSERT INTO public.cheque
VALUES (30, 13, 17, 2989.96, 2677.44, 312.52);
INSERT INTO public.cheque
VALUES (270, 8, 28, 5213.60, 5213.60, 0.00);
INSERT INTO public.cheque
VALUES (244, 16, 33, 21471.12, 17323.93, 0.00);
INSERT INTO public.cheque
VALUES (8, 8, 11, 2048.20, 1959.24, 0.00);
INSERT INTO public.cheque
VALUES (155, 25, 23, 9718.65, 9718.65, 0.00);
INSERT INTO public.cheque
VALUES (42, 13, 13, 2286.44, 2286.44, 0.00);
INSERT INTO public.cheque
VALUES (280, 18, 26, 23566.66, 20565.52, 3001.14);
INSERT INTO public.cheque
VALUES (114, 16, 30, 19519.20, 19519.20, 0.00);
INSERT INTO public.cheque
VALUES (7, 14, 36, 9280.44, 9280.44, 0.00);
INSERT INTO public.cheque
VALUES (21, 29, 45, 29601.90, 29278.00, 0.00);
INSERT INTO public.cheque
VALUES (186, 21, 29, 1421.29, 1421.29, 0.00);
INSERT INTO public.cheque
VALUES (9, 27, 33, 4271.52, 3737.97, 533.55);
INSERT INTO public.cheque
VALUES (219, 18, 34, 27574.00, 27574.00, 0.00);
INSERT INTO public.cheque
VALUES (128, 20, 21, 5655.09, 5655.09, 0.00);
INSERT INTO public.cheque
VALUES (60, 21, 34, 1372.24, 1372.24, 0.00);
INSERT INTO public.cheque
VALUES (241, 26, 41, 25072.73, 24566.52, 0.00);
INSERT INTO public.cheque
VALUES (70, 7, 42, 11599.14, 9710.37, 0.00);
INSERT INTO public.cheque
VALUES (227, 2, 25, 18593.75, 17693.79, 0.00);
INSERT INTO public.cheque
VALUES (222, 1, 18, 5040.00, 5040.00, 0.00);
INSERT INTO public.cheque
VALUES (179, 15, 38, 7923.38, 6355.01, 0.00);
INSERT INTO public.cheque
VALUES (151, 18, 10, 8110.00, 7599.28, 0.00);
INSERT INTO public.cheque
VALUES (190, 9, 37, 33022.50, 29912.09, 3110.41);
INSERT INTO public.cheque
VALUES (10, 10, 40, 17328.00, 16282.23, 0.00);
INSERT INTO public.cheque
VALUES (85, 8, 23, 4282.60, 4282.60, 0.00);
INSERT INTO public.cheque
VALUES (39, 25, 18, 7605.90, 7474.62, 0.00);
INSERT INTO public.cheque
VALUES (272, 20, 37, 8914.78, 8898.60, 16.18);
INSERT INTO public.cheque
VALUES (128, 14, 25, 7203.00, 7203.00, 0.00);
INSERT INTO public.cheque
VALUES (92, 13, 16, 2317.44, 1857.90, 0.00);
INSERT INTO public.cheque
VALUES (129, 16, 38, 22121.70, 18533.88, 3587.82);
INSERT INTO public.cheque
VALUES (150, 12, 10, 1957.20, 1760.52, 0.00);
INSERT INTO public.cheque
VALUES (280, 18, 32, 29005.12, 28624.45, 0.00);
INSERT INTO public.cheque
VALUES (284, 24, 3, 1413.81, 1413.81, 0.00);
INSERT INTO public.cheque
VALUES (58, 6, 41, 8538.25, 8457.53, 80.72);
INSERT INTO public.cheque
VALUES (7, 26, 40, 29703.20, 26064.17, 3639.03);
INSERT INTO public.cheque
VALUES (26, 10, 46, 15456.00, 12529.08, 0.00);
INSERT INTO public.cheque
VALUES (164, 28, 41, 22462.26, 22462.26, 0.00);
INSERT INTO public.cheque
VALUES (159, 14, 9, 1910.70, 1910.70, 0.00);
INSERT INTO public.cheque
VALUES (223, 2, 37, 18130.00, 18130.00, 0.00);
INSERT INTO public.cheque
VALUES (104, 29, 19, 12498.58, 11632.26, 866.32);
INSERT INTO public.cheque
VALUES (175, 4, 14, 7437.50, 6176.84, 1260.66);
INSERT INTO public.cheque
VALUES (204, 6, 44, 9163.00, 8982.61, 0.00);
INSERT INTO public.cheque
VALUES (150, 4, 24, 8400.00, 7653.74, 746.26);
INSERT INTO public.cheque
VALUES (243, 24, 24, 11310.48, 9421.63, 1888.85);
INSERT INTO public.cheque
VALUES (272, 13, 9, 1582.92, 1582.92, 0.00);
INSERT INTO public.cheque
VALUES (236, 9, 41, 36592.50, 36592.50, 0.00);
INSERT INTO public.cheque
VALUES (238, 2, 36, 22743.00, 22743.00, 0.00);
INSERT INTO public.cheque
VALUES (147, 3, 29, 1787.27, 1787.27, 0.00);
INSERT INTO public.cheque
VALUES (174, 19, 35, 15039.85, 12994.01, 0.00);
INSERT INTO public.cheque
VALUES (203, 11, 10, 609.30, 576.03, 33.27);
INSERT INTO public.cheque
VALUES (36, 10, 27, 13770.00, 13770.00, 0.00);
INSERT INTO public.cheque
VALUES (61, 26, 9, 7469.46, 7369.99, 0.00);
INSERT INTO public.cheque
VALUES (157, 7, 18, 5852.34, 5852.34, 0.00);
INSERT INTO public.cheque
VALUES (201, 24, 18, 8482.86, 6988.65, 0.00);
INSERT INTO public.cheque
VALUES (26, 26, 16, 9784.48, 9784.48, 0.00);
INSERT INTO public.cheque
VALUES (253, 2, 20, 9800.00, 9800.00, 0.00);
INSERT INTO public.cheque
VALUES (147, 13, 11, 1934.68, 1934.68, 0.00);
INSERT INTO public.cheque
VALUES (266, 17, 5, 16.65, 14.97, 0.00);
INSERT INTO public.cheque
VALUES (18, 1, 37, 15725.00, 15725.00, 0.00);
INSERT INTO public.cheque
VALUES (114, 8, 18, 4321.26, 3560.33, 0.00);
INSERT INTO public.cheque
VALUES (211, 22, 7, 819.35, 662.59, 156.76);
INSERT INTO public.cheque
VALUES (32, 20, 38, 9155.72, 7957.51, 0.00);
INSERT INTO public.cheque
VALUES (70, 17, 48, 178.56, 161.17, 17.39);
INSERT INTO public.cheque
VALUES (272, 11, 11, 813.78, 666.63, 0.00);
INSERT INTO public.cheque
VALUES (10, 7, 36, 9942.12, 9223.41, 718.71);
INSERT INTO public.cheque
VALUES (193, 9, 38, 33915.00, 31891.93, 0.00);
INSERT INTO public.cheque
VALUES (4, 10, 37, 16028.40, 14266.57, 0.00);
INSERT INTO public.cheque
VALUES (66, 20, 37, 8914.78, 8914.78, 0.00);
INSERT INTO public.cheque
VALUES (71, 13, 39, 5648.76, 5638.81, 9.95);
INSERT INTO public.cheque
VALUES (282, 28, 15, 6767.70, 6767.70, 0.00);
INSERT INTO public.cheque
VALUES (8, 12, 34, 6654.48, 5901.91, 0.00);
INSERT INTO public.cheque
VALUES (136, 15, 15, 3127.65, 3127.65, 0.00);
INSERT INTO public.cheque
VALUES (91, 22, 29, 3394.45, 2824.08, 0.00);
INSERT INTO public.cheque
VALUES (188, 24, 10, 5722.50, 5722.50, 0.00);
INSERT INTO public.cheque
VALUES (54, 6, 49, 10204.25, 8439.92, 1764.33);
INSERT INTO public.cheque
VALUES (263, 29, 6, 3946.92, 3946.92, 0.00);
INSERT INTO public.cheque
VALUES (177, 13, 22, 3186.48, 3186.48, 0.00);
INSERT INTO public.cheque
VALUES (279, 26, 30, 22277.40, 19609.07, 0.00);
INSERT INTO public.cheque
VALUES (222, 20, 19, 3769.98, 3769.98, 0.00);
INSERT INTO public.cheque
VALUES (127, 25, 42, 17747.10, 17747.10, 0.00);
INSERT INTO public.cheque
VALUES (108, 5, 18, 2891.70, 2891.70, 0.00);
INSERT INTO public.cheque
VALUES (136, 17, 35, 116.55, 110.75, 5.80);
INSERT INTO public.cheque
VALUES (121, 7, 15, 4876.95, 4801.11, 75.84);
INSERT INTO public.cheque
VALUES (217, 20, 19, 3769.98, 3459.24, 0.00);
INSERT INTO public.cheque
VALUES (249, 3, 13, 801.19, 801.19, 0.00);
INSERT INTO public.cheque
VALUES (138, 10, 29, 14790.00, 12784.76, 0.00);
INSERT INTO public.cheque
VALUES (162, 25, 23, 9718.65, 9718.65, 0.00);
INSERT INTO public.cheque
VALUES (42, 3, 11, 677.93, 677.93, 0.00);
INSERT INTO public.cheque
VALUES (142, 27, 44, 4690.40, 4328.06, 362.34);
INSERT INTO public.cheque
VALUES (69, 29, 4, 2631.28, 2274.44, 0.00);
INSERT INTO public.cheque
VALUES (258, 8, 35, 9892.05, 9892.05, 0.00);
INSERT INTO public.cheque
VALUES (174, 24, 26, 14878.50, 14878.50, 0.00);
INSERT INTO public.cheque
VALUES (217, 4, 45, 15750.00, 15750.00, 0.00);
INSERT INTO public.cheque
VALUES (158, 8, 5, 931.00, 931.00, 0.00);
INSERT INTO public.cheque
VALUES (127, 20, 38, 9155.72, 7663.02, 1492.70);
INSERT INTO public.cheque
VALUES (144, 2, 34, 16660.00, 16214.97, 445.03);
INSERT INTO public.cheque
VALUES (63, 25, 7, 2435.86, 2352.85, 0.00);
INSERT INTO public.cheque
VALUES (91, 20, 32, 7710.08, 6226.02, 1484.06);
INSERT INTO public.cheque
VALUES (52, 30, 17, 9948.06, 9685.71, 0.00);
INSERT INTO public.cheque
VALUES (153, 19, 15, 6445.65, 6445.65, 0.00);
INSERT INTO public.cheque
VALUES (217, 4, 40, 14000.00, 13333.47, 0.00);
INSERT INTO public.cheque
VALUES (96, 9, 8, 7140.00, 6385.25, 0.00);
INSERT INTO public.cheque
VALUES (175, 7, 45, 14630.85, 11854.50, 2776.35);
INSERT INTO public.cheque
VALUES (157, 27, 8, 1035.52, 1035.52, 0.00);
INSERT INTO public.cheque
VALUES (116, 6, 15, 2653.35, 2653.35, 0.00);
INSERT INTO public.cheque
VALUES (183, 18, 35, 28385.00, 27485.77, 0.00);
INSERT INTO public.cheque
VALUES (275, 15, 8, 1668.08, 1599.78, 0.00);
INSERT INTO public.cheque
VALUES (135, 14, 32, 9219.84, 9219.84, 0.00);
INSERT INTO public.cheque
VALUES (258, 9, 31, 27667.50, 27667.50, 0.00);
INSERT INTO public.cheque
VALUES (83, 19, 3, 1440.78, 1398.06, 42.72);
INSERT INTO public.cheque
VALUES (257, 14, 49, 14117.88, 14117.88, 0.00);
INSERT INTO public.cheque
VALUES (29, 27, 14, 2025.38, 1715.29, 0.00);
INSERT INTO public.cheque
VALUES (281, 26, 23, 14065.19, 13663.80, 401.39);
INSERT INTO public.cheque
VALUES (107, 13, 28, 4055.52, 3868.92, 0.00);
INSERT INTO public.cheque
VALUES (34, 18, 4, 3244.00, 3171.75, 0.00);
INSERT INTO public.cheque
VALUES (195, 7, 17, 5527.21, 5527.21, 0.00);
INSERT INTO public.cheque
VALUES (248, 27, 20, 2588.80, 2212.95, 0.00);
INSERT INTO public.cheque
VALUES (258, 21, 45, 2205.45, 2205.45, 0.00);
INSERT INTO public.cheque
VALUES (187, 16, 45, 21573.90, 18652.55, 0.00);
INSERT INTO public.cheque
VALUES (202, 25, 2, 695.96, 695.96, 0.00);
INSERT INTO public.cheque
VALUES (20, 27, 34, 3624.40, 3624.40, 0.00);
INSERT INTO public.cheque
VALUES (28, 12, 31, 8234.22, 6979.42, 0.00);
INSERT INTO public.cheque
VALUES (60, 4, 37, 12950.00, 12429.43, 520.57);
INSERT INTO public.cheque
VALUES (75, 29, 30, 22056.30, 21777.43, 0.00);
INSERT INTO public.cheque
VALUES (196, 11, 43, 2619.99, 2145.19, 0.00);
INSERT INTO public.cheque
VALUES (162, 15, 38, 7923.38, 7923.38, 0.00);
INSERT INTO public.cheque
VALUES (120, 8, 18, 5087.34, 5087.34, 0.00);
INSERT INTO public.cheque
VALUES (207, 29, 43, 28286.26, 27600.64, 0.00);
INSERT INTO public.cheque
VALUES (68, 30, 20, 10471.60, 10471.60, 0.00);
INSERT INTO public.cheque
VALUES (30, 19, 34, 14610.14, 14208.46, 401.68);
INSERT INTO public.cheque
VALUES (119, 18, 17, 13787.00, 13787.00, 0.00);
INSERT INTO public.cheque
VALUES (247, 19, 38, 18249.88, 18249.88, 0.00);
INSERT INTO public.cheque
VALUES (182, 11, 49, 2985.57, 2534.90, 450.67);
INSERT INTO public.cheque
VALUES (181, 7, 21, 6827.73, 6045.53, 0.00);
INSERT INTO public.cheque
VALUES (12, 12, 27, 6416.82, 5363.51, 0.00);
INSERT INTO public.cheque
VALUES (152, 21, 17, 686.12, 668.50, 17.62);
INSERT INTO public.cheque
VALUES (88, 28, 29, 13084.22, 10469.36, 0.00);
INSERT INTO public.cheque
VALUES (284, 18, 13, 8682.44, 8682.44, 0.00);
INSERT INTO public.cheque
VALUES (234, 2, 36, 26775.00, 24342.66, 2432.34);
INSERT INTO public.cheque
VALUES (242, 28, 39, 21366.54, 21366.54, 0.00);
INSERT INTO public.cheque
VALUES (49, 18, 12, 8014.56, 8014.56, 0.00);
INSERT INTO public.cheque
VALUES (239, 29, 11, 8087.31, 7845.26, 0.00);
INSERT INTO public.cheque
VALUES (219, 26, 34, 25247.72, 22277.03, 2970.69);
INSERT INTO public.cheque
VALUES (110, 16, 12, 6985.80, 6985.80, 0.00);
INSERT INTO public.cheque
VALUES (249, 23, 23, 12918.64, 12918.64, 0.00);
INSERT INTO public.cheque
VALUES (192, 25, 4, 1690.20, 1643.12, 0.00);
INSERT INTO public.cheque
VALUES (195, 15, 40, 8340.40, 8340.40, 0.00);
INSERT INTO public.cheque
VALUES (75, 8, 8, 1920.56, 1831.80, 0.00);
INSERT INTO public.cheque
VALUES (71, 8, 21, 3910.20, 3609.86, 0.00);
INSERT INTO public.cheque
VALUES (158, 3, 36, 1461.60, 1175.07, 0.00);
INSERT INTO public.cheque
VALUES (217, 8, 39, 7261.80, 7261.80, 0.00);
INSERT INTO public.cheque
VALUES (102, 10, 24, 8064.00, 8064.00, 0.00);
INSERT INTO public.cheque
VALUES (216, 20, 24, 6462.96, 6462.96, 0.00);
INSERT INTO public.cheque
VALUES (48, 17, 25, 83.25, 67.18, 16.07);
INSERT INTO public.cheque
VALUES (153, 14, 49, 12631.71, 11152.33, 0.00);
INSERT INTO public.cheque
VALUES (26, 3, 37, 1502.20, 1312.02, 0.00);
INSERT INTO public.cheque
VALUES (90, 23, 47, 26398.96, 21672.95, 0.00);
INSERT INTO public.cheque
VALUES (279, 14, 5, 1288.95, 1251.83, 37.12);
INSERT INTO public.cheque
VALUES (183, 23, 28, 15727.04, 15553.04, 0.00);
INSERT INTO public.cheque
VALUES (7, 10, 35, 17850.00, 17850.00, 0.00);
INSERT INTO public.cheque
VALUES (142, 21, 48, 1937.28, 1932.01, 0.00);
INSERT INTO public.cheque
VALUES (20, 24, 40, 18850.80, 18850.80, 0.00);
INSERT INTO public.cheque
VALUES (73, 11, 17, 1257.66, 1257.66, 0.00);
INSERT INTO public.cheque
VALUES (218, 5, 12, 2269.56, 2269.56, 0.00);
INSERT INTO public.cheque
VALUES (69, 6, 44, 9163.00, 9163.00, 0.00);
INSERT INTO public.cheque
VALUES (47, 13, 18, 2607.12, 2607.12, 0.00);
INSERT INTO public.cheque
VALUES (283, 10, 39, 19890.00, 19890.00, 0.00);
INSERT INTO public.cheque
VALUES (185, 9, 7, 4116.00, 3451.08, 664.92);
INSERT INTO public.cheque
VALUES (80, 10, 28, 14280.00, 13191.50, 0.00);
INSERT INTO public.cheque
VALUES (143, 27, 48, 6213.12, 5193.54, 0.00);
INSERT INTO public.cheque
VALUES (150, 13, 45, 6517.80, 6517.80, 0.00);
INSERT INTO public.cheque
VALUES (61, 30, 22, 12873.96, 12873.96, 0.00);
INSERT INTO public.cheque
VALUES (234, 14, 7, 1804.53, 1804.53, 0.00);
INSERT INTO public.cheque
VALUES (7, 29, 47, 30917.54, 26283.77, 0.00);
INSERT INTO public.cheque
VALUES (279, 25, 22, 9296.10, 7493.99, 0.00);
INSERT INTO public.cheque
VALUES (226, 16, 42, 27326.88, 27326.88, 0.00);
INSERT INTO public.cheque
VALUES (196, 17, 48, 131.52, 118.50, 0.00);
INSERT INTO public.cheque
VALUES (131, 15, 40, 8340.40, 7083.70, 0.00);
INSERT INTO public.cheque
VALUES (88, 14, 41, 8704.30, 8627.79, 0.00);
INSERT INTO public.cheque
VALUES (225, 22, 20, 2616.40, 2616.40, 0.00);
INSERT INTO public.cheque
VALUES (43, 19, 28, 13447.28, 13140.94, 0.00);
INSERT INTO public.cheque
VALUES (231, 15, 23, 3949.33, 3949.33, 0.00);
INSERT INTO public.cheque
VALUES (180, 3, 23, 1204.05, 1204.05, 0.00);
INSERT INTO public.cheque
VALUES (67, 26, 23, 17079.34, 14708.16, 0.00);
INSERT INTO public.cheque
VALUES (253, 14, 21, 4458.30, 3582.25, 0.00);
INSERT INTO public.cheque
VALUES (17, 22, 30, 3511.50, 3394.92, 116.58);
INSERT INTO public.cheque
VALUES (279, 15, 36, 7506.36, 6704.36, 0.00);
INSERT INTO public.cheque
VALUES (111, 21, 12, 588.12, 588.12, 0.00);
INSERT INTO public.cheque
VALUES (214, 6, 44, 9163.00, 8296.33, 0.00);
INSERT INTO public.cheque
VALUES (171, 10, 47, 23970.00, 23970.00, 0.00);
INSERT INTO public.cheque
VALUES (113, 1, 35, 12635.00, 10792.13, 0.00);
INSERT INTO public.cheque
VALUES (251, 19, 39, 16758.69, 16758.69, 0.00);
INSERT INTO public.cheque
VALUES (217, 11, 3, 182.79, 182.79, 0.00);
INSERT INTO public.cheque
VALUES (198, 22, 35, 4578.70, 4473.83, 0.00);
INSERT INTO public.cheque
VALUES (140, 15, 18, 4194.72, 3788.56, 0.00);
INSERT INTO public.cheque
VALUES (156, 2, 10, 7437.50, 7390.48, 0.00);
INSERT INTO public.cheque
VALUES (21, 12, 14, 3327.24, 3011.34, 0.00);
INSERT INTO public.cheque
VALUES (132, 5, 26, 3239.60, 3239.60, 0.00);
INSERT INTO public.cheque
VALUES (137, 13, 17, 2462.28, 2462.28, 0.00);
INSERT INTO public.cheque
VALUES (224, 3, 25, 1540.75, 1540.75, 0.00);
INSERT INTO public.cheque
VALUES (158, 25, 19, 6611.62, 5291.94, 0.00);
INSERT INTO public.cheque
VALUES (272, 23, 4, 2246.72, 2246.72, 0.00);
INSERT INTO public.cheque
VALUES (266, 4, 13, 6906.25, 6906.25, 0.00);
INSERT INTO public.cheque
VALUES (244, 12, 11, 2921.82, 2834.56, 87.26);
INSERT INTO public.cheque
VALUES (141, 24, 24, 13734.00, 11393.69, 0.00);
INSERT INTO public.cheque
VALUES (50, 5, 22, 2741.20, 2741.20, 0.00);
INSERT INTO public.cheque
VALUES (119, 14, 41, 10569.39, 10569.39, 0.00);
INSERT INTO public.cheque
VALUES (18, 19, 30, 12891.30, 12891.30, 0.00);
INSERT INTO public.cheque
VALUES (3, 27, 25, 3236.00, 2654.87, 0.00);
INSERT INTO public.cheque
VALUES (82, 7, 9, 2926.17, 2926.17, 0.00);
INSERT INTO public.cheque
VALUES (226, 12, 47, 12484.14, 12484.14, 0.00);
INSERT INTO public.cheque
VALUES (248, 6, 4, 833.00, 833.00, 0.00);
INSERT INTO public.cheque
VALUES (252, 16, 44, 21094.48, 19300.30, 0.00);
INSERT INTO public.cheque
VALUES (27, 30, 49, 25655.42, 22646.00, 3009.42);
INSERT INTO public.cheque
VALUES (242, 19, 46, 19766.66, 19766.66, 0.00);
INSERT INTO public.cheque
VALUES (106, 8, 17, 3165.40, 3076.78, 0.00);
INSERT INTO public.cheque
VALUES (191, 16, 29, 18868.56, 16500.49, 2368.07);
INSERT INTO public.cheque
VALUES (182, 19, 23, 8139.24, 7169.67, 0.00);
INSERT INTO public.cheque
VALUES (258, 19, 4, 1718.84, 1718.84, 0.00);
INSERT INTO public.cheque
VALUES (32, 10, 2, 1020.00, 1020.00, 0.00);
INSERT INTO public.cheque
VALUES (91, 26, 27, 20049.66, 20049.66, 0.00);
INSERT INTO public.cheque
VALUES (154, 14, 29, 7475.91, 6347.43, 1128.48);
INSERT INTO public.cheque
VALUES (200, 28, 20, 12246.20, 9894.94, 0.00);
INSERT INTO public.cheque
VALUES (135, 5, 29, 4658.85, 4648.67, 0.00);
INSERT INTO public.cheque
VALUES (255, 22, 8, 936.40, 879.96, 56.44);
INSERT INTO public.cheque
VALUES (112, 27, 27, 3494.88, 3204.18, 290.70);
INSERT INTO public.cheque
VALUES (114, 6, 41, 7252.49, 7252.49, 0.00);
INSERT INTO public.cheque
VALUES (145, 15, 24, 5004.24, 5004.24, 0.00);
INSERT INTO public.cheque
VALUES (267, 26, 32, 19568.96, 19568.96, 0.00);
INSERT INTO public.cheque
VALUES (178, 22, 25, 3270.50, 3248.67, 0.00);
INSERT INTO public.cheque
VALUES (150, 18, 46, 30722.48, 30722.48, 0.00);
INSERT INTO public.cheque
VALUES (164, 15, 41, 8548.91, 8548.91, 0.00);
INSERT INTO public.cheque
VALUES (124, 5, 47, 8889.11, 8889.11, 0.00);
INSERT INTO public.cheque
VALUES (111, 8, 8, 2261.04, 2201.84, 0.00);
INSERT INTO public.cheque
VALUES (105, 29, 34, 18418.82, 18418.82, 0.00);
INSERT INTO public.cheque
VALUES (119, 22, 37, 4330.85, 4262.02, 68.83);
INSERT INTO public.cheque
VALUES (179, 24, 23, 13161.75, 13161.75, 0.00);
INSERT INTO public.cheque
VALUES (243, 25, 11, 3827.78, 3827.78, 0.00);
INSERT INTO public.cheque
VALUES (213, 12, 35, 9296.70, 9296.70, 0.00);
INSERT INTO public.cheque
VALUES (141, 26, 39, 28960.62, 28960.62, 0.00);
INSERT INTO public.cheque
VALUES (164, 22, 27, 3160.35, 3160.35, 0.00);
INSERT INTO public.cheque
VALUES (11, 29, 14, 9209.48, 7479.42, 0.00);
INSERT INTO public.cheque
VALUES (267, 23, 30, 13876.80, 13876.80, 0.00);
INSERT INTO public.cheque
VALUES (283, 14, 45, 11600.55, 9984.82, 0.00);
INSERT INTO public.cheque
VALUES (225, 10, 36, 15595.20, 15292.13, 0.00);
INSERT INTO public.cheque
VALUES (111, 7, 30, 9753.90, 9753.90, 0.00);
INSERT INTO public.cheque
VALUES (225, 23, 28, 17577.28, 17577.28, 0.00);
INSERT INTO public.cheque
VALUES (232, 11, 34, 2515.32, 2161.04, 0.00);
INSERT INTO public.cheque
VALUES (40, 11, 35, 2894.15, 2894.15, 0.00);
INSERT INTO public.cheque
VALUES (28, 24, 19, 12152.02, 12152.02, 0.00);
INSERT INTO public.cheque
VALUES (99, 19, 42, 20170.92, 20170.92, 0.00);
INSERT INTO public.cheque
VALUES (144, 29, 1, 541.73, 541.73, 0.00);
INSERT INTO public.cheque
VALUES (244, 22, 30, 3924.60, 3450.80, 0.00);
INSERT INTO public.cheque
VALUES (117, 19, 45, 21611.70, 21611.70, 0.00);
INSERT INTO public.cheque
VALUES (34, 22, 43, 5033.15, 4272.00, 0.00);
INSERT INTO public.cheque
VALUES (103, 19, 18, 7734.78, 7030.31, 0.00);
INSERT INTO public.cheque
VALUES (38, 16, 25, 14553.75, 12721.86, 0.00);
INSERT INTO public.cheque
VALUES (258, 5, 15, 2836.95, 2836.95, 0.00);
INSERT INTO public.cheque
VALUES (133, 30, 35, 18325.30, 16121.86, 0.00);
INSERT INTO public.cheque
VALUES (254, 24, 38, 21745.50, 20909.91, 0.00);
INSERT INTO public.cheque
VALUES (110, 23, 5, 2808.40, 2808.40, 0.00);
INSERT INTO public.cheque
VALUES (44, 12, 37, 8793.42, 8367.48, 0.00);
INSERT INTO public.cheque
VALUES (263, 28, 23, 12600.78, 12600.78, 0.00);
INSERT INTO public.cheque
VALUES (80, 22, 16, 1872.80, 1533.30, 339.50);
INSERT INTO public.cheque
VALUES (259, 13, 7, 1013.88, 1013.88, 0.00);
INSERT INTO public.cheque
VALUES (120, 28, 18, 9861.48, 8817.84, 1043.64);
INSERT INTO public.cheque
VALUES (107, 22, 39, 3759.21, 3063.24, 0.00);
INSERT INTO public.cheque
VALUES (171, 28, 32, 17531.52, 17092.49, 0.00);
INSERT INTO public.cheque
VALUES (24, 17, 9, 29.97, 29.97, 0.00);
INSERT INTO public.cheque
VALUES (83, 5, 43, 6907.95, 6824.61, 0.00);
INSERT INTO public.cheque
VALUES (146, 19, 4, 1718.84, 1446.94, 271.90);
INSERT INTO public.cheque
VALUES (181, 29, 7, 4604.74, 4604.74, 0.00);
INSERT INTO public.cheque
VALUES (69, 5, 10, 1891.30, 1891.30, 0.00);
INSERT INTO public.cheque
VALUES (51, 14, 43, 9128.90, 7780.83, 0.00);
INSERT INTO public.cheque
VALUES (72, 26, 5, 4149.70, 4135.04, 0.00);
INSERT INTO public.cheque
VALUES (275, 8, 32, 9044.16, 9044.16, 0.00);
INSERT INTO public.cheque
VALUES (48, 13, 17, 2989.96, 2774.95, 0.00);
INSERT INTO public.cheque
VALUES (76, 18, 15, 12165.00, 11717.47, 0.00);
INSERT INTO public.cheque
VALUES (86, 10, 33, 11088.00, 11088.00, 0.00);
INSERT INTO public.cheque
VALUES (46, 1, 23, 9775.00, 9775.00, 0.00);
INSERT INTO public.cheque
VALUES (280, 13, 14, 2751.98, 2650.20, 0.00);
INSERT INTO public.cheque
VALUES (71, 13, 16, 2317.44, 2237.87, 0.00);
INSERT INTO public.cheque
VALUES (101, 27, 44, 5695.36, 4792.84, 0.00);
INSERT INTO public.cheque
VALUES (132, 27, 25, 2665.00, 2500.23, 164.77);
INSERT INTO public.cheque
VALUES (247, 6, 28, 4952.92, 4355.69, 597.23);
INSERT INTO public.cheque
VALUES (69, 5, 39, 7376.07, 7085.56, 290.51);
INSERT INTO public.cheque
VALUES (206, 12, 8, 2124.96, 1769.00, 0.00);
INSERT INTO public.cheque
VALUES (226, 15, 39, 9088.56, 8613.05, 0.00);
INSERT INTO public.cheque
VALUES (246, 8, 25, 6001.75, 6001.75, 0.00);
INSERT INTO public.cheque
VALUES (281, 9, 8, 4704.00, 4586.86, 0.00);
INSERT INTO public.cheque
VALUES (38, 11, 38, 2811.24, 2487.59, 0.00);
INSERT INTO public.cheque
VALUES (51, 23, 12, 5550.72, 4633.59, 917.13);
INSERT INTO public.cheque
VALUES (17, 16, 23, 13389.45, 12635.56, 0.00);
INSERT INTO public.cheque
VALUES (233, 3, 17, 690.20, 690.20, 0.00);
INSERT INTO public.cheque
VALUES (54, 24, 3, 1716.75, 1716.75, 0.00);
INSERT INTO public.cheque
VALUES (255, 18, 37, 30007.00, 30007.00, 0.00);
INSERT INTO public.cheque
VALUES (195, 17, 15, 49.95, 46.16, 0.00);
INSERT INTO public.cheque
VALUES (261, 11, 33, 2010.69, 1906.11, 0.00);
INSERT INTO public.cheque
VALUES (22, 12, 32, 8499.84, 8499.84, 0.00);
INSERT INTO public.cheque
VALUES (146, 10, 30, 15300.00, 15158.69, 141.31);
INSERT INTO public.cheque
VALUES (124, 28, 19, 10409.34, 10409.34, 0.00);
INSERT INTO public.cheque
VALUES (211, 25, 24, 10141.20, 10141.20, 0.00);
INSERT INTO public.cheque
VALUES (214, 24, 24, 13734.00, 13734.00, 0.00);
INSERT INTO public.cheque
VALUES (41, 12, 34, 9031.08, 7495.55, 0.00);
INSERT INTO public.cheque
VALUES (20, 28, 39, 17596.02, 15561.93, 0.00);
INSERT INTO public.cheque
VALUES (101, 10, 2, 1020.00, 820.51, 199.49);
INSERT INTO public.cheque
VALUES (75, 13, 39, 7666.23, 7666.23, 0.00);
INSERT INTO public.cheque
VALUES (55, 5, 41, 7754.33, 6967.75, 0.00);
INSERT INTO public.cheque
VALUES (29, 6, 22, 3891.58, 3891.58, 0.00);
INSERT INTO public.cheque
VALUES (56, 14, 10, 2577.90, 2577.90, 0.00);
INSERT INTO public.cheque
VALUES (180, 2, 10, 6317.50, 6317.50, 0.00);
INSERT INTO public.cheque
VALUES (235, 16, 27, 15718.05, 15718.05, 0.00);
INSERT INTO public.cheque
VALUES (144, 3, 31, 1258.60, 1258.60, 0.00);
INSERT INTO public.cheque
VALUES (233, 24, 14, 6597.78, 5331.56, 0.00);
INSERT INTO public.cheque
VALUES (174, 1, 50, 21250.00, 20253.15, 996.85);
INSERT INTO public.cheque
VALUES (190, 15, 4, 834.04, 834.04, 0.00);
INSERT INTO public.cheque
VALUES (264, 13, 29, 4200.36, 4075.65, 0.00);
INSERT INTO public.cheque
VALUES (71, 8, 9, 1675.80, 1675.80, 0.00);
INSERT INTO public.cheque
VALUES (109, 5, 47, 5856.20, 4766.78, 1089.42);
INSERT INTO public.cheque
VALUES (158, 12, 39, 7633.08, 7235.32, 0.00);
INSERT INTO public.cheque
VALUES (26, 26, 18, 11007.54, 11007.54, 0.00);
INSERT INTO public.cheque
VALUES (55, 5, 45, 8510.85, 8099.49, 0.00);
INSERT INTO public.cheque
VALUES (56, 4, 21, 11156.25, 11156.25, 0.00);
INSERT INTO public.cheque
VALUES (45, 29, 39, 25654.98, 20588.83, 0.00);
INSERT INTO public.cheque
VALUES (19, 7, 33, 9113.61, 9113.61, 0.00);
INSERT INTO public.cheque
VALUES (166, 27, 21, 2718.24, 2385.53, 0.00);
INSERT INTO public.cheque
VALUES (239, 2, 26, 16425.50, 16425.50, 0.00);
INSERT INTO public.cheque
VALUES (201, 7, 31, 6640.20, 6640.20, 0.00);
INSERT INTO public.cheque
VALUES (74, 12, 12, 2851.92, 2851.92, 0.00);
INSERT INTO public.cheque
VALUES (9, 15, 1, 208.51, 208.51, 0.00);
INSERT INTO public.cheque
VALUES (255, 7, 3, 975.39, 975.39, 0.00);
INSERT INTO public.cheque
VALUES (185, 22, 14, 1349.46, 1165.06, 0.00);
INSERT INTO public.cheque
VALUES (249, 6, 37, 7705.25, 7705.25, 0.00);
INSERT INTO public.cheque
VALUES (175, 18, 6, 4866.00, 4866.00, 0.00);
INSERT INTO public.cheque
VALUES (27, 7, 31, 10079.03, 10079.03, 0.00);
INSERT INTO public.cheque
VALUES (54, 20, 18, 4336.92, 4336.92, 0.00);
INSERT INTO public.cheque
VALUES (42, 8, 28, 7913.64, 7913.64, 0.00);
INSERT INTO public.cheque
VALUES (157, 23, 7, 3931.76, 3717.49, 0.00);
INSERT INTO public.cheque
VALUES (57, 8, 49, 13848.87, 12132.21, 0.00);
INSERT INTO public.cheque
VALUES (107, 18, 13, 8682.44, 8682.44, 0.00);
INSERT INTO public.cheque
VALUES (116, 21, 33, 1807.74, 1523.22, 0.00);
INSERT INTO public.cheque
VALUES (207, 26, 2, 1485.16, 1485.16, 0.00);
INSERT INTO public.cheque
VALUES (59, 30, 15, 7853.70, 7853.70, 0.00);
INSERT INTO public.cheque
VALUES (68, 22, 9, 1053.45, 1053.45, 0.00);
INSERT INTO public.cheque
VALUES (92, 14, 17, 3609.10, 3312.62, 296.48);
INSERT INTO public.cheque
VALUES (92, 18, 46, 30722.48, 30722.48, 0.00);
INSERT INTO public.cheque
VALUES (268, 4, 32, 17000.00, 14099.27, 2900.73);
INSERT INTO public.cheque
VALUES (101, 28, 9, 4930.74, 4930.74, 0.00);
INSERT INTO public.cheque
VALUES (111, 15, 4, 834.04, 786.06, 0.00);
INSERT INTO public.cheque
VALUES (180, 29, 14, 10292.94, 10292.94, 0.00);
INSERT INTO public.cheque
VALUES (83, 12, 35, 9296.70, 9296.70, 0.00);
INSERT INTO public.cheque
VALUES (191, 13, 26, 5110.82, 4791.64, 0.00);
INSERT INTO public.cheque
VALUES (114, 13, 26, 5110.82, 5110.82, 0.00);
INSERT INTO public.cheque
VALUES (278, 22, 34, 3979.70, 3912.62, 0.00);
INSERT INTO public.cheque
VALUES (55, 24, 29, 16595.25, 15244.34, 0.00);
INSERT INTO public.cheque
VALUES (273, 25, 50, 17399.00, 15287.68, 0.00);
INSERT INTO public.cheque
VALUES (278, 14, 5, 1288.95, 1288.95, 0.00);
INSERT INTO public.cheque
VALUES (81, 9, 46, 41055.00, 40723.25, 0.00);
INSERT INTO public.cheque
VALUES (74, 8, 33, 9326.79, 7486.51, 0.00);
INSERT INTO public.cheque
VALUES (147, 3, 49, 3019.87, 2659.85, 360.02);
INSERT INTO public.cheque
VALUES (50, 3, 12, 487.20, 487.20, 0.00);
INSERT INTO public.cheque
VALUES (186, 13, 3, 527.64, 527.64, 0.00);
INSERT INTO public.cheque
VALUES (175, 15, 48, 10008.48, 10008.48, 0.00);
INSERT INTO public.cheque
VALUES (140, 26, 50, 41497.00, 34026.42, 0.00);
INSERT INTO public.cheque
VALUES (280, 18, 20, 18128.20, 16765.87, 0.00);
INSERT INTO public.cheque
VALUES (208, 29, 6, 4411.26, 3622.45, 0.00);
INSERT INTO public.cheque
VALUES (61, 15, 28, 6525.12, 6525.12, 0.00);
INSERT INTO public.cheque
VALUES (58, 22, 20, 2341.00, 2341.00, 0.00);
INSERT INTO public.cheque
VALUES (51, 2, 25, 12250.00, 10653.72, 0.00);
INSERT INTO public.cheque
VALUES (150, 29, 21, 11376.33, 11376.33, 0.00);
INSERT INTO public.cheque
VALUES (98, 1, 20, 5600.00, 4798.02, 801.98);
INSERT INTO public.cheque
VALUES (77, 9, 49, 43732.50, 43732.50, 0.00);
INSERT INTO public.cheque
VALUES (17, 12, 15, 3564.90, 3564.90, 0.00);
INSERT INTO public.cheque
VALUES (281, 29, 44, 23836.12, 19695.67, 0.00);
INSERT INTO public.cheque
VALUES (135, 25, 29, 13695.54, 13695.54, 0.00);
INSERT INTO public.cheque
VALUES (101, 12, 44, 10457.04, 10457.04, 0.00);
INSERT INTO public.cheque
VALUES (60, 24, 27, 12724.29, 10214.68, 0.00);
INSERT INTO public.cheque
VALUES (197, 12, 47, 9198.84, 9198.84, 0.00);
INSERT INTO public.cheque
VALUES (206, 27, 13, 1880.71, 1880.71, 0.00);
INSERT INTO public.cheque
VALUES (115, 9, 29, 17052.00, 15502.00, 1550.00);
INSERT INTO public.cheque
VALUES (40, 2, 32, 20216.00, 20216.00, 0.00);
INSERT INTO public.cheque
VALUES (259, 6, 29, 3978.80, 3798.78, 180.02);
INSERT INTO public.cheque
VALUES (42, 11, 43, 3181.14, 2582.21, 0.00);
INSERT INTO public.cheque
VALUES (116, 24, 13, 8314.54, 8314.54, 0.00);
INSERT INTO public.cheque
VALUES (71, 29, 11, 5959.03, 5440.03, 0.00);
INSERT INTO public.cheque
VALUES (246, 19, 21, 10085.46, 9298.22, 787.24);
INSERT INTO public.cheque
VALUES (249, 14, 10, 2577.90, 2577.90, 0.00);
INSERT INTO public.cheque
VALUES (243, 30, 4, 1724.76, 1724.76, 0.00);
INSERT INTO public.cheque
VALUES (16, 8, 12, 2234.40, 2023.29, 0.00);
INSERT INTO public.cheque
VALUES (210, 17, 40, 148.80, 148.80, 0.00);
INSERT INTO public.cheque
VALUES (206, 28, 37, 22655.47, 20284.07, 0.00);
INSERT INTO public.cheque
VALUES (258, 20, 31, 7469.14, 7469.14, 0.00);
INSERT INTO public.cheque
VALUES (104, 29, 21, 13814.22, 13563.72, 0.00);
INSERT INTO public.cheque
VALUES (122, 19, 9, 3184.92, 2551.57, 0.00);
INSERT INTO public.cheque
VALUES (26, 23, 37, 17114.72, 15656.83, 0.00);
INSERT INTO public.cheque
VALUES (274, 9, 3, 2677.50, 2606.01, 0.00);
INSERT INTO public.cheque
VALUES (63, 8, 21, 3910.20, 3714.62, 0.00);
INSERT INTO public.cheque
VALUES (142, 29, 17, 9209.41, 8962.02, 0.00);
INSERT INTO public.cheque
VALUES (87, 23, 43, 24152.24, 21526.63, 2625.61);
INSERT INTO public.cheque
VALUES (32, 3, 2, 123.26, 107.96, 15.30);
INSERT INTO public.cheque
VALUES (139, 25, 32, 13521.60, 11419.33, 2102.27);
INSERT INTO public.cheque
VALUES (261, 29, 10, 5417.30, 4492.73, 0.00);
INSERT INTO public.cheque
VALUES (123, 2, 20, 14875.00, 13535.43, 0.00);
INSERT INTO public.cheque
VALUES (124, 16, 17, 9896.55, 9251.48, 645.07);
INSERT INTO public.cheque
VALUES (30, 8, 15, 4239.45, 4239.45, 0.00);
INSERT INTO public.cheque
VALUES (38, 9, 23, 20527.50, 20527.50, 0.00);
INSERT INTO public.cheque
VALUES (166, 16, 36, 20957.40, 20661.93, 295.47);
INSERT INTO public.cheque
VALUES (269, 7, 33, 9113.61, 9113.61, 0.00);
INSERT INTO public.cheque
VALUES (207, 20, 50, 12047.00, 10572.27, 1474.73);
INSERT INTO public.cheque
VALUES (63, 14, 43, 9128.90, 8227.95, 900.95);
INSERT INTO public.cheque
VALUES (67, 7, 12, 3901.56, 3326.89, 0.00);
INSERT INTO public.cheque
VALUES (207, 23, 38, 21343.84, 18180.49, 0.00);
INSERT INTO public.cheque
VALUES (2, 30, 11, 4743.09, 4743.09, 0.00);
INSERT INTO public.cheque
VALUES (144, 9, 2, 1176.00, 957.09, 0.00);
INSERT INTO public.cheque
VALUES (193, 15, 20, 4170.20, 4170.20, 0.00);
INSERT INTO public.cheque
VALUES (230, 13, 48, 8442.24, 6986.00, 1456.24);
INSERT INTO public.cheque
VALUES (36, 4, 43, 22843.75, 22843.75, 0.00);
INSERT INTO public.cheque
VALUES (209, 30, 27, 14136.66, 14136.66, 0.00);
INSERT INTO public.cheque
VALUES (155, 28, 9, 4930.74, 4520.11, 0.00);
INSERT INTO public.cheque
VALUES (53, 23, 18, 8326.08, 7246.74, 0.00);
INSERT INTO public.cheque
VALUES (58, 13, 23, 4045.24, 4045.24, 0.00);
INSERT INTO public.cheque
VALUES (4, 8, 15, 3601.05, 3601.05, 0.00);
INSERT INTO public.cheque
VALUES (214, 11, 26, 1923.48, 1616.05, 0.00);
INSERT INTO public.cheque
VALUES (40, 1, 23, 8303.00, 8303.00, 0.00);
INSERT INTO public.cheque
VALUES (172, 27, 46, 5954.24, 5794.96, 0.00);
INSERT INTO public.cheque
VALUES (14, 24, 47, 30060.26, 30060.26, 0.00);
INSERT INTO public.cheque
VALUES (284, 22, 43, 4144.77, 4144.77, 0.00);
INSERT INTO public.cheque
VALUES (178, 9, 19, 14403.90, 14403.90, 0.00);
INSERT INTO public.cheque
VALUES (279, 6, 24, 4998.00, 4350.53, 0.00);
INSERT INTO public.cheque
VALUES (165, 26, 49, 29964.97, 26811.22, 0.00);
INSERT INTO public.cheque
VALUES (52, 5, 49, 7871.85, 7871.85, 0.00);
INSERT INTO public.cheque
VALUES (120, 13, 5, 879.40, 728.39, 151.01);
INSERT INTO public.cheque
VALUES (271, 28, 4, 2191.44, 2191.44, 0.00);
INSERT INTO public.cheque
VALUES (68, 10, 24, 12240.00, 12240.00, 0.00);
INSERT INTO public.cheque
VALUES (59, 29, 40, 26312.80, 26312.80, 0.00);
INSERT INTO public.cheque
VALUES (64, 11, 10, 739.80, 739.80, 0.00);
INSERT INTO public.cheque
VALUES (204, 13, 7, 1231.16, 1146.34, 0.00);
INSERT INTO public.cheque
VALUES (102, 4, 28, 9800.00, 9166.96, 0.00);
INSERT INTO public.cheque
VALUES (89, 19, 35, 15039.85, 15039.85, 0.00);
INSERT INTO public.cheque
VALUES (151, 13, 26, 4572.88, 3707.46, 0.00);
INSERT INTO public.cheque
VALUES (6, 12, 6, 1593.72, 1483.94, 0.00);
INSERT INTO public.cheque
VALUES (12, 5, 28, 5295.64, 4274.96, 0.00);
INSERT INTO public.cheque
VALUES (57, 12, 18, 4277.88, 3638.20, 0.00);
INSERT INTO public.cheque
VALUES (150, 20, 27, 5357.34, 5357.34, 0.00);
INSERT INTO public.cheque
VALUES (50, 18, 35, 23375.80, 19995.40, 0.00);
INSERT INTO public.cheque
VALUES (247, 3, 7, 366.45, 366.45, 0.00);
INSERT INTO public.cheque
VALUES (71, 29, 17, 9209.41, 7436.31, 0.00);
INSERT INTO public.cheque
VALUES (155, 22, 23, 2692.15, 2209.00, 0.00);
INSERT INTO public.cheque
VALUES (183, 6, 25, 5206.25, 5206.25, 0.00);
INSERT INTO public.cheque
VALUES (237, 10, 34, 17340.00, 16265.69, 1074.31);
INSERT INTO public.cheque
VALUES (189, 27, 6, 639.60, 639.60, 0.00);
INSERT INTO public.cheque
VALUES (134, 8, 33, 6144.60, 6144.60, 0.00);
INSERT INTO public.cheque
VALUES (211, 29, 15, 9867.30, 8051.22, 1816.08);
INSERT INTO public.cheque
VALUES (264, 29, 28, 15168.44, 15168.44, 0.00);
INSERT INTO public.cheque
VALUES (284, 14, 18, 3821.40, 3821.40, 0.00);
INSERT INTO public.cheque
VALUES (185, 14, 29, 6156.70, 5757.14, 0.00);
INSERT INTO public.cheque
VALUES (214, 7, 39, 12680.07, 10665.31, 0.00);
INSERT INTO public.cheque
VALUES (207, 15, 28, 5838.28, 5838.28, 0.00);
INSERT INTO public.cheque
VALUES (277, 19, 29, 13927.54, 13927.54, 0.00);
INSERT INTO public.cheque
VALUES (259, 1, 31, 8680.00, 8680.00, 0.00);
INSERT INTO public.cheque
VALUES (197, 20, 37, 7341.54, 7321.67, 0.00);
INSERT INTO public.cheque
VALUES (122, 24, 23, 10839.21, 8800.45, 0.00);
INSERT INTO public.cheque
VALUES (72, 11, 40, 3307.60, 3307.60, 0.00);
INSERT INTO public.cheque
VALUES (58, 19, 44, 18907.24, 17750.64, 1156.60);
INSERT INTO public.cheque
VALUES (109, 23, 17, 7863.52, 7863.52, 0.00);
INSERT INTO public.cheque
VALUES (154, 2, 37, 27518.75, 27518.75, 0.00);
INSERT INTO public.cheque
VALUES (174, 1, 40, 17000.00, 17000.00, 0.00);
INSERT INTO public.cheque
VALUES (65, 10, 39, 16894.80, 14540.39, 0.00);
INSERT INTO public.cheque
VALUES (17, 24, 3, 1716.75, 1716.75, 0.00);
INSERT INTO public.cheque
VALUES (105, 4, 38, 13300.00, 13300.00, 0.00);
INSERT INTO public.cheque
VALUES (184, 26, 38, 28218.04, 28218.04, 0.00);
INSERT INTO public.cheque
VALUES (49, 25, 12, 4175.76, 4093.86, 81.90);
INSERT INTO public.cheque
VALUES (168, 11, 1, 60.93, 57.54, 3.39);
INSERT INTO public.cheque
VALUES (75, 3, 32, 1675.20, 1675.20, 0.00);
INSERT INTO public.cheque
VALUES (266, 9, 10, 8925.00, 8925.00, 0.00);
INSERT INTO public.cheque
VALUES (263, 16, 15, 8732.25, 8732.25, 0.00);
INSERT INTO public.cheque
VALUES (76, 25, 29, 12253.95, 10688.43, 0.00);
INSERT INTO public.cheque
VALUES (266, 26, 8, 5940.64, 5940.64, 0.00);
INSERT INTO public.cheque
VALUES (130, 10, 25, 10830.00, 10830.00, 0.00);
INSERT INTO public.cheque
VALUES (37, 20, 47, 12656.63, 10743.15, 0.00);
INSERT INTO public.cheque
VALUES (39, 28, 18, 9861.48, 9861.48, 0.00);
INSERT INTO public.cheque
VALUES (195, 17, 19, 63.27, 54.59, 0.00);
INSERT INTO public.cheque
VALUES (33, 18, 3, 2003.64, 2003.64, 0.00);
INSERT INTO public.cheque
VALUES (27, 22, 15, 1755.75, 1603.02, 0.00);
INSERT INTO public.cheque
VALUES (57, 4, 16, 8500.00, 8500.00, 0.00);
INSERT INTO public.cheque
VALUES (87, 5, 10, 1891.30, 1891.30, 0.00);
INSERT INTO public.cheque
VALUES (3, 24, 24, 13734.00, 12484.47, 0.00);
INSERT INTO public.cheque
VALUES (161, 20, 31, 7469.14, 6501.07, 0.00);
INSERT INTO public.cheque
VALUES (124, 3, 7, 431.41, 431.41, 0.00);
INSERT INTO public.cheque
VALUES (173, 7, 32, 6854.40, 6854.40, 0.00);
INSERT INTO public.cheque
VALUES (190, 22, 18, 2106.90, 1869.04, 0.00);
INSERT INTO public.cheque
VALUES (75, 2, 21, 13266.75, 11568.77, 0.00);
INSERT INTO public.cheque
VALUES (7, 26, 34, 25247.72, 25247.72, 0.00);
INSERT INTO public.cheque
VALUES (257, 28, 3, 1836.93, 1646.99, 0.00);
INSERT INTO public.cheque
VALUES (263, 23, 4, 2246.72, 2246.72, 0.00);
INSERT INTO public.cheque
VALUES (123, 8, 23, 6500.49, 6500.49, 0.00);
INSERT INTO public.cheque
VALUES (66, 21, 19, 931.19, 931.19, 0.00);
INSERT INTO public.cheque
VALUES (80, 4, 21, 11156.25, 11156.25, 0.00);
INSERT INTO public.cheque
VALUES (124, 4, 45, 23906.25, 23906.25, 0.00);
INSERT INTO public.cheque
VALUES (282, 8, 8, 1489.60, 1383.46, 106.14);
INSERT INTO public.cheque
VALUES (265, 28, 12, 7347.72, 7173.31, 174.41);
INSERT INTO public.cheque
VALUES (100, 16, 29, 16882.35, 16823.10, 0.00);
INSERT INTO public.cheque
VALUES (29, 7, 46, 12703.82, 10441.45, 2262.37);
INSERT INTO public.cheque
VALUES (22, 30, 2, 1170.36, 1009.35, 161.01);
INSERT INTO public.cheque
VALUES (96, 4, 8, 4250.00, 4250.00, 0.00);
INSERT INTO public.cheque
VALUES (235, 26, 43, 31930.94, 30820.42, 0.00);
INSERT INTO public.cheque
VALUES (282, 23, 37, 17114.72, 16799.06, 315.66);
INSERT INTO public.cheque
VALUES (54, 23, 49, 27522.32, 26496.08, 1026.24);
INSERT INTO public.cheque
VALUES (56, 19, 13, 5586.23, 5586.23, 0.00);
INSERT INTO public.cheque
VALUES (139, 8, 12, 3391.56, 3391.56, 0.00);
INSERT INTO public.cheque
VALUES (72, 18, 15, 13596.15, 13596.15, 0.00);
INSERT INTO public.cheque
VALUES (245, 17, 17, 56.61, 56.61, 0.00);
INSERT INTO public.cheque
VALUES (266, 19, 21, 9023.91, 7583.99, 0.00);
INSERT INTO public.cheque
VALUES (103, 12, 5, 1188.30, 1188.30, 0.00);
INSERT INTO public.cheque
VALUES (91, 2, 30, 22312.50, 19179.89, 3132.61);
INSERT INTO public.cheque
VALUES (201, 9, 32, 18816.00, 17562.26, 1253.74);
INSERT INTO public.cheque
VALUES (42, 24, 21, 12017.25, 12017.25, 0.00);
INSERT INTO public.cheque
VALUES (274, 17, 35, 116.55, 116.54, 0.01);
INSERT INTO public.cheque
VALUES (249, 18, 49, 39739.00, 39739.00, 0.00);
INSERT INTO public.cheque
VALUES (57, 1, 21, 8925.00, 8925.00, 0.00);
INSERT INTO public.cheque
VALUES (281, 22, 48, 4626.72, 3725.98, 0.00);
INSERT INTO public.cheque
VALUES (174, 21, 8, 392.08, 348.75, 0.00);
INSERT INTO public.cheque
VALUES (247, 6, 33, 5837.37, 5179.36, 0.00);
INSERT INTO public.cheque
VALUES (267, 13, 13, 1882.92, 1674.69, 0.00);
INSERT INTO public.cheque
VALUES (190, 7, 33, 10729.29, 10729.29, 0.00);
INSERT INTO public.cheque
VALUES (81, 15, 2, 417.02, 417.02, 0.00);
INSERT INTO public.cheque
VALUES (159, 15, 33, 5666.43, 5666.43, 0.00);
INSERT INTO public.cheque
VALUES (116, 11, 25, 2067.25, 2067.25, 0.00);
INSERT INTO public.cheque
VALUES (283, 24, 46, 26323.50, 26323.50, 0.00);
INSERT INTO public.cheque
VALUES (43, 7, 25, 6904.25, 6904.25, 0.00);
INSERT INTO public.cheque
VALUES (217, 6, 41, 5625.20, 4803.21, 0.00);
INSERT INTO public.cheque
VALUES (195, 28, 44, 24105.84, 21560.94, 0.00);
INSERT INTO public.cheque
VALUES (179, 7, 40, 13005.20, 13005.20, 0.00);
INSERT INTO public.cheque
VALUES (208, 12, 38, 10093.56, 8376.24, 0.00);
INSERT INTO public.cheque
VALUES (195, 14, 31, 7991.49, 7991.49, 0.00);
INSERT INTO public.cheque
VALUES (52, 2, 46, 29060.50, 25743.10, 0.00);
INSERT INTO public.cheque
VALUES (85, 19, 48, 16986.24, 15212.42, 0.00);
INSERT INTO public.cheque
VALUES (230, 15, 42, 8757.42, 7157.12, 0.00);
INSERT INTO public.cheque
VALUES (206, 4, 9, 4061.25, 4061.25, 0.00);
INSERT INTO public.cheque
VALUES (28, 10, 39, 16894.80, 16894.80, 0.00);
INSERT INTO public.cheque
VALUES (232, 10, 28, 14280.00, 14280.00, 0.00);
INSERT INTO public.cheque
VALUES (285, 6, 27, 5622.75, 5622.48, 0.00);
INSERT INTO public.cheque
VALUES (74, 13, 11, 1934.68, 1776.48, 0.00);
INSERT INTO public.cheque
VALUES (122, 3, 50, 2030.00, 2030.00, 0.00);
INSERT INTO public.cheque
VALUES (277, 5, 44, 7068.60, 6228.71, 839.89);
INSERT INTO public.cheque
VALUES (105, 9, 31, 18228.00, 18228.00, 0.00);
INSERT INTO public.cheque
VALUES (242, 16, 33, 19210.95, 19210.95, 0.00);
INSERT INTO public.cheque
VALUES (45, 16, 43, 25032.45, 22752.57, 0.00);
INSERT INTO public.cheque
VALUES (204, 9, 19, 16957.50, 16957.50, 0.00);
INSERT INTO public.cheque
VALUES (208, 24, 45, 28781.10, 28781.10, 0.00);
INSERT INTO public.cheque
VALUES (61, 3, 13, 680.55, 624.69, 0.00);
INSERT INTO public.cheque
VALUES (159, 30, 34, 14660.46, 13394.65, 0.00);
INSERT INTO public.cheque
VALUES (39, 13, 49, 8618.12, 7597.03, 0.00);
INSERT INTO public.cheque
VALUES (77, 9, 39, 34807.50, 33875.66, 0.00);
INSERT INTO public.cheque
VALUES (82, 9, 3, 2677.50, 2677.50, 0.00);
INSERT INTO public.cheque
VALUES (168, 10, 9, 3024.00, 2820.48, 203.52);
INSERT INTO public.cheque
VALUES (23, 23, 19, 11927.44, 11927.44, 0.00);
INSERT INTO public.cheque
VALUES (58, 26, 23, 17079.34, 16336.20, 743.14);
INSERT INTO public.cheque
VALUES (80, 3, 19, 1170.97, 1061.39, 109.58);
INSERT INTO public.cheque
VALUES (56, 7, 17, 5527.21, 5527.21, 0.00);
INSERT INTO public.cheque
VALUES (48, 26, 38, 28218.04, 22920.40, 0.00);
INSERT INTO public.cheque
VALUES (278, 22, 21, 2458.05, 2458.05, 0.00);
INSERT INTO public.cheque
VALUES (62, 2, 8, 3920.00, 3920.00, 0.00);
INSERT INTO public.cheque
VALUES (41, 11, 41, 3390.29, 2742.46, 0.00);
INSERT INTO public.cheque
VALUES (281, 13, 5, 724.20, 724.20, 0.00);
INSERT INTO public.cheque
VALUES (231, 20, 14, 2777.88, 2777.88, 0.00);
INSERT INTO public.cheque
VALUES (48, 9, 13, 11602.50, 9448.19, 0.00);
INSERT INTO public.cheque
VALUES (202, 12, 35, 6850.20, 6850.20, 0.00);
INSERT INTO public.cheque
VALUES (219, 16, 39, 22703.85, 20975.12, 0.00);
INSERT INTO public.cheque
VALUES (21, 10, 44, 22440.00, 22440.00, 0.00);
INSERT INTO public.cheque
VALUES (204, 9, 37, 33022.50, 33022.50, 0.00);
INSERT INTO public.cheque
VALUES (49, 11, 31, 1888.83, 1814.30, 0.00);
INSERT INTO public.cheque
VALUES (70, 24, 17, 10872.86, 10872.86, 0.00);
INSERT INTO public.cheque
VALUES (122, 26, 17, 10396.01, 10396.01, 0.00);
INSERT INTO public.cheque
VALUES (209, 14, 19, 4898.01, 4741.38, 156.63);
INSERT INTO public.cheque
VALUES (54, 6, 8, 1666.00, 1455.44, 210.56);
INSERT INTO public.cheque
VALUES (117, 14, 33, 9507.96, 9507.96, 0.00);
INSERT INTO public.cheque
VALUES (68, 4, 19, 10093.75, 10093.75, 0.00);
INSERT INTO public.cheque
VALUES (46, 3, 23, 1417.49, 1417.49, 0.00);
INSERT INTO public.cheque
VALUES (20, 21, 42, 1695.12, 1458.14, 0.00);
INSERT INTO public.cheque
VALUES (21, 1, 43, 18275.00, 18275.00, 0.00);
INSERT INTO public.cheque
VALUES (121, 24, 3, 1716.75, 1716.75, 0.00);
INSERT INTO public.cheque
VALUES (211, 25, 4, 1690.20, 1425.82, 0.00);
INSERT INTO public.cheque
VALUES (88, 3, 13, 527.80, 442.50, 85.30);
INSERT INTO public.cheque
VALUES (17, 29, 7, 4604.74, 4604.74, 0.00);
INSERT INTO public.cheque
VALUES (223, 29, 20, 10834.60, 10834.60, 0.00);
INSERT INTO public.cheque
VALUES (259, 6, 1, 137.20, 122.67, 0.00);
INSERT INTO public.cheque
VALUES (54, 11, 50, 3699.00, 3699.00, 0.00);
INSERT INTO public.cheque
VALUES (129, 13, 47, 8266.36, 7020.18, 0.00);
INSERT INTO public.cheque
VALUES (139, 27, 30, 3883.20, 3405.45, 0.00);
INSERT INTO public.cheque
VALUES (74, 15, 38, 7923.38, 7310.55, 612.83);
INSERT INTO public.cheque
VALUES (171, 14, 35, 9022.65, 9022.65, 0.00);
INSERT INTO public.cheque
VALUES (35, 27, 36, 5208.12, 5196.21, 0.00);
INSERT INTO public.cheque
VALUES (197, 24, 11, 5183.97, 4671.03, 0.00);
INSERT INTO public.cheque
VALUES (285, 4, 47, 24968.75, 21536.44, 3432.31);
INSERT INTO public.cheque
VALUES (64, 13, 3, 527.64, 527.64, 0.00);
INSERT INTO public.cheque
VALUES (261, 10, 2, 672.00, 655.02, 0.00);
INSERT INTO public.cheque
VALUES (53, 29, 35, 18960.55, 16394.83, 0.00);
INSERT INTO public.cheque
VALUES (83, 23, 42, 26365.92, 23521.51, 2844.41);
INSERT INTO public.cheque
VALUES (283, 5, 19, 3593.47, 3593.47, 0.00);
INSERT INTO public.cheque
VALUES (100, 14, 37, 9538.23, 8226.00, 0.00);
INSERT INTO public.cheque
VALUES (136, 23, 16, 8986.88, 7355.76, 0.00);
INSERT INTO public.cheque
VALUES (141, 14, 27, 6960.33, 5641.37, 1318.96);
INSERT INTO public.cheque
VALUES (100, 10, 20, 10200.00, 9259.47, 0.00);
INSERT INTO public.cheque
VALUES (209, 27, 10, 1294.40, 1133.94, 0.00);
INSERT INTO public.cheque
VALUES (278, 20, 18, 4336.92, 4336.92, 0.00);
INSERT INTO public.cheque
VALUES (49, 28, 40, 18047.20, 18047.20, 0.00);
INSERT INTO public.cheque
VALUES (84, 9, 12, 10710.00, 10139.32, 0.00);
INSERT INTO public.cheque
VALUES (159, 10, 21, 7056.00, 6215.09, 840.91);
INSERT INTO public.cheque
VALUES (36, 4, 14, 7437.50, 5972.07, 0.00);
INSERT INTO public.cheque
VALUES (217, 13, 35, 5069.40, 5069.40, 0.00);
INSERT INTO public.cheque
VALUES (48, 30, 8, 4188.64, 3532.02, 0.00);
INSERT INTO public.cheque
VALUES (261, 16, 43, 20615.06, 20615.06, 0.00);
INSERT INTO public.cheque
VALUES (249, 17, 37, 123.21, 107.97, 0.00);
INSERT INTO public.cheque
VALUES (200, 19, 12, 5763.12, 4760.21, 0.00);
INSERT INTO public.cheque
VALUES (12, 24, 26, 14878.50, 14878.50, 0.00);
INSERT INTO public.cheque
VALUES (116, 23, 49, 30760.24, 25199.59, 0.00);
INSERT INTO public.cheque
VALUES (139, 23, 24, 13480.32, 13480.32, 0.00);
INSERT INTO public.cheque
VALUES (40, 6, 42, 7429.38, 6930.66, 0.00);
INSERT INTO public.cheque
VALUES (204, 11, 43, 3181.14, 2624.08, 0.00);
INSERT INTO public.cheque
VALUES (217, 19, 14, 4954.32, 4954.32, 0.00);
INSERT INTO public.cheque
VALUES (174, 4, 9, 4781.25, 4237.21, 0.00);
INSERT INTO public.cheque
VALUES (168, 9, 38, 22344.00, 20326.04, 0.00);
INSERT INTO public.cheque
VALUES (233, 14, 44, 9341.20, 9341.20, 0.00);
INSERT INTO public.cheque
VALUES (90, 15, 21, 4378.71, 4378.71, 0.00);
INSERT INTO public.cheque
VALUES (145, 9, 15, 13387.50, 13387.50, 0.00);
INSERT INTO public.cheque
VALUES (167, 30, 8, 4188.64, 3604.73, 0.00);
INSERT INTO public.cheque
VALUES (117, 24, 25, 15989.50, 14027.62, 1961.88);
INSERT INTO public.cheque
VALUES (79, 2, 30, 14700.00, 13404.35, 1295.65);
INSERT INTO public.cheque
VALUES (12, 12, 4, 950.64, 950.64, 0.00);
INSERT INTO public.cheque
VALUES (13, 9, 11, 8339.10, 8339.10, 0.00);
INSERT INTO public.cheque
VALUES (229, 1, 26, 9386.00, 9386.00, 0.00);
INSERT INTO public.cheque
VALUES (136, 30, 22, 11518.76, 11518.76, 0.00);
INSERT INTO public.cheque
VALUES (226, 8, 3, 720.21, 601.08, 119.13);
INSERT INTO public.cheque
VALUES (20, 16, 19, 9108.98, 7522.40, 0.00);
INSERT INTO public.cheque
VALUES (189, 8, 19, 3537.80, 3537.80, 0.00);
INSERT INTO public.cheque
VALUES (260, 13, 35, 5069.40, 4341.35, 0.00);
INSERT INTO public.cheque
VALUES (26, 19, 2, 707.76, 689.51, 0.00);
INSERT INTO public.cheque
VALUES (200, 27, 20, 2893.40, 2893.40, 0.00);
INSERT INTO public.cheque
VALUES (248, 17, 33, 109.89, 109.89, 0.00);
INSERT INTO public.cheque
VALUES (91, 26, 41, 30445.78, 30445.78, 0.00);
INSERT INTO public.cheque
VALUES (233, 13, 30, 4345.20, 4345.20, 0.00);
INSERT INTO public.cheque
VALUES (34, 13, 23, 4045.24, 3606.03, 439.21);
INSERT INTO public.cheque
VALUES (148, 18, 42, 34062.00, 34062.00, 0.00);
INSERT INTO public.cheque
VALUES (240, 5, 40, 7565.20, 6806.51, 0.00);
INSERT INTO public.cheque
VALUES (57, 23, 47, 26398.96, 26398.96, 0.00);
INSERT INTO public.cheque
VALUES (254, 25, 45, 19014.75, 18081.40, 0.00);
INSERT INTO public.cheque
VALUES (177, 7, 47, 10067.40, 10011.00, 56.40);
INSERT INTO public.cheque
VALUES (82, 11, 32, 2367.36, 2367.36, 0.00);
INSERT INTO public.cheque
VALUES (48, 15, 4, 834.04, 749.73, 0.00);
INSERT INTO public.cheque
VALUES (175, 13, 14, 2462.32, 2228.76, 0.00);
INSERT INTO public.cheque
VALUES (189, 15, 14, 2403.94, 2304.87, 0.00);
INSERT INTO public.cheque
VALUES (105, 23, 20, 9251.20, 8797.78, 0.00);
INSERT INTO public.cheque
VALUES (209, 27, 25, 3236.00, 3236.00, 0.00);
INSERT INTO public.cheque
VALUES (222, 30, 25, 10779.75, 9681.38, 0.00);
INSERT INTO public.cheque
VALUES (153, 3, 7, 431.41, 415.60, 0.00);
INSERT INTO public.cheque
VALUES (249, 26, 15, 11138.70, 11138.70, 0.00);
INSERT INTO public.cheque
VALUES (259, 29, 7, 3792.11, 3732.07, 60.04);
INSERT INTO public.cheque
VALUES (192, 29, 15, 9867.30, 9867.30, 0.00);
INSERT INTO public.cheque
VALUES (207, 16, 21, 12225.15, 12225.15, 0.00);
INSERT INTO public.cheque
VALUES (89, 2, 50, 37187.50, 31329.56, 0.00);
INSERT INTO public.cheque
VALUES (104, 5, 23, 4349.99, 4349.40, 0.00);
INSERT INTO public.cheque
VALUES (277, 10, 30, 12996.00, 12996.00, 0.00);
INSERT INTO public.cheque
VALUES (108, 23, 43, 26993.68, 26835.01, 0.00);
INSERT INTO public.cheque
VALUES (155, 9, 29, 25882.50, 25882.50, 0.00);
INSERT INTO public.cheque
VALUES (275, 28, 47, 25749.42, 24174.36, 0.00);
INSERT INTO public.cheque
VALUES (27, 21, 46, 2254.46, 2254.46, 0.00);
INSERT INTO public.cheque
VALUES (123, 28, 36, 19722.96, 18136.32, 1586.64);
INSERT INTO public.cheque
VALUES (136, 18, 4, 3244.00, 2973.98, 270.02);
INSERT INTO public.cheque
VALUES (264, 3, 22, 893.20, 743.16, 0.00);
INSERT INTO public.cheque
VALUES (16, 9, 26, 15288.00, 15288.00, 0.00);
INSERT INTO public.cheque
VALUES (37, 22, 41, 5363.62, 5363.62, 0.00);
INSERT INTO public.cheque
VALUES (38, 2, 23, 17106.25, 16891.58, 214.67);
INSERT INTO public.cheque
VALUES (76, 9, 29, 25882.50, 25882.50, 0.00);
INSERT INTO public.cheque
VALUES (268, 17, 17, 56.61, 56.61, 0.00);
INSERT INTO public.cheque
VALUES (15, 13, 38, 6683.44, 6664.56, 0.00);
INSERT INTO public.cheque
VALUES (211, 10, 23, 11730.00, 10577.33, 0.00);
INSERT INTO public.cheque
VALUES (25, 6, 30, 4116.00, 3538.45, 0.00);
INSERT INTO public.cheque
VALUES (250, 20, 8, 1587.36, 1270.24, 0.00);
INSERT INTO public.cheque
VALUES (126, 20, 41, 9878.54, 9878.54, 0.00);
INSERT INTO public.cheque
VALUES (68, 28, 35, 19175.10, 17151.93, 2023.17);
INSERT INTO public.cheque
VALUES (209, 24, 7, 4005.75, 4005.75, 0.00);
INSERT INTO public.cheque
VALUES (17, 18, 45, 36495.00, 29453.62, 0.00);
INSERT INTO public.cheque
VALUES (244, 24, 34, 21745.72, 21745.72, 0.00);
INSERT INTO public.cheque
VALUES (274, 11, 18, 1331.64, 1331.64, 0.00);
INSERT INTO public.cheque
VALUES (279, 27, 33, 4271.52, 4271.52, 0.00);
INSERT INTO public.cheque
VALUES (119, 13, 43, 7562.84, 6996.90, 565.94);
INSERT INTO public.cheque
VALUES (268, 20, 12, 2891.28, 2861.70, 0.00);
INSERT INTO public.cheque
VALUES (251, 1, 2, 850.00, 841.09, 0.00);
INSERT INTO public.cheque
VALUES (185, 3, 37, 1502.20, 1502.20, 0.00);
INSERT INTO public.cheque
VALUES (260, 2, 44, 21560.00, 21560.00, 0.00);
INSERT INTO public.cheque
VALUES (273, 16, 18, 8629.56, 8084.78, 544.78);
INSERT INTO public.cheque
VALUES (81, 6, 7, 1457.75, 1243.53, 0.00);
INSERT INTO public.cheque
VALUES (13, 9, 40, 30324.00, 25626.23, 4697.77);
INSERT INTO public.cheque
VALUES (247, 15, 13, 3029.52, 3029.52, 0.00);
INSERT INTO public.cheque
VALUES (27, 4, 11, 5843.75, 5843.75, 0.00);
INSERT INTO public.cheque
VALUES (91, 27, 23, 2977.12, 2977.12, 0.00);
INSERT INTO public.cheque
VALUES (166, 11, 33, 2441.34, 2179.90, 0.00);
INSERT INTO public.cheque
VALUES (79, 6, 29, 3978.80, 3278.38, 0.00);
INSERT INTO public.cheque
VALUES (182, 29, 15, 8125.95, 7462.41, 663.54);
INSERT INTO public.cheque
VALUES (169, 5, 49, 7871.85, 7817.91, 0.00);
INSERT INTO public.cheque
VALUES (124, 12, 48, 11407.68, 11407.68, 0.00);
INSERT INTO public.cheque
VALUES (34, 29, 19, 12498.58, 12434.56, 0.00);
INSERT INTO public.cheque
VALUES (102, 19, 29, 10262.52, 9012.65, 1249.87);
INSERT INTO public.cheque
VALUES (33, 7, 35, 7497.00, 7497.00, 0.00);
INSERT INTO public.cheque
VALUES (139, 10, 20, 10200.00, 9742.93, 0.00);
INSERT INTO public.cheque
VALUES (241, 11, 33, 2010.69, 1779.69, 231.00);
INSERT INTO public.cheque
VALUES (155, 23, 33, 18535.44, 17896.25, 0.00);
INSERT INTO public.cheque
VALUES (241, 7, 42, 8996.40, 8996.40, 0.00);
INSERT INTO public.cheque
VALUES (42, 7, 9, 2926.17, 2926.17, 0.00);
INSERT INTO public.cheque
VALUES (110, 11, 23, 1701.54, 1701.54, 0.00);
INSERT INTO public.cheque
VALUES (54, 28, 47, 25749.42, 25749.42, 0.00);
INSERT INTO public.cheque
VALUES (210, 30, 9, 5266.62, 4643.35, 0.00);
INSERT INTO public.cheque
VALUES (237, 27, 38, 4918.72, 4918.72, 0.00);
INSERT INTO public.cheque
VALUES (184, 28, 33, 18079.38, 16467.94, 0.00);
INSERT INTO public.cheque
VALUES (130, 1, 38, 13718.00, 13718.00, 0.00);
INSERT INTO public.cheque
VALUES (218, 24, 19, 10872.75, 10417.87, 0.00);
INSERT INTO public.cheque
VALUES (232, 19, 40, 17188.40, 17188.40, 0.00);
INSERT INTO public.cheque
VALUES (272, 3, 2, 123.26, 117.09, 6.17);
INSERT INTO public.cheque
VALUES (206, 9, 43, 32598.30, 31256.27, 0.00);
INSERT INTO public.cheque
VALUES (93, 27, 9, 1164.96, 970.82, 0.00);
INSERT INTO public.cheque
VALUES (163, 27, 9, 1302.03, 1090.55, 0.00);
INSERT INTO public.cheque
VALUES (79, 8, 9, 1675.80, 1466.04, 0.00);
INSERT INTO public.cheque
VALUES (178, 6, 34, 6014.26, 5677.26, 337.00);
INSERT INTO public.cheque
VALUES (177, 25, 41, 14267.18, 14267.18, 0.00);
INSERT INTO public.cheque
VALUES (259, 26, 2, 1223.06, 1223.06, 0.00);
INSERT INTO public.cheque
VALUES (285, 1, 33, 14025.00, 13363.74, 0.00);
INSERT INTO public.cheque
VALUES (31, 22, 10, 1170.50, 1126.96, 0.00);
INSERT INTO public.cheque
VALUES (83, 4, 7, 3158.75, 3158.75, 0.00);
INSERT INTO public.cheque
VALUES (87, 2, 25, 18593.75, 17472.38, 1121.37);
INSERT INTO public.cheque
VALUES (116, 2, 7, 4422.25, 3788.32, 633.93);
INSERT INTO public.cheque
VALUES (279, 11, 2, 147.96, 147.96, 0.00);
INSERT INTO public.cheque
VALUES (133, 1, 25, 10625.00, 8892.60, 0.00);
INSERT INTO public.cheque
VALUES (234, 23, 5, 2808.40, 2640.41, 0.00);
INSERT INTO public.cheque
VALUES (170, 10, 23, 7728.00, 7728.00, 0.00);
INSERT INTO public.cheque
VALUES (54, 15, 17, 3544.67, 3544.67, 0.00);
INSERT INTO public.cheque
VALUES (109, 23, 16, 7400.96, 7090.93, 310.03);
INSERT INTO public.cheque
VALUES (176, 5, 3, 567.39, 493.63, 0.00);
INSERT INTO public.cheque
VALUES (161, 7, 3, 975.39, 975.39, 0.00);
INSERT INTO public.cheque
VALUES (273, 13, 46, 6662.64, 6662.64, 0.00);
INSERT INTO public.cheque
VALUES (114, 14, 31, 8931.72, 7649.65, 0.00);
INSERT INTO public.cheque
VALUES (111, 17, 14, 46.62, 46.62, 0.00);
INSERT INTO public.cheque
VALUES (77, 27, 48, 6213.12, 6213.12, 0.00);
INSERT INTO public.cheque
VALUES (252, 22, 13, 1253.07, 1134.34, 118.73);
INSERT INTO public.cheque
VALUES (4, 15, 44, 10253.76, 9463.85, 0.00);
INSERT INTO public.cheque
VALUES (134, 26, 19, 11619.07, 10347.49, 0.00);
INSERT INTO public.cheque
VALUES (81, 24, 19, 10872.75, 10760.52, 0.00);
INSERT INTO public.cheque
VALUES (144, 30, 29, 12504.51, 12504.51, 0.00);
INSERT INTO public.cheque
VALUES (21, 21, 43, 2107.43, 2085.67, 21.76);
INSERT INTO public.cheque
VALUES (84, 18, 27, 21897.00, 20545.52, 1351.48);
INSERT INTO public.cheque
VALUES (111, 9, 37, 33022.50, 31155.84, 1866.66);
INSERT INTO public.cheque
VALUES (203, 3, 4, 162.40, 154.89, 0.00);
INSERT INTO public.cheque
VALUES (172, 20, 17, 4095.98, 4095.98, 0.00);
INSERT INTO public.cheque
VALUES (22, 30, 19, 11118.42, 11118.42, 0.00);
INSERT INTO public.cheque
VALUES (114, 12, 17, 4515.54, 4206.80, 0.00);
INSERT INTO public.cheque
VALUES (163, 4, 14, 6317.50, 5875.77, 441.73);
INSERT INTO public.cheque
VALUES (271, 18, 40, 32440.00, 32440.00, 0.00);
INSERT INTO public.cheque
VALUES (6, 21, 26, 1424.28, 1424.28, 0.00);
INSERT INTO public.cheque
VALUES (140, 12, 42, 11156.04, 11156.04, 0.00);
INSERT INTO public.cheque
VALUES (233, 15, 49, 8413.79, 8413.79, 0.00);
INSERT INTO public.cheque
VALUES (260, 13, 27, 3910.68, 3910.68, 0.00);
INSERT INTO public.cheque
VALUES (111, 25, 46, 19437.30, 19437.30, 0.00);
INSERT INTO public.cheque
VALUES (276, 6, 30, 6247.50, 5757.98, 0.00);
INSERT INTO public.cheque
VALUES (232, 13, 26, 4572.88, 4206.37, 366.51);
INSERT INTO public.cheque
VALUES (74, 16, 21, 12225.15, 12225.15, 0.00);
INSERT INTO public.cheque
VALUES (130, 18, 6, 5438.46, 4644.07, 0.00);
INSERT INTO public.cheque
VALUES (15, 25, 31, 13099.05, 11984.52, 0.00);
INSERT INTO public.cheque
VALUES (15, 12, 10, 2376.60, 2202.61, 0.00);
INSERT INTO public.cheque
VALUES (207, 11, 11, 813.78, 743.67, 70.11);
INSERT INTO public.cheque
VALUES (163, 9, 35, 26533.50, 25783.25, 750.25);
INSERT INTO public.cheque
VALUES (74, 13, 6, 1055.28, 1003.63, 0.00);
INSERT INTO public.cheque
VALUES (193, 22, 43, 5033.15, 5033.15, 0.00);
INSERT INTO public.cheque
VALUES (63, 11, 18, 1096.74, 1096.74, 0.00);
INSERT INTO public.cheque
VALUES (127, 9, 43, 38377.50, 38377.50, 0.00);
INSERT INTO public.cheque
VALUES (247, 6, 19, 3360.91, 3360.91, 0.00);
INSERT INTO public.cheque
VALUES (211, 16, 45, 26196.75, 25082.80, 0.00);
INSERT INTO public.cheque
VALUES (255, 5, 2, 378.26, 378.26, 0.00);
INSERT INTO public.cheque
VALUES (217, 26, 39, 23849.67, 22633.69, 1215.98);
INSERT INTO public.cheque
VALUES (57, 14, 38, 9796.02, 9796.02, 0.00);
INSERT INTO public.cheque
VALUES (118, 1, 26, 11050.00, 11050.00, 0.00);
INSERT INTO public.cheque
VALUES (216, 8, 23, 5521.61, 5521.61, 0.00);
INSERT INTO public.cheque
VALUES (139, 16, 22, 12807.30, 12807.30, 0.00);
INSERT INTO public.cheque
VALUES (136, 29, 42, 27628.44, 23121.19, 0.00);
INSERT INTO public.cheque
VALUES (143, 10, 38, 19380.00, 16134.91, 3245.09);
INSERT INTO public.cheque
VALUES (284, 10, 7, 2352.00, 1935.57, 0.00);
INSERT INTO public.cheque
VALUES (236, 30, 9, 4712.22, 4277.47, 434.75);
INSERT INTO public.cheque
VALUES (54, 5, 38, 7186.94, 5845.85, 0.00);
INSERT INTO public.cheque
VALUES (109, 9, 34, 19992.00, 16190.45, 0.00);
INSERT INTO public.cheque
VALUES (246, 5, 32, 5140.80, 4584.18, 0.00);
INSERT INTO public.cheque
VALUES (206, 5, 15, 2409.75, 2409.75, 0.00);
INSERT INTO public.cheque
VALUES (201, 6, 14, 1920.80, 1702.57, 218.23);
INSERT INTO public.cheque
VALUES (247, 17, 42, 156.24, 156.24, 0.00);
INSERT INTO public.cheque
VALUES (73, 10, 44, 22440.00, 22440.00, 0.00);
INSERT INTO public.cheque
VALUES (123, 4, 18, 9562.50, 9562.50, 0.00);
INSERT INTO public.cheque
VALUES (38, 10, 3, 1530.00, 1530.00, 0.00);
INSERT INTO public.cheque
VALUES (200, 8, 17, 4081.19, 3674.20, 0.00);
INSERT INTO public.cheque
VALUES (71, 8, 29, 5399.80, 4387.19, 1012.61);
INSERT INTO public.cheque
VALUES (259, 26, 34, 20792.02, 20792.02, 0.00);
INSERT INTO public.cheque
VALUES (260, 19, 3, 1061.64, 1061.64, 0.00);
INSERT INTO public.cheque
VALUES (241, 10, 28, 9408.00, 8908.29, 0.00);
INSERT INTO public.cheque
VALUES (194, 7, 25, 6904.25, 6904.25, 0.00);
INSERT INTO public.cheque
VALUES (95, 17, 9, 29.97, 29.97, 0.00);
INSERT INTO public.cheque
VALUES (84, 1, 1, 425.00, 404.89, 20.11);
INSERT INTO public.cheque
VALUES (45, 30, 30, 15707.40, 15707.40, 0.00);
INSERT INTO public.cheque
VALUES (224, 21, 10, 490.10, 440.21, 0.00);
INSERT INTO public.cheque
VALUES (207, 2, 26, 19337.50, 18942.72, 0.00);
INSERT INTO public.cheque
VALUES (214, 10, 10, 5100.00, 5100.00, 0.00);
INSERT INTO public.cheque
VALUES (48, 26, 2, 1485.16, 1471.78, 0.00);
INSERT INTO public.cheque
VALUES (43, 11, 16, 1323.04, 1067.06, 0.00);
INSERT INTO public.cheque
VALUES (249, 18, 41, 33251.00, 26974.11, 0.00);
INSERT INTO public.cheque
VALUES (255, 27, 45, 5824.80, 5824.80, 0.00);
INSERT INTO public.cheque
VALUES (43, 18, 40, 36256.40, 36256.40, 0.00);
INSERT INTO public.cheque
VALUES (215, 9, 49, 37146.90, 37146.90, 0.00);
INSERT INTO public.cheque
VALUES (102, 22, 45, 4337.55, 3810.53, 0.00);
INSERT INTO public.cheque
VALUES (161, 12, 9, 2138.94, 2138.94, 0.00);
INSERT INTO public.cheque
VALUES (120, 21, 13, 637.13, 637.13, 0.00);
INSERT INTO public.cheque
VALUES (5, 11, 10, 609.30, 609.30, 0.00);
INSERT INTO public.cheque
VALUES (269, 21, 26, 1424.28, 1140.48, 0.00);
INSERT INTO public.cheque
VALUES (185, 14, 41, 8704.30, 8256.74, 0.00);
INSERT INTO public.cheque
VALUES (107, 13, 21, 3041.64, 2645.98, 0.00);
INSERT INTO public.cheque
VALUES (17, 13, 2, 351.76, 351.76, 0.00);
INSERT INTO public.cheque
VALUES (173, 23, 40, 18502.40, 16551.51, 0.00);
INSERT INTO public.cheque
VALUES (230, 11, 31, 2293.38, 2293.38, 0.00);
INSERT INTO public.cheque
VALUES (203, 9, 4, 2352.00, 2352.00, 0.00);
INSERT INTO public.cheque
VALUES (259, 25, 27, 9395.46, 9395.46, 0.00);
INSERT INTO public.cheque
VALUES (281, 27, 36, 3837.60, 3837.60, 0.00);
INSERT INTO public.cheque
VALUES (93, 22, 44, 5150.20, 5150.20, 0.00);
INSERT INTO public.cheque
VALUES (85, 19, 39, 13801.32, 13801.32, 0.00);
INSERT INTO public.cheque
VALUES (101, 12, 19, 4515.54, 4515.54, 0.00);
INSERT INTO public.cheque
VALUES (185, 6, 28, 3841.60, 3841.60, 0.00);
INSERT INTO public.cheque
VALUES (197, 9, 24, 14112.00, 11610.98, 0.00);
INSERT INTO public.cheque
VALUES (231, 15, 2, 343.42, 291.18, 0.00);
INSERT INTO public.cheque
VALUES (175, 15, 5, 1042.55, 1042.55, 0.00);
INSERT INTO public.cheque
VALUES (243, 7, 29, 6211.80, 5492.24, 0.00);
INSERT INTO public.cheque
VALUES (132, 28, 16, 7218.88, 7218.88, 0.00);
INSERT INTO public.cheque
VALUES (167, 9, 11, 9817.50, 9154.41, 663.09);
INSERT INTO public.cheque
VALUES (11, 12, 39, 9268.74, 9268.74, 0.00);
INSERT INTO public.cheque
VALUES (118, 22, 13, 1521.65, 1376.18, 0.00);
INSERT INTO public.cheque
VALUES (221, 29, 34, 24997.14, 24997.14, 0.00);
INSERT INTO public.cheque
VALUES (66, 6, 29, 6039.25, 6036.14, 0.00);
INSERT INTO public.cheque
VALUES (129, 13, 37, 6507.56, 6507.56, 0.00);
INSERT INTO public.cheque
VALUES (255, 22, 37, 4330.85, 3610.65, 720.20);
INSERT INTO public.cheque
VALUES (138, 29, 30, 19734.60, 16096.99, 0.00);
INSERT INTO public.cheque
VALUES (238, 6, 27, 4776.03, 4382.44, 0.00);
INSERT INTO public.cheque
VALUES (111, 15, 14, 2919.14, 2919.14, 0.00);
INSERT INTO public.cheque
VALUES (263, 12, 16, 3802.56, 3802.56, 0.00);
INSERT INTO public.cheque
VALUES (204, 22, 16, 1872.80, 1571.60, 0.00);
INSERT INTO public.cheque
VALUES (183, 7, 27, 8778.51, 7350.58, 1427.93);
INSERT INTO public.cheque
VALUES (35, 16, 26, 16916.64, 13535.98, 0.00);
INSERT INTO public.cheque
VALUES (66, 20, 26, 6264.44, 6264.44, 0.00);
INSERT INTO public.cheque
VALUES (160, 9, 41, 36592.50, 36592.50, 0.00);
INSERT INTO public.cheque
VALUES (186, 29, 36, 23681.52, 21648.64, 0.00);
INSERT INTO public.cheque
VALUES (162, 14, 24, 6186.96, 5258.99, 0.00);
INSERT INTO public.cheque
VALUES (133, 18, 18, 14598.00, 13855.65, 0.00);
INSERT INTO public.cheque
VALUES (159, 5, 26, 3239.60, 3239.60, 0.00);
INSERT INTO public.cheque
VALUES (195, 17, 21, 69.93, 61.29, 8.64);
INSERT INTO public.cheque
VALUES (230, 14, 30, 7733.70, 6771.73, 0.00);
INSERT INTO public.cheque
VALUES (252, 26, 3, 1834.59, 1834.59, 0.00);
INSERT INTO public.cheque
VALUES (113, 20, 29, 7809.41, 7604.48, 0.00);
INSERT INTO public.cheque
VALUES (158, 9, 28, 16464.00, 16464.00, 0.00);
INSERT INTO public.cheque
VALUES (3, 26, 41, 30445.78, 26008.43, 4437.35);
INSERT INTO public.cheque
VALUES (256, 19, 20, 8594.20, 8594.20, 0.00);
INSERT INTO public.cheque
VALUES (33, 7, 20, 4284.00, 4284.00, 0.00);
INSERT INTO public.cheque
VALUES (35, 12, 35, 9296.70, 8752.51, 0.00);
INSERT INTO public.cheque
VALUES (39, 27, 10, 1294.40, 1256.18, 38.22);
INSERT INTO public.cheque
VALUES (192, 19, 7, 3007.97, 3007.97, 0.00);
INSERT INTO public.cheque
VALUES (199, 18, 50, 45320.50, 40496.40, 0.00);
INSERT INTO public.cheque
VALUES (169, 30, 35, 20481.30, 20481.30, 0.00);
INSERT INTO public.cheque
VALUES (271, 26, 48, 35643.84, 32908.91, 0.00);
INSERT INTO public.cheque
VALUES (100, 8, 23, 6500.49, 6500.49, 0.00);
INSERT INTO public.cheque
VALUES (185, 11, 26, 1584.18, 1564.52, 19.66);
INSERT INTO public.cheque
VALUES (129, 13, 42, 7386.96, 7386.96, 0.00);
INSERT INTO public.cheque
VALUES (123, 6, 3, 624.75, 562.34, 62.41);
INSERT INTO public.cheque
VALUES (240, 8, 21, 5935.23, 5391.99, 543.24);
INSERT INTO public.cheque
VALUES (255, 2, 43, 31981.25, 31706.51, 0.00);
INSERT INTO public.cheque
VALUES (201, 7, 6, 1285.20, 1285.20, 0.00);
INSERT INTO public.cheque
VALUES (267, 21, 40, 1614.40, 1404.22, 0.00);
INSERT INTO public.cheque
VALUES (235, 16, 16, 9314.40, 9314.40, 0.00);
INSERT INTO public.cheque
VALUES (238, 5, 49, 7871.85, 7871.85, 0.00);
INSERT INTO public.cheque
VALUES (9, 30, 33, 17278.14, 17278.14, 0.00);
INSERT INTO public.cheque
VALUES (84, 16, 44, 25614.60, 23508.10, 0.00);
INSERT INTO public.cheque
VALUES (2, 4, 37, 12950.00, 11240.35, 1709.65);
INSERT INTO public.cheque
VALUES (122, 6, 2, 274.40, 274.40, 0.00);
INSERT INTO public.cheque
VALUES (40, 4, 32, 14440.00, 14440.00, 0.00);
INSERT INTO public.cheque
VALUES (9, 30, 26, 13613.08, 13329.56, 0.00);
INSERT INTO public.cheque
VALUES (29, 28, 4, 2449.24, 2412.17, 0.00);
INSERT INTO public.cheque
VALUES (166, 25, 43, 18169.65, 18169.65, 0.00);
INSERT INTO public.cheque
VALUES (77, 4, 45, 23906.25, 23906.25, 0.00);
INSERT INTO public.cheque
VALUES (235, 3, 30, 1848.90, 1848.90, 0.00);
INSERT INTO public.cheque
VALUES (244, 14, 33, 9507.96, 8952.63, 555.33);
INSERT INTO public.cheque
VALUES (257, 12, 30, 7968.60, 7612.74, 0.00);
INSERT INTO public.cheque
VALUES (124, 26, 13, 9653.54, 8256.13, 0.00);
INSERT INTO public.cheque
VALUES (237, 25, 13, 5493.15, 5327.17, 0.00);
INSERT INTO public.cheque
VALUES (71, 24, 32, 15080.64, 13826.56, 0.00);
INSERT INTO public.cheque
VALUES (254, 2, 3, 2231.25, 2231.25, 0.00);
INSERT INTO public.cheque
VALUES (184, 26, 11, 8168.38, 7601.06, 0.00);
INSERT INTO public.cheque
VALUES (9, 3, 49, 3019.87, 2841.86, 0.00);
INSERT INTO public.cheque
VALUES (121, 29, 42, 27628.44, 27628.44, 0.00);
INSERT INTO public.cheque
VALUES (14, 13, 36, 7076.52, 7076.52, 0.00);
INSERT INTO public.cheque
VALUES (275, 29, 21, 13814.22, 11431.34, 0.00);
INSERT INTO public.cheque
VALUES (150, 2, 10, 4900.00, 4900.00, 0.00);
INSERT INTO public.cheque
VALUES (35, 10, 19, 8230.80, 8230.80, 0.00);
INSERT INTO public.cheque
VALUES (33, 16, 26, 12464.92, 12464.92, 0.00);
INSERT INTO public.cheque
VALUES (52, 2, 46, 29060.50, 24819.57, 4240.93);
INSERT INTO public.cheque
VALUES (99, 2, 40, 25270.00, 25270.00, 0.00);
INSERT INTO public.cheque
VALUES (74, 27, 32, 4142.08, 4142.08, 0.00);
INSERT INTO public.cheque
VALUES (239, 8, 43, 10323.01, 8690.55, 0.00);
INSERT INTO public.cheque
VALUES (201, 29, 8, 4333.84, 4333.84, 0.00);
INSERT INTO public.cheque
VALUES (37, 4, 7, 3158.75, 3158.75, 0.00);
INSERT INTO public.cheque
VALUES (17, 29, 17, 11182.94, 10491.41, 0.00);
INSERT INTO public.cheque
VALUES (257, 12, 33, 8765.46, 8765.46, 0.00);
INSERT INTO public.cheque
VALUES (200, 11, 28, 2315.32, 2315.32, 0.00);
INSERT INTO public.cheque
VALUES (28, 17, 24, 89.28, 88.57, 0.71);
INSERT INTO public.cheque
VALUES (162, 9, 40, 35700.00, 35700.00, 0.00);
INSERT INTO public.cheque
VALUES (273, 14, 2, 424.60, 359.92, 64.68);
INSERT INTO public.cheque
VALUES (98, 22, 18, 1735.02, 1735.02, 0.00);
INSERT INTO public.cheque
VALUES (97, 19, 20, 7077.60, 6442.26, 0.00);
INSERT INTO public.cheque
VALUES (9, 10, 12, 6120.00, 6120.00, 0.00);
INSERT INTO public.cheque
VALUES (15, 11, 8, 591.84, 591.84, 0.00);
INSERT INTO public.cheque
VALUES (217, 24, 27, 12724.29, 11378.63, 0.00);
INSERT INTO public.cheque
VALUES (259, 18, 8, 5343.04, 4751.73, 591.31);
INSERT INTO public.cheque
VALUES (279, 24, 49, 28040.25, 23302.34, 4737.91);
INSERT INTO public.cheque
VALUES (250, 12, 45, 8807.40, 8516.86, 290.54);
INSERT INTO public.cheque
VALUES (115, 29, 3, 1625.19, 1433.48, 0.00);
INSERT INTO public.cheque
VALUES (12, 20, 6, 1445.64, 1445.64, 0.00);
INSERT INTO public.cheque
VALUES (190, 21, 40, 1960.40, 1664.21, 0.00);
INSERT INTO public.cheque
VALUES (9, 3, 27, 1664.01, 1391.00, 0.00);
INSERT INTO public.cheque
VALUES (62, 4, 15, 5250.00, 5250.00, 0.00);
INSERT INTO public.cheque
VALUES (178, 30, 27, 15799.86, 12835.39, 0.00);
INSERT INTO public.cheque
VALUES (173, 10, 48, 16128.00, 16128.00, 0.00);
INSERT INTO public.cheque
VALUES (209, 13, 29, 5100.52, 4646.11, 0.00);
INSERT INTO public.cheque
VALUES (132, 8, 3, 558.60, 558.60, 0.00);
INSERT INTO public.cheque
VALUES (159, 20, 7, 1388.94, 1219.82, 0.00);
INSERT INTO public.cheque
VALUES (267, 15, 4, 686.84, 686.84, 0.00);
INSERT INTO public.cheque
VALUES (92, 20, 42, 8333.64, 6942.45, 0.00);
INSERT INTO public.cheque
VALUES (13, 21, 6, 328.68, 328.68, 0.00);
INSERT INTO public.cheque
VALUES (134, 28, 39, 17596.02, 17596.02, 0.00);
INSERT INTO public.cheque
VALUES (256, 16, 22, 12807.30, 12807.30, 0.00);
INSERT INTO public.cheque
VALUES (214, 4, 34, 18062.50, 16657.04, 0.00);
INSERT INTO public.cheque
VALUES (195, 8, 46, 13000.98, 13000.98, 0.00);
INSERT INTO public.cheque
VALUES (221, 6, 26, 4599.14, 4599.14, 0.00);
INSERT INTO public.cheque
VALUES (33, 29, 18, 9751.14, 9751.14, 0.00);
INSERT INTO public.cheque
VALUES (187, 18, 30, 20036.40, 20036.40, 0.00);
INSERT INTO public.cheque
VALUES (186, 7, 7, 2275.91, 1957.75, 318.16);
INSERT INTO public.cheque
VALUES (225, 10, 4, 1732.80, 1421.63, 311.17);
INSERT INTO public.cheque
VALUES (185, 4, 32, 11200.00, 11200.00, 0.00);
INSERT INTO public.cheque
VALUES (272, 20, 45, 10842.30, 10842.30, 0.00);
INSERT INTO public.cheque
VALUES (175, 8, 36, 10174.68, 10068.97, 105.71);
INSERT INTO public.cheque
VALUES (5, 11, 2, 121.86, 121.86, 0.00);
INSERT INTO public.cheque
VALUES (231, 5, 14, 1744.40, 1649.24, 0.00);
INSERT INTO public.cheque
VALUES (7, 26, 49, 36386.42, 36016.65, 0.00);
INSERT INTO public.cheque
VALUES (93, 7, 24, 7803.12, 7434.05, 369.07);
INSERT INTO public.cheque
VALUES (91, 17, 50, 166.50, 166.50, 0.00);
INSERT INTO public.cheque
VALUES (90, 15, 48, 10008.48, 10008.48, 0.00);
INSERT INTO public.cheque
VALUES (186, 24, 25, 14306.25, 14306.25, 0.00);
INSERT INTO public.cheque
VALUES (131, 1, 34, 14450.00, 14450.00, 0.00);
INSERT INTO public.cheque
VALUES (137, 7, 47, 10067.40, 10067.40, 0.00);
INSERT INTO public.cheque
VALUES (148, 5, 12, 2269.56, 2269.56, 0.00);
INSERT INTO public.cheque
VALUES (193, 9, 18, 16065.00, 16065.00, 0.00);
INSERT INTO public.cheque
VALUES (213, 3, 36, 1884.60, 1624.92, 0.00);
INSERT INTO public.cheque
VALUES (133, 4, 22, 11687.50, 10089.31, 0.00);
INSERT INTO public.cheque
VALUES (209, 7, 5, 1625.65, 1625.65, 0.00);
INSERT INTO public.cheque
VALUES (230, 23, 10, 5616.80, 4704.54, 0.00);
INSERT INTO public.cheque
VALUES (63, 28, 23, 10377.14, 10377.14, 0.00);
INSERT INTO public.cheque
VALUES (75, 26, 14, 11619.16, 10509.95, 1109.21);
INSERT INTO public.cheque
VALUES (52, 11, 40, 3307.60, 3307.60, 0.00);
INSERT INTO public.cheque
VALUES (263, 18, 28, 22708.00, 20796.69, 0.00);
INSERT INTO public.cheque
VALUES (114, 8, 50, 12003.50, 12003.50, 0.00);
INSERT INTO public.cheque
VALUES (114, 25, 2, 944.52, 944.52, 0.00);
INSERT INTO public.cheque
VALUES (12, 2, 32, 23800.00, 23800.00, 0.00);
INSERT INTO public.cheque
VALUES (196, 24, 32, 15080.64, 14367.54, 0.00);
INSERT INTO public.cheque
VALUES (258, 3, 41, 2526.83, 2334.29, 192.54);
INSERT INTO public.cheque
VALUES (26, 19, 27, 9554.76, 9033.51, 0.00);
INSERT INTO public.cheque
VALUES (102, 20, 32, 6349.44, 6349.44, 0.00);
INSERT INTO public.cheque
VALUES (43, 20, 45, 12118.05, 12118.05, 0.00);
INSERT INTO public.cheque
VALUES (225, 18, 41, 37162.81, 37162.81, 0.00);
INSERT INTO public.cheque
VALUES (107, 2, 45, 22050.00, 22050.00, 0.00);
INSERT INTO public.cheque
VALUES (211, 6, 2, 416.50, 371.39, 0.00);
INSERT INTO public.cheque
VALUES (278, 18, 20, 16220.00, 13672.98, 0.00);
INSERT INTO public.cheque
VALUES (185, 7, 3, 642.60, 642.60, 0.00);
INSERT INTO public.cheque
VALUES (62, 7, 35, 7497.00, 7063.59, 433.41);
INSERT INTO public.cheque
VALUES (247, 9, 15, 11371.50, 11371.50, 0.00);
INSERT INTO public.cheque
VALUES (154, 2, 3, 2231.25, 2179.81, 0.00);
INSERT INTO public.cheque
VALUES (214, 18, 20, 16220.00, 13167.38, 0.00);
INSERT INTO public.cheque
VALUES (155, 29, 15, 9867.30, 9867.30, 0.00);
INSERT INTO public.cheque
VALUES (237, 30, 40, 20943.20, 20943.20, 0.00);
INSERT INTO public.cheque
VALUES (41, 4, 22, 9927.50, 9927.50, 0.00);
INSERT INTO public.cheque
VALUES (75, 12, 37, 9827.94, 8844.50, 983.44);
INSERT INTO public.cheque
VALUES (72, 15, 32, 7457.28, 7457.28, 0.00);
INSERT INTO public.cheque
VALUES (220, 6, 29, 6039.25, 6039.25, 0.00);
INSERT INTO public.cheque
VALUES (32, 5, 11, 2080.43, 2080.43, 0.00);
INSERT INTO public.cheque
VALUES (136, 5, 35, 6619.55, 5882.20, 737.35);
INSERT INTO public.cheque
VALUES (132, 8, 46, 8565.20, 7181.65, 1383.55);
INSERT INTO public.cheque
VALUES (278, 2, 3, 2231.25, 1943.48, 287.77);
INSERT INTO public.cheque
VALUES (117, 20, 32, 8617.28, 8027.97, 589.31);
INSERT INTO public.cheque
VALUES (126, 25, 24, 10141.20, 10141.20, 0.00);
INSERT INTO public.cheque
VALUES (34, 4, 6, 3187.50, 3187.50, 0.00);
INSERT INTO public.cheque
VALUES (160, 15, 10, 2085.10, 1841.15, 243.95);
INSERT INTO public.cheque
VALUES (55, 19, 20, 8594.20, 8424.72, 169.48);
INSERT INTO public.cheque
VALUES (240, 11, 30, 2219.40, 2125.78, 0.00);
INSERT INTO public.cheque
VALUES (214, 8, 39, 11022.57, 11022.57, 0.00);
INSERT INTO public.cheque
VALUES (218, 21, 20, 980.20, 980.20, 0.00);
INSERT INTO public.cheque
VALUES (153, 16, 12, 6985.80, 6985.80, 0.00);
INSERT INTO public.cheque
VALUES (143, 29, 26, 17103.32, 17103.32, 0.00);
INSERT INTO public.cheque
VALUES (120, 4, 45, 23906.25, 20987.29, 2918.96);
INSERT INTO public.cheque
VALUES (112, 18, 8, 6488.00, 5481.83, 1006.17);
INSERT INTO public.cheque
VALUES (118, 28, 33, 18079.38, 18079.38, 0.00);
INSERT INTO public.cheque
VALUES (150, 17, 9, 24.66, 22.45, 0.00);
INSERT INTO public.cheque
VALUES (43, 18, 12, 10876.92, 8826.59, 0.00);
INSERT INTO public.cheque
VALUES (22, 10, 12, 5198.40, 4703.57, 494.83);
INSERT INTO public.cheque
VALUES (144, 24, 37, 17436.99, 16467.42, 969.57);
INSERT INTO public.cheque
VALUES (160, 18, 14, 11354.00, 11354.00, 0.00);
INSERT INTO public.cheque
VALUES (276, 20, 17, 4095.98, 3738.83, 0.00);
INSERT INTO public.cheque
VALUES (80, 21, 24, 1176.24, 1176.24, 0.00);
INSERT INTO public.cheque
VALUES (179, 1, 6, 2550.00, 2281.34, 0.00);
INSERT INTO public.cheque
VALUES (229, 4, 10, 4512.50, 4512.50, 0.00);
INSERT INTO public.cheque
VALUES (84, 8, 16, 4522.08, 4522.08, 0.00);
INSERT INTO public.cheque
VALUES (237, 17, 21, 69.93, 64.67, 5.26);
INSERT INTO public.cheque
VALUES (77, 3, 2, 123.26, 123.26, 0.00);
INSERT INTO public.cheque
VALUES (84, 2, 5, 3718.75, 3718.75, 0.00);
INSERT INTO public.cheque
VALUES (113, 18, 49, 44414.09, 40398.52, 0.00);
INSERT INTO public.cheque
VALUES (97, 13, 41, 5938.44, 5938.44, 0.00);
INSERT INTO public.cheque
VALUES (182, 23, 20, 9251.20, 8668.17, 0.00);
INSERT INTO public.cheque
VALUES (285, 21, 40, 1960.40, 1960.40, 0.00);
INSERT INTO public.cheque
VALUES (186, 10, 43, 21930.00, 21402.41, 0.00);
INSERT INTO public.cheque
VALUES (92, 29, 39, 21127.47, 19214.20, 1913.27);
INSERT INTO public.cheque
VALUES (13, 11, 48, 3969.12, 3969.12, 0.00);
INSERT INTO public.cheque
VALUES (131, 6, 8, 1666.00, 1407.96, 258.04);
INSERT INTO public.cheque
VALUES (6, 28, 21, 12858.51, 10832.00, 0.00);
INSERT INTO public.cheque
VALUES (123, 5, 31, 5863.03, 4963.54, 899.49);
INSERT INTO public.cheque
VALUES (85, 23, 5, 2312.80, 2312.80, 0.00);
INSERT INTO public.cheque
VALUES (116, 7, 34, 9389.78, 9389.78, 0.00);
INSERT INTO public.cheque
VALUES (147, 5, 25, 4728.25, 4614.27, 0.00);
INSERT INTO public.cheque
VALUES (10, 21, 47, 2574.66, 2216.94, 357.72);
INSERT INTO public.cheque
VALUES (41, 22, 46, 6017.72, 6017.72, 0.00);
INSERT INTO public.cheque
VALUES (32, 29, 32, 21050.24, 18584.18, 0.00);
INSERT INTO public.cheque
VALUES (51, 19, 17, 6015.96, 6015.96, 0.00);
INSERT INTO public.cheque
VALUES (193, 15, 14, 2919.14, 2919.14, 0.00);
INSERT INTO public.cheque
VALUES (207, 10, 40, 20400.00, 16646.24, 0.00);
INSERT INTO public.cheque
VALUES (162, 29, 33, 21708.06, 21708.06, 0.00);
INSERT INTO public.cheque
VALUES (52, 3, 29, 1518.15, 1518.15, 0.00);
INSERT INTO public.cheque
VALUES (97, 26, 40, 24461.20, 24461.20, 0.00);
INSERT INTO public.cheque
VALUES (6, 3, 23, 1204.05, 1204.05, 0.00);
INSERT INTO public.cheque
VALUES (276, 10, 34, 17340.00, 17340.00, 0.00);
INSERT INTO public.cheque
VALUES (264, 15, 15, 2575.65, 2575.65, 0.00);
INSERT INTO public.cheque
VALUES (78, 28, 36, 16242.48, 16242.48, 0.00);
INSERT INTO public.cheque
VALUES (211, 18, 18, 14598.00, 13870.84, 727.16);
INSERT INTO public.cheque
VALUES (113, 23, 28, 17577.28, 16260.98, 0.00);
INSERT INTO public.cheque
VALUES (276, 18, 5, 4055.00, 3383.94, 0.00);
INSERT INTO public.cheque
VALUES (41, 10, 19, 8230.80, 6612.27, 0.00);
INSERT INTO public.cheque
VALUES (243, 10, 33, 11088.00, 9792.69, 1295.31);
INSERT INTO public.cheque
VALUES (207, 12, 12, 2851.92, 2612.47, 0.00);
INSERT INTO public.cheque
VALUES (185, 28, 39, 17596.02, 16649.06, 946.96);
INSERT INTO public.cheque
VALUES (38, 29, 42, 27628.44, 27628.44, 0.00);
INSERT INTO public.cheque
VALUES (30, 24, 12, 6867.00, 6867.00, 0.00);
INSERT INTO public.cheque
VALUES (114, 25, 43, 20307.18, 16420.73, 0.00);
INSERT INTO public.cheque
VALUES (2, 4, 47, 16450.00, 13500.18, 2949.82);
INSERT INTO public.cheque
VALUES (142, 10, 13, 4368.00, 4368.00, 0.00);
INSERT INTO public.cheque
VALUES (207, 2, 8, 5950.00, 5880.11, 0.00);
INSERT INTO public.cheque
VALUES (9, 21, 26, 1274.26, 1263.10, 11.16);
INSERT INTO public.cheque
VALUES (187, 17, 48, 131.52, 131.52, 0.00);
INSERT INTO public.cheque
VALUES (6, 5, 23, 3694.95, 3322.69, 0.00);
INSERT INTO public.cheque
VALUES (141, 2, 5, 3718.75, 3400.99, 0.00);
INSERT INTO public.cheque
VALUES (10, 7, 25, 6904.25, 6904.25, 0.00);
INSERT INTO public.cheque
VALUES (210, 19, 16, 7684.16, 7684.16, 0.00);
INSERT INTO public.cheque
VALUES (282, 27, 36, 3837.60, 3837.60, 0.00);
INSERT INTO public.cheque
VALUES (85, 14, 30, 6369.00, 6369.00, 0.00);
INSERT INTO public.cheque
VALUES (48, 2, 45, 33468.75, 33468.75, 0.00);
INSERT INTO public.cheque
VALUES (200, 11, 1, 82.69, 82.69, 0.00);
INSERT INTO public.cheque
VALUES (176, 22, 14, 1638.70, 1453.88, 0.00);
INSERT INTO public.cheque
VALUES (212, 25, 38, 13223.24, 11891.91, 1331.33);
INSERT INTO public.cheque
VALUES (162, 26, 14, 10396.12, 8417.83, 0.00);
INSERT INTO public.cheque
VALUES (254, 8, 20, 5652.60, 5652.60, 0.00);
INSERT INTO public.cheque
VALUES (70, 4, 25, 11281.25, 11281.25, 0.00);
INSERT INTO public.cheque
VALUES (10, 12, 42, 11156.04, 9668.67, 0.00);
INSERT INTO public.cheque
VALUES (270, 27, 48, 5116.80, 5089.78, 0.00);
INSERT INTO public.cheque
VALUES (68, 7, 19, 6177.47, 4944.49, 0.00);
INSERT INTO public.cheque
VALUES (4, 8, 32, 7682.24, 7682.24, 0.00);
INSERT INTO public.cheque
VALUES (190, 17, 37, 123.21, 123.21, 0.00);
INSERT INTO public.cheque
VALUES (101, 5, 32, 6052.16, 5801.25, 0.00);
INSERT INTO public.cheque
VALUES (230, 11, 47, 3477.06, 3477.06, 0.00);
INSERT INTO public.cheque
VALUES (220, 16, 25, 14553.75, 14493.48, 0.00);
INSERT INTO public.cheque
VALUES (203, 10, 9, 3024.00, 3024.00, 0.00);
INSERT INTO public.cheque
VALUES (192, 30, 25, 13089.50, 11326.56, 1762.94);
INSERT INTO public.cheque
VALUES (274, 12, 10, 2376.60, 2265.47, 111.13);
INSERT INTO public.cheque
VALUES (64, 22, 16, 1872.80, 1872.80, 0.00);
INSERT INTO public.cheque
VALUES (126, 11, 25, 1849.50, 1849.50, 0.00);
INSERT INTO public.cheque
VALUES (118, 22, 40, 4682.00, 4604.70, 0.00);
INSERT INTO public.cheque
VALUES (80, 11, 37, 2737.26, 2737.26, 0.00);
INSERT INTO public.cheque
VALUES (78, 9, 6, 3528.00, 2998.96, 529.04);
INSERT INTO public.cheque
VALUES (165, 18, 33, 22040.04, 22040.04, 0.00);
INSERT INTO public.cheque
VALUES (246, 17, 1, 3.72, 3.72, 0.00);
INSERT INTO public.cheque
VALUES (111, 20, 3, 722.82, 722.82, 0.00);
INSERT INTO public.cheque
VALUES (99, 21, 19, 1040.82, 1018.36, 0.00);
INSERT INTO public.cheque
VALUES (125, 24, 9, 4241.43, 3708.68, 0.00);
INSERT INTO public.cheque
VALUES (95, 29, 15, 9867.30, 9777.45, 0.00);
INSERT INTO public.cheque
VALUES (111, 27, 32, 4142.08, 4142.08, 0.00);
INSERT INTO public.cheque
VALUES (9, 8, 30, 8478.90, 8478.90, 0.00);
INSERT INTO public.cheque
VALUES (169, 9, 42, 31840.20, 31840.20, 0.00);
INSERT INTO public.cheque
VALUES (191, 26, 49, 40667.06, 37822.30, 2844.76);
INSERT INTO public.cheque
VALUES (162, 16, 23, 13389.45, 13389.45, 0.00);
INSERT INTO public.cheque
VALUES (120, 24, 12, 6867.00, 6525.34, 0.00);
INSERT INTO public.cheque
VALUES (173, 26, 17, 10396.01, 9028.50, 0.00);
INSERT INTO public.cheque
VALUES (30, 21, 35, 1715.35, 1715.35, 0.00);
INSERT INTO public.cheque
VALUES (198, 26, 41, 34027.54, 32480.73, 0.00);
INSERT INTO public.cheque
VALUES (131, 4, 47, 24968.75, 20654.43, 4314.32);
INSERT INTO public.cheque
VALUES (44, 21, 19, 931.19, 931.19, 0.00);
INSERT INTO public.cheque
VALUES (279, 10, 16, 8160.00, 8160.00, 0.00);
INSERT INTO public.cheque
VALUES (130, 8, 30, 7202.10, 7202.10, 0.00);
INSERT INTO public.cheque
VALUES (81, 8, 42, 11870.46, 11870.46, 0.00);
INSERT INTO public.cheque
VALUES (131, 12, 20, 4753.20, 3871.97, 0.00);
INSERT INTO public.cheque
VALUES (175, 25, 14, 5915.70, 5419.78, 0.00);
INSERT INTO public.cheque
VALUES (115, 16, 3, 1438.26, 1332.68, 0.00);
INSERT INTO public.cheque
VALUES (117, 20, 1, 269.29, 269.29, 0.00);
INSERT INTO public.cheque
VALUES (81, 26, 26, 19307.08, 19307.08, 0.00);
INSERT INTO public.cheque
VALUES (68, 7, 50, 16256.50, 16256.50, 0.00);
INSERT INTO public.cheque
VALUES (85, 16, 37, 17738.54, 17738.54, 0.00);
INSERT INTO public.cheque
VALUES (29, 10, 28, 12129.60, 12129.60, 0.00);
INSERT INTO public.cheque
VALUES (37, 27, 24, 3472.08, 3472.08, 0.00);
INSERT INTO public.cheque
VALUES (81, 24, 36, 20601.00, 20601.00, 0.00);
INSERT INTO public.cheque
VALUES (44, 25, 30, 12676.50, 12676.50, 0.00);
INSERT INTO public.cheque
VALUES (115, 15, 6, 1030.26, 1030.26, 0.00);
INSERT INTO public.cheque
VALUES (61, 19, 32, 15368.32, 15368.32, 0.00);
INSERT INTO public.cheque
VALUES (275, 9, 14, 12495.00, 12495.00, 0.00);
INSERT INTO public.cheque
VALUES (175, 24, 35, 20028.75, 20028.75, 0.00);
INSERT INTO public.cheque
VALUES (119, 16, 23, 13389.45, 13389.45, 0.00);
INSERT INTO public.cheque
VALUES (112, 20, 16, 3855.04, 3390.89, 0.00);
INSERT INTO public.cheque
VALUES (275, 25, 4, 1690.20, 1682.50, 0.00);
INSERT INTO public.cheque
VALUES (167, 15, 10, 2085.10, 2059.11, 25.99);
INSERT INTO public.cheque
VALUES (260, 7, 19, 4069.80, 4069.80, 0.00);
INSERT INTO public.cheque
VALUES (210, 26, 15, 12449.10, 11405.94, 1043.16);
INSERT INTO public.cheque
VALUES (46, 13, 9, 1582.92, 1582.92, 0.00);
INSERT INTO public.cheque
VALUES (28, 25, 14, 6611.64, 6611.64, 0.00);
INSERT INTO public.cheque
VALUES (49, 25, 32, 11135.36, 11135.36, 0.00);
INSERT INTO public.cheque
VALUES (240, 3, 27, 1664.01, 1414.05, 0.00);
INSERT INTO public.cheque
VALUES (160, 3, 26, 1602.38, 1512.99, 0.00);
INSERT INTO public.cheque
VALUES (258, 16, 49, 28525.35, 28525.35, 0.00);
INSERT INTO public.cheque
VALUES (73, 20, 30, 7228.20, 6322.89, 905.31);
INSERT INTO public.cheque
VALUES (229, 7, 15, 4142.55, 3704.43, 438.12);
INSERT INTO public.cheque
VALUES (269, 2, 49, 30955.75, 28606.66, 0.00);
INSERT INTO public.cheque
VALUES (178, 1, 9, 3249.00, 2882.78, 366.22);
INSERT INTO public.cheque
VALUES (129, 3, 23, 1417.49, 1347.38, 0.00);
INSERT INTO public.cheque
VALUES (188, 4, 8, 4250.00, 4250.00, 0.00);
INSERT INTO public.cheque
VALUES (45, 22, 48, 5618.40, 5618.40, 0.00);
INSERT INTO public.cheque
VALUES (184, 12, 48, 11407.68, 10512.41, 0.00);
INSERT INTO public.cheque
VALUES (117, 4, 13, 5866.25, 5567.63, 0.00);
INSERT INTO public.cheque
VALUES (67, 23, 45, 25275.60, 21039.17, 4236.43);
INSERT INTO public.cheque
VALUES (281, 5, 11, 1370.60, 1370.60, 0.00);
INSERT INTO public.cheque
VALUES (14, 14, 32, 9219.84, 9219.84, 0.00);
INSERT INTO public.cheque
VALUES (90, 28, 25, 13696.50, 11259.28, 2437.22);
INSERT INTO public.cheque
VALUES (23, 11, 4, 330.76, 330.76, 0.00);
INSERT INTO public.cheque
VALUES (192, 10, 41, 20910.00, 20910.00, 0.00);
INSERT INTO public.cheque
VALUES (103, 22, 10, 1170.50, 1170.50, 0.00);
INSERT INTO public.cheque
VALUES (243, 30, 2, 862.38, 714.46, 147.92);
INSERT INTO public.cheque
VALUES (68, 17, 16, 53.28, 43.49, 0.00);
INSERT INTO public.cheque
VALUES (178, 18, 44, 39882.04, 39882.04, 0.00);
INSERT INTO public.cheque
VALUES (214, 23, 18, 10110.24, 10110.24, 0.00);
INSERT INTO public.cheque
VALUES (166, 1, 5, 2125.00, 2092.21, 0.00);
INSERT INTO public.cheque
VALUES (234, 17, 46, 153.18, 153.18, 0.00);
INSERT INTO public.cheque
VALUES (94, 4, 6, 3187.50, 2778.47, 409.03);
INSERT INTO public.cheque
VALUES (189, 29, 36, 19502.28, 18208.90, 0.00);
INSERT INTO public.cheque
VALUES (91, 26, 33, 24505.14, 24505.14, 0.00);
INSERT INTO public.cheque
VALUES (157, 19, 33, 14180.43, 11405.06, 2775.37);
INSERT INTO public.cheque
VALUES (89, 14, 45, 11600.55, 11600.55, 0.00);
INSERT INTO public.cheque
VALUES (177, 29, 19, 10292.87, 10292.87, 0.00);
INSERT INTO public.cheque
VALUES (93, 29, 47, 30917.54, 27615.32, 3302.22);
INSERT INTO public.cheque
VALUES (262, 6, 34, 6014.26, 5580.00, 434.26);
INSERT INTO public.cheque
VALUES (149, 8, 13, 3674.19, 3045.52, 628.67);
INSERT INTO public.cheque
VALUES (93, 14, 10, 2577.90, 2577.90, 0.00);
INSERT INTO public.cheque
VALUES (208, 9, 15, 11371.50, 11371.50, 0.00);
INSERT INTO public.cheque
VALUES (139, 13, 48, 8442.24, 7209.81, 0.00);
INSERT INTO public.cheque
VALUES (235, 17, 3, 9.99, 9.46, 0.00);
INSERT INTO public.cheque
VALUES (72, 16, 22, 14314.08, 12829.76, 0.00);
INSERT INTO public.cheque
VALUES (145, 18, 47, 38117.00, 38117.00, 0.00);
INSERT INTO public.cheque
VALUES (72, 21, 3, 164.34, 135.32, 0.00);
INSERT INTO public.cheque
VALUES (31, 28, 9, 4930.74, 4804.45, 0.00);
INSERT INTO public.cheque
VALUES (199, 7, 45, 12427.65, 10598.72, 0.00);
INSERT INTO public.cheque
VALUES (128, 2, 23, 14530.25, 13018.04, 1512.21);
INSERT INTO public.cheque
VALUES (8, 20, 18, 3571.56, 3027.89, 0.00);
INSERT INTO public.cheque
VALUES (242, 25, 34, 14366.70, 13926.66, 440.04);
INSERT INTO public.cheque
VALUES (45, 21, 41, 2009.41, 2009.41, 0.00);
INSERT INTO public.cheque
VALUES (132, 20, 9, 1785.78, 1444.35, 0.00);
INSERT INTO public.cheque
VALUES (74, 16, 36, 20957.40, 20957.40, 0.00);
INSERT INTO public.cheque
VALUES (12, 24, 37, 21173.25, 18065.80, 0.00);
INSERT INTO public.cheque
VALUES (98, 28, 21, 9474.78, 9474.78, 0.00);
INSERT INTO public.cheque
VALUES (76, 7, 41, 13330.33, 13330.33, 0.00);
INSERT INTO public.cheque
VALUES (208, 27, 26, 3761.42, 3689.45, 0.00);
INSERT INTO public.cheque
VALUES (66, 1, 17, 7225.00, 7225.00, 0.00);
INSERT INTO public.cheque
VALUES (199, 4, 1, 451.25, 451.25, 0.00);
INSERT INTO public.cheque
VALUES (48, 12, 47, 11170.02, 11170.02, 0.00);
INSERT INTO public.cheque
VALUES (232, 12, 17, 4040.22, 3309.62, 0.00);
INSERT INTO public.cheque
VALUES (247, 17, 24, 89.28, 84.27, 0.00);
INSERT INTO public.cheque
VALUES (83, 11, 32, 2646.08, 2365.71, 0.00);
INSERT INTO public.cheque
VALUES (49, 3, 34, 1380.40, 1380.40, 0.00);
INSERT INTO public.cheque
VALUES (238, 7, 28, 7732.76, 7732.76, 0.00);
INSERT INTO public.cheque
VALUES (102, 11, 10, 609.30, 609.30, 0.00);
INSERT INTO public.cheque
VALUES (182, 17, 37, 101.38, 93.72, 7.66);
INSERT INTO public.cheque
VALUES (241, 22, 17, 1638.63, 1638.63, 0.00);
INSERT INTO public.cheque
VALUES (230, 29, 29, 19076.78, 16342.44, 0.00);
INSERT INTO public.cheque
VALUES (251, 9, 31, 27667.50, 25390.60, 2276.90);
INSERT INTO public.cheque
VALUES (102, 26, 29, 17734.37, 14838.05, 2896.32);
INSERT INTO public.cheque
VALUES (83, 19, 33, 15848.58, 15848.58, 0.00);
INSERT INTO public.cheque
VALUES (11, 29, 14, 9209.48, 9209.48, 0.00);
INSERT INTO public.cheque
VALUES (285, 23, 14, 7863.52, 7863.52, 0.00);
INSERT INTO public.cheque
VALUES (282, 20, 9, 1785.78, 1618.22, 0.00);
INSERT INTO public.cheque
VALUES (178, 9, 41, 31082.10, 31082.10, 0.00);
INSERT INTO public.cheque
VALUES (151, 27, 47, 6083.68, 5830.40, 0.00);
INSERT INTO public.cheque
VALUES (72, 3, 22, 1151.70, 1151.70, 0.00);
INSERT INTO public.cheque
VALUES (120, 8, 8, 2261.04, 2261.04, 0.00);
INSERT INTO public.cheque
VALUES (53, 25, 7, 2435.86, 2435.86, 0.00);
INSERT INTO public.cheque
VALUES (260, 10, 10, 3360.00, 3180.53, 0.00);
INSERT INTO public.cheque
VALUES (53, 23, 24, 11101.44, 11101.44, 0.00);
INSERT INTO public.cheque
VALUES (32, 27, 1, 129.44, 129.44, 0.00);
INSERT INTO public.cheque
VALUES (1, 9, 32, 18816.00, 18816.00, 0.00);
INSERT INTO public.cheque
VALUES (141, 27, 25, 3236.00, 2745.50, 490.50);
INSERT INTO public.cheque
VALUES (173, 6, 48, 6585.60, 5707.17, 0.00);
INSERT INTO public.cheque
VALUES (251, 6, 45, 9371.25, 9366.67, 0.00);
INSERT INTO public.cheque
VALUES (163, 10, 6, 2599.20, 2599.20, 0.00);
INSERT INTO public.cheque
VALUES (121, 12, 30, 7129.80, 7129.80, 0.00);
INSERT INTO public.cheque
VALUES (180, 2, 35, 22111.25, 20145.74, 0.00);
INSERT INTO public.cheque
VALUES (189, 26, 48, 29353.44, 27751.37, 1602.07);
INSERT INTO public.cheque
VALUES (163, 11, 7, 578.83, 478.24, 100.59);
INSERT INTO public.cheque
VALUES (218, 12, 38, 9031.08, 8950.58, 0.00);
INSERT INTO public.cheque
VALUES (84, 3, 45, 2773.35, 2773.35, 0.00);
INSERT INTO public.cheque
VALUES (223, 5, 27, 3364.20, 2886.39, 0.00);
INSERT INTO public.cheque
VALUES (216, 6, 27, 4776.03, 4520.16, 0.00);
INSERT INTO public.cheque
VALUES (184, 6, 28, 5831.00, 5647.24, 183.76);
INSERT INTO public.cheque
VALUES (121, 16, 12, 6985.80, 6985.80, 0.00);
INSERT INTO public.cheque
VALUES (21, 2, 48, 35700.00, 35700.00, 0.00);
INSERT INTO public.cheque
VALUES (184, 14, 15, 3866.85, 3866.85, 0.00);
INSERT INTO public.cheque
VALUES (154, 17, 41, 136.53, 121.46, 0.00);
INSERT INTO public.cheque
VALUES (228, 11, 5, 369.90, 299.08, 0.00);
INSERT INTO public.cheque
VALUES (48, 12, 1, 237.66, 237.66, 0.00);
INSERT INTO public.cheque
VALUES (21, 25, 39, 16479.45, 14120.74, 2358.71);
INSERT INTO public.cheque
VALUES (207, 3, 31, 1910.53, 1886.17, 24.36);
INSERT INTO public.cheque
VALUES (276, 27, 36, 4659.84, 4659.84, 0.00);
INSERT INTO public.cheque
VALUES (98, 26, 39, 23849.67, 22062.65, 1787.02);
INSERT INTO public.cheque
VALUES (256, 2, 47, 34956.25, 34956.25, 0.00);
INSERT INTO public.cheque
VALUES (121, 8, 26, 7348.38, 7348.38, 0.00);
INSERT INTO public.cheque
VALUES (109, 30, 31, 13366.89, 13366.89, 0.00);
INSERT INTO public.cheque
VALUES (257, 8, 33, 7922.31, 7922.31, 0.00);
INSERT INTO public.cheque
VALUES (61, 24, 48, 30699.84, 27610.46, 3089.38);
INSERT INTO public.cheque
VALUES (8, 12, 45, 8807.40, 7652.07, 0.00);
INSERT INTO public.cheque
VALUES (130, 24, 48, 30699.84, 28345.01, 0.00);
INSERT INTO public.cheque
VALUES (149, 17, 2, 6.66, 6.66, 0.00);
INSERT INTO public.cheque
VALUES (261, 18, 40, 26715.20, 26715.20, 0.00);
INSERT INTO public.cheque
VALUES (21, 15, 20, 4170.20, 3434.22, 735.98);
INSERT INTO public.cheque
VALUES (82, 21, 23, 1127.23, 1118.98, 8.25);
INSERT INTO public.cheque
VALUES (244, 20, 28, 7540.12, 7540.12, 0.00);
INSERT INTO public.cheque
VALUES (280, 24, 23, 14710.34, 14710.34, 0.00);
INSERT INTO public.cheque
VALUES (70, 5, 15, 2409.75, 2309.96, 0.00);
INSERT INTO public.cheque
VALUES (262, 6, 39, 6898.71, 6898.71, 0.00);
INSERT INTO public.cheque
VALUES (210, 17, 26, 96.72, 96.72, 0.00);
INSERT INTO public.cheque
VALUES (258, 27, 5, 647.20, 647.20, 0.00);
INSERT INTO public.cheque
VALUES (33, 13, 16, 2317.44, 2062.44, 0.00);
INSERT INTO public.cheque
VALUES (76, 17, 18, 59.94, 59.94, 0.00);
INSERT INTO public.cheque
VALUES (161, 27, 25, 3236.00, 3236.00, 0.00);
INSERT INTO public.cheque
VALUES (198, 4, 14, 6317.50, 6317.50, 0.00);
INSERT INTO public.cheque
VALUES (213, 7, 14, 3866.38, 3866.38, 0.00);
INSERT INTO public.cheque
VALUES (103, 17, 35, 116.55, 94.98, 21.57);
INSERT INTO public.cheque
VALUES (177, 13, 21, 3041.64, 3041.64, 0.00);
INSERT INTO public.cheque
VALUES (58, 20, 46, 11083.24, 10495.09, 0.00);
INSERT INTO public.cheque
VALUES (65, 13, 32, 6290.24, 6290.24, 0.00);
INSERT INTO public.cheque
VALUES (22, 21, 21, 1150.38, 1134.14, 0.00);
INSERT INTO public.cheque
VALUES (267, 18, 9, 6010.92, 5405.64, 0.00);
INSERT INTO public.cheque
VALUES (130, 6, 39, 6898.71, 6898.71, 0.00);
INSERT INTO public.cheque
VALUES (234, 10, 27, 13770.00, 13770.00, 0.00);
INSERT INTO public.cheque
VALUES (264, 7, 9, 1927.80, 1927.80, 0.00);
INSERT INTO public.cheque
VALUES (212, 11, 24, 1462.32, 1403.82, 0.00);
INSERT INTO public.cheque
VALUES (67, 15, 17, 3544.67, 3544.67, 0.00);
INSERT INTO public.cheque
VALUES (68, 13, 37, 6507.56, 6507.56, 0.00);
INSERT INTO public.cheque
VALUES (14, 22, 39, 5101.98, 5101.98, 0.00);
INSERT INTO public.cheque
VALUES (202, 19, 14, 4954.32, 4954.32, 0.00);
INSERT INTO public.cheque
VALUES (119, 2, 26, 19337.50, 18316.97, 0.00);
INSERT INTO public.cheque
VALUES (268, 4, 10, 5312.50, 5312.50, 0.00);
INSERT INTO public.cheque
VALUES (136, 13, 12, 2110.56, 2110.56, 0.00);
INSERT INTO public.cheque
VALUES (180, 6, 44, 7783.16, 6997.50, 0.00);
INSERT INTO public.cheque
VALUES (20, 14, 39, 8279.70, 7081.35, 0.00);
INSERT INTO public.cheque
VALUES (16, 19, 33, 11678.04, 10266.00, 0.00);
INSERT INTO public.cheque
VALUES (141, 21, 38, 1862.38, 1729.35, 0.00);
INSERT INTO public.cheque
VALUES (267, 7, 23, 4926.60, 4427.39, 499.21);
INSERT INTO public.cheque
VALUES (131, 28, 20, 10957.20, 8874.54, 0.00);
INSERT INTO public.cheque
VALUES (66, 20, 42, 10119.48, 10119.48, 0.00);
INSERT INTO public.cheque
VALUES (205, 15, 35, 8156.40, 6678.73, 0.00);
INSERT INTO public.cheque
VALUES (259, 18, 9, 6010.92, 5234.20, 776.72);
INSERT INTO public.cheque
VALUES (101, 23, 44, 24713.92, 23612.58, 1101.34);
INSERT INTO public.cheque
VALUES (78, 6, 18, 2469.60, 2469.60, 0.00);
INSERT INTO public.cheque
VALUES (62, 4, 15, 5250.00, 5250.00, 0.00);
INSERT INTO public.cheque
VALUES (235, 6, 12, 2499.00, 2499.00, 0.00);
INSERT INTO public.cheque
VALUES (260, 29, 46, 24919.58, 24919.58, 0.00);
INSERT INTO public.cheque
VALUES (4, 22, 15, 1962.30, 1601.09, 0.00);
INSERT INTO public.cheque
VALUES (19, 24, 10, 6395.80, 6395.80, 0.00);
INSERT INTO public.cheque
VALUES (233, 27, 25, 2665.00, 2665.00, 0.00);
INSERT INTO public.cheque
VALUES (65, 5, 41, 6586.65, 6586.65, 0.00);
INSERT INTO public.cheque
VALUES (208, 20, 13, 3500.77, 3500.77, 0.00);
INSERT INTO public.cheque
VALUES (264, 28, 48, 21656.64, 18040.00, 0.00);
INSERT INTO public.cheque
VALUES (211, 15, 15, 3127.65, 2596.83, 530.82);
INSERT INTO public.cheque
VALUES (129, 10, 6, 3060.00, 2737.74, 322.26);
INSERT INTO public.cheque
VALUES (21, 21, 3, 147.03, 128.78, 18.25);
INSERT INTO public.cheque
VALUES (12, 13, 38, 6683.44, 6361.46, 0.00);
INSERT INTO public.cheque
VALUES (48, 4, 38, 20187.50, 19658.24, 529.26);
INSERT INTO public.cheque
VALUES (161, 11, 47, 3477.06, 3477.06, 0.00);
INSERT INTO public.cheque
VALUES (67, 15, 25, 5212.75, 4260.03, 952.72);
INSERT INTO public.cheque
VALUES (26, 18, 34, 22707.92, 22707.92, 0.00);
INSERT INTO public.cheque
VALUES (227, 19, 47, 20196.37, 17583.55, 0.00);
INSERT INTO public.cheque
VALUES (174, 4, 24, 12750.00, 12750.00, 0.00);
INSERT INTO public.cheque
VALUES (224, 24, 42, 24034.50, 24034.50, 0.00);
INSERT INTO public.cheque
VALUES (69, 4, 24, 12750.00, 11824.48, 925.52);
INSERT INTO public.cheque
VALUES (174, 9, 13, 11602.50, 11602.50, 0.00);
INSERT INTO public.cheque
VALUES (57, 14, 21, 5413.59, 5413.59, 0.00);
INSERT INTO public.cheque
VALUES (242, 24, 41, 23462.25, 23462.25, 0.00);
INSERT INTO public.cheque
VALUES (239, 17, 45, 167.40, 163.48, 0.00);
INSERT INTO public.cheque
VALUES (21, 27, 36, 4659.84, 4366.27, 293.57);
INSERT INTO public.cheque
VALUES (244, 30, 8, 4681.44, 3911.34, 0.00);
INSERT INTO public.cheque
VALUES (207, 6, 20, 4165.00, 4165.00, 0.00);
INSERT INTO public.cheque
VALUES (172, 1, 13, 5525.00, 5525.00, 0.00);
INSERT INTO public.cheque
VALUES (141, 2, 15, 11156.25, 9541.42, 0.00);
INSERT INTO public.cheque
VALUES (116, 4, 32, 14440.00, 14440.00, 0.00);
INSERT INTO public.cheque
VALUES (106, 10, 13, 4368.00, 4368.00, 0.00);
INSERT INTO public.cheque
VALUES (82, 13, 9, 1582.92, 1582.92, 0.00);
INSERT INTO public.cheque
VALUES (157, 16, 5, 2910.75, 2878.22, 0.00);
INSERT INTO public.cheque
VALUES (64, 25, 36, 15211.80, 13954.91, 0.00);
INSERT INTO public.cheque
VALUES (132, 23, 48, 22202.88, 18175.52, 4027.36);
INSERT INTO public.cheque
VALUES (149, 19, 35, 15039.85, 15039.85, 0.00);
INSERT INTO public.cheque
VALUES (174, 22, 17, 1989.85, 1951.65, 0.00);
INSERT INTO public.cheque
VALUES (235, 29, 12, 7893.84, 6440.57, 1453.27);
INSERT INTO public.cheque
VALUES (43, 28, 43, 26329.33, 26329.33, 0.00);
INSERT INTO public.cheque
VALUES (65, 22, 13, 1700.66, 1700.66, 0.00);
INSERT INTO public.cheque
VALUES (57, 21, 36, 1764.36, 1764.36, 0.00);
INSERT INTO public.cheque
VALUES (54, 24, 3, 1716.75, 1716.75, 0.00);
INSERT INTO public.cheque
VALUES (96, 28, 5, 2739.30, 2739.30, 0.00);
INSERT INTO public.cheque
VALUES (99, 7, 22, 6075.74, 4946.30, 1129.44);
INSERT INTO public.cheque
VALUES (270, 7, 34, 7282.80, 7282.80, 0.00);
INSERT INTO public.cheque
VALUES (167, 25, 7, 2957.85, 2863.26, 94.59);
INSERT INTO public.cheque
VALUES (126, 28, 41, 22462.26, 18826.58, 0.00);
INSERT INTO public.cheque
VALUES (64, 5, 11, 2080.43, 2061.06, 19.37);
INSERT INTO public.cheque
VALUES (39, 2, 8, 5950.00, 5950.00, 0.00);
INSERT INTO public.cheque
VALUES (162, 2, 42, 31237.50, 31237.50, 0.00);
INSERT INTO public.cheque
VALUES (80, 23, 23, 12918.64, 11201.06, 1717.58);
INSERT INTO public.cheque
VALUES (16, 20, 23, 4563.66, 4137.05, 426.61);
INSERT INTO public.cheque
VALUES (15, 25, 23, 9718.65, 9718.65, 0.00);
INSERT INTO public.cheque
VALUES (230, 10, 19, 9690.00, 8934.96, 755.04);
INSERT INTO public.cheque
VALUES (148, 4, 6, 3187.50, 2650.93, 0.00);
INSERT INTO public.cheque
VALUES (19, 25, 39, 18418.14, 16265.63, 0.00);
INSERT INTO public.cheque
VALUES (21, 9, 10, 8925.00, 8925.00, 0.00);
INSERT INTO public.cheque
VALUES (235, 23, 42, 23590.56, 23590.56, 0.00);
INSERT INTO public.cheque
VALUES (157, 17, 41, 136.53, 122.57, 0.00);
INSERT INTO public.cheque
VALUES (159, 8, 22, 4096.40, 3449.08, 0.00);
INSERT INTO public.cheque
VALUES (83, 19, 14, 6723.64, 5998.19, 0.00);
INSERT INTO public.cheque
VALUES (66, 26, 41, 30445.78, 30445.78, 0.00);
INSERT INTO public.cheque
VALUES (54, 29, 15, 9867.30, 9867.30, 0.00);
INSERT INTO public.cheque
VALUES (122, 28, 41, 18498.38, 15090.14, 0.00);
INSERT INTO public.cheque
VALUES (14, 2, 22, 13898.50, 11821.73, 0.00);
INSERT INTO public.cheque
VALUES (121, 9, 29, 25882.50, 25867.46, 15.04);
INSERT INTO public.cheque
VALUES (12, 7, 34, 11054.42, 11054.42, 0.00);
INSERT INTO public.cheque
VALUES (199, 13, 14, 2751.98, 2542.83, 0.00);
INSERT INTO public.cheque
VALUES (280, 10, 33, 14295.60, 13558.31, 0.00);
INSERT INTO public.cheque
VALUES (40, 24, 39, 24943.62, 24943.62, 0.00);
INSERT INTO public.cheque
VALUES (273, 6, 37, 5076.40, 4823.17, 0.00);
INSERT INTO public.cheque
VALUES (204, 18, 35, 28385.00, 24833.99, 3551.01);
INSERT INTO public.cheque
VALUES (195, 14, 17, 4382.43, 3801.24, 0.00);
INSERT INTO public.cheque
VALUES (249, 16, 38, 22121.70, 19355.00, 0.00);
INSERT INTO public.cheque
VALUES (80, 2, 13, 9668.75, 9668.75, 0.00);
INSERT INTO public.cheque
VALUES (120, 13, 26, 4572.88, 4403.41, 0.00);
INSERT INTO public.cheque
VALUES (249, 30, 49, 25655.42, 25655.42, 0.00);
INSERT INTO public.cheque
VALUES (44, 19, 20, 8594.20, 8594.20, 0.00);
INSERT INTO public.cheque
VALUES (265, 2, 13, 8212.75, 7721.99, 490.76);
INSERT INTO public.cheque
VALUES (268, 16, 18, 10478.70, 8764.53, 0.00);
INSERT INTO public.cheque
VALUES (259, 14, 21, 4458.30, 3568.48, 0.00);
INSERT INTO public.cheque
VALUES (202, 12, 40, 7828.80, 7828.80, 0.00);
INSERT INTO public.cheque
VALUES (103, 20, 10, 2409.40, 2324.77, 0.00);
INSERT INTO public.cheque
VALUES (110, 13, 31, 5452.28, 5044.90, 0.00);
INSERT INTO public.cheque
VALUES (87, 25, 30, 12676.50, 12264.99, 0.00);
INSERT INTO public.cheque
VALUES (91, 28, 41, 22462.26, 22462.26, 0.00);
INSERT INTO public.cheque
VALUES (109, 20, 13, 2579.46, 2579.46, 0.00);
INSERT INTO public.cheque
VALUES (174, 19, 38, 16328.98, 16075.96, 0.00);
INSERT INTO public.cheque
VALUES (166, 29, 10, 6578.20, 5565.34, 1012.86);
INSERT INTO public.cheque
VALUES (140, 29, 2, 1470.42, 1470.42, 0.00);
INSERT INTO public.cheque
VALUES (124, 12, 5, 1188.30, 1037.48, 150.82);
INSERT INTO public.cheque
VALUES (264, 22, 27, 2602.53, 2386.19, 0.00);
INSERT INTO public.cheque
VALUES (247, 2, 17, 10739.75, 8641.94, 2097.81);
INSERT INTO public.cheque
VALUES (146, 14, 17, 4382.43, 4292.06, 90.37);
INSERT INTO public.cheque
VALUES (109, 2, 13, 6370.00, 6370.00, 0.00);
INSERT INTO public.cheque
VALUES (236, 25, 35, 14789.25, 12672.79, 2116.46);
INSERT INTO public.cheque
VALUES (215, 10, 45, 19494.00, 15808.92, 3685.08);
INSERT INTO public.cheque
VALUES (156, 17, 33, 109.89, 106.63, 0.00);
INSERT INTO public.cheque
VALUES (111, 3, 38, 2341.94, 2297.22, 44.72);
INSERT INTO public.cheque
VALUES (115, 4, 9, 3150.00, 3150.00, 0.00);
INSERT INTO public.cheque
VALUES (193, 14, 36, 9280.44, 8782.71, 497.73);
INSERT INTO public.cheque
VALUES (135, 15, 14, 3262.56, 2994.43, 268.13);
INSERT INTO public.cheque
VALUES (158, 24, 42, 19793.34, 17997.67, 1795.67);
INSERT INTO public.cheque
VALUES (35, 2, 45, 28428.75, 28428.75, 0.00);
INSERT INTO public.cheque
VALUES (206, 16, 12, 7807.68, 6995.27, 0.00);
INSERT INTO public.cheque
VALUES (95, 21, 17, 833.17, 827.34, 0.00);
INSERT INTO public.cheque
VALUES (42, 15, 15, 3127.65, 3032.92, 94.73);
INSERT INTO public.cheque
VALUES (128, 13, 37, 7273.09, 6473.06, 0.00);
INSERT INTO public.cheque
VALUES (182, 24, 43, 20264.61, 20264.61, 0.00);
INSERT INTO public.cheque
VALUES (217, 12, 48, 9394.56, 9394.56, 0.00);
INSERT INTO public.cheque
VALUES (251, 9, 24, 21420.00, 18357.32, 3062.68);
INSERT INTO public.cheque
VALUES (103, 18, 32, 25952.00, 25952.00, 0.00);
INSERT INTO public.cheque
VALUES (81, 16, 39, 22703.85, 22703.85, 0.00);
INSERT INTO public.cheque
VALUES (220, 10, 14, 7140.00, 6804.55, 0.00);
INSERT INTO public.cheque
VALUES (229, 16, 28, 18217.92, 16398.12, 0.00);
INSERT INTO public.cheque
VALUES (281, 18, 43, 28718.84, 28718.84, 0.00);
INSERT INTO public.cheque
VALUES (232, 3, 46, 2834.98, 2353.79, 481.19);
INSERT INTO public.cheque
VALUES (104, 24, 9, 5150.25, 4265.94, 884.31);
INSERT INTO public.cheque
VALUES (243, 23, 50, 23128.00, 23128.00, 0.00);
INSERT INTO public.cheque
VALUES (236, 28, 20, 10957.20, 10957.20, 0.00);
INSERT INTO public.cheque
VALUES (169, 18, 4, 3625.64, 3393.22, 0.00);
INSERT INTO public.cheque
VALUES (87, 9, 29, 25882.50, 25882.50, 0.00);
INSERT INTO public.cheque
VALUES (46, 19, 39, 16758.69, 16545.01, 0.00);
INSERT INTO public.cheque
VALUES (86, 13, 27, 3910.68, 3388.07, 522.61);
INSERT INTO public.cheque
VALUES (150, 29, 11, 5959.03, 5959.03, 0.00);
INSERT INTO public.cheque
VALUES (182, 28, 22, 9925.96, 9925.96, 0.00);
INSERT INTO public.cheque
VALUES (191, 6, 15, 2653.35, 2368.66, 0.00);
INSERT INTO public.cheque
VALUES (211, 6, 30, 6247.50, 6206.39, 0.00);
INSERT INTO public.cheque
VALUES (37, 17, 32, 119.04, 119.04, 0.00);
INSERT INTO public.cheque
VALUES (218, 8, 49, 13848.87, 12029.92, 0.00);
INSERT INTO public.cheque
VALUES (20, 7, 39, 8353.80, 7636.80, 0.00);
INSERT INTO public.cheque
VALUES (197, 22, 6, 578.34, 578.34, 0.00);
INSERT INTO public.cheque
VALUES (100, 21, 15, 735.15, 682.23, 0.00);
INSERT INTO public.cheque
VALUES (72, 19, 7, 3361.82, 3136.91, 0.00);
INSERT INTO public.cheque
VALUES (148, 27, 5, 647.20, 647.20, 0.00);
INSERT INTO public.cheque
VALUES (79, 12, 21, 4110.12, 4110.12, 0.00);
INSERT INTO public.cheque
VALUES (183, 25, 31, 13099.05, 12770.78, 328.27);
INSERT INTO public.cheque
VALUES (36, 3, 38, 2341.94, 2341.94, 0.00);
INSERT INTO public.cheque
VALUES (25, 27, 16, 1705.60, 1705.60, 0.00);
INSERT INTO public.cheque
VALUES (133, 3, 10, 616.30, 511.74, 104.56);
INSERT INTO public.cheque
VALUES (161, 27, 9, 1164.96, 1164.96, 0.00);
INSERT INTO public.cheque
VALUES (156, 26, 13, 9653.54, 9653.54, 0.00);
INSERT INTO public.cheque
VALUES (91, 20, 45, 10842.30, 9197.19, 1645.11);
INSERT INTO public.cheque
VALUES (192, 7, 36, 11704.68, 11704.68, 0.00);
INSERT INTO public.cheque
VALUES (190, 28, 43, 23557.98, 19950.95, 0.00);
INSERT INTO public.cheque
VALUES (123, 5, 38, 7186.94, 7186.94, 0.00);
INSERT INTO public.cheque
VALUES (155, 14, 22, 5671.38, 4982.17, 689.21);
INSERT INTO public.cheque
VALUES (256, 13, 44, 7738.72, 7738.72, 0.00);
INSERT INTO public.cheque
VALUES (9, 2, 12, 8925.00, 8925.00, 0.00);
INSERT INTO public.cheque
VALUES (269, 22, 7, 915.74, 840.14, 0.00);
INSERT INTO public.cheque
VALUES (131, 19, 26, 11172.46, 9778.60, 0.00);
INSERT INTO public.cheque
VALUES (207, 12, 26, 6179.16, 5929.52, 0.00);
INSERT INTO public.cheque
VALUES (30, 3, 20, 1232.60, 1232.60, 0.00);
INSERT INTO public.cheque
VALUES (39, 2, 15, 11156.25, 10205.36, 0.00);
INSERT INTO public.cheque
VALUES (25, 12, 45, 8807.40, 7369.13, 0.00);
INSERT INTO public.cheque
VALUES (84, 19, 49, 21055.79, 21055.79, 0.00);
INSERT INTO public.cheque
VALUES (94, 22, 9, 1053.45, 1053.45, 0.00);
INSERT INTO public.cheque
VALUES (171, 3, 27, 1664.01, 1476.63, 187.38);
INSERT INTO public.cheque
VALUES (81, 30, 19, 9948.02, 9948.02, 0.00);
INSERT INTO public.cheque
VALUES (142, 11, 34, 2071.62, 1863.22, 0.00);
INSERT INTO public.cheque
VALUES (220, 3, 15, 924.45, 924.45, 0.00);
INSERT INTO public.cheque
VALUES (56, 3, 34, 2095.42, 2095.42, 0.00);
INSERT INTO public.cheque
VALUES (190, 25, 32, 13521.60, 12893.24, 628.36);
INSERT INTO public.cheque
VALUES (169, 20, 42, 11310.18, 11058.06, 252.12);
INSERT INTO public.cheque
VALUES (22, 26, 6, 4979.64, 4979.64, 0.00);
INSERT INTO public.cheque
VALUES (23, 13, 21, 4127.97, 3679.91, 448.06);
INSERT INTO public.cheque
VALUES (33, 19, 15, 5308.20, 5308.20, 0.00);
INSERT INTO public.cheque
VALUES (25, 13, 36, 5214.24, 5214.24, 0.00);
INSERT INTO public.cheque
VALUES (22, 14, 35, 10084.20, 9545.89, 538.31);
INSERT INTO public.cheque
VALUES (88, 18, 31, 20704.28, 20545.86, 0.00);
INSERT INTO public.cheque
VALUES (147, 23, 34, 19097.12, 18914.08, 0.00);
INSERT INTO public.cheque
VALUES (247, 18, 17, 15408.97, 15408.97, 0.00);
INSERT INTO public.cheque
VALUES (75, 19, 16, 7684.16, 7684.16, 0.00);
INSERT INTO public.cheque
VALUES (143, 5, 45, 8510.85, 7269.19, 0.00);
INSERT INTO public.cheque
VALUES (246, 23, 23, 14438.48, 14044.13, 0.00);
INSERT INTO public.cheque
VALUES (130, 10, 38, 16461.60, 13990.86, 0.00);
INSERT INTO public.cheque
VALUES (22, 22, 48, 6279.36, 5389.44, 0.00);
INSERT INTO public.cheque
VALUES (267, 1, 25, 7000.00, 7000.00, 0.00);
INSERT INTO public.cheque
VALUES (105, 23, 1, 462.56, 452.13, 0.00);
INSERT INTO public.cheque
VALUES (21, 8, 27, 7631.01, 7631.01, 0.00);
INSERT INTO public.cheque
VALUES (182, 15, 44, 7555.24, 6536.89, 0.00);
INSERT INTO public.cheque
VALUES (17, 8, 11, 3108.93, 2823.60, 285.33);
INSERT INTO public.cheque
VALUES (44, 25, 7, 2957.85, 2957.85, 0.00);
INSERT INTO public.cheque
VALUES (253, 11, 16, 974.88, 787.75, 0.00);
INSERT INTO public.cheque
VALUES (183, 19, 39, 16758.69, 16188.15, 0.00);
INSERT INTO public.cheque
VALUES (188, 10, 29, 14790.00, 13855.67, 934.33);
INSERT INTO public.cheque
VALUES (226, 2, 46, 29060.50, 29060.50, 0.00);
INSERT INTO public.cheque
VALUES (183, 16, 13, 7567.95, 7567.95, 0.00);
INSERT INTO public.cheque
VALUES (267, 7, 15, 3213.00, 2919.21, 0.00);
INSERT INTO public.cheque
VALUES (146, 26, 35, 25990.30, 25291.08, 699.22);
INSERT INTO public.cheque
VALUES (104, 10, 39, 19890.00, 19890.00, 0.00);
INSERT INTO public.cheque
VALUES (219, 18, 48, 38928.00, 38928.00, 0.00);
INSERT INTO public.cheque
VALUES (263, 14, 49, 12631.71, 12152.41, 479.30);
INSERT INTO public.cheque
VALUES (240, 3, 26, 1602.38, 1602.38, 0.00);
INSERT INTO public.cheque
VALUES (17, 6, 12, 2499.00, 2134.81, 0.00);
INSERT INTO public.cheque
VALUES (192, 24, 3, 1716.75, 1716.75, 0.00);
INSERT INTO public.cheque
VALUES (134, 8, 14, 2606.80, 2606.80, 0.00);
INSERT INTO public.cheque
VALUES (241, 25, 35, 12179.30, 12179.30, 0.00);
INSERT INTO public.cheque
VALUES (46, 10, 41, 20910.00, 20910.00, 0.00);
INSERT INTO public.cheque
VALUES (116, 21, 37, 2026.86, 2016.62, 0.00);
INSERT INTO public.cheque
VALUES (271, 20, 26, 6264.44, 5463.16, 801.28);
INSERT INTO public.cheque
VALUES (284, 9, 4, 2352.00, 2253.03, 0.00);
INSERT INTO public.cheque
VALUES (67, 4, 20, 10625.00, 9910.31, 714.69);
INSERT INTO public.cheque
VALUES (143, 27, 6, 776.64, 666.26, 0.00);
INSERT INTO public.cheque
VALUES (239, 26, 42, 34857.48, 32077.79, 0.00);
INSERT INTO public.cheque
VALUES (161, 6, 20, 4165.00, 4165.00, 0.00);
INSERT INTO public.cheque
VALUES (222, 3, 43, 1745.80, 1567.46, 0.00);
INSERT INTO public.cheque
VALUES (248, 30, 2, 1047.16, 885.93, 0.00);
INSERT INTO public.cheque
VALUES (116, 2, 48, 30324.00, 25755.47, 4568.53);
INSERT INTO public.cheque
VALUES (273, 4, 47, 16450.00, 16450.00, 0.00);
INSERT INTO public.cheque
VALUES (233, 29, 15, 8125.95, 7954.29, 171.66);
INSERT INTO public.cheque
VALUES (135, 25, 8, 3778.08, 3388.42, 0.00);
INSERT INTO public.cheque
VALUES (144, 11, 12, 731.16, 731.16, 0.00);
INSERT INTO public.cheque
VALUES (130, 22, 46, 6017.72, 5041.42, 0.00);
INSERT INTO public.cheque
VALUES (193, 20, 35, 8432.90, 7940.88, 0.00);
INSERT INTO public.cheque
VALUES (35, 11, 14, 1157.66, 1157.66, 0.00);
INSERT INTO public.cheque
VALUES (55, 17, 29, 96.57, 96.57, 0.00);
INSERT INTO public.cheque
VALUES (254, 20, 29, 6987.26, 6566.55, 420.71);
INSERT INTO public.cheque
VALUES (209, 3, 36, 2218.68, 1953.29, 0.00);
INSERT INTO public.cheque
VALUES (156, 8, 27, 7631.01, 6407.55, 0.00);
INSERT INTO public.cheque
VALUES (56, 25, 12, 5070.60, 5070.60, 0.00);
INSERT INTO public.cheque
VALUES (121, 30, 35, 18325.30, 17580.12, 0.00);
INSERT INTO public.cheque
VALUES (59, 8, 32, 9044.16, 7856.09, 0.00);
INSERT INTO public.cheque
VALUES (51, 11, 19, 1157.67, 1157.67, 0.00);
INSERT INTO public.cheque
VALUES (109, 28, 3, 1353.54, 1353.54, 0.00);
INSERT INTO public.cheque
VALUES (241, 10, 25, 8400.00, 8400.00, 0.00);
INSERT INTO public.cheque
VALUES (213, 24, 2, 1279.16, 1032.35, 0.00);
INSERT INTO public.cheque
VALUES (185, 12, 2, 391.44, 314.29, 77.15);
INSERT INTO public.cheque
VALUES (65, 11, 38, 3142.22, 3142.22, 0.00);
INSERT INTO public.cheque
VALUES (257, 17, 2, 7.44, 6.72, 0.00);
INSERT INTO public.cheque
VALUES (279, 2, 27, 20081.25, 16806.35, 3274.90);
INSERT INTO public.cheque
VALUES (177, 25, 42, 14615.16, 11878.30, 0.00);
INSERT INTO public.cheque
VALUES (163, 12, 9, 2390.58, 2390.58, 0.00);
INSERT INTO public.cheque
VALUES (264, 10, 18, 6048.00, 6048.00, 0.00);
INSERT INTO public.cheque
VALUES (224, 28, 37, 20270.82, 20270.82, 0.00);
INSERT INTO public.cheque
VALUES (87, 16, 49, 28525.35, 28525.35, 0.00);
INSERT INTO public.cheque
VALUES (184, 24, 28, 16023.00, 16023.00, 0.00);
INSERT INTO public.cheque
VALUES (212, 12, 24, 4697.28, 4697.28, 0.00);
INSERT INTO public.cheque
VALUES (218, 15, 14, 2919.14, 2919.14, 0.00);
INSERT INTO public.cheque
VALUES (94, 2, 28, 20825.00, 20825.00, 0.00);
INSERT INTO public.cheque
VALUES (185, 23, 12, 5550.72, 5550.72, 0.00);
INSERT INTO public.cheque
VALUES (282, 20, 20, 3968.40, 3968.40, 0.00);
INSERT INTO public.cheque
VALUES (175, 4, 17, 9031.25, 7486.73, 0.00);
INSERT INTO public.cheque
VALUES (9, 24, 7, 4005.75, 4005.75, 0.00);
INSERT INTO public.cheque
VALUES (76, 5, 9, 1702.17, 1702.17, 0.00);
INSERT INTO public.cheque
VALUES (48, 4, 38, 20187.50, 20187.50, 0.00);
INSERT INTO public.cheque
VALUES (160, 17, 27, 89.91, 79.55, 10.36);
INSERT INTO public.cheque
VALUES (122, 13, 48, 6952.32, 6219.35, 0.00);
INSERT INTO public.cheque
VALUES (150, 16, 38, 18217.96, 14801.97, 3415.99);
INSERT INTO public.cheque
VALUES (208, 24, 3, 1918.74, 1918.74, 0.00);
INSERT INTO public.cheque
VALUES (72, 6, 10, 1768.90, 1575.40, 0.00);
INSERT INTO public.cheque
VALUES (5, 9, 17, 9996.00, 8930.62, 1065.38);
INSERT INTO public.cheque
VALUES (132, 27, 43, 4583.80, 4583.80, 0.00);
INSERT INTO public.cheque
VALUES (215, 17, 42, 156.24, 156.24, 0.00);
INSERT INTO public.cheque
VALUES (133, 9, 39, 34807.50, 34807.50, 0.00);
INSERT INTO public.cheque
VALUES (247, 8, 15, 3601.05, 3344.24, 256.81);
INSERT INTO public.cheque
VALUES (101, 26, 43, 31930.94, 26049.80, 0.00);
INSERT INTO public.cheque
VALUES (127, 20, 38, 9155.72, 7539.26, 0.00);
INSERT INTO public.cheque
VALUES (82, 17, 40, 133.20, 107.81, 25.39);
INSERT INTO public.cheque
VALUES (44, 20, 22, 5300.68, 4487.69, 0.00);
INSERT INTO public.cheque
VALUES (99, 29, 16, 11763.36, 10272.32, 0.00);
INSERT INTO public.cheque
VALUES (138, 24, 50, 28612.50, 27398.11, 0.00);
INSERT INTO public.cheque
VALUES (154, 16, 38, 22121.70, 22121.70, 0.00);
INSERT INTO public.cheque
VALUES (215, 10, 47, 20360.40, 20360.40, 0.00);
INSERT INTO public.cheque
VALUES (94, 15, 34, 7089.34, 7089.34, 0.00);
INSERT INTO public.cheque
VALUES (60, 20, 11, 2182.62, 2182.62, 0.00);
INSERT INTO public.cheque
VALUES (4, 20, 23, 6193.67, 6193.67, 0.00);
INSERT INTO public.cheque
VALUES (203, 29, 39, 21127.47, 21127.47, 0.00);
INSERT INTO public.cheque
VALUES (143, 9, 42, 37485.00, 35920.77, 0.00);
INSERT INTO public.cheque
VALUES (133, 9, 26, 23205.00, 23205.00, 0.00);
INSERT INTO public.cheque
VALUES (275, 30, 4, 2094.32, 2094.32, 0.00);
INSERT INTO public.cheque
VALUES (170, 4, 8, 2800.00, 2294.22, 0.00);
INSERT INTO public.cheque
VALUES (142, 13, 29, 4200.36, 4200.36, 0.00);
INSERT INTO public.cheque
VALUES (114, 7, 17, 4694.89, 4694.89, 0.00);
INSERT INTO public.cheque
VALUES (39, 25, 12, 5070.60, 5070.60, 0.00);
INSERT INTO public.cheque
VALUES (279, 18, 22, 17842.00, 15336.99, 2505.01);
INSERT INTO public.cheque
VALUES (243, 25, 13, 4523.74, 4523.74, 0.00);
INSERT INTO public.cheque
VALUES (202, 21, 37, 1493.32, 1459.79, 33.53);
INSERT INTO public.cheque
VALUES (131, 28, 34, 18627.24, 17997.44, 629.80);
INSERT INTO public.cheque
VALUES (174, 28, 17, 9313.62, 9024.33, 0.00);
INSERT INTO public.cheque
VALUES (76, 20, 13, 3132.22, 3132.22, 0.00);
INSERT INTO public.cheque
VALUES (219, 14, 24, 6186.96, 6186.96, 0.00);
INSERT INTO public.cheque
VALUES (101, 19, 48, 20626.08, 20626.08, 0.00);
INSERT INTO public.cheque
VALUES (139, 29, 17, 11182.94, 11182.94, 0.00);
INSERT INTO public.cheque
VALUES (158, 8, 12, 2234.40, 2234.40, 0.00);
INSERT INTO public.cheque
VALUES (194, 27, 47, 6799.49, 5839.60, 0.00);
INSERT INTO public.cheque
VALUES (121, 22, 47, 5501.35, 5501.35, 0.00);
INSERT INTO public.cheque
VALUES (45, 17, 48, 159.84, 159.84, 0.00);
INSERT INTO public.cheque
VALUES (29, 25, 9, 4250.34, 4250.34, 0.00);
INSERT INTO public.cheque
VALUES (191, 27, 34, 4918.78, 4090.59, 0.00);
INSERT INTO public.cheque
VALUES (78, 18, 22, 14693.36, 14693.36, 0.00);
INSERT INTO public.cheque
VALUES (204, 19, 18, 7734.78, 6996.09, 0.00);
INSERT INTO public.cheque
VALUES (12, 12, 5, 1188.30, 1108.03, 0.00);
INSERT INTO public.cheque
VALUES (257, 1, 5, 1805.00, 1805.00, 0.00);
INSERT INTO public.cheque
VALUES (6, 21, 35, 1917.30, 1917.30, 0.00);
INSERT INTO public.cheque
VALUES (149, 24, 45, 25751.25, 25751.25, 0.00);
INSERT INTO public.cheque
VALUES (107, 27, 19, 2025.40, 1842.11, 183.29);
INSERT INTO public.cheque
VALUES (100, 11, 50, 3699.00, 3242.51, 0.00);
INSERT INTO public.cheque
VALUES (38, 19, 41, 17618.11, 17618.11, 0.00);
INSERT INTO public.cheque
VALUES (45, 21, 43, 2107.43, 2107.43, 0.00);
INSERT INTO public.cheque
VALUES (169, 13, 40, 7862.80, 7491.29, 371.51);
INSERT INTO public.cheque
VALUES (71, 6, 4, 548.80, 449.53, 0.00);
INSERT INTO public.cheque
VALUES (134, 29, 21, 11376.33, 9372.96, 2003.37);
INSERT INTO public.cheque
VALUES (11, 2, 30, 22312.50, 22312.50, 0.00);
INSERT INTO public.cheque
VALUES (56, 27, 10, 1294.40, 1294.40, 0.00);
INSERT INTO public.cheque
VALUES (275, 9, 40, 35700.00, 35700.00, 0.00);
INSERT INTO public.cheque
VALUES (64, 10, 26, 13260.00, 12350.59, 0.00);
INSERT INTO public.cheque
VALUES (238, 2, 31, 19584.25, 18597.82, 0.00);
INSERT INTO public.cheque
VALUES (103, 4, 28, 14875.00, 14875.00, 0.00);
INSERT INTO public.cheque
VALUES (163, 18, 27, 24473.07, 20203.36, 4269.71);
INSERT INTO public.cheque
VALUES (47, 26, 39, 23849.67, 23821.36, 0.00);
INSERT INTO public.cheque
VALUES (170, 17, 37, 101.38, 93.86, 0.00);
INSERT INTO public.cheque
VALUES (4, 10, 38, 16461.60, 16461.60, 0.00);
INSERT INTO public.cheque
VALUES (216, 30, 18, 10533.24, 10533.24, 0.00);
INSERT INTO public.cheque
VALUES (245, 9, 16, 14280.00, 14280.00, 0.00);
INSERT INTO public.cheque
VALUES (184, 6, 7, 1457.75, 1457.75, 0.00);
INSERT INTO public.cheque
VALUES (170, 30, 10, 4311.90, 3738.62, 573.28);
INSERT INTO public.cheque
VALUES (4, 7, 45, 12427.65, 11457.95, 969.70);
INSERT INTO public.cheque
VALUES (101, 7, 47, 15281.11, 14409.31, 871.80);
INSERT INTO public.cheque
VALUES (118, 14, 21, 5413.59, 5413.59, 0.00);
INSERT INTO public.cheque
VALUES (105, 27, 27, 2878.20, 2673.91, 204.29);
INSERT INTO public.cheque
VALUES (96, 4, 4, 2125.00, 1845.95, 279.05);
INSERT INTO public.cheque
VALUES (11, 27, 2, 258.88, 250.23, 0.00);
INSERT INTO public.cheque
VALUES (248, 28, 12, 6574.32, 5853.70, 0.00);
INSERT INTO public.cheque
VALUES (59, 4, 28, 14875.00, 14875.00, 0.00);
INSERT INTO public.cheque
VALUES (159, 3, 48, 1948.80, 1852.58, 0.00);
INSERT INTO public.cheque
VALUES (247, 11, 36, 2976.84, 2738.58, 0.00);
INSERT INTO public.cheque
VALUES (219, 19, 26, 11172.46, 9406.17, 0.00);
INSERT INTO public.cheque
VALUES (64, 14, 14, 3609.06, 3609.06, 0.00);
INSERT INTO public.cheque
VALUES (201, 7, 34, 7282.80, 7282.80, 0.00);
INSERT INTO public.cheque
VALUES (278, 17, 7, 23.31, 22.03, 1.28);
INSERT INTO public.cheque
VALUES (151, 12, 4, 950.64, 787.63, 0.00);
INSERT INTO public.cheque
VALUES (209, 12, 17, 4040.22, 3612.81, 0.00);
INSERT INTO public.cheque
VALUES (140, 1, 28, 10108.00, 10108.00, 0.00);
INSERT INTO public.cheque
VALUES (276, 2, 26, 19337.50, 18414.04, 0.00);
INSERT INTO public.cheque
VALUES (182, 13, 24, 3476.16, 3420.37, 0.00);
INSERT INTO public.cheque
VALUES (226, 24, 43, 27501.94, 22609.39, 4892.55);
INSERT INTO public.cheque
VALUES (225, 14, 36, 10372.32, 8674.30, 0.00);
INSERT INTO public.cheque
VALUES (242, 17, 29, 96.57, 96.57, 0.00);
INSERT INTO public.cheque
VALUES (45, 16, 16, 9314.40, 8508.88, 0.00);
INSERT INTO public.cheque
VALUES (63, 11, 31, 1888.83, 1609.49, 0.00);
INSERT INTO public.cheque
VALUES (234, 24, 18, 10300.50, 8342.99, 1957.51);
INSERT INTO public.cheque
VALUES (192, 4, 15, 7968.75, 7050.90, 917.85);
INSERT INTO public.cheque
VALUES (104, 21, 31, 1519.31, 1478.81, 0.00);
INSERT INTO public.cheque
VALUES (175, 13, 32, 5628.16, 5389.58, 238.58);
INSERT INTO public.cheque
VALUES (103, 6, 20, 4165.00, 4165.00, 0.00);
INSERT INTO public.cheque
VALUES (128, 21, 7, 383.46, 383.46, 0.00);
INSERT INTO public.cheque
VALUES (208, 4, 49, 22111.25, 22111.25, 0.00);
INSERT INTO public.cheque
VALUES (223, 4, 27, 9450.00, 9450.00, 0.00);
INSERT INTO public.cheque
VALUES (56, 19, 33, 14180.43, 14180.43, 0.00);
INSERT INTO public.cheque
VALUES (173, 13, 13, 1882.92, 1882.92, 0.00);
INSERT INTO public.cheque
VALUES (148, 14, 50, 12889.50, 12889.50, 0.00);
INSERT INTO public.cheque
VALUES (66, 7, 10, 3251.30, 2881.82, 0.00);
INSERT INTO public.cheque
VALUES (217, 2, 49, 24010.00, 20990.25, 0.00);
INSERT INTO public.cheque
VALUES (202, 18, 7, 4675.16, 4675.16, 0.00);
INSERT INTO public.cheque
VALUES (129, 13, 42, 7386.96, 6702.92, 0.00);
INSERT INTO public.cheque
VALUES (221, 29, 18, 13233.78, 10750.13, 0.00);
INSERT INTO public.cheque
VALUES (105, 28, 30, 13535.40, 11604.15, 0.00);
INSERT INTO public.cheque
VALUES (91, 11, 12, 887.76, 777.61, 110.15);
INSERT INTO public.cheque
VALUES (203, 16, 24, 11506.08, 11506.08, 0.00);
INSERT INTO public.cheque
VALUES (211, 24, 40, 22890.00, 20806.11, 0.00);
INSERT INTO public.cheque
VALUES (112, 13, 33, 5804.04, 5804.04, 0.00);
INSERT INTO public.cheque
VALUES (163, 27, 39, 5642.13, 5015.73, 0.00);
INSERT INTO public.cheque
VALUES (203, 14, 3, 636.90, 636.90, 0.00);
INSERT INTO public.cheque
VALUES (5, 15, 12, 2060.52, 2060.52, 0.00);
INSERT INTO public.cheque
VALUES (269, 22, 22, 2878.04, 2690.08, 0.00);
INSERT INTO public.cheque
VALUES (276, 7, 50, 16256.50, 16016.62, 239.88);
INSERT INTO public.cheque
VALUES (103, 24, 11, 6294.75, 6294.75, 0.00);
INSERT INTO public.cheque
VALUES (233, 9, 24, 14112.00, 13316.11, 795.89);
INSERT INTO public.cheque
VALUES (176, 28, 10, 5478.60, 5478.60, 0.00);
INSERT INTO public.cheque
VALUES (243, 20, 36, 7143.12, 6700.17, 0.00);
INSERT INTO public.cheque
VALUES (48, 2, 45, 33468.75, 33468.75, 0.00);
INSERT INTO public.cheque
VALUES (166, 26, 37, 27475.46, 24161.74, 3313.72);
INSERT INTO public.cheque
VALUES (45, 28, 8, 4382.88, 4382.88, 0.00);
INSERT INTO public.cheque
VALUES (189, 10, 48, 16128.00, 16128.00, 0.00);
INSERT INTO public.cheque
VALUES (84, 5, 48, 9078.24, 8965.53, 0.00);
INSERT INTO public.cheque
VALUES (93, 10, 42, 21420.00, 17945.31, 0.00);
INSERT INTO public.cheque
VALUES (28, 19, 1, 480.26, 413.19, 0.00);
INSERT INTO public.cheque
VALUES (210, 24, 32, 20466.56, 20466.56, 0.00);
INSERT INTO public.cheque
VALUES (256, 22, 34, 3979.70, 3347.78, 0.00);
INSERT INTO public.cheque
VALUES (62, 4, 9, 3150.00, 2758.98, 0.00);
INSERT INTO public.cheque
VALUES (99, 11, 42, 3472.98, 3038.08, 434.90);
INSERT INTO public.cheque
VALUES (133, 1, 40, 17000.00, 13992.02, 0.00);
INSERT INTO public.cheque
VALUES (93, 10, 47, 23970.00, 23970.00, 0.00);
INSERT INTO public.cheque
VALUES (42, 9, 41, 36592.50, 36592.50, 0.00);
INSERT INTO public.cheque
VALUES (123, 11, 31, 2293.38, 2293.33, 0.00);
INSERT INTO public.cheque
VALUES (32, 2, 19, 14131.25, 14131.25, 0.00);
INSERT INTO public.cheque
VALUES (63, 7, 11, 2356.20, 2100.73, 0.00);
INSERT INTO public.cheque
VALUES (115, 6, 32, 4390.40, 4390.40, 0.00);
INSERT INTO public.cheque
VALUES (111, 6, 48, 9996.00, 8344.69, 0.00);
INSERT INTO public.cheque
VALUES (108, 16, 19, 12362.16, 12362.16, 0.00);
INSERT INTO public.cheque
VALUES (36, 8, 24, 6783.12, 6688.44, 94.68);
INSERT INTO public.cheque
VALUES (6, 13, 19, 3734.83, 3154.47, 0.00);
INSERT INTO public.cheque
VALUES (189, 23, 29, 13414.24, 13414.24, 0.00);
INSERT INTO public.cheque
VALUES (245, 9, 19, 16957.50, 16957.50, 0.00);
INSERT INTO public.cheque
VALUES (78, 3, 35, 1421.00, 1146.34, 274.66);
INSERT INTO public.cheque
VALUES (212, 21, 40, 1614.40, 1410.72, 203.68);
INSERT INTO public.cheque
VALUES (14, 13, 26, 5110.82, 5045.23, 0.00);
INSERT INTO public.cheque
VALUES (22, 18, 44, 39882.04, 39882.04, 0.00);
INSERT INTO public.cheque
VALUES (182, 21, 8, 322.88, 322.88, 0.00);
INSERT INTO public.cheque
VALUES (223, 25, 47, 16355.06, 14460.00, 0.00);
INSERT INTO public.cheque
VALUES (146, 5, 14, 2647.82, 2192.02, 0.00);
INSERT INTO public.cheque
VALUES (180, 2, 1, 631.75, 511.06, 120.69);
INSERT INTO public.cheque
VALUES (223, 5, 32, 3987.20, 3192.72, 794.48);
INSERT INTO public.cheque
VALUES (222, 12, 2, 391.44, 313.41, 78.03);
INSERT INTO public.cheque
VALUES (151, 27, 34, 4400.96, 3629.86, 0.00);
INSERT INTO public.cheque
VALUES (250, 8, 27, 5027.40, 4395.40, 0.00);
INSERT INTO public.cheque
VALUES (104, 7, 8, 2601.04, 2142.20, 0.00);
INSERT INTO public.cheque
VALUES (162, 2, 44, 32725.00, 32725.00, 0.00);
INSERT INTO public.cheque
VALUES (71, 8, 10, 1862.00, 1833.07, 0.00);
INSERT INTO public.cheque
VALUES (41, 26, 8, 6639.52, 6639.52, 0.00);
INSERT INTO public.cheque
VALUES (75, 26, 3, 2489.82, 2489.82, 0.00);
INSERT INTO public.cheque
VALUES (217, 19, 29, 10262.52, 10034.56, 0.00);
INSERT INTO public.cheque
VALUES (182, 10, 48, 16128.00, 14790.19, 1337.81);
INSERT INTO public.cheque
VALUES (188, 26, 46, 34158.68, 28956.96, 0.00);
INSERT INTO public.cheque
VALUES (109, 8, 26, 4841.20, 3897.33, 0.00);
INSERT INTO public.cheque
VALUES (124, 25, 23, 9718.65, 9718.65, 0.00);
INSERT INTO public.cheque
VALUES (55, 23, 33, 18535.44, 15628.61, 2906.83);
INSERT INTO public.cheque
VALUES (117, 15, 12, 2796.48, 2796.48, 0.00);
INSERT INTO public.cheque
VALUES (178, 27, 32, 4629.44, 4629.44, 0.00);
INSERT INTO public.cheque
VALUES (124, 8, 49, 13848.87, 11676.95, 0.00);
INSERT INTO public.cheque
VALUES (143, 16, 17, 9896.55, 9649.37, 0.00);
INSERT INTO public.cheque
VALUES (93, 26, 31, 23019.98, 23019.98, 0.00);
INSERT INTO public.cheque
VALUES (242, 20, 5, 1204.70, 1204.70, 0.00);
INSERT INTO public.cheque
VALUES (199, 26, 22, 18258.68, 18258.68, 0.00);
INSERT INTO public.cheque
VALUES (278, 26, 33, 24505.14, 19807.58, 0.00);
INSERT INTO public.cheque
VALUES (254, 8, 32, 9044.16, 8310.08, 0.00);
INSERT INTO public.cheque
VALUES (33, 5, 21, 2616.60, 2616.60, 0.00);
INSERT INTO public.cheque
VALUES (180, 19, 8, 3842.08, 3842.08, 0.00);
INSERT INTO public.cheque
VALUES (170, 24, 19, 8954.13, 7969.18, 0.00);
INSERT INTO public.cheque
VALUES (192, 22, 18, 2106.90, 1983.28, 0.00);
INSERT INTO public.cheque
VALUES (16, 3, 11, 446.60, 392.21, 54.39);
INSERT INTO public.cheque
VALUES (237, 18, 28, 22708.00, 20858.18, 0.00);
INSERT INTO public.cheque
VALUES (220, 24, 46, 26323.50, 26323.50, 0.00);
INSERT INTO public.cheque
VALUES (262, 7, 21, 5799.57, 5799.57, 0.00);
INSERT INTO public.cheque
VALUES (64, 8, 38, 10739.94, 10453.06, 0.00);
INSERT INTO public.cheque
VALUES (92, 13, 29, 4200.36, 4200.36, 0.00);
INSERT INTO public.cheque
VALUES (170, 14, 42, 8916.60, 8916.60, 0.00);
INSERT INTO public.cheque
VALUES (120, 28, 33, 18079.38, 18079.38, 0.00);
INSERT INTO public.cheque
VALUES (68, 24, 33, 18884.25, 18884.25, 0.00);
INSERT INTO public.cheque
VALUES (118, 17, 47, 156.51, 154.73, 1.78);
INSERT INTO public.cheque
VALUES (112, 12, 5, 1188.30, 1156.99, 0.00);
INSERT INTO public.cheque
VALUES (236, 18, 15, 12165.00, 11648.14, 0.00);
INSERT INTO public.cheque
VALUES (146, 7, 20, 6502.60, 5869.50, 633.10);
INSERT INTO public.cheque
VALUES (241, 23, 8, 3700.48, 3562.65, 137.83);
INSERT INTO public.cheque
VALUES (87, 8, 45, 12718.35, 12718.35, 0.00);
INSERT INTO public.cheque
VALUES (5, 30, 40, 17247.60, 17247.60, 0.00);
INSERT INTO public.cheque
VALUES (70, 18, 14, 12689.74, 12207.59, 482.15);
INSERT INTO public.cheque
VALUES (92, 10, 37, 12432.00, 12432.00, 0.00);
INSERT INTO public.cheque
VALUES (274, 25, 11, 4648.05, 4604.13, 0.00);
INSERT INTO public.cheque
VALUES (16, 28, 42, 18949.56, 18516.94, 432.62);
INSERT INTO public.cheque
VALUES (81, 5, 45, 8510.85, 6990.67, 1520.18);
INSERT INTO public.cheque
VALUES (113, 6, 47, 8313.83, 7656.20, 0.00);
INSERT INTO public.cheque
VALUES (144, 25, 8, 2783.84, 2320.49, 0.00);
INSERT INTO public.cheque
VALUES (29, 24, 5, 3197.90, 3197.90, 0.00);
INSERT INTO public.cheque
VALUES (12, 2, 14, 10412.50, 10412.50, 0.00);
INSERT INTO public.cheque
VALUES (123, 11, 32, 2367.36, 1984.47, 382.89);
INSERT INTO public.cheque
VALUES (267, 19, 20, 7077.60, 7077.60, 0.00);
INSERT INTO public.cheque
VALUES (49, 17, 45, 123.30, 120.38, 0.00);
INSERT INTO public.cheque
VALUES (62, 18, 34, 22707.92, 22707.92, 0.00);
INSERT INTO public.cheque
VALUES (65, 11, 47, 3886.43, 3217.48, 0.00);
INSERT INTO public.cheque
VALUES (91, 24, 10, 5722.50, 4934.50, 788.00);
INSERT INTO public.cheque
VALUES (272, 21, 37, 1813.37, 1813.37, 0.00);
INSERT INTO public.cheque
VALUES (122, 20, 40, 7936.80, 6737.91, 0.00);
INSERT INTO public.cheque
VALUES (36, 18, 9, 7299.00, 7299.00, 0.00);
INSERT INTO public.cheque
VALUES (203, 18, 14, 9350.32, 8355.50, 0.00);
INSERT INTO public.cheque
VALUES (204, 20, 25, 6023.50, 5594.10, 0.00);
INSERT INTO public.cheque
VALUES (151, 15, 38, 7923.38, 7923.38, 0.00);
INSERT INTO public.cheque
VALUES (78, 5, 8, 996.80, 901.17, 0.00);
INSERT INTO public.cheque
VALUES (240, 7, 48, 15606.24, 15606.24, 0.00);
INSERT INTO public.cheque
VALUES (248, 17, 13, 43.29, 41.93, 0.00);
INSERT INTO public.cheque
VALUES (146, 4, 25, 13281.25, 13281.25, 0.00);
INSERT INTO public.cheque
VALUES (91, 10, 13, 6630.00, 6630.00, 0.00);
INSERT INTO public.cheque
VALUES (219, 19, 29, 12461.59, 12461.59, 0.00);
INSERT INTO public.cheque
VALUES (71, 7, 12, 2570.40, 2570.40, 0.00);
INSERT INTO public.cheque
VALUES (63, 7, 9, 1927.80, 1927.80, 0.00);
INSERT INTO public.cheque
VALUES (156, 3, 18, 1109.34, 928.21, 181.13);
INSERT INTO public.cheque
VALUES (167, 21, 13, 637.13, 637.13, 0.00);
INSERT INTO public.cheque
VALUES (284, 8, 6, 1117.20, 1117.20, 0.00);
INSERT INTO public.cheque
VALUES (91, 23, 23, 12918.64, 12918.64, 0.00);
INSERT INTO public.cheque
VALUES (167, 10, 35, 17850.00, 16867.76, 0.00);
INSERT INTO public.cheque
VALUES (60, 8, 37, 6889.40, 6799.33, 0.00);
INSERT INTO public.cheque
VALUES (108, 17, 42, 156.24, 151.39, 0.00);
INSERT INTO public.cheque
VALUES (127, 21, 6, 294.06, 294.06, 0.00);
INSERT INTO public.cheque
VALUES (64, 29, 5, 3289.10, 2851.32, 437.78);
INSERT INTO public.cheque
VALUES (11, 28, 29, 15887.94, 15887.94, 0.00);
INSERT INTO public.cheque
VALUES (185, 21, 4, 161.44, 161.44, 0.00);
INSERT INTO public.cheque
VALUES (75, 10, 46, 19927.20, 19600.71, 326.49);
INSERT INTO public.cheque
VALUES (134, 24, 6, 2827.62, 2827.62, 0.00);
INSERT INTO public.cheque
VALUES (52, 23, 12, 7533.12, 7145.46, 0.00);
INSERT INTO public.cheque
VALUES (56, 3, 27, 1664.01, 1664.01, 0.00);
INSERT INTO public.cheque
VALUES (265, 14, 38, 10948.56, 9206.77, 0.00);
INSERT INTO public.cheque
VALUES (148, 14, 48, 12373.92, 12373.92, 0.00);
INSERT INTO public.cheque
VALUES (45, 11, 50, 3699.00, 3496.08, 0.00);
INSERT INTO public.cheque
VALUES (80, 27, 31, 4012.64, 3363.04, 0.00);
INSERT INTO public.cheque
VALUES (98, 12, 16, 3131.52, 2764.86, 0.00);
INSERT INTO public.cheque
VALUES (73, 21, 39, 1911.39, 1759.57, 0.00);
INSERT INTO public.cheque
VALUES (21, 18, 7, 5677.00, 5677.00, 0.00);
INSERT INTO public.cheque
VALUES (15, 20, 32, 7710.08, 7710.08, 0.00);
INSERT INTO public.cheque
VALUES (143, 2, 25, 18593.75, 18593.75, 0.00);
INSERT INTO public.cheque
VALUES (30, 1, 12, 5100.00, 5100.00, 0.00);
INSERT INTO public.cheque
VALUES (201, 24, 25, 11781.75, 10965.38, 0.00);
INSERT INTO public.cheque
VALUES (46, 25, 47, 19859.85, 18246.96, 1612.89);
INSERT INTO public.cheque
VALUES (278, 23, 14, 7863.52, 7173.40, 0.00);
INSERT INTO public.cheque
VALUES (111, 15, 24, 5004.24, 5004.24, 0.00);
INSERT INTO public.cheque
VALUES (244, 9, 40, 30324.00, 30324.00, 0.00);
INSERT INTO public.cheque
VALUES (247, 12, 8, 2124.96, 1702.08, 0.00);
INSERT INTO public.cheque
VALUES (116, 2, 47, 29692.25, 29168.47, 0.00);
INSERT INTO public.cheque
VALUES (217, 15, 40, 6868.40, 5624.33, 1244.07);
INSERT INTO public.cheque
VALUES (282, 5, 4, 498.40, 498.40, 0.00);
INSERT INTO public.cheque
VALUES (48, 7, 16, 5202.08, 5202.08, 0.00);
INSERT INTO public.cheque
VALUES (169, 1, 15, 5415.00, 5415.00, 0.00);
INSERT INTO public.cheque
VALUES (211, 28, 24, 13148.64, 13032.59, 0.00);
INSERT INTO public.cheque
VALUES (105, 21, 42, 1695.12, 1509.40, 185.72);
INSERT INTO public.cheque
VALUES (265, 15, 41, 9554.64, 9554.64, 0.00);
INSERT INTO public.cheque
VALUES (53, 11, 46, 2802.78, 2571.84, 0.00);
INSERT INTO public.cheque
VALUES (270, 3, 18, 730.80, 708.53, 0.00);
INSERT INTO public.cheque
VALUES (262, 15, 14, 3262.56, 2745.48, 517.08);
INSERT INTO public.cheque
VALUES (164, 24, 22, 12589.50, 12195.13, 394.37);
INSERT INTO public.cheque
VALUES (30, 25, 3, 1267.65, 1267.65, 0.00);
INSERT INTO public.cheque
VALUES (124, 22, 17, 1989.85, 1989.85, 0.00);
INSERT INTO public.cheque
VALUES (205, 23, 32, 20088.32, 20088.32, 0.00);
INSERT INTO public.cheque
VALUES (142, 16, 31, 14862.02, 14862.02, 0.00);
INSERT INTO public.cheque
VALUES (153, 25, 45, 19014.75, 19014.75, 0.00);
INSERT INTO public.cheque
VALUES (72, 15, 43, 10020.72, 10020.72, 0.00);
INSERT INTO public.cheque
VALUES (77, 28, 44, 24105.84, 19290.47, 4815.37);
INSERT INTO public.cheque
VALUES (74, 10, 20, 10200.00, 10200.00, 0.00);
INSERT INTO public.cheque
VALUES (50, 23, 50, 23128.00, 23128.00, 0.00);
INSERT INTO public.cheque
VALUES (111, 3, 28, 1725.64, 1531.44, 0.00);
INSERT INTO public.cheque
VALUES (198, 14, 39, 11236.68, 11236.68, 0.00);
INSERT INTO public.cheque
VALUES (228, 22, 26, 3043.30, 2858.93, 184.37);
INSERT INTO public.cheque
VALUES (188, 29, 9, 5920.38, 5040.17, 0.00);
INSERT INTO public.cheque
VALUES (83, 15, 37, 8622.48, 8622.48, 0.00);
INSERT INTO public.cheque
VALUES (38, 4, 26, 13812.50, 12987.40, 825.10);
INSERT INTO public.cheque
VALUES (228, 2, 12, 8925.00, 7597.79, 0.00);
INSERT INTO public.cheque
VALUES (193, 11, 9, 665.82, 576.69, 0.00);
INSERT INTO public.cheque
VALUES (35, 11, 34, 2811.46, 2811.46, 0.00);
INSERT INTO public.cheque
VALUES (155, 7, 23, 7477.99, 7477.99, 0.00);
INSERT INTO public.cheque
VALUES (25, 14, 12, 2547.60, 2065.89, 0.00);
INSERT INTO public.cheque
VALUES (55, 17, 12, 39.96, 39.96, 0.00);
INSERT INTO public.cheque
VALUES (73, 6, 7, 1457.75, 1457.75, 0.00);
INSERT INTO public.cheque
VALUES (129, 22, 21, 2458.05, 2383.69, 0.00);
INSERT INTO public.cheque
VALUES (146, 4, 23, 12218.75, 12218.75, 0.00);
INSERT INTO public.cheque
VALUES (97, 5, 23, 2865.80, 2747.35, 0.00);
INSERT INTO public.cheque
VALUES (151, 15, 36, 7506.36, 6163.08, 1343.28);
INSERT INTO public.cheque
VALUES (14, 23, 24, 15066.24, 13433.55, 0.00);
INSERT INTO public.cheque
VALUES (149, 15, 22, 4587.22, 4587.22, 0.00);
INSERT INTO public.cheque
VALUES (38, 15, 5, 1042.55, 1042.55, 0.00);
INSERT INTO public.cheque
VALUES (88, 21, 42, 1695.12, 1657.66, 0.00);
INSERT INTO public.cheque
VALUES (278, 7, 35, 11379.55, 9890.17, 0.00);
INSERT INTO public.cheque
VALUES (211, 21, 27, 1323.27, 1323.27, 0.00);
INSERT INTO public.cheque
VALUES (110, 13, 47, 8266.36, 8266.36, 0.00);
INSERT INTO public.cheque
VALUES (260, 6, 8, 1097.60, 1076.75, 0.00);
INSERT INTO public.cheque
VALUES (285, 16, 13, 7567.95, 6387.75, 0.00);
INSERT INTO public.cheque
VALUES (56, 3, 31, 1910.53, 1655.65, 0.00);
INSERT INTO public.cheque
VALUES (22, 19, 27, 12967.02, 10634.74, 0.00);
INSERT INTO public.cheque
VALUES (33, 21, 11, 443.96, 443.96, 0.00);
INSERT INTO public.cheque
VALUES (206, 25, 10, 4722.60, 4722.60, 0.00);
INSERT INTO public.cheque
VALUES (90, 11, 35, 2589.30, 2589.30, 0.00);
INSERT INTO public.cheque
VALUES (119, 28, 21, 11505.06, 10320.29, 0.00);
INSERT INTO public.cheque
VALUES (10, 21, 16, 876.48, 876.48, 0.00);
INSERT INTO public.cheque
VALUES (183, 7, 36, 11704.68, 11704.68, 0.00);
INSERT INTO public.cheque
VALUES (34, 12, 18, 4277.88, 4068.46, 209.42);
INSERT INTO public.cheque
VALUES (96, 4, 23, 12218.75, 11192.10, 0.00);
INSERT INTO public.cheque
VALUES (200, 24, 12, 7674.96, 7674.96, 0.00);
INSERT INTO public.cheque
VALUES (111, 29, 46, 30259.72, 28155.64, 0.00);
INSERT INTO public.cheque
VALUES (36, 6, 46, 9579.50, 8212.15, 0.00);
INSERT INTO public.cheque
VALUES (115, 9, 38, 22344.00, 22344.00, 0.00);
INSERT INTO public.cheque
VALUES (72, 26, 12, 9959.28, 9959.28, 0.00);
INSERT INTO public.cheque
VALUES (210, 25, 50, 23613.00, 23448.57, 164.43);
INSERT INTO public.cheque
VALUES (160, 17, 29, 96.57, 96.57, 0.00);
INSERT INTO public.cheque
VALUES (44, 10, 7, 3570.00, 3516.96, 0.00);
INSERT INTO public.cheque
VALUES (218, 3, 35, 2157.05, 2157.05, 0.00);
INSERT INTO public.cheque
VALUES (10, 6, 4, 707.56, 707.56, 0.00);
INSERT INTO public.cheque
VALUES (256, 13, 8, 1407.04, 1161.00, 0.00);
INSERT INTO public.cheque
VALUES (75, 23, 42, 26365.92, 22415.58, 0.00);
INSERT INTO public.cheque
VALUES (139, 11, 6, 443.88, 443.88, 0.00);
INSERT INTO public.cheque
VALUES (140, 6, 2, 353.78, 353.03, 0.00);
INSERT INTO public.cheque
VALUES (176, 8, 18, 5087.34, 4904.91, 0.00);
INSERT INTO public.cheque
VALUES (199, 12, 35, 9296.70, 7961.33, 0.00);
INSERT INTO public.cheque
VALUES (119, 8, 12, 3391.56, 3391.56, 0.00);
INSERT INTO public.cheque
VALUES (236, 13, 3, 527.64, 516.27, 0.00);
INSERT INTO public.cheque
VALUES (163, 8, 25, 6001.75, 6001.75, 0.00);
INSERT INTO public.cheque
VALUES (175, 4, 48, 25500.00, 25500.00, 0.00);
INSERT INTO public.cheque
VALUES (278, 6, 3, 624.75, 542.81, 0.00);
INSERT INTO public.cheque
VALUES (247, 15, 43, 10020.72, 8709.38, 1311.34);
INSERT INTO public.cheque
VALUES (233, 20, 43, 8532.06, 7115.31, 1416.75);
INSERT INTO public.cheque
VALUES (36, 5, 50, 9456.50, 7868.52, 0.00);
INSERT INTO public.cheque
VALUES (43, 24, 31, 19826.98, 19826.98, 0.00);
INSERT INTO public.cheque
VALUES (124, 25, 7, 2957.85, 2957.85, 0.00);
INSERT INTO public.cheque
VALUES (196, 21, 12, 484.32, 419.10, 0.00);
INSERT INTO public.cheque
VALUES (226, 20, 37, 9963.73, 9963.73, 0.00);
INSERT INTO public.cheque
VALUES (194, 12, 32, 8499.84, 8499.84, 0.00);
INSERT INTO public.cheque
VALUES (96, 30, 5, 2617.90, 2431.53, 186.37);
INSERT INTO public.cheque
VALUES (196, 9, 11, 6468.00, 6468.00, 0.00);
INSERT INTO public.cheque
VALUES (277, 18, 21, 19034.61, 15692.16, 0.00);
INSERT INTO public.cheque
VALUES (79, 17, 2, 5.48, 5.48, 0.00);
INSERT INTO public.cheque
VALUES (236, 21, 8, 392.08, 392.08, 0.00);
INSERT INTO public.cheque
VALUES (285, 20, 22, 5300.68, 4765.45, 0.00);
INSERT INTO public.cheque
VALUES (203, 3, 39, 1583.40, 1572.96, 0.00);
INSERT INTO public.cheque
VALUES (81, 28, 18, 9861.48, 7953.56, 0.00);
INSERT INTO public.cheque
VALUES (199, 19, 6, 2881.56, 2881.56, 0.00);
INSERT INTO public.cheque
VALUES (150, 14, 34, 7218.20, 7045.44, 172.76);
INSERT INTO public.cheque
VALUES (282, 19, 36, 12739.68, 12569.79, 0.00);
INSERT INTO public.cheque
VALUES (63, 13, 4, 579.36, 579.36, 0.00);
INSERT INTO public.cheque
VALUES (179, 10, 16, 8160.00, 7631.25, 0.00);
INSERT INTO public.cheque
VALUES (265, 11, 38, 3142.22, 3142.22, 0.00);
INSERT INTO public.cheque
VALUES (192, 9, 29, 25882.50, 25882.50, 0.00);
INSERT INTO public.cheque
VALUES (281, 19, 40, 14155.20, 11707.09, 0.00);
INSERT INTO public.cheque
VALUES (214, 21, 14, 686.14, 663.85, 0.00);
INSERT INTO public.cheque
VALUES (165, 7, 8, 1713.60, 1713.60, 0.00);
INSERT INTO public.cheque
VALUES (101, 15, 39, 8131.89, 7618.23, 0.00);
INSERT INTO public.cheque
VALUES (99, 24, 16, 10233.28, 10233.28, 0.00);
INSERT INTO public.cheque
VALUES (272, 2, 8, 5950.00, 5950.00, 0.00);
INSERT INTO public.cheque
VALUES (136, 16, 17, 9896.55, 9456.11, 0.00);
INSERT INTO public.cheque
VALUES (17, 8, 40, 11305.20, 10715.13, 0.00);
INSERT INTO public.cheque
VALUES (79, 22, 32, 3084.48, 3084.48, 0.00);
INSERT INTO public.cheque
VALUES (51, 26, 27, 16511.31, 15716.81, 0.00);
INSERT INTO public.cheque
VALUES (199, 10, 50, 21660.00, 21338.27, 321.73);
INSERT INTO public.cheque
VALUES (7, 7, 26, 8453.38, 8453.38, 0.00);
INSERT INTO public.cheque
VALUES (208, 22, 35, 4578.70, 4578.70, 0.00);
INSERT INTO public.cheque
VALUES (47, 20, 18, 3571.56, 3571.56, 0.00);
INSERT INTO public.cheque
VALUES (118, 13, 49, 8618.12, 8015.22, 602.90);
INSERT INTO public.cheque
VALUES (7, 27, 26, 3365.44, 2782.78, 0.00);
INSERT INTO public.cheque
VALUES (80, 30, 18, 9424.44, 9424.44, 0.00);
INSERT INTO public.cheque
VALUES (280, 28, 37, 22655.47, 22655.47, 0.00);
INSERT INTO public.cheque
VALUES (121, 27, 17, 2200.48, 1939.45, 0.00);
INSERT INTO public.cheque
VALUES (116, 5, 28, 4498.20, 4498.20, 0.00);
INSERT INTO public.cheque
VALUES (112, 17, 41, 136.53, 136.53, 0.00);
INSERT INTO public.cheque
VALUES (166, 8, 10, 2826.30, 2826.30, 0.00);
INSERT INTO public.cheque
VALUES (142, 20, 16, 3174.72, 2865.94, 0.00);
INSERT INTO public.cheque
VALUES (137, 26, 10, 6115.30, 6115.30, 0.00);
INSERT INTO public.cheque
VALUES (228, 10, 43, 21930.00, 17802.31, 0.00);
INSERT INTO public.cheque
VALUES (82, 7, 21, 6827.73, 5514.55, 1313.18);
INSERT INTO public.cheque
VALUES (95, 19, 41, 17618.11, 15468.19, 0.00);
INSERT INTO public.cheque
VALUES (151, 19, 12, 5156.52, 5156.52, 0.00);
INSERT INTO public.cheque
VALUES (255, 2, 23, 17106.25, 17106.25, 0.00);
INSERT INTO public.cheque
VALUES (68, 17, 2, 6.66, 5.47, 0.00);
INSERT INTO public.cheque
VALUES (19, 4, 5, 2256.25, 1830.71, 425.54);
INSERT INTO public.cheque
VALUES (94, 6, 30, 6247.50, 6247.50, 0.00);
INSERT INTO public.cheque
VALUES (75, 5, 13, 2088.45, 2005.92, 0.00);
INSERT INTO public.cheque
VALUES (279, 9, 29, 25882.50, 25882.50, 0.00);
INSERT INTO public.cheque
VALUES (230, 29, 29, 19076.78, 18651.56, 0.00);
INSERT INTO public.cheque
VALUES (277, 4, 2, 902.50, 728.58, 173.92);
INSERT INTO public.cheque
VALUES (122, 12, 16, 3131.52, 3131.52, 0.00);
INSERT INTO public.cheque
VALUES (37, 16, 41, 26676.24, 24444.01, 2232.23);
INSERT INTO public.cheque
VALUES (36, 19, 25, 10742.75, 10742.75, 0.00);
INSERT INTO public.cheque
VALUES (204, 20, 37, 8914.78, 7513.88, 0.00);
INSERT INTO public.cheque
VALUES (6, 9, 44, 33356.40, 33356.40, 0.00);
INSERT INTO public.cheque
VALUES (213, 3, 23, 1204.05, 1204.05, 0.00);
INSERT INTO public.cheque
VALUES (62, 17, 25, 68.50, 68.50, 0.00);
INSERT INTO public.cheque
VALUES (281, 24, 50, 23563.50, 23563.50, 0.00);
INSERT INTO public.cheque
VALUES (159, 29, 21, 11376.33, 11376.33, 0.00);
INSERT INTO public.cheque
VALUES (80, 13, 49, 8618.12, 8618.12, 0.00);
INSERT INTO public.cheque
VALUES (131, 4, 25, 13281.25, 11846.09, 0.00);
INSERT INTO public.cheque
VALUES (247, 7, 29, 8008.93, 7343.03, 0.00);
INSERT INTO public.cheque
VALUES (145, 11, 49, 3625.02, 3625.02, 0.00);
INSERT INTO public.cheque
VALUES (54, 29, 25, 16445.50, 16445.50, 0.00);
INSERT INTO public.cheque
VALUES (76, 29, 32, 21050.24, 19154.69, 1895.55);
INSERT INTO public.cheque
VALUES (124, 27, 10, 1294.40, 1294.40, 0.00);
INSERT INTO public.cheque
VALUES (127, 27, 8, 1035.52, 949.71, 85.81);
INSERT INTO public.cheque
VALUES (166, 17, 2, 6.66, 6.66, 0.00);
INSERT INTO public.cheque
VALUES (143, 12, 48, 11407.68, 11407.68, 0.00);
INSERT INTO public.cheque
VALUES (175, 19, 45, 19336.95, 17071.03, 0.00);
INSERT INTO public.cheque
VALUES (109, 8, 41, 7634.20, 7175.54, 0.00);
INSERT INTO public.cheque
VALUES (178, 23, 34, 21343.84, 21343.84, 0.00);
INSERT INTO public.cheque
VALUES (42, 23, 28, 15727.04, 13305.15, 0.00);
INSERT INTO public.cheque
VALUES (39, 1, 46, 19550.00, 19550.00, 0.00);
INSERT INTO public.cheque
VALUES (154, 4, 33, 17531.25, 17291.37, 0.00);
INSERT INTO public.cheque
VALUES (119, 24, 35, 20028.75, 16720.13, 0.00);
INSERT INTO public.cheque
VALUES (271, 17, 14, 46.62, 46.62, 0.00);
INSERT INTO public.cheque
VALUES (180, 6, 47, 8313.83, 7730.96, 582.87);
INSERT INTO public.cheque
VALUES (43, 17, 38, 141.36, 141.36, 0.00);
INSERT INTO public.cheque
VALUES (31, 12, 36, 8555.76, 8555.76, 0.00);
INSERT INTO public.cheque
VALUES (220, 17, 32, 106.56, 106.56, 0.00);
INSERT INTO public.cheque
VALUES (273, 22, 48, 4626.72, 4599.65, 0.00);
INSERT INTO public.cheque
VALUES (18, 13, 31, 5452.28, 5452.28, 0.00);
INSERT INTO public.cheque
VALUES (121, 21, 28, 1372.28, 1132.34, 0.00);
INSERT INTO public.cheque
VALUES (62, 7, 28, 5997.60, 5977.66, 0.00);
INSERT INTO public.cheque
VALUES (110, 30, 47, 24608.26, 24608.26, 0.00);
INSERT INTO public.cheque
VALUES (125, 14, 45, 9553.50, 9553.50, 0.00);
INSERT INTO public.cheque
VALUES (92, 23, 49, 22665.44, 21285.93, 1379.51);
INSERT INTO public.cheque
VALUES (160, 28, 33, 18079.38, 17761.13, 318.25);
INSERT INTO public.cheque
VALUES (77, 22, 42, 4916.10, 4350.49, 0.00);
INSERT INTO public.cheque
VALUES (235, 7, 46, 14955.98, 13859.21, 0.00);
INSERT INTO public.cheque
VALUES (75, 29, 12, 8822.52, 8822.52, 0.00);
INSERT INTO public.cheque
VALUES (236, 7, 45, 14630.85, 13808.54, 0.00);
INSERT INTO public.cheque
VALUES (74, 9, 14, 12495.00, 12495.00, 0.00);
INSERT INTO public.cheque
VALUES (87, 24, 11, 6294.75, 5310.98, 983.77);
INSERT INTO public.cheque
VALUES (53, 24, 3, 1413.81, 1347.16, 66.65);
INSERT INTO public.cheque
VALUES (131, 2, 26, 19337.50, 19337.50, 0.00);
INSERT INTO public.cheque
VALUES (169, 27, 11, 1591.37, 1591.37, 0.00);
INSERT INTO public.cheque
VALUES (108, 16, 43, 27977.52, 25978.15, 0.00);
INSERT INTO public.cheque
VALUES (53, 26, 16, 9784.48, 9774.51, 0.00);
INSERT INTO public.cheque
VALUES (158, 28, 15, 6767.70, 5802.10, 965.60);
INSERT INTO public.cheque
VALUES (183, 16, 48, 27943.20, 27943.20, 0.00);
INSERT INTO public.cheque
VALUES (162, 3, 38, 2341.94, 2341.94, 0.00);
INSERT INTO public.cheque
VALUES (79, 26, 42, 25684.26, 25279.53, 0.00);
INSERT INTO public.cheque
VALUES (56, 5, 41, 7754.33, 7754.33, 0.00);
INSERT INTO public.cheque
VALUES (256, 3, 14, 862.82, 728.21, 134.61);
INSERT INTO public.cheque
VALUES (171, 10, 42, 21420.00, 19693.40, 0.00);
INSERT INTO public.cheque
VALUES (144, 3, 29, 1177.40, 1082.18, 0.00);
INSERT INTO public.cheque
VALUES (84, 12, 25, 5941.50, 5641.36, 0.00);
INSERT INTO public.cheque
VALUES (276, 29, 27, 17761.14, 17761.14, 0.00);
INSERT INTO public.cheque
VALUES (223, 3, 47, 1908.20, 1908.20, 0.00);
INSERT INTO public.cheque
VALUES (277, 9, 18, 13645.80, 11565.62, 0.00);
INSERT INTO public.cheque
VALUES (21, 1, 34, 14450.00, 13527.84, 922.16);
INSERT INTO public.cheque
VALUES (206, 24, 37, 23664.46, 23664.46, 0.00);
INSERT INTO public.cheque
VALUES (277, 4, 36, 16245.00, 16245.00, 0.00);
INSERT INTO public.cheque
VALUES (119, 16, 43, 25032.45, 23598.96, 1433.49);
INSERT INTO public.cheque
VALUES (149, 21, 17, 833.17, 833.17, 0.00);
INSERT INTO public.cheque
VALUES (199, 5, 12, 1927.80, 1927.80, 0.00);
INSERT INTO public.cheque
VALUES (198, 3, 4, 209.40, 209.40, 0.00);
INSERT INTO public.cheque
VALUES (117, 10, 14, 6064.80, 6064.80, 0.00);
INSERT INTO public.cheque
VALUES (219, 5, 30, 5673.90, 5673.90, 0.00);
INSERT INTO public.cheque
VALUES (157, 21, 2, 98.02, 81.81, 0.00);
INSERT INTO public.cheque
VALUES (128, 15, 22, 5126.88, 5126.88, 0.00);
INSERT INTO public.cheque
VALUES (163, 23, 28, 17577.28, 17577.28, 0.00);
INSERT INTO public.cheque
VALUES (189, 28, 5, 2255.90, 2255.90, 0.00);
INSERT INTO public.cheque
VALUES (186, 12, 20, 4753.20, 4495.83, 0.00);
INSERT INTO public.cheque
VALUES (64, 7, 44, 14305.72, 14305.72, 0.00);
INSERT INTO public.cheque
VALUES (73, 8, 44, 12435.72, 12435.72, 0.00);
INSERT INTO public.cheque
VALUES (187, 18, 26, 17364.88, 17364.88, 0.00);
INSERT INTO public.cheque
VALUES (136, 27, 32, 4142.08, 3928.45, 213.63);
INSERT INTO public.cheque
VALUES (203, 27, 1, 106.60, 106.60, 0.00);
INSERT INTO public.cheque
VALUES (207, 29, 36, 23681.52, 23681.52, 0.00);
INSERT INTO public.cheque
VALUES (38, 4, 9, 4781.25, 4316.92, 464.33);
INSERT INTO public.cheque
VALUES (96, 14, 35, 9022.65, 7812.48, 1210.17);
INSERT INTO public.cheque
VALUES (194, 5, 7, 1124.55, 1124.55, 0.00);
INSERT INTO public.cheque
VALUES (234, 17, 41, 136.53, 136.53, 0.00);
INSERT INTO public.cheque
VALUES (175, 21, 35, 1715.35, 1715.35, 0.00);
INSERT INTO public.cheque
VALUES (57, 24, 34, 19456.50, 16240.25, 0.00);
INSERT INTO public.cheque
VALUES (233, 25, 40, 13919.20, 13919.20, 0.00);
INSERT INTO public.cheque
VALUES (163, 21, 18, 986.04, 826.04, 0.00);
INSERT INTO public.cheque
VALUES (138, 21, 27, 1323.27, 1072.97, 0.00);
INSERT INTO public.cheque
VALUES (102, 10, 43, 14448.00, 12157.32, 0.00);
INSERT INTO public.cheque
VALUES (264, 19, 32, 11324.16, 9065.23, 0.00);
INSERT INTO public.cheque
VALUES (260, 17, 42, 115.08, 96.68, 0.00);
INSERT INTO public.cheque
VALUES (231, 26, 8, 4892.24, 3984.25, 907.99);
INSERT INTO public.cheque
VALUES (259, 25, 25, 8699.50, 7102.70, 0.00);
INSERT INTO public.cheque
VALUES (117, 26, 20, 16598.80, 14062.52, 0.00);
INSERT INTO public.cheque
VALUES (124, 6, 17, 3540.25, 3540.25, 0.00);
INSERT INTO public.cheque
VALUES (269, 6, 45, 7960.05, 7960.05, 0.00);
INSERT INTO public.cheque
VALUES (188, 23, 41, 23028.88, 23028.88, 0.00);
INSERT INTO public.cheque
VALUES (267, 20, 11, 2182.62, 2182.62, 0.00);
INSERT INTO public.cheque
VALUES (249, 14, 2, 515.58, 515.58, 0.00);
INSERT INTO public.cheque
VALUES (89, 6, 28, 5831.00, 5095.10, 735.90);
INSERT INTO public.cheque
VALUES (48, 10, 20, 10200.00, 8585.31, 0.00);
INSERT INTO public.cheque
VALUES (56, 25, 46, 19437.30, 19437.30, 0.00);
INSERT INTO public.cheque
VALUES (218, 23, 21, 11795.28, 9865.93, 0.00);
INSERT INTO public.cheque
VALUES (34, 29, 42, 27628.44, 23703.17, 3925.27);
INSERT INTO public.cheque
VALUES (186, 23, 46, 25837.28, 21600.13, 0.00);
INSERT INTO public.cheque
VALUES (3, 7, 45, 14630.85, 14519.12, 111.73);
INSERT INTO public.cheque
VALUES (29, 20, 41, 11040.89, 10102.60, 938.29);
INSERT INTO public.cheque
VALUES (284, 21, 47, 1896.92, 1896.92, 0.00);
INSERT INTO public.cheque
VALUES (100, 22, 15, 1755.75, 1565.16, 190.59);
INSERT INTO public.cheque
VALUES (137, 25, 23, 8003.54, 6761.22, 0.00);
INSERT INTO public.cheque
VALUES (191, 12, 46, 12218.52, 12218.52, 0.00);
INSERT INTO public.cheque
VALUES (113, 11, 36, 2976.84, 2935.01, 0.00);
INSERT INTO public.cheque
VALUES (122, 1, 18, 5040.00, 5040.00, 0.00);
INSERT INTO public.cheque
VALUES (149, 2, 30, 22312.50, 22312.50, 0.00);
INSERT INTO public.cheque
VALUES (115, 16, 33, 15820.86, 15608.95, 0.00);
INSERT INTO public.cheque
VALUES (283, 21, 13, 637.13, 519.04, 0.00);
INSERT INTO public.cheque
VALUES (86, 5, 29, 3613.40, 3270.46, 0.00);
INSERT INTO public.cheque
VALUES (269, 27, 34, 4918.78, 4210.34, 708.44);
INSERT INTO public.cheque
VALUES (121, 12, 39, 9268.74, 7425.56, 0.00);
INSERT INTO public.cheque
VALUES (42, 4, 18, 9562.50, 9350.64, 211.86);
INSERT INTO public.cheque
VALUES (258, 15, 3, 625.53, 575.20, 50.33);
INSERT INTO public.cheque
VALUES (53, 8, 48, 8937.60, 8511.54, 426.06);
INSERT INTO public.cheque
VALUES (199, 13, 33, 6486.81, 5940.77, 0.00);
INSERT INTO public.cheque
VALUES (108, 27, 39, 5642.13, 5588.74, 53.39);
INSERT INTO public.cheque
VALUES (269, 1, 17, 6137.00, 5883.98, 0.00);
INSERT INTO public.cheque
VALUES (91, 5, 13, 2458.69, 2458.69, 0.00);
INSERT INTO public.cheque
VALUES (19, 29, 10, 7352.10, 6221.78, 0.00);
INSERT INTO public.cheque
VALUES (209, 7, 45, 14630.85, 14120.49, 0.00);
INSERT INTO public.cheque
VALUES (213, 10, 46, 19927.20, 19927.20, 0.00);
INSERT INTO public.cheque
VALUES (73, 20, 48, 11565.12, 9880.41, 1684.71);
INSERT INTO public.cheque
VALUES (189, 29, 38, 20585.74, 18209.58, 2376.16);
INSERT INTO public.cheque
VALUES (256, 6, 43, 8954.75, 8954.75, 0.00);
INSERT INTO public.cheque
VALUES (48, 1, 27, 11475.00, 11300.79, 0.00);
INSERT INTO public.cheque
VALUES (202, 12, 5, 978.60, 978.60, 0.00);
INSERT INTO public.cheque
VALUES (49, 18, 38, 25379.44, 25379.44, 0.00);
INSERT INTO public.cheque
VALUES (39, 29, 40, 26312.80, 24035.66, 0.00);
INSERT INTO public.cheque
VALUES (191, 9, 16, 12129.60, 11293.40, 0.00);
INSERT INTO public.cheque
VALUES (226, 20, 33, 8886.57, 8472.84, 0.00);
INSERT INTO public.cheque
VALUES (273, 3, 21, 852.60, 800.22, 52.38);
INSERT INTO public.cheque
VALUES (179, 10, 3, 1530.00, 1530.00, 0.00);
INSERT INTO public.cheque
VALUES (247, 21, 38, 2081.64, 1714.10, 0.00);
INSERT INTO public.cheque
VALUES (45, 20, 21, 5059.74, 4171.66, 0.00);
INSERT INTO public.cheque
VALUES (25, 27, 33, 3517.80, 3163.87, 353.93);
INSERT INTO public.cheque
VALUES (79, 25, 33, 11483.34, 11483.34, 0.00);
INSERT INTO public.cheque
VALUES (43, 10, 29, 12562.80, 12120.15, 0.00);
INSERT INTO public.cheque
VALUES (240, 22, 49, 5735.45, 5735.45, 0.00);
INSERT INTO public.cheque
VALUES (262, 8, 45, 10803.15, 10751.23, 0.00);
INSERT INTO public.cheque
VALUES (145, 28, 15, 8217.90, 8040.11, 0.00);
INSERT INTO public.cheque
VALUES (284, 15, 20, 3434.20, 3181.75, 0.00);
INSERT INTO public.cheque
VALUES (242, 27, 41, 5307.04, 5307.04, 0.00);
INSERT INTO public.cheque
VALUES (278, 14, 39, 10053.81, 8519.91, 1533.90);
INSERT INTO public.cheque
VALUES (127, 26, 34, 25247.72, 25247.72, 0.00);
INSERT INTO public.cheque
VALUES (73, 24, 14, 8011.50, 8011.50, 0.00);
INSERT INTO public.cheque
VALUES (130, 7, 20, 5523.40, 4644.52, 0.00);
INSERT INTO public.cheque
VALUES (187, 23, 24, 11101.44, 9890.39, 0.00);
INSERT INTO public.cheque
VALUES (3, 13, 32, 5628.16, 5297.75, 0.00);
INSERT INTO public.cheque
VALUES (263, 28, 28, 15340.08, 15340.08, 0.00);
INSERT INTO public.cheque
VALUES (216, 14, 27, 7779.24, 6861.40, 0.00);
INSERT INTO public.cheque
VALUES (110, 16, 7, 4075.05, 3962.15, 0.00);
INSERT INTO public.cheque
VALUES (97, 21, 40, 1614.40, 1346.56, 0.00);
INSERT INTO public.cheque
VALUES (79, 17, 34, 93.16, 75.20, 0.00);
INSERT INTO public.cheque
VALUES (43, 13, 25, 4914.25, 4914.25, 0.00);
INSERT INTO public.cheque
VALUES (244, 12, 4, 1062.48, 1062.48, 0.00);
INSERT INTO public.cheque
VALUES (43, 27, 7, 1012.69, 1012.69, 0.00);
INSERT INTO public.cheque
VALUES (253, 7, 27, 5783.40, 4969.75, 0.00);
INSERT INTO public.cheque
VALUES (65, 9, 14, 10613.40, 10613.40, 0.00);
INSERT INTO public.cheque
VALUES (168, 5, 8, 996.80, 996.80, 0.00);
INSERT INTO public.cheque
VALUES (28, 2, 21, 13266.75, 13266.75, 0.00);
INSERT INTO public.cheque
VALUES (85, 17, 42, 115.08, 115.08, 0.00);
INSERT INTO public.cheque
VALUES (72, 7, 46, 12703.82, 10846.43, 0.00);
INSERT INTO public.cheque
VALUES (9, 2, 41, 30493.75, 27698.12, 0.00);
INSERT INTO public.cheque
VALUES (174, 28, 27, 14792.22, 14792.22, 0.00);
INSERT INTO public.cheque
VALUES (263, 18, 14, 11354.00, 9981.48, 0.00);
INSERT INTO public.cheque
VALUES (122, 23, 27, 12489.12, 12489.12, 0.00);
INSERT INTO public.cheque
VALUES (80, 18, 37, 30007.00, 30007.00, 0.00);
INSERT INTO public.cheque
VALUES (180, 21, 4, 219.12, 219.12, 0.00);
INSERT INTO public.cheque
VALUES (274, 6, 39, 8121.75, 8121.75, 0.00);
INSERT INTO public.cheque
VALUES (137, 17, 14, 38.36, 38.36, 0.00);
INSERT INTO public.cheque
VALUES (58, 12, 32, 7605.12, 6752.92, 852.20);
INSERT INTO public.cheque
VALUES (2, 3, 47, 1908.20, 1908.20, 0.00);
INSERT INTO public.cheque
VALUES (88, 21, 32, 1291.52, 1217.35, 0.00);
INSERT INTO public.cheque
VALUES (69, 29, 29, 19076.78, 17563.25, 1513.53);
INSERT INTO public.cheque
VALUES (232, 12, 1, 237.66, 236.93, 0.00);
INSERT INTO public.cheque
VALUES (32, 9, 30, 26775.00, 22394.13, 0.00);
INSERT INTO public.cheque
VALUES (160, 6, 40, 8330.00, 7226.15, 0.00);
INSERT INTO public.cheque
VALUES (34, 24, 2, 1144.50, 1144.50, 0.00);
INSERT INTO public.cheque
VALUES (232, 27, 29, 3753.76, 3753.76, 0.00);
INSERT INTO public.cheque
VALUES (43, 25, 28, 13223.28, 13223.28, 0.00);
INSERT INTO public.cheque
VALUES (60, 28, 18, 8121.24, 8121.24, 0.00);
INSERT INTO public.cheque
VALUES (261, 12, 36, 7045.92, 6002.03, 1043.89);
INSERT INTO public.cheque
VALUES (168, 26, 39, 23849.67, 23849.67, 0.00);
INSERT INTO public.cheque
VALUES (157, 9, 19, 16957.50, 16361.90, 0.00);
INSERT INTO public.cheque
VALUES (145, 2, 40, 29750.00, 25725.23, 0.00);
INSERT INTO public.cheque
VALUES (125, 18, 1, 667.88, 628.39, 0.00);
INSERT INTO public.cheque
VALUES (250, 18, 27, 18032.76, 16654.95, 1377.81);
INSERT INTO public.cheque
VALUES (82, 3, 26, 1602.38, 1602.38, 0.00);
INSERT INTO public.cheque
VALUES (19, 30, 24, 14044.32, 14044.32, 0.00);
INSERT INTO public.cheque
VALUES (147, 20, 9, 2168.46, 2168.46, 0.00);
INSERT INTO public.cheque
VALUES (116, 28, 8, 4898.48, 3973.96, 0.00);
INSERT INTO public.cheque
VALUES (50, 30, 2, 862.38, 859.72, 0.00);
INSERT INTO public.cheque
VALUES (73, 29, 30, 19734.60, 15792.30, 0.00);
INSERT INTO public.cheque
VALUES (188, 19, 42, 18047.82, 18047.82, 0.00);
INSERT INTO public.cheque
VALUES (8, 30, 8, 3449.52, 3449.52, 0.00);
INSERT INTO public.cheque
VALUES (51, 20, 21, 4166.82, 3554.05, 0.00);
INSERT INTO public.cheque
VALUES (30, 7, 21, 6827.73, 6827.73, 0.00);
INSERT INTO public.cheque
VALUES (98, 4, 35, 12250.00, 12250.00, 0.00);
INSERT INTO public.cheque
VALUES (6, 25, 22, 10389.72, 9907.56, 482.16);
INSERT INTO public.cheque
VALUES (268, 27, 33, 4271.52, 4271.52, 0.00);
INSERT INTO public.cheque
VALUES (127, 15, 2, 417.02, 339.28, 0.00);
INSERT INTO public.cheque
VALUES (84, 8, 42, 11870.46, 11870.46, 0.00);
INSERT INTO public.cheque
VALUES (276, 14, 9, 2320.11, 2320.11, 0.00);
INSERT INTO public.cheque
VALUES (63, 24, 9, 4241.43, 4180.61, 0.00);
INSERT INTO public.cheque
VALUES (214, 15, 45, 9382.95, 8365.92, 0.00);
INSERT INTO public.cheque
VALUES (151, 27, 23, 2977.12, 2977.12, 0.00);
INSERT INTO public.cheque
VALUES (278, 24, 27, 15450.75, 15450.75, 0.00);
INSERT INTO public.cheque
VALUES (124, 24, 24, 13734.00, 13340.21, 393.79);
INSERT INTO public.cheque
VALUES (216, 25, 46, 21723.96, 21723.96, 0.00);
INSERT INTO public.cheque
VALUES (265, 25, 6, 2833.56, 2271.14, 562.42);
INSERT INTO public.cheque
VALUES (213, 10, 21, 9097.20, 8325.16, 772.04);
INSERT INTO public.cheque
VALUES (237, 29, 17, 11182.94, 11182.94, 0.00);
INSERT INTO public.cheque
VALUES (162, 16, 22, 12807.30, 12807.30, 0.00);
INSERT INTO public.cheque
VALUES (152, 2, 13, 6370.00, 6370.00, 0.00);
INSERT INTO public.cheque
VALUES (80, 21, 33, 1617.33, 1555.15, 0.00);
INSERT INTO public.cheque
VALUES (4, 28, 20, 12246.20, 12246.20, 0.00);
INSERT INTO public.cheque
VALUES (97, 12, 45, 8807.40, 8807.40, 0.00);
INSERT INTO public.cheque
VALUES (113, 5, 37, 5944.05, 5944.05, 0.00);
INSERT INTO public.cheque
VALUES (253, 3, 37, 1502.20, 1502.20, 0.00);
INSERT INTO public.cheque
VALUES (257, 9, 35, 26533.50, 26533.50, 0.00);
INSERT INTO public.cheque
VALUES (64, 26, 26, 19307.08, 19307.08, 0.00);
INSERT INTO public.cheque
VALUES (266, 6, 15, 3123.75, 3123.75, 0.00);
INSERT INTO public.cheque
VALUES (239, 13, 24, 4717.68, 4717.68, 0.00);
INSERT INTO public.cheque
VALUES (4, 20, 9, 2423.61, 2423.61, 0.00);
INSERT INTO public.cheque
VALUES (272, 26, 35, 25990.30, 25990.30, 0.00);
INSERT INTO public.cheque
VALUES (14, 22, 1, 130.82, 130.82, 0.00);
INSERT INTO public.cheque
VALUES (186, 14, 27, 6960.33, 6084.58, 0.00);
INSERT INTO public.cheque
VALUES (91, 5, 2, 378.26, 378.26, 0.00);
INSERT INTO public.cheque
VALUES (117, 26, 38, 31537.72, 31537.72, 0.00);
INSERT INTO public.cheque
VALUES (85, 9, 6, 3528.00, 3528.00, 0.00);
INSERT INTO public.cheque
VALUES (68, 13, 6, 1055.28, 1018.02, 0.00);
INSERT INTO public.cheque
VALUES (186, 28, 13, 7122.18, 5787.19, 0.00);
INSERT INTO public.cheque
VALUES (144, 16, 13, 6232.46, 5417.61, 0.00);
INSERT INTO public.cheque
VALUES (212, 19, 6, 2123.28, 1750.16, 373.12);
INSERT INTO public.cheque
VALUES (282, 27, 5, 533.00, 533.00, 0.00);
INSERT INTO public.cheque
VALUES (75, 9, 28, 21226.80, 20942.51, 284.29);
INSERT INTO public.cheque
VALUES (142, 22, 7, 674.73, 595.24, 79.49);
INSERT INTO public.cheque
VALUES (156, 26, 25, 18564.50, 18172.23, 0.00);
INSERT INTO public.cheque
VALUES (99, 21, 13, 712.14, 633.56, 78.58);
INSERT INTO public.cheque
VALUES (107, 26, 9, 5503.77, 4939.16, 564.61);
INSERT INTO public.cheque
VALUES (245, 23, 18, 10110.24, 9771.22, 0.00);
INSERT INTO public.cheque
VALUES (149, 22, 19, 2223.95, 2223.95, 0.00);
INSERT INTO public.cheque
VALUES (121, 21, 30, 1470.30, 1470.30, 0.00);
INSERT INTO public.cheque
VALUES (197, 7, 24, 5140.80, 4124.98, 0.00);
INSERT INTO public.cheque
VALUES (256, 4, 39, 20718.75, 20306.23, 0.00);
INSERT INTO public.cheque
VALUES (34, 23, 43, 24152.24, 20436.90, 3715.34);
INSERT INTO public.cheque
VALUES (264, 22, 29, 2795.31, 2707.54, 0.00);
INSERT INTO public.cheque
VALUES (274, 26, 48, 35643.84, 35643.84, 0.00);
INSERT INTO public.cheque
VALUES (222, 24, 46, 21678.42, 20496.90, 0.00);
INSERT INTO public.cheque
VALUES (2, 7, 4, 856.80, 773.88, 82.92);
INSERT INTO public.cheque
VALUES (155, 14, 29, 7475.91, 7475.91, 0.00);
INSERT INTO public.cheque
VALUES (242, 24, 28, 16023.00, 15944.67, 0.00);
INSERT INTO public.cheque
VALUES (155, 12, 23, 5466.18, 5466.18, 0.00);
INSERT INTO public.cheque
VALUES (191, 11, 20, 1653.80, 1521.52, 0.00);
INSERT INTO public.cheque
VALUES (72, 18, 43, 38975.63, 36831.76, 2143.87);
INSERT INTO public.cheque
VALUES (8, 16, 45, 21573.90, 21573.90, 0.00);
INSERT INTO public.cheque
VALUES (88, 27, 44, 4690.40, 3817.99, 0.00);
INSERT INTO public.cheque
VALUES (219, 2, 13, 9668.75, 9668.75, 0.00);
INSERT INTO public.cheque
VALUES (267, 13, 31, 4490.04, 4490.04, 0.00);
INSERT INTO public.cheque
VALUES (212, 9, 10, 5880.00, 5389.04, 490.96);
INSERT INTO public.cheque
VALUES (86, 24, 41, 19322.07, 19105.21, 0.00);
INSERT INTO public.cheque
VALUES (131, 19, 13, 5586.23, 5254.50, 0.00);
INSERT INTO public.cheque
VALUES (1, 11, 44, 2680.92, 2680.92, 0.00);
INSERT INTO public.cheque
VALUES (156, 19, 41, 17618.11, 14198.94, 0.00);
INSERT INTO public.cheque
VALUES (35, 23, 35, 21971.60, 21163.02, 808.58);
INSERT INTO public.cheque
VALUES (21, 12, 36, 8555.76, 7277.43, 0.00);
INSERT INTO public.cheque
VALUES (106, 12, 15, 2935.80, 2935.80, 0.00);
INSERT INTO public.cheque
VALUES (93, 5, 43, 8132.59, 8132.59, 0.00);
INSERT INTO public.cheque
VALUES (6, 21, 36, 1972.08, 1674.07, 298.01);
INSERT INTO public.cheque
VALUES (117, 16, 40, 26025.60, 25190.36, 835.24);
INSERT INTO public.cheque
VALUES (239, 19, 49, 23532.74, 23532.74, 0.00);
INSERT INTO public.cheque
VALUES (134, 2, 38, 18620.00, 18124.99, 0.00);
INSERT INTO public.cheque
VALUES (63, 13, 2, 289.68, 275.61, 14.07);
INSERT INTO public.cheque
VALUES (156, 5, 20, 3782.60, 3782.60, 0.00);
INSERT INTO public.cheque
VALUES (266, 2, 20, 14875.00, 14875.00, 0.00);
INSERT INTO public.cheque
VALUES (169, 28, 22, 13470.82, 12363.80, 0.00);
INSERT INTO public.cheque
VALUES (87, 5, 32, 6052.16, 5767.63, 0.00);
INSERT INTO public.cheque
VALUES (255, 12, 38, 9031.08, 9018.76, 12.32);
INSERT INTO public.cheque
VALUES (269, 3, 37, 1936.95, 1931.78, 5.17);
INSERT INTO public.cheque
VALUES (205, 16, 46, 29929.44, 28056.78, 0.00);
INSERT INTO public.cheque
VALUES (134, 3, 39, 1583.40, 1496.62, 0.00);
INSERT INTO public.cheque
VALUES (278, 14, 26, 6702.54, 6687.54, 0.00);
INSERT INTO public.cheque
VALUES (141, 14, 23, 5929.17, 5929.17, 0.00);
INSERT INTO public.cheque
VALUES (246, 25, 5, 2361.30, 2361.30, 0.00);
INSERT INTO public.cheque
VALUES (129, 2, 9, 6693.75, 6693.75, 0.00);
INSERT INTO public.cheque
VALUES (83, 17, 44, 163.68, 140.70, 0.00);
INSERT INTO public.cheque
VALUES (168, 14, 38, 8067.40, 7309.98, 757.42);
INSERT INTO public.cheque
VALUES (237, 23, 46, 25837.28, 25837.28, 0.00);
INSERT INTO public.cheque
VALUES (93, 28, 41, 22462.26, 18025.20, 0.00);
INSERT INTO public.cheque
VALUES (14, 2, 32, 20216.00, 20216.00, 0.00);
INSERT INTO public.cheque
VALUES (120, 6, 39, 8121.75, 8121.75, 0.00);
INSERT INTO public.cheque
VALUES (186, 27, 38, 4918.72, 4298.83, 619.89);
INSERT INTO public.cheque
VALUES (238, 5, 18, 2891.70, 2891.70, 0.00);
INSERT INTO public.cheque
VALUES (17, 6, 25, 5206.25, 5206.25, 0.00);
INSERT INTO public.cheque
VALUES (140, 27, 36, 5208.12, 4396.15, 811.97);
INSERT INTO public.cheque
VALUES (112, 4, 42, 22312.50, 20908.88, 1403.62);
INSERT INTO public.cheque
VALUES (38, 9, 50, 44625.00, 43121.42, 0.00);
INSERT INTO public.cheque
VALUES (188, 21, 11, 539.11, 539.11, 0.00);
INSERT INTO public.cheque
VALUES (201, 1, 15, 4200.00, 4200.00, 0.00);
INSERT INTO public.cheque
VALUES (87, 18, 22, 17842.00, 16259.27, 0.00);
INSERT INTO public.cheque
VALUES (259, 27, 47, 5010.20, 5010.20, 0.00);
INSERT INTO public.cheque
VALUES (278, 28, 24, 13148.64, 12750.60, 398.04);
INSERT INTO public.cheque
VALUES (194, 19, 14, 6723.64, 6248.58, 475.06);
INSERT INTO public.cheque
VALUES (131, 28, 29, 15887.94, 14843.07, 1044.87);
INSERT INTO public.cheque
VALUES (172, 29, 18, 11840.76, 11059.45, 781.31);
INSERT INTO public.cheque
VALUES (88, 11, 24, 1462.32, 1435.41, 26.91);
INSERT INTO public.cheque
VALUES (224, 14, 19, 4898.01, 4898.01, 0.00);
INSERT INTO public.cheque
VALUES (274, 2, 34, 25287.50, 25287.50, 0.00);
INSERT INTO public.cheque
VALUES (10, 15, 44, 10253.76, 10253.76, 0.00);
INSERT INTO public.cheque
VALUES (170, 20, 32, 6349.44, 5700.50, 648.94);
INSERT INTO public.cheque
VALUES (47, 11, 30, 1827.90, 1810.29, 17.61);
INSERT INTO public.cheque
VALUES (154, 9, 11, 9817.50, 9572.60, 0.00);
INSERT INTO public.cheque
VALUES (270, 25, 28, 9743.44, 9334.88, 0.00);
INSERT INTO public.cheque
VALUES (274, 3, 17, 1047.71, 1047.71, 0.00);
INSERT INTO public.cheque
VALUES (109, 7, 39, 8353.80, 8353.80, 0.00);
INSERT INTO public.cheque
VALUES (31, 25, 46, 19437.30, 18417.75, 0.00);
INSERT INTO public.cheque
VALUES (255, 11, 48, 3551.04, 3261.35, 289.69);
INSERT INTO public.cheque
VALUES (200, 17, 37, 137.64, 137.64, 0.00);
INSERT INTO public.cheque
VALUES (161, 20, 25, 6023.50, 5328.26, 0.00);
INSERT INTO public.cheque
VALUES (169, 23, 39, 24482.64, 21419.24, 0.00);
INSERT INTO public.cheque
VALUES (159, 9, 42, 24696.00, 20601.90, 0.00);
INSERT INTO public.cheque
VALUES (83, 18, 11, 9970.51, 8409.61, 0.00);
INSERT INTO public.cheque
VALUES (22, 26, 38, 31537.72, 31537.72, 0.00);
INSERT INTO public.cheque
VALUES (130, 5, 8, 1285.20, 1285.20, 0.00);
INSERT INTO public.cheque
VALUES (171, 1, 9, 3825.00, 3825.00, 0.00);
INSERT INTO public.cheque
VALUES (54, 6, 4, 833.00, 678.76, 0.00);
INSERT INTO public.cheque
VALUES (6, 27, 7, 1012.69, 1012.69, 0.00);
INSERT INTO public.cheque
VALUES (264, 21, 24, 968.64, 842.76, 125.88);
INSERT INTO public.cheque
VALUES (106, 19, 11, 3892.68, 3585.38, 0.00);
INSERT INTO public.cheque
VALUES (277, 19, 48, 23052.48, 22766.02, 0.00);
INSERT INTO public.cheque
VALUES (58, 24, 34, 19456.50, 19456.50, 0.00);
INSERT INTO public.cheque
VALUES (245, 13, 45, 7914.60, 7584.92, 0.00);
INSERT INTO public.cheque
VALUES (67, 5, 2, 378.26, 378.26, 0.00);
INSERT INTO public.cheque
VALUES (157, 7, 32, 10404.16, 10404.16, 0.00);
INSERT INTO public.cheque
VALUES (90, 1, 40, 17000.00, 15883.96, 0.00);
INSERT INTO public.cheque
VALUES (24, 11, 26, 1923.48, 1923.48, 0.00);
INSERT INTO public.cheque
VALUES (202, 26, 49, 29964.97, 27280.14, 2684.83);
INSERT INTO public.cheque
VALUES (211, 25, 14, 5915.70, 5915.70, 0.00);
INSERT INTO public.cheque
VALUES (184, 21, 34, 1666.34, 1666.34, 0.00);
INSERT INTO public.cheque
VALUES (25, 19, 25, 8847.00, 7406.50, 0.00);
INSERT INTO public.cheque
VALUES (66, 16, 9, 5239.35, 5139.72, 0.00);
INSERT INTO public.cheque
VALUES (281, 25, 37, 12875.26, 10921.29, 0.00);
INSERT INTO public.cheque
VALUES (161, 25, 18, 7605.90, 7605.90, 0.00);
INSERT INTO public.cheque
VALUES (111, 8, 35, 9892.05, 9892.05, 0.00);
INSERT INTO public.cheque
VALUES (214, 12, 6, 1425.96, 1356.73, 0.00);
INSERT INTO public.cheque
VALUES (64, 9, 13, 11602.50, 10734.13, 868.37);
INSERT INTO public.cheque
VALUES (91, 12, 30, 7129.80, 7129.80, 0.00);
INSERT INTO public.cheque
VALUES (231, 4, 20, 7000.00, 7000.00, 0.00);
INSERT INTO public.cheque
VALUES (276, 18, 21, 17031.00, 17031.00, 0.00);
INSERT INTO public.cheque
VALUES (104, 13, 38, 6683.44, 6462.32, 0.00);
INSERT INTO public.cheque
VALUES (277, 14, 2, 576.24, 565.34, 0.00);
INSERT INTO public.cheque
VALUES (232, 11, 16, 1183.68, 1178.80, 4.88);
INSERT INTO public.cheque
VALUES (96, 10, 36, 18360.00, 18360.00, 0.00);
INSERT INTO public.cheque
VALUES (152, 27, 10, 1066.00, 1066.00, 0.00);
INSERT INTO public.cheque
VALUES (156, 22, 5, 585.25, 560.04, 25.21);
INSERT INTO public.cheque
VALUES (39, 3, 22, 1355.86, 1301.98, 0.00);
INSERT INTO public.cheque
VALUES (128, 4, 8, 3610.00, 3610.00, 0.00);
INSERT INTO public.cheque
VALUES (255, 2, 36, 26775.00, 22418.39, 0.00);
INSERT INTO public.cheque
VALUES (22, 8, 25, 6001.75, 5097.64, 0.00);
INSERT INTO public.cheque
VALUES (251, 5, 16, 3026.08, 2480.75, 545.33);
INSERT INTO public.cheque
VALUES (20, 3, 47, 1908.20, 1908.20, 0.00);
INSERT INTO public.cheque
VALUES (14, 17, 16, 59.52, 56.07, 3.45);
INSERT INTO public.cheque
VALUES (120, 13, 2, 351.76, 286.71, 0.00);
INSERT INTO public.cheque
VALUES (9, 7, 46, 14955.98, 14955.98, 0.00);
INSERT INTO public.cheque
VALUES (184, 18, 48, 38928.00, 38928.00, 0.00);
INSERT INTO public.cheque
VALUES (146, 3, 29, 1787.27, 1752.60, 34.67);
INSERT INTO public.cheque
VALUES (270, 27, 40, 4264.00, 4224.66, 0.00);
INSERT INTO public.cheque
VALUES (23, 4, 42, 18952.50, 18952.50, 0.00);
INSERT INTO public.cheque
VALUES (167, 7, 48, 15606.24, 15606.24, 0.00);
INSERT INTO public.cheque
VALUES (188, 16, 6, 3492.90, 3492.90, 0.00);
INSERT INTO public.cheque
VALUES (124, 13, 17, 2989.96, 2890.46, 0.00);
INSERT INTO public.cheque
VALUES (67, 5, 14, 2647.82, 2370.34, 0.00);
INSERT INTO public.cheque
VALUES (173, 23, 18, 8326.08, 8326.08, 0.00);
INSERT INTO public.cheque
VALUES (169, 13, 45, 8845.65, 8845.65, 0.00);
INSERT INTO public.cheque
VALUES (193, 15, 5, 1042.55, 939.45, 103.10);
INSERT INTO public.cheque
VALUES (282, 2, 47, 23030.00, 18634.26, 4395.74);
INSERT INTO public.cheque
VALUES (4, 4, 8, 3610.00, 3043.62, 0.00);
INSERT INTO public.cheque
VALUES (14, 20, 31, 8347.99, 6824.05, 1523.94);
INSERT INTO public.cheque
VALUES (219, 10, 11, 5610.00, 5163.75, 0.00);
INSERT INTO public.cheque
VALUES (65, 29, 33, 24261.93, 23439.25, 0.00);
INSERT INTO public.cheque
VALUES (195, 4, 23, 12218.75, 11300.16, 0.00);
INSERT INTO public.cheque
VALUES (117, 8, 6, 1440.42, 1440.42, 0.00);
INSERT INTO public.cheque
VALUES (11, 5, 21, 3971.73, 3601.44, 0.00);
INSERT INTO public.cheque
VALUES (80, 29, 13, 8551.66, 8551.66, 0.00);
INSERT INTO public.cheque
VALUES (181, 24, 27, 15450.75, 12487.97, 2962.78);
INSERT INTO public.cheque
VALUES (221, 29, 11, 8087.31, 6543.04, 1544.27);
INSERT INTO public.cheque
VALUES (8, 10, 49, 16464.00, 13421.14, 3042.86);
INSERT INTO public.cheque
VALUES (87, 25, 23, 9718.65, 9498.75, 0.00);
INSERT INTO public.cheque
VALUES (6, 20, 39, 10502.31, 10502.31, 0.00);
INSERT INTO public.cheque
VALUES (210, 16, 15, 9759.60, 8515.69, 1243.91);
INSERT INTO public.cheque
VALUES (154, 6, 20, 4165.00, 3337.90, 827.10);
INSERT INTO public.cheque
VALUES (50, 13, 6, 869.04, 760.04, 109.00);
INSERT INTO public.cheque
VALUES (278, 30, 11, 5759.38, 5759.38, 0.00);
INSERT INTO public.cheque
VALUES (41, 28, 6, 3673.86, 3673.86, 0.00);
INSERT INTO public.cheque
VALUES (210, 6, 22, 3891.58, 3171.86, 0.00);
INSERT INTO public.cheque
VALUES (150, 21, 43, 1735.48, 1589.74, 0.00);
INSERT INTO public.cheque
VALUES (177, 27, 47, 5010.20, 5010.20, 0.00);
INSERT INTO public.cheque
VALUES (167, 10, 43, 21930.00, 21930.00, 0.00);
INSERT INTO public.cheque
VALUES (170, 16, 4, 1917.68, 1681.93, 0.00);
INSERT INTO public.cheque
VALUES (121, 20, 11, 2650.34, 2650.34, 0.00);
INSERT INTO public.cheque
VALUES (66, 21, 47, 2303.47, 2303.47, 0.00);
INSERT INTO public.cheque
VALUES (2, 10, 43, 14448.00, 14448.00, 0.00);
INSERT INTO public.cheque
VALUES (234, 20, 6, 1445.64, 1440.90, 0.00);
INSERT INTO public.cheque
VALUES (75, 26, 13, 10789.22, 10789.22, 0.00);
INSERT INTO public.cheque
VALUES (224, 23, 10, 5616.80, 5616.80, 0.00);
INSERT INTO public.cheque
VALUES (190, 4, 30, 15937.50, 15937.50, 0.00);
INSERT INTO public.cheque
VALUES (96, 26, 4, 2970.32, 2862.17, 0.00);
INSERT INTO public.cheque
VALUES (20, 7, 10, 2142.00, 1989.46, 152.54);
INSERT INTO public.cheque
VALUES (242, 2, 40, 29750.00, 28891.02, 858.98);
INSERT INTO public.cheque
VALUES (231, 7, 34, 7282.80, 7282.80, 0.00);
INSERT INTO public.cheque
VALUES (242, 14, 4, 1031.16, 922.71, 108.45);
INSERT INTO public.cheque
VALUES (228, 10, 46, 23460.00, 20470.87, 2989.13);
INSERT INTO public.cheque
VALUES (199, 17, 8, 29.76, 26.77, 0.00);
INSERT INTO public.cheque
VALUES (189, 25, 32, 11135.36, 10269.13, 866.23);
INSERT INTO public.cheque
VALUES (189, 16, 7, 3355.94, 3324.35, 31.59);
INSERT INTO public.cheque
VALUES (268, 4, 15, 7968.75, 7968.75, 0.00);
INSERT INTO public.cheque
VALUES (196, 22, 49, 4723.11, 3888.63, 834.48);
INSERT INTO public.cheque
VALUES (72, 4, 38, 17147.50, 14449.62, 0.00);
INSERT INTO public.cheque
VALUES (196, 16, 41, 19656.22, 19656.22, 0.00);
INSERT INTO public.cheque
VALUES (257, 26, 36, 29877.84, 29877.84, 0.00);
INSERT INTO public.cheque
VALUES (234, 10, 43, 21930.00, 21930.00, 0.00);
INSERT INTO public.cheque
VALUES (186, 8, 50, 14131.50, 13597.17, 534.33);
INSERT INTO public.cheque
VALUES (164, 17, 32, 106.56, 93.25, 0.00);
INSERT INTO public.cheque
VALUES (12, 15, 36, 7506.36, 6168.21, 1338.15);
INSERT INTO public.cheque
VALUES (148, 27, 45, 5824.80, 5824.80, 0.00);
INSERT INTO public.cheque
VALUES (156, 26, 20, 14851.60, 14121.07, 0.00);
INSERT INTO public.cheque
VALUES (179, 17, 39, 129.87, 129.87, 0.00);
INSERT INTO public.cheque
VALUES (125, 4, 48, 16800.00, 16800.00, 0.00);
INSERT INTO public.cheque
VALUES (193, 25, 23, 9718.65, 9690.29, 0.00);
INSERT INTO public.cheque
VALUES (214, 14, 36, 9280.44, 7430.44, 0.00);
INSERT INTO public.cheque
VALUES (244, 14, 35, 10084.20, 9908.88, 0.00);
INSERT INTO public.cheque
VALUES (193, 23, 29, 16288.72, 16288.72, 0.00);
INSERT INTO public.cheque
VALUES (99, 28, 38, 23267.78, 19955.63, 0.00);
INSERT INTO public.cheque
VALUES (259, 3, 38, 1542.80, 1272.24, 0.00);
INSERT INTO public.cheque
VALUES (152, 10, 39, 13104.00, 10947.12, 2156.88);
INSERT INTO public.cheque
VALUES (42, 19, 29, 12461.59, 12068.46, 0.00);
INSERT INTO public.cheque
VALUES (113, 13, 24, 4717.68, 4717.68, 0.00);
INSERT INTO public.cheque
VALUES (242, 24, 31, 17739.75, 17721.09, 18.66);
INSERT INTO public.cheque
VALUES (115, 21, 33, 1331.88, 1331.88, 0.00);
INSERT INTO public.cheque
VALUES (177, 15, 1, 171.71, 165.16, 6.55);
INSERT INTO public.cheque
VALUES (30, 29, 43, 28286.26, 26834.60, 0.00);
INSERT INTO public.cheque
VALUES (195, 9, 34, 30345.00, 25562.38, 0.00);
INSERT INTO public.cheque
VALUES (30, 8, 30, 8478.90, 7566.89, 0.00);
INSERT INTO public.cheque
VALUES (245, 11, 7, 517.86, 499.64, 0.00);
INSERT INTO public.cheque
VALUES (216, 2, 30, 18952.50, 18952.50, 0.00);
INSERT INTO public.cheque
VALUES (274, 1, 25, 10625.00, 8710.74, 0.00);
INSERT INTO public.cheque
VALUES (166, 28, 38, 20818.68, 17231.54, 0.00);
INSERT INTO public.cheque
VALUES (252, 17, 50, 137.00, 132.20, 0.00);
INSERT INTO public.cheque
VALUES (142, 18, 2, 1335.76, 1335.76, 0.00);
INSERT INTO public.cheque
VALUES (258, 12, 50, 11883.00, 11281.10, 601.90);
INSERT INTO public.cheque
VALUES (4, 17, 8, 29.76, 29.76, 0.00);
INSERT INTO public.cheque
VALUES (230, 3, 5, 308.15, 308.15, 0.00);
INSERT INTO public.cheque
VALUES (269, 23, 43, 26993.68, 22829.61, 0.00);
INSERT INTO public.cheque
VALUES (211, 13, 6, 1055.28, 929.20, 0.00);
INSERT INTO public.cheque
VALUES (281, 28, 22, 9925.96, 9925.96, 0.00);
INSERT INTO public.cheque
VALUES (28, 12, 50, 13281.00, 13281.00, 0.00);
INSERT INTO public.cheque
VALUES (144, 20, 14, 2777.88, 2392.48, 385.40);
INSERT INTO public.cheque
VALUES (273, 12, 7, 1370.04, 1370.04, 0.00);
INSERT INTO public.cheque
VALUES (143, 26, 15, 11138.70, 9698.12, 0.00);
INSERT INTO public.cheque
VALUES (7, 3, 25, 1540.75, 1470.91, 0.00);
INSERT INTO public.cheque
VALUES (94, 7, 2, 650.26, 599.26, 51.00);
INSERT INTO public.cheque
VALUES (254, 4, 38, 20187.50, 20187.50, 0.00);
INSERT INTO public.cheque
VALUES (50, 20, 9, 1785.78, 1602.16, 183.62);
INSERT INTO public.cheque
VALUES (204, 8, 38, 10739.94, 10739.94, 0.00);
INSERT INTO public.cheque
VALUES (15, 4, 25, 13281.25, 13281.25, 0.00);
INSERT INTO public.cheque
VALUES (73, 25, 15, 6338.25, 5556.39, 781.86);
INSERT INTO public.cheque
VALUES (57, 24, 44, 25179.00, 25179.00, 0.00);
INSERT INTO public.cheque
VALUES (225, 25, 49, 23140.74, 23140.74, 0.00);
INSERT INTO public.cheque
VALUES (19, 13, 38, 7469.66, 7469.66, 0.00);
INSERT INTO public.cheque
VALUES (224, 14, 11, 2835.69, 2835.69, 0.00);
INSERT INTO public.cheque
VALUES (246, 6, 3, 530.67, 530.67, 0.00);
INSERT INTO public.cheque
VALUES (76, 15, 3, 625.53, 599.82, 25.71);
INSERT INTO public.cheque
VALUES (95, 25, 34, 14366.70, 14366.70, 0.00);
INSERT INTO public.cheque
VALUES (207, 10, 5, 2550.00, 2086.48, 0.00);
INSERT INTO public.cheque
VALUES (99, 23, 7, 4394.32, 4394.32, 0.00);
INSERT INTO public.cheque
VALUES (203, 17, 13, 35.62, 35.62, 0.00);
INSERT INTO public.cheque
VALUES (204, 9, 43, 38377.50, 38377.50, 0.00);
INSERT INTO public.cheque
VALUES (100, 23, 34, 19097.12, 18760.17, 336.95);
INSERT INTO public.cheque
VALUES (67, 24, 50, 28612.50, 24895.50, 0.00);
INSERT INTO public.cheque
VALUES (97, 12, 37, 7241.64, 7241.64, 0.00);
INSERT INTO public.cheque
VALUES (194, 11, 15, 1240.35, 1240.35, 0.00);
INSERT INTO public.cheque
VALUES (160, 7, 11, 3576.43, 3192.14, 0.00);
INSERT INTO public.cheque
VALUES (239, 15, 30, 6991.20, 6099.92, 891.28);
INSERT INTO public.cheque
VALUES (178, 18, 45, 40788.45, 40691.23, 0.00);
INSERT INTO public.cheque
VALUES (177, 11, 17, 1035.81, 1035.81, 0.00);
INSERT INTO public.cheque
VALUES (27, 25, 27, 11408.85, 11051.30, 357.55);
INSERT INTO public.cheque
VALUES (174, 4, 29, 15406.25, 15406.25, 0.00);
INSERT INTO public.cheque
VALUES (252, 12, 16, 3131.52, 3131.52, 0.00);
INSERT INTO public.cheque
VALUES (117, 3, 30, 1570.50, 1323.99, 0.00);
INSERT INTO public.cheque
VALUES (204, 8, 17, 4804.71, 4160.21, 644.50);
INSERT INTO public.cheque
VALUES (58, 28, 32, 17531.52, 15312.72, 0.00);
INSERT INTO public.cheque
VALUES (113, 14, 32, 9219.84, 9219.84, 0.00);
INSERT INTO public.cheque
VALUES (57, 5, 26, 4917.38, 4829.30, 0.00);
INSERT INTO public.cheque
VALUES (6, 20, 18, 4847.22, 4847.22, 0.00);
INSERT INTO public.cheque
VALUES (58, 25, 17, 7183.35, 7183.35, 0.00);
INSERT INTO public.cheque
VALUES (227, 9, 46, 41055.00, 41055.00, 0.00);
INSERT INTO public.cheque
VALUES (11, 22, 23, 2692.15, 2692.15, 0.00);
INSERT INTO public.cheque
VALUES (97, 23, 41, 18964.96, 16697.05, 0.00);
INSERT INTO public.cheque
VALUES (233, 4, 24, 8400.00, 8400.00, 0.00);
INSERT INTO public.cheque
VALUES (267, 28, 31, 13986.58, 13986.58, 0.00);
INSERT INTO public.cheque
VALUES (265, 13, 4, 786.28, 671.39, 0.00);
INSERT INTO public.cheque
VALUES (201, 10, 35, 11760.00, 11007.37, 0.00);
INSERT INTO public.cheque
VALUES (94, 16, 44, 25614.60, 21223.32, 0.00);
INSERT INTO public.cheque
VALUES (140, 21, 31, 1698.18, 1535.88, 0.00);
INSERT INTO public.cheque
VALUES (221, 23, 3, 1883.28, 1883.28, 0.00);
INSERT INTO public.cheque
VALUES (231, 14, 48, 10190.40, 9297.22, 0.00);
INSERT INTO public.cheque
VALUES (75, 8, 9, 2160.63, 1893.66, 266.97);
INSERT INTO public.cheque
VALUES (123, 7, 18, 5852.34, 5319.91, 0.00);
INSERT INTO public.cheque
VALUES (158, 29, 17, 9209.41, 8841.68, 367.73);
INSERT INTO public.cheque
VALUES (263, 13, 40, 7035.20, 5683.70, 0.00);
INSERT INTO public.cheque
VALUES (69, 3, 5, 308.15, 308.15, 0.00);
INSERT INTO public.cheque
VALUES (202, 26, 5, 3057.65, 3057.65, 0.00);
INSERT INTO public.cheque
VALUES (217, 10, 42, 14112.00, 12794.07, 1317.93);
INSERT INTO public.cheque
VALUES (179, 17, 42, 139.86, 120.37, 0.00);
INSERT INTO public.cheque
VALUES (186, 19, 33, 14180.43, 13029.38, 0.00);
INSERT INTO public.cheque
VALUES (17, 14, 4, 1031.16, 902.40, 128.76);
INSERT INTO public.cheque
VALUES (120, 23, 30, 16850.40, 14454.81, 0.00);
INSERT INTO public.cheque
VALUES (13, 24, 10, 6395.80, 6395.80, 0.00);
INSERT INTO public.cheque
VALUES (129, 28, 21, 11505.06, 10347.34, 0.00);
INSERT INTO public.cheque
VALUES (120, 9, 14, 12495.00, 11176.34, 1318.66);
INSERT INTO public.cheque
VALUES (224, 17, 18, 59.94, 57.04, 0.00);
INSERT INTO public.cheque
VALUES (241, 26, 28, 17122.84, 17122.84, 0.00);
INSERT INTO public.cheque
VALUES (103, 10, 15, 7650.00, 6343.46, 0.00);
INSERT INTO public.cheque
VALUES (111, 23, 11, 6178.48, 6178.48, 0.00);
INSERT INTO public.cheque
VALUES (11, 11, 34, 2515.32, 2259.27, 256.05);
INSERT INTO public.cheque
VALUES (84, 26, 14, 10396.12, 10396.12, 0.00);
INSERT INTO public.cheque
VALUES (250, 7, 43, 9210.60, 9210.60, 0.00);
INSERT INTO public.cheque
VALUES (38, 4, 43, 22843.75, 22843.75, 0.00);
INSERT INTO public.cheque
VALUES (180, 8, 9, 2160.63, 2160.63, 0.00);
INSERT INTO public.cheque
VALUES (108, 10, 30, 12996.00, 12996.00, 0.00);
INSERT INTO public.cheque
VALUES (124, 22, 26, 3043.30, 3043.30, 0.00);
INSERT INTO public.cheque
VALUES (185, 19, 26, 9200.88, 9200.88, 0.00);
INSERT INTO public.cheque
VALUES (28, 4, 10, 4512.50, 3776.47, 0.00);
INSERT INTO public.cheque
VALUES (235, 25, 1, 422.55, 419.64, 0.00);
INSERT INTO public.cheque
VALUES (177, 23, 9, 4163.04, 3678.91, 0.00);
INSERT INTO public.cheque
VALUES (70, 10, 9, 3898.80, 3898.80, 0.00);
INSERT INTO public.cheque
VALUES (127, 2, 8, 5950.00, 5507.22, 442.78);
INSERT INTO public.cheque
VALUES (206, 28, 40, 24492.40, 24492.40, 0.00);
INSERT INTO public.cheque
VALUES (45, 11, 10, 739.80, 627.01, 112.79);
INSERT INTO public.cheque
VALUES (206, 15, 15, 3495.60, 3246.07, 0.00);
INSERT INTO public.cheque
VALUES (173, 29, 23, 12459.79, 10147.86, 0.00);
INSERT INTO public.cheque
VALUES (222, 2, 34, 16660.00, 16660.00, 0.00);
INSERT INTO public.cheque
VALUES (36, 4, 22, 11687.50, 10381.61, 0.00);
INSERT INTO public.cheque
VALUES (55, 6, 26, 5414.50, 5414.50, 0.00);
INSERT INTO public.cheque
VALUES (241, 22, 45, 4337.55, 4337.55, 0.00);
INSERT INTO public.cheque
VALUES (233, 15, 26, 4464.46, 4464.46, 0.00);
INSERT INTO public.cheque
VALUES (140, 27, 19, 2748.73, 2679.86, 68.87);
INSERT INTO public.cheque
VALUES (68, 4, 13, 6906.25, 5891.04, 1015.21);
INSERT INTO public.cheque
VALUES (79, 15, 7, 1201.97, 974.17, 0.00);
INSERT INTO public.cheque
VALUES (207, 3, 4, 246.52, 246.52, 0.00);
INSERT INTO public.cheque
VALUES (258, 7, 24, 7803.12, 7464.17, 0.00);
INSERT INTO public.cheque
VALUES (266, 18, 35, 28385.00, 23054.45, 0.00);
INSERT INTO public.cheque
VALUES (237, 19, 42, 18047.82, 18047.82, 0.00);
INSERT INTO public.cheque
VALUES (216, 5, 10, 1606.50, 1606.50, 0.00);
INSERT INTO public.cheque
VALUES (119, 12, 26, 6179.16, 6179.16, 0.00);
INSERT INTO public.cheque
VALUES (276, 28, 34, 18627.24, 18414.39, 212.85);
INSERT INTO public.cheque
VALUES (95, 3, 30, 1848.90, 1848.90, 0.00);
INSERT INTO public.cheque
VALUES (38, 25, 43, 18169.65, 18169.65, 0.00);
INSERT INTO public.cheque
VALUES (44, 3, 20, 1232.60, 1232.60, 0.00);
INSERT INTO public.cheque
VALUES (232, 10, 14, 7140.00, 7140.00, 0.00);
INSERT INTO public.cheque
VALUES (280, 24, 42, 26862.36, 26862.36, 0.00);
INSERT INTO public.cheque
VALUES (134, 3, 17, 690.20, 690.20, 0.00);
INSERT INTO public.cheque
VALUES (164, 4, 5, 2656.25, 2656.25, 0.00);
INSERT INTO public.cheque
VALUES (228, 22, 6, 702.30, 585.16, 0.00);
INSERT INTO public.cheque
VALUES (189, 14, 33, 7005.90, 7005.90, 0.00);
INSERT INTO public.cheque
VALUES (80, 16, 26, 15135.90, 12576.13, 0.00);
INSERT INTO public.cheque
VALUES (168, 12, 27, 5284.44, 4891.82, 0.00);
INSERT INTO public.cheque
VALUES (23, 5, 23, 3694.95, 3694.95, 0.00);
INSERT INTO public.cheque
VALUES (269, 4, 16, 7220.00, 7220.00, 0.00);
INSERT INTO public.cheque
VALUES (203, 1, 19, 5320.00, 4265.50, 1054.50);
INSERT INTO public.cheque
VALUES (209, 10, 25, 12750.00, 11480.97, 0.00);
INSERT INTO public.cheque
VALUES (48, 15, 41, 8548.91, 8034.56, 0.00);
INSERT INTO public.cheque
VALUES (69, 13, 9, 1582.92, 1496.11, 0.00);
INSERT INTO public.cheque
VALUES (171, 1, 19, 8075.00, 8075.00, 0.00);
INSERT INTO public.cheque
VALUES (224, 13, 46, 8090.48, 7843.60, 246.88);
INSERT INTO public.cheque
VALUES (249, 16, 3, 1746.45, 1746.45, 0.00);
INSERT INTO public.cheque
VALUES (212, 2, 8, 3920.00, 3920.00, 0.00);
INSERT INTO public.cheque
VALUES (96, 27, 50, 6472.00, 5496.76, 0.00);
INSERT INTO public.cheque
VALUES (184, 3, 3, 184.89, 153.07, 0.00);
INSERT INTO public.cheque
VALUES (137, 25, 33, 11483.34, 10772.87, 0.00);
INSERT INTO public.cheque
VALUES (96, 18, 36, 29196.00, 29196.00, 0.00);
INSERT INTO public.cheque
VALUES (125, 22, 17, 1638.63, 1638.63, 0.00);
INSERT INTO public.cheque
VALUES (154, 12, 9, 2138.94, 2138.94, 0.00);
INSERT INTO public.cheque
VALUES (17, 29, 45, 29601.90, 29601.90, 0.00);
INSERT INTO public.cheque
VALUES (179, 16, 24, 13971.60, 13971.60, 0.00);
INSERT INTO public.cheque
VALUES (214, 25, 12, 5070.60, 5070.60, 0.00);
INSERT INTO public.cheque
VALUES (33, 16, 48, 23012.16, 21773.06, 0.00);
INSERT INTO public.cheque
VALUES (115, 2, 35, 17150.00, 17150.00, 0.00);
INSERT INTO public.cheque
VALUES (183, 7, 43, 13980.59, 13523.85, 0.00);
INSERT INTO public.cheque
VALUES (257, 25, 43, 20307.18, 16467.78, 0.00);
INSERT INTO public.cheque
VALUES (25, 8, 6, 1117.20, 1117.20, 0.00);
INSERT INTO public.cheque
VALUES (254, 10, 4, 2040.00, 2040.00, 0.00);
INSERT INTO public.cheque
VALUES (174, 27, 27, 3494.88, 3494.88, 0.00);
INSERT INTO public.cheque
VALUES (10, 23, 22, 13810.72, 13810.72, 0.00);
INSERT INTO public.cheque
VALUES (57, 4, 4, 2125.00, 1742.87, 0.00);
INSERT INTO public.cheque
VALUES (171, 26, 5, 3712.90, 3499.58, 213.32);
INSERT INTO public.cheque
VALUES (253, 2, 2, 980.00, 980.00, 0.00);
INSERT INTO public.cheque
VALUES (52, 4, 40, 18050.00, 15997.74, 0.00);
INSERT INTO public.cheque
VALUES (8, 30, 12, 5174.28, 5174.28, 0.00);
INSERT INTO public.cheque
VALUES (262, 29, 18, 13233.78, 13233.78, 0.00);
INSERT INTO public.cheque
VALUES (229, 18, 32, 29005.12, 28677.04, 328.08);
INSERT INTO public.cheque
VALUES (55, 6, 18, 3748.50, 3748.50, 0.00);
INSERT INTO public.cheque
VALUES (67, 5, 8, 1513.04, 1513.04, 0.00);
INSERT INTO public.cheque
VALUES (181, 4, 11, 5843.75, 5688.84, 154.91);
INSERT INTO public.cheque
VALUES (221, 6, 36, 6368.04, 5491.24, 876.80);
INSERT INTO public.cheque
VALUES (17, 9, 31, 27667.50, 27667.50, 0.00);
INSERT INTO public.cheque
VALUES (199, 17, 11, 40.92, 38.97, 0.00);
INSERT INTO public.cheque
VALUES (150, 16, 10, 4794.20, 4794.20, 0.00);
INSERT INTO public.cheque
VALUES (33, 28, 32, 14437.76, 12721.30, 0.00);
INSERT INTO public.cheque
VALUES (8, 17, 33, 90.42, 90.23, 0.19);
INSERT INTO public.cheque
VALUES (223, 5, 45, 5607.00, 4780.60, 0.00);
INSERT INTO public.cheque
VALUES (281, 5, 43, 5357.80, 4345.05, 1012.75);
INSERT INTO public.cheque
VALUES (112, 20, 47, 11324.18, 9944.03, 0.00);
INSERT INTO public.cheque
VALUES (257, 3, 5, 261.75, 214.37, 47.38);
INSERT INTO public.cheque
VALUES (168, 10, 35, 11760.00, 11370.64, 0.00);
INSERT INTO public.cheque
VALUES (33, 20, 35, 6944.70, 6944.70, 0.00);
INSERT INTO public.cheque
VALUES (252, 1, 44, 12320.00, 12320.00, 0.00);
INSERT INTO public.cheque
VALUES (21, 9, 6, 5355.00, 5355.00, 0.00);
INSERT INTO public.cheque
VALUES (203, 8, 33, 6144.60, 4998.23, 0.00);
INSERT INTO public.cheque
VALUES (86, 28, 17, 7670.06, 7625.42, 44.64);
INSERT INTO public.cheque
VALUES (63, 28, 25, 11279.50, 11279.50, 0.00);
INSERT INTO public.cheque
VALUES (139, 29, 13, 8551.66, 7997.34, 554.32);
INSERT INTO public.cheque
VALUES (171, 19, 9, 3867.39, 3867.39, 0.00);
INSERT INTO public.cheque
VALUES (147, 27, 18, 2329.92, 1920.63, 409.29);
INSERT INTO public.cheque
VALUES (9, 29, 14, 9209.48, 9209.48, 0.00);
INSERT INTO public.cheque
VALUES (97, 9, 13, 7644.00, 7042.14, 601.86);
INSERT INTO public.cheque
VALUES (41, 9, 8, 6064.80, 6064.80, 0.00);
INSERT INTO public.cheque
VALUES (5, 21, 39, 1574.04, 1362.14, 0.00);
INSERT INTO public.cheque
VALUES (67, 24, 5, 2861.25, 2861.25, 0.00);
INSERT INTO public.cheque
VALUES (98, 29, 26, 14084.98, 14084.98, 0.00);
INSERT INTO public.cheque
VALUES (176, 8, 12, 3391.56, 3391.56, 0.00);
INSERT INTO public.cheque
VALUES (4, 5, 36, 5783.40, 5783.40, 0.00);
INSERT INTO public.cheque
VALUES (129, 7, 45, 14630.85, 14026.23, 0.00);
INSERT INTO public.cheque
VALUES (162, 8, 45, 12718.35, 11113.86, 1604.49);
INSERT INTO public.cheque
VALUES (51, 12, 40, 7828.80, 7828.80, 0.00);
INSERT INTO public.cheque
VALUES (229, 26, 29, 24068.26, 24068.26, 0.00);
INSERT INTO public.cheque
VALUES (119, 9, 25, 22312.50, 22312.50, 0.00);
INSERT INTO public.cheque
VALUES (26, 12, 25, 4893.00, 4722.58, 170.42);
INSERT INTO public.cheque
VALUES (51, 2, 8, 3920.00, 3920.00, 0.00);
INSERT INTO public.cheque
VALUES (103, 16, 43, 25032.45, 22359.39, 0.00);
INSERT INTO public.cheque
VALUES (228, 21, 6, 294.06, 278.72, 0.00);
INSERT INTO public.cheque
VALUES (87, 21, 21, 1029.21, 1029.21, 0.00);
INSERT INTO public.cheque
VALUES (35, 23, 39, 24482.64, 24482.64, 0.00);
INSERT INTO public.cheque
VALUES (124, 10, 19, 9690.00, 8108.64, 0.00);
INSERT INTO public.cheque
VALUES (261, 24, 13, 6126.51, 6126.51, 0.00);
INSERT INTO public.cheque
VALUES (274, 29, 19, 12498.58, 12498.58, 0.00);
INSERT INTO public.cheque
VALUES (269, 25, 42, 19834.92, 19834.92, 0.00);
INSERT INTO public.cheque
VALUES (188, 16, 5, 2910.75, 2864.21, 0.00);
INSERT INTO public.cheque
VALUES (91, 27, 15, 1941.60, 1941.60, 0.00);
INSERT INTO public.cheque
VALUES (241, 27, 33, 3517.80, 2866.38, 0.00);
INSERT INTO public.cheque
VALUES (270, 24, 38, 17908.26, 17908.26, 0.00);
INSERT INTO public.cheque
VALUES (270, 8, 39, 7261.80, 6188.79, 0.00);
INSERT INTO public.cheque
VALUES (58, 18, 7, 5677.00, 5677.00, 0.00);
INSERT INTO public.cheque
VALUES (205, 12, 21, 5578.02, 5036.91, 541.11);
INSERT INTO public.cheque
VALUES (17, 20, 6, 1445.64, 1433.26, 12.38);
INSERT INTO public.cheque
VALUES (27, 26, 26, 19307.08, 18677.39, 0.00);
INSERT INTO public.cheque
VALUES (70, 16, 22, 14314.08, 13386.19, 927.89);
INSERT INTO public.cheque
VALUES (132, 23, 31, 14339.36, 14339.36, 0.00);
INSERT INTO public.cheque
VALUES (136, 30, 49, 25655.42, 24393.64, 1261.78);
INSERT INTO public.cheque
VALUES (173, 7, 8, 1713.60, 1418.58, 0.00);
INSERT INTO public.cheque
VALUES (227, 14, 49, 12631.71, 10772.27, 0.00);
INSERT INTO public.cheque
VALUES (197, 19, 49, 17340.12, 13905.32, 3434.80);
INSERT INTO public.cheque
VALUES (34, 11, 10, 739.80, 739.80, 0.00);
INSERT INTO public.cheque
VALUES (2, 18, 37, 24711.56, 21203.20, 3508.36);
INSERT INTO public.cheque
VALUES (110, 7, 25, 8128.25, 8128.25, 0.00);
INSERT INTO public.cheque
VALUES (153, 5, 48, 9078.24, 8304.87, 773.37);
INSERT INTO public.cheque
VALUES (233, 10, 49, 16464.00, 16464.00, 0.00);
INSERT INTO public.cheque
VALUES (202, 20, 42, 8333.64, 7316.93, 0.00);
INSERT INTO public.cheque
VALUES (32, 29, 9, 5920.38, 5920.38, 0.00);
INSERT INTO public.cheque
VALUES (163, 18, 27, 24473.07, 24473.07, 0.00);
INSERT INTO public.cheque
VALUES (176, 5, 46, 8699.98, 8699.98, 0.00);
INSERT INTO public.cheque
VALUES (9, 11, 44, 3255.12, 3255.12, 0.00);
INSERT INTO public.cheque
VALUES (234, 10, 26, 13260.00, 11692.30, 1567.70);
INSERT INTO public.cheque
VALUES (55, 7, 37, 12029.81, 12029.81, 0.00);
INSERT INTO public.cheque
VALUES (114, 8, 13, 3120.91, 2692.37, 428.54);
INSERT INTO public.cheque
VALUES (43, 26, 5, 4149.70, 4149.70, 0.00);
INSERT INTO public.cheque
VALUES (208, 26, 25, 20748.50, 17521.73, 0.00);
INSERT INTO public.cheque
VALUES (57, 20, 2, 481.88, 481.88, 0.00);
INSERT INTO public.cheque
VALUES (41, 14, 6, 1728.72, 1513.03, 215.69);
INSERT INTO public.cheque
VALUES (49, 30, 48, 20697.12, 20697.12, 0.00);
INSERT INTO public.cheque
VALUES (231, 9, 50, 29400.00, 29400.00, 0.00);
INSERT INTO public.cheque
VALUES (201, 27, 2, 213.20, 213.20, 0.00);
INSERT INTO public.cheque
VALUES (124, 21, 11, 539.11, 521.78, 0.00);
INSERT INTO public.cheque
VALUES (1, 17, 39, 106.86, 106.86, 0.00);
INSERT INTO public.cheque
VALUES (139, 29, 29, 19076.78, 19076.78, 0.00);
INSERT INTO public.cheque
VALUES (256, 15, 25, 5212.75, 5212.75, 0.00);
INSERT INTO public.cheque
VALUES (124, 9, 34, 30345.00, 30345.00, 0.00);
INSERT INTO public.cheque
VALUES (111, 21, 14, 686.14, 686.14, 0.00);
INSERT INTO public.cheque
VALUES (138, 28, 42, 23010.12, 18824.54, 0.00);
INSERT INTO public.cheque
VALUES (186, 10, 40, 20400.00, 20400.00, 0.00);
INSERT INTO public.cheque
VALUES (266, 3, 20, 1232.60, 1232.60, 0.00);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: student
--

INSERT INTO public.customer
VALUES (1, 'Иван', 'Петров', 'hjdlaks@gsdhjkasdf.com', '+71623746352');
INSERT INTO public.customer
VALUES (2, 'Петр', 'Иванов', 'jdjsks@sldouiu.re', '+79376549826');
INSERT INTO public.customer
VALUES (3, 'Семен', 'Сидоров', 'ldld@rretyu.me', '+79842354651');
INSERT INTO public.customer
VALUES (4, 'Сидор', 'Семенов', 'wewrt@fgsfsgha.nu', '+78876452435');
INSERT INTO public.customer
VALUES (5, 'Сергей', 'Сергеев', 'audgt@gdhja.ka', '+71723765643');


--
-- Data for Name: customer_card; Type: TABLE DATA; Schema: public; Owner: student
--

INSERT INTO public.customer_card
VALUES (1, 1);
INSERT INTO public.customer_card
VALUES (2, 2);
INSERT INTO public.customer_card
VALUES (3, 3);
INSERT INTO public.customer_card
VALUES (4, 4);
INSERT INTO public.customer_card
VALUES (5, 5);
INSERT INTO public.customer_card
VALUES (6, 2);
INSERT INTO public.customer_card
VALUES (7, 3);
INSERT INTO public.customer_card
VALUES (8, 5);
INSERT INTO public.customer_card
VALUES (9, 1);
INSERT INTO public.customer_card
VALUES (10, 2);


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: student
--

INSERT INTO public."group"
VALUES (1, 'Дорого, богато');
INSERT INTO public."group"
VALUES (2, 'На сладенькое');
INSERT INTO public."group"
VALUES (3, 'Для настроения');
INSERT INTO public."group"
VALUES (4, 'Грп. 1');
INSERT INTO public."group"
VALUES (5, 'Грп. 2');
INSERT INTO public."group"
VALUES (6, 'Грп. 3');


--
-- Data for Name: sku; Type: TABLE DATA; Schema: public; Owner: student
--

INSERT INTO public.sku
VALUES (3, 'Икра черная "Президентская" (имитация)', 1);
INSERT INTO public.sku
VALUES (4, 'Конфеты "Поп ас ли плас"', 2);
INSERT INTO public.sku
VALUES (5, 'Шок. бат. "Трикс"', 2);
INSERT INTO public.sku
VALUES (6, 'Шок. бат. "Маркс"', 2);
INSERT INTO public.sku
VALUES (7, 'Яйца перепелинные (имитация) ', 1);
INSERT INTO public.sku
VALUES (8, 'Водка "Мечта интеллигента" (завод "Красная белочка")', 3);
INSERT INTO public.sku
VALUES (9, 'Коньяк "Коньяк" (ИП Хатачирян)', 3);
INSERT INTO public.sku
VALUES (10, 'Коньяк "Не совсем коньяк, но пойдет" (ИП Петров)', 3);
INSERT INTO public.sku
VALUES (1, 'Фуагра с креветочным молоком (свинокомплекс "Веселый пятачок")', 1);
INSERT INTO public.sku
VALUES (2, 'Свинина мраморная', 1);
INSERT INTO public.sku
VALUES (11, 'Товар 1', 4);
INSERT INTO public.sku
VALUES (12, 'Товар 2', 4);
INSERT INTO public.sku
VALUES (13, 'Товар 3', 5);
INSERT INTO public.sku
VALUES (14, 'Товар 4', 5);
INSERT INTO public.sku
VALUES (15, 'Товар 5', 5);
INSERT INTO public.sku
VALUES (16, 'Товар 6', 6);
INSERT INTO public.sku
VALUES (17, 'Товар 7', 6);
INSERT INTO public.sku
VALUES (18, 'Товар 8', 5);
INSERT INTO public.sku
VALUES (19, 'Товар 9', 4);
INSERT INTO public.sku
VALUES (20, 'Товар 10', 5);
INSERT INTO public.sku
VALUES (21, 'Товар 11', 4);
INSERT INTO public.sku
VALUES (22, 'Товар 12', 5);
INSERT INTO public.sku
VALUES (23, 'Товар 13', 6);
INSERT INTO public.sku
VALUES (24, 'Товар 14', 6);
INSERT INTO public.sku
VALUES (25, 'Товар 15', 5);
INSERT INTO public.sku
VALUES (26, 'Товар 16', 4);
INSERT INTO public.sku
VALUES (27, 'Товар 17', 3);
INSERT INTO public.sku
VALUES (28, 'Товар 18', 2);
INSERT INTO public.sku
VALUES (29, 'Товар 19', 1);
INSERT INTO public.sku
VALUES (30, 'Товар 20', 2);


--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: student
--

INSERT INTO public.store
VALUES (1, 11, 43.52, 60.93);
INSERT INTO public.store
VALUES (1, 12, 139.80, 195.72);
INSERT INTO public.store
VALUES (1, 13, 103.46, 144.84);
INSERT INTO public.store
VALUES (1, 14, 151.64, 212.30);
INSERT INTO public.store
VALUES (1, 15, 122.65, 171.71);
INSERT INTO public.store
VALUES (1, 16, 342.44, 479.42);
INSERT INTO public.store
VALUES (1, 17, 1.96, 2.74);
INSERT INTO public.store
VALUES (1, 18, 477.06, 667.88);
INSERT INTO public.store
VALUES (1, 19, 252.77, 353.88);
INSERT INTO public.store
VALUES (1, 20, 141.73, 198.42);
INSERT INTO public.store
VALUES (1, 21, 28.83, 40.36);
INSERT INTO public.store
VALUES (1, 22, 68.85, 96.39);
INSERT INTO public.store
VALUES (1, 23, 330.40, 462.56);
INSERT INTO public.store
VALUES (1, 24, 336.62, 471.27);
INSERT INTO public.store
VALUES (1, 25, 248.56, 347.98);
INSERT INTO public.store
VALUES (1, 26, 436.81, 611.53);
INSERT INTO public.store
VALUES (1, 27, 76.14, 106.60);
INSERT INTO public.store
VALUES (1, 28, 322.27, 451.18);
INSERT INTO public.store
VALUES (1, 29, 386.95, 541.73);
INSERT INTO public.store
VALUES (1, 30, 307.99, 431.19);
INSERT INTO public.store
VALUES (1, 1, 200.00, 280.00);
INSERT INTO public.store
VALUES (1, 2, 350.00, 490.00);
INSERT INTO public.store
VALUES (1, 3, 29.00, 40.60);
INSERT INTO public.store
VALUES (1, 4, 250.00, 350.00);
INSERT INTO public.store
VALUES (1, 5, 89.00, 124.60);
INSERT INTO public.store
VALUES (1, 6, 98.00, 137.20);
INSERT INTO public.store
VALUES (1, 7, 153.00, 214.20);
INSERT INTO public.store
VALUES (1, 8, 133.00, 186.20);
INSERT INTO public.store
VALUES (1, 9, 420.00, 588.00);
INSERT INTO public.store
VALUES (1, 10, 240.00, 336.00);
INSERT INTO public.store
VALUES (2, 1, 250.00, 425.00);
INSERT INTO public.store
VALUES (2, 2, 437.50, 743.75);
INSERT INTO public.store
VALUES (2, 3, 36.25, 61.63);
INSERT INTO public.store
VALUES (2, 4, 312.50, 531.25);
INSERT INTO public.store
VALUES (2, 5, 111.25, 189.13);
INSERT INTO public.store
VALUES (2, 6, 122.50, 208.25);
INSERT INTO public.store
VALUES (2, 7, 191.25, 325.13);
INSERT INTO public.store
VALUES (2, 8, 166.25, 282.63);
INSERT INTO public.store
VALUES (2, 9, 525.00, 892.50);
INSERT INTO public.store
VALUES (2, 10, 300.00, 510.00);
INSERT INTO public.store
VALUES (2, 11, 43.52, 73.98);
INSERT INTO public.store
VALUES (2, 12, 139.80, 237.66);
INSERT INTO public.store
VALUES (2, 13, 103.46, 175.88);
INSERT INTO public.store
VALUES (2, 14, 151.64, 257.79);
INSERT INTO public.store
VALUES (2, 15, 122.65, 208.51);
INSERT INTO public.store
VALUES (2, 16, 342.44, 582.15);
INSERT INTO public.store
VALUES (2, 17, 1.96, 3.33);
INSERT INTO public.store
VALUES (2, 18, 477.06, 811.00);
INSERT INTO public.store
VALUES (2, 19, 252.77, 429.71);
INSERT INTO public.store
VALUES (2, 20, 141.73, 240.94);
INSERT INTO public.store
VALUES (2, 21, 28.83, 49.01);
INSERT INTO public.store
VALUES (2, 22, 68.85, 117.05);
INSERT INTO public.store
VALUES (2, 23, 330.40, 561.68);
INSERT INTO public.store
VALUES (2, 24, 336.62, 572.25);
INSERT INTO public.store
VALUES (2, 25, 248.56, 422.55);
INSERT INTO public.store
VALUES (2, 26, 436.81, 742.58);
INSERT INTO public.store
VALUES (2, 27, 76.14, 129.44);
INSERT INTO public.store
VALUES (2, 28, 322.27, 547.86);
INSERT INTO public.store
VALUES (2, 29, 386.95, 657.82);
INSERT INTO public.store
VALUES (2, 30, 307.99, 523.58);
INSERT INTO public.store
VALUES (3, 1, 190.00, 361.00);
INSERT INTO public.store
VALUES (3, 2, 332.50, 631.75);
INSERT INTO public.store
VALUES (3, 3, 27.55, 52.35);
INSERT INTO public.store
VALUES (3, 4, 237.50, 451.25);
INSERT INTO public.store
VALUES (3, 5, 84.55, 160.65);
INSERT INTO public.store
VALUES (3, 6, 93.10, 176.89);
INSERT INTO public.store
VALUES (3, 7, 145.35, 276.17);
INSERT INTO public.store
VALUES (3, 8, 126.35, 240.07);
INSERT INTO public.store
VALUES (3, 9, 399.00, 758.10);
INSERT INTO public.store
VALUES (3, 10, 228.00, 433.20);
INSERT INTO public.store
VALUES (3, 11, 43.52, 82.69);
INSERT INTO public.store
VALUES (3, 12, 139.80, 265.62);
INSERT INTO public.store
VALUES (3, 13, 103.46, 196.57);
INSERT INTO public.store
VALUES (3, 14, 151.64, 288.12);
INSERT INTO public.store
VALUES (3, 15, 122.65, 233.04);
INSERT INTO public.store
VALUES (3, 16, 342.44, 650.64);
INSERT INTO public.store
VALUES (3, 17, 1.96, 3.72);
INSERT INTO public.store
VALUES (3, 18, 477.06, 906.41);
INSERT INTO public.store
VALUES (3, 19, 252.77, 480.26);
INSERT INTO public.store
VALUES (3, 20, 141.73, 269.29);
INSERT INTO public.store
VALUES (3, 21, 28.83, 54.78);
INSERT INTO public.store
VALUES (3, 22, 68.85, 130.82);
INSERT INTO public.store
VALUES (3, 23, 330.40, 627.76);
INSERT INTO public.store
VALUES (3, 24, 336.62, 639.58);
INSERT INTO public.store
VALUES (3, 25, 248.56, 472.26);
INSERT INTO public.store
VALUES (3, 26, 436.81, 829.94);
INSERT INTO public.store
VALUES (3, 27, 76.14, 144.67);
INSERT INTO public.store
VALUES (3, 28, 322.27, 612.31);
INSERT INTO public.store
VALUES (3, 29, 386.95, 735.21);
INSERT INTO public.store
VALUES (3, 30, 307.99, 585.18);


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: student
--

INSERT INTO public.transaction
VALUES (36, 1, 95616.27, '2022-08-26 13:32:17.014775', 2);
INSERT INTO public.transaction
VALUES (37, 1, 128077.92, '2022-06-17 04:10:17.014775', 3);
INSERT INTO public.transaction
VALUES (38, 5, 50681.63, '2022-08-14 12:32:17.014775', 2);
INSERT INTO public.transaction
VALUES (39, 8, 111810.99, '2023-05-28 17:17:17.014775', 2);
INSERT INTO public.transaction
VALUES (40, 10, 49848.66, '2023-01-05 12:10:17.014775', 3);
INSERT INTO public.transaction
VALUES (41, 5, 198003.36, '2022-09-09 20:13:17.014775', 3);
INSERT INTO public.transaction
VALUES (42, 7, 60636.03, '2023-03-18 04:38:17.014775', 2);
INSERT INTO public.transaction
VALUES (43, 4, 85314.30, '2022-10-12 06:10:17.014775', 3);
INSERT INTO public.transaction
VALUES (44, 5, 58909.41, '2022-08-21 16:54:17.014775', 2);
INSERT INTO public.transaction
VALUES (45, 3, 84394.52, '2022-09-30 14:04:17.014775', 2);
INSERT INTO public.transaction
VALUES (46, 5, 113889.21, '2022-10-09 12:38:17.014775', 2);
INSERT INTO public.transaction
VALUES (47, 4, 45875.78, '2022-10-02 22:19:17.014775', 1);
INSERT INTO public.transaction
VALUES (48, 8, 59731.71, '2023-03-17 17:45:17.014775', 2);
INSERT INTO public.transaction
VALUES (49, 1, 87292.29, '2023-03-11 13:55:17.014775', 1);
INSERT INTO public.transaction
VALUES (50, 9, 118934.93, '2022-12-27 08:20:17.014775', 1);
INSERT INTO public.transaction
VALUES (51, 1, 23927.64, '2022-09-21 18:58:17.014775', 1);
INSERT INTO public.transaction
VALUES (52, 6, 118210.55, '2022-07-08 10:31:17.014775', 3);
INSERT INTO public.transaction
VALUES (53, 6, 123472.50, '2022-06-23 00:14:17.014775', 1);
INSERT INTO public.transaction
VALUES (54, 3, 106540.06, '2023-01-15 21:27:17.014775', 2);
INSERT INTO public.transaction
VALUES (55, 2, 51057.30, '2022-10-15 14:19:17.014775', 2);
INSERT INTO public.transaction
VALUES (56, 6, 85255.14, '2022-12-06 07:22:17.014775', 2);
INSERT INTO public.transaction
VALUES (57, 4, 67219.26, '2022-08-15 04:36:17.014775', 2);
INSERT INTO public.transaction
VALUES (58, 4, 62965.00, '2022-08-20 20:22:17.014775', 2);
INSERT INTO public.transaction
VALUES (59, 2, 133982.00, '2022-10-25 18:05:17.014775', 2);
INSERT INTO public.transaction
VALUES (60, 9, 41607.21, '2022-11-22 19:35:17.014775', 1);
INSERT INTO public.transaction
VALUES (61, 9, 142711.67, '2022-07-09 00:00:17.014775', 3);
INSERT INTO public.transaction
VALUES (62, 9, 26802.78, '2023-01-07 21:54:17.014775', 1);
INSERT INTO public.transaction
VALUES (63, 3, 27620.83, '2023-03-24 03:28:17.014775', 1);
INSERT INTO public.transaction
VALUES (64, 2, 70793.59, '2023-06-12 16:10:17.014775', 2);
INSERT INTO public.transaction
VALUES (65, 10, 75165.37, '2023-01-29 02:17:17.014775', 3);
INSERT INTO public.transaction
VALUES (66, 6, 117947.70, '2023-02-15 18:45:17.014775', 2);
INSERT INTO public.transaction
VALUES (67, 3, 86616.29, '2023-01-12 11:32:17.014775', 2);
INSERT INTO public.transaction
VALUES (68, 9, 68904.95, '2022-06-18 11:06:17.014775', 2);
INSERT INTO public.transaction
VALUES (69, 3, 41929.24, '2023-05-06 22:41:17.014775', 2);
INSERT INTO public.transaction
VALUES (70, 1, 80422.52, '2023-03-15 04:14:17.014775', 3);
INSERT INTO public.transaction
VALUES (71, 2, 46445.78, '2022-10-13 08:15:17.014775', 1);
INSERT INTO public.transaction
VALUES (72, 1, 46271.40, '2022-09-11 02:58:17.014775', 3);
INSERT INTO public.transaction
VALUES (73, 4, 91302.37, '2022-09-26 10:03:17.014775', 2);
INSERT INTO public.transaction
VALUES (74, 8, 83592.90, '2023-02-27 13:12:17.014775', 2);
INSERT INTO public.transaction
VALUES (75, 1, 71779.30, '2023-03-04 04:38:17.014775', 3);
INSERT INTO public.transaction
VALUES (76, 5, 77481.11, '2022-08-07 10:53:17.014775', 2);
INSERT INTO public.transaction
VALUES (77, 6, 119883.71, '2022-11-19 03:07:17.014775', 2);
INSERT INTO public.transaction
VALUES (78, 5, 47926.44, '2023-04-30 05:43:17.014775', 1);
INSERT INTO public.transaction
VALUES (79, 8, 79201.03, '2022-09-08 08:04:17.014775', 1);
INSERT INTO public.transaction
VALUES (80, 8, 68106.39, '2023-04-24 00:41:17.014775', 2);
INSERT INTO public.transaction
VALUES (81, 3, 41758.56, '2022-12-07 08:39:17.014775', 2);
INSERT INTO public.transaction
VALUES (82, 6, 83922.30, '2022-07-27 05:44:17.014775', 2);
INSERT INTO public.transaction
VALUES (83, 9, 87423.06, '2023-04-22 17:52:17.014775', 3);
INSERT INTO public.transaction
VALUES (84, 9, 57932.25, '2023-01-30 13:42:17.014775', 2);
INSERT INTO public.transaction
VALUES (85, 8, 52859.18, '2022-12-12 12:27:17.014775', 1);
INSERT INTO public.transaction
VALUES (86, 1, 64900.11, '2023-05-22 02:35:17.014775', 1);
INSERT INTO public.transaction
VALUES (87, 8, 125574.65, '2022-07-13 18:14:17.014775', 2);
INSERT INTO public.transaction
VALUES (88, 7, 62371.26, '2022-12-30 13:10:17.014775', 1);
INSERT INTO public.transaction
VALUES (89, 5, 194838.17, '2023-04-07 18:11:17.014775', 2);
INSERT INTO public.transaction
VALUES (90, 6, 52493.02, '2023-01-20 10:20:17.014775', 2);
INSERT INTO public.transaction
VALUES (91, 9, 43013.81, '2023-05-29 12:28:17.014775', 2);
INSERT INTO public.transaction
VALUES (92, 6, 88397.17, '2023-01-03 12:35:17.014775', 1);
INSERT INTO public.transaction
VALUES (93, 9, 74575.50, '2022-06-28 19:46:17.014775', 2);
INSERT INTO public.transaction
VALUES (94, 10, 99160.48, '2023-03-12 15:49:17.014775', 2);
INSERT INTO public.transaction
VALUES (95, 8, 48937.41, '2022-08-03 11:45:17.014775', 2);
INSERT INTO public.transaction
VALUES (96, 5, 130070.66, '2022-08-06 18:31:17.014775', 2);
INSERT INTO public.transaction
VALUES (97, 4, 145053.40, '2022-07-04 01:49:17.014775', 1);
INSERT INTO public.transaction
VALUES (98, 10, 55589.84, '2023-03-06 22:53:17.014775', 1);
INSERT INTO public.transaction
VALUES (99, 4, 87831.35, '2022-09-01 03:05:17.014775', 3);
INSERT INTO public.transaction
VALUES (100, 6, 51066.50, '2023-05-09 01:49:17.014775', 2);
INSERT INTO public.transaction
VALUES (101, 7, 144164.79, '2022-12-27 21:08:17.014775', 2);
INSERT INTO public.transaction
VALUES (102, 9, 71221.82, '2022-12-13 16:50:17.014775', 1);
INSERT INTO public.transaction
VALUES (103, 7, 149432.22, '2023-01-16 17:27:17.014775', 2);
INSERT INTO public.transaction
VALUES (104, 7, 81400.61, '2022-07-09 07:48:17.014775', 2);
INSERT INTO public.transaction
VALUES (105, 3, 67628.13, '2022-08-22 04:28:17.014775', 1);
INSERT INTO public.transaction
VALUES (5, 4, 54677.86, '2023-04-14 06:13:58', 1);
INSERT INTO public.transaction
VALUES (26, 1, 75747.10, '2022-08-20 15:16:25.666624', 1);
INSERT INTO public.transaction
VALUES (30, 5, 143513.71, '2023-06-03 17:14:26.547486', 2);
INSERT INTO public.transaction
VALUES (2, 2, 39556.35, '2022-12-17 10:07:53', 1);
INSERT INTO public.transaction
VALUES (14, 4, 57570.39, '2023-01-10 00:44:23.362386', 3);
INSERT INTO public.transaction
VALUES (3, 3, 56692.78, '2023-01-20 08:08:05', 2);
INSERT INTO public.transaction
VALUES (32, 7, 123758.47, '2022-11-02 14:22:26.889939', 2);
INSERT INTO public.transaction
VALUES (28, 3, 65930.15, '2022-08-27 20:08:26.251353', 3);
INSERT INTO public.transaction
VALUES (17, 6, 62413.82, '2022-12-28 08:41:23.841744', 2);
INSERT INTO public.transaction
VALUES (23, 10, 51227.96, '2023-04-22 21:50:25.035334', 3);
INSERT INTO public.transaction
VALUES (18, 7, 117136.39, '2022-11-13 20:57:24.010901', 2);
INSERT INTO public.transaction
VALUES (24, 2, 117592.14, '2022-10-09 06:37:25.226471', 2);
INSERT INTO public.transaction
VALUES (8, 7, 61677.50, '2023-05-08 04:30:20.367379', 1);
INSERT INTO public.transaction
VALUES (21, 1, 75879.21, '2022-10-22 21:12:24.69168', 2);
INSERT INTO public.transaction
VALUES (25, 1, 89679.70, '2022-09-03 15:18:25.441992', 1);
INSERT INTO public.transaction
VALUES (35, 10, 103077.79, '2022-11-06 22:36:27.45967', 3);
INSERT INTO public.transaction
VALUES (6, 5, 128585.44, '2023-04-16 21:09:17', 3);
INSERT INTO public.transaction
VALUES (27, 2, 56247.03, '2022-09-03 08:08:26.10633', 2);
INSERT INTO public.transaction
VALUES (31, 6, 80729.62, '2022-09-22 03:02:26.723389', 2);
INSERT INTO public.transaction
VALUES (15, 5, 57466.36, '2023-01-31 08:54:23.530248', 2);
INSERT INTO public.transaction
VALUES (9, 2, 42178.26, '2022-11-02 17:35:21.734504', 2);
INSERT INTO public.transaction
VALUES (11, 10, 62413.69, '2022-11-01 22:42:22.604135', 2);
INSERT INTO public.transaction
VALUES (33, 8, 11097.82, '2023-03-09 21:06:27.066959', 1);
INSERT INTO public.transaction
VALUES (29, 8, 67337.14, '2022-11-02 16:23:26.403276', 3);
INSERT INTO public.transaction
VALUES (13, 3, 32500.70, '2023-01-14 12:10:22.940164', 3);
INSERT INTO public.transaction
VALUES (10, 9, 87605.82, '2023-04-08 14:52:22.429791', 3);
INSERT INTO public.transaction
VALUES (19, 2, 36299.39, '2022-08-16 10:00:24.195763', 3);
INSERT INTO public.transaction
VALUES (34, 9, 32837.65, '2023-04-06 20:02:27.251014', 2);
INSERT INTO public.transaction
VALUES (12, 10, 128837.20, '2022-11-25 12:40:22.777997', 2);
INSERT INTO public.transaction
VALUES (7, 6, 47500.24, '2023-05-21 12:09:31', 2);
INSERT INTO public.transaction
VALUES (22, 9, 32429.04, '2022-06-28 07:49:24.863764', 3);
INSERT INTO public.transaction
VALUES (20, 8, 42055.86, '2022-06-17 06:13:24.52538', 1);
INSERT INTO public.transaction
VALUES (1, 1, 46872.87, '2022-09-09 16:07:38', 1);
INSERT INTO public.transaction
VALUES (4, 1, 113550.71, '2023-02-09 20:08:39', 3);
INSERT INTO public.transaction
VALUES (16, 2, 35305.73, '2022-12-15 06:10:23.685358', 1);
INSERT INTO public.transaction
VALUES (106, 3, 44989.20, '2022-09-24 17:07:17.014775', 1);
INSERT INTO public.transaction
VALUES (107, 3, 76417.86, '2022-12-15 02:30:17.014775', 1);
INSERT INTO public.transaction
VALUES (108, 3, 49308.74, '2022-11-02 06:26:17.014775', 3);
INSERT INTO public.transaction
VALUES (109, 8, 92234.12, '2022-08-01 00:38:17.014775', 1);
INSERT INTO public.transaction
VALUES (110, 4, 39854.83, '2023-04-13 10:04:17.014775', 2);
INSERT INTO public.transaction
VALUES (111, 8, 49559.58, '2023-04-07 03:50:17.014775', 2);
INSERT INTO public.transaction
VALUES (112, 1, 178775.34, '2023-01-11 01:18:17.014775', 2);
INSERT INTO public.transaction
VALUES (113, 10, 69327.81, '2023-05-19 10:03:17.014775', 3);
INSERT INTO public.transaction
VALUES (114, 4, 63870.17, '2022-08-04 23:18:17.014775', 3);
INSERT INTO public.transaction
VALUES (115, 9, 60122.22, '2023-05-29 01:45:17.014775', 1);
INSERT INTO public.transaction
VALUES (116, 4, 163327.14, '2022-12-09 03:20:17.014775', 3);
INSERT INTO public.transaction
VALUES (117, 2, 76363.43, '2023-04-16 06:02:17.014775', 3);
INSERT INTO public.transaction
VALUES (118, 3, 86427.98, '2022-06-23 20:22:17.014775', 2);
INSERT INTO public.transaction
VALUES (119, 7, 84883.87, '2023-04-28 11:51:17.014775', 2);
INSERT INTO public.transaction
VALUES (120, 4, 59542.89, '2023-05-01 17:15:17.014775', 2);
INSERT INTO public.transaction
VALUES (121, 6, 91588.49, '2022-11-10 00:43:17.014775', 2);
INSERT INTO public.transaction
VALUES (122, 7, 35569.62, '2023-01-31 05:31:17.014775', 1);
INSERT INTO public.transaction
VALUES (123, 5, 49752.91, '2022-12-05 14:08:17.014775', 2);
INSERT INTO public.transaction
VALUES (124, 8, 47542.47, '2023-04-09 19:04:17.014775', 2);
INSERT INTO public.transaction
VALUES (125, 10, 21892.38, '2022-11-02 12:27:17.014775', 1);
INSERT INTO public.transaction
VALUES (126, 4, 108682.59, '2023-05-21 15:13:17.014775', 2);
INSERT INTO public.transaction
VALUES (127, 8, 111356.25, '2022-12-29 02:03:17.014775', 2);
INSERT INTO public.transaction
VALUES (128, 3, 106241.69, '2022-10-20 03:04:17.014775', 3);
INSERT INTO public.transaction
VALUES (129, 7, 72457.30, '2023-04-29 09:18:17.014775', 2);
INSERT INTO public.transaction
VALUES (130, 8, 88583.43, '2022-07-02 04:19:17.014775', 3);
INSERT INTO public.transaction
VALUES (131, 5, 62850.14, '2023-02-02 08:53:17.014775', 2);
INSERT INTO public.transaction
VALUES (132, 4, 69386.79, '2022-10-03 00:30:17.014775', 1);
INSERT INTO public.transaction
VALUES (133, 8, 64153.00, '2023-04-22 08:14:17.014775', 2);
INSERT INTO public.transaction
VALUES (134, 9, 21800.26, '2022-07-11 09:51:17.014775', 1);
INSERT INTO public.transaction
VALUES (135, 8, 86805.34, '2022-06-17 14:07:17.014775', 3);
INSERT INTO public.transaction
VALUES (136, 8, 122546.69, '2022-11-18 00:12:17.014775', 2);
INSERT INTO public.transaction
VALUES (137, 4, 61604.31, '2022-10-24 10:31:17.014775', 1);
INSERT INTO public.transaction
VALUES (138, 2, 170651.88, '2022-07-03 18:31:17.014775', 2);
INSERT INTO public.transaction
VALUES (139, 1, 90521.39, '2022-07-24 05:42:17.014775', 2);
INSERT INTO public.transaction
VALUES (140, 6, 78679.16, '2023-01-26 01:07:17.014775', 3);
INSERT INTO public.transaction
VALUES (141, 3, 95606.65, '2022-11-10 04:42:17.014775', 2);
INSERT INTO public.transaction
VALUES (142, 6, 91573.43, '2023-05-03 04:57:17.014775', 1);
INSERT INTO public.transaction
VALUES (143, 5, 62344.82, '2022-08-16 05:16:17.014775', 2);
INSERT INTO public.transaction
VALUES (144, 8, 64675.88, '2022-10-05 03:57:17.014775', 1);
INSERT INTO public.transaction
VALUES (145, 5, 90921.09, '2022-08-04 21:26:17.014775', 2);
INSERT INTO public.transaction
VALUES (146, 8, 51370.60, '2023-04-07 06:08:17.014775', 2);
INSERT INTO public.transaction
VALUES (147, 2, 84623.63, '2023-03-20 05:37:17.014775', 2);
INSERT INTO public.transaction
VALUES (148, 7, 61478.93, '2022-09-26 21:37:17.014775', 2);
INSERT INTO public.transaction
VALUES (149, 7, 68029.08, '2022-12-25 05:03:17.014775', 2);
INSERT INTO public.transaction
VALUES (150, 4, 182042.97, '2022-07-11 20:06:17.014775', 1);
INSERT INTO public.transaction
VALUES (151, 5, 122189.11, '2022-09-24 12:41:17.014775', 2);
INSERT INTO public.transaction
VALUES (152, 9, 62979.04, '2023-02-21 22:58:17.014775', 1);
INSERT INTO public.transaction
VALUES (153, 6, 48580.35, '2022-09-25 08:24:17.014775', 2);
INSERT INTO public.transaction
VALUES (154, 8, 112243.39, '2022-08-27 20:55:17.014775', 2);
INSERT INTO public.transaction
VALUES (155, 5, 128180.10, '2023-02-17 22:07:17.014775', 2);
INSERT INTO public.transaction
VALUES (156, 9, 120858.57, '2022-09-22 23:29:17.014775', 2);
INSERT INTO public.transaction
VALUES (157, 2, 80488.25, '2022-08-24 02:42:17.014775', 2);
INSERT INTO public.transaction
VALUES (158, 9, 59044.62, '2023-02-27 04:17:17.014775', 1);
INSERT INTO public.transaction
VALUES (159, 3, 60632.66, '2023-02-11 03:42:17.014775', 1);
INSERT INTO public.transaction
VALUES (160, 7, 44379.91, '2022-06-27 23:39:17.014775', 2);
INSERT INTO public.transaction
VALUES (161, 7, 53583.53, '2022-07-17 11:50:17.014775', 2);
INSERT INTO public.transaction
VALUES (162, 3, 119778.68, '2022-11-10 01:15:17.014775', 2);
INSERT INTO public.transaction
VALUES (163, 8, 40249.22, '2023-04-09 03:15:17.014775', 3);
INSERT INTO public.transaction
VALUES (164, 5, 98844.99, '2022-11-23 09:48:17.014775', 2);
INSERT INTO public.transaction
VALUES (165, 3, 6845.91, '2022-09-03 14:37:17.014775', 1);
INSERT INTO public.transaction
VALUES (166, 7, 69430.64, '2022-07-10 09:58:17.014775', 2);
INSERT INTO public.transaction
VALUES (167, 8, 107291.54, '2022-07-17 14:15:17.014775', 2);
INSERT INTO public.transaction
VALUES (168, 7, 59845.98, '2022-12-18 00:02:17.014775', 1);
INSERT INTO public.transaction
VALUES (169, 7, 77496.27, '2022-07-14 22:06:17.014775', 3);
INSERT INTO public.transaction
VALUES (170, 3, 35232.34, '2022-08-22 21:27:17.014775', 1);
INSERT INTO public.transaction
VALUES (171, 3, 44086.92, '2022-11-08 05:26:17.014775', 2);
INSERT INTO public.transaction
VALUES (172, 5, 42081.32, '2022-11-21 09:32:17.014775', 2);
INSERT INTO public.transaction
VALUES (173, 6, 60781.22, '2022-10-28 08:40:17.014775', 1);
INSERT INTO public.transaction
VALUES (174, 4, 86384.23, '2023-01-27 01:44:17.014775', 2);
INSERT INTO public.transaction
VALUES (175, 2, 102784.13, '2023-01-04 16:35:17.014775', 2);
INSERT INTO public.transaction
VALUES (176, 2, 80174.03, '2022-11-08 21:05:17.014775', 2);
INSERT INTO public.transaction
VALUES (177, 2, 23397.58, '2022-06-24 09:36:17.014775', 1);
INSERT INTO public.transaction
VALUES (178, 2, 87952.74, '2022-08-09 03:09:17.014775', 3);
INSERT INTO public.transaction
VALUES (179, 3, 64193.65, '2022-10-25 11:36:17.014775', 2);
INSERT INTO public.transaction
VALUES (180, 1, 152718.38, '2022-10-08 23:02:17.014775', 3);
INSERT INTO public.transaction
VALUES (181, 7, 68458.06, '2022-09-22 13:26:17.014775', 2);
INSERT INTO public.transaction
VALUES (182, 6, 58684.86, '2023-04-27 20:50:17.014775', 1);
INSERT INTO public.transaction
VALUES (183, 3, 99921.08, '2022-10-22 22:39:17.014775', 2);
INSERT INTO public.transaction
VALUES (184, 1, 71106.09, '2023-02-28 17:31:17.014775', 2);
INSERT INTO public.transaction
VALUES (185, 3, 141682.33, '2023-05-12 02:57:17.014775', 1);
INSERT INTO public.transaction
VALUES (186, 4, 35098.35, '2023-06-14 15:23:17.014775', 2);
INSERT INTO public.transaction
VALUES (187, 10, 79517.97, '2022-07-24 19:32:17.014775', 1);
INSERT INTO public.transaction
VALUES (188, 2, 119421.95, '2023-01-10 20:31:17.014775', 2);
INSERT INTO public.transaction
VALUES (189, 3, 104938.97, '2022-08-02 18:38:17.014775', 1);
INSERT INTO public.transaction
VALUES (190, 3, 94225.79, '2023-04-10 03:20:17.014775', 2);
INSERT INTO public.transaction
VALUES (191, 6, 159219.41, '2022-12-07 11:25:17.014775', 3);
INSERT INTO public.transaction
VALUES (192, 6, 53268.44, '2022-09-27 21:40:17.014775', 2);
INSERT INTO public.transaction
VALUES (193, 8, 23486.31, '2023-02-01 16:48:17.014775', 2);
INSERT INTO public.transaction
VALUES (194, 5, 25620.87, '2022-08-02 04:29:17.014775', 3);
INSERT INTO public.transaction
VALUES (195, 1, 68830.24, '2023-06-03 02:19:17.014775', 2);
INSERT INTO public.transaction
VALUES (196, 6, 19111.79, '2022-12-31 03:02:17.014775', 1);
INSERT INTO public.transaction
VALUES (197, 7, 80780.74, '2022-09-25 15:11:17.014775', 1);
INSERT INTO public.transaction
VALUES (198, 3, 159649.66, '2022-07-16 18:08:17.014775', 3);
INSERT INTO public.transaction
VALUES (199, 5, 94538.53, '2022-10-16 22:55:17.014775', 3);
INSERT INTO public.transaction
VALUES (200, 5, 67288.58, '2023-01-02 20:05:17.014775', 3);
INSERT INTO public.transaction
VALUES (201, 8, 31973.42, '2023-04-24 04:38:17.014775', 1);
INSERT INTO public.transaction
VALUES (202, 9, 50706.55, '2023-05-17 12:56:17.014775', 1);
INSERT INTO public.transaction
VALUES (203, 7, 39227.49, '2023-04-21 11:37:17.014775', 1);
INSERT INTO public.transaction
VALUES (204, 7, 91469.77, '2023-04-07 00:10:17.014775', 2);
INSERT INTO public.transaction
VALUES (205, 4, 85131.34, '2023-01-13 20:19:17.014775', 3);
INSERT INTO public.transaction
VALUES (206, 5, 65491.92, '2023-05-16 21:45:17.014775', 3);
INSERT INTO public.transaction
VALUES (207, 10, 10064.18, '2022-09-05 21:39:17.014775', 2);
INSERT INTO public.transaction
VALUES (208, 10, 114542.66, '2022-08-19 23:44:17.014775', 3);
INSERT INTO public.transaction
VALUES (209, 4, 94867.09, '2022-12-08 17:07:17.014775', 2);
INSERT INTO public.transaction
VALUES (210, 3, 59592.16, '2022-09-29 13:44:17.014775', 3);
INSERT INTO public.transaction
VALUES (211, 7, 118868.04, '2022-09-11 21:56:17.014775', 2);
INSERT INTO public.transaction
VALUES (212, 3, 47406.97, '2022-12-06 07:03:17.014775', 1);
INSERT INTO public.transaction
VALUES (213, 1, 32909.25, '2023-05-27 06:08:17.014775', 3);
INSERT INTO public.transaction
VALUES (214, 1, 82486.47, '2022-10-03 01:27:17.014775', 2);
INSERT INTO public.transaction
VALUES (215, 9, 134934.94, '2023-04-13 11:57:17.014775', 3);
INSERT INTO public.transaction
VALUES (216, 10, 72369.78, '2023-06-04 11:54:17.014775', 3);
INSERT INTO public.transaction
VALUES (217, 7, 56955.44, '2023-01-30 03:57:17.014775', 1);
INSERT INTO public.transaction
VALUES (218, 5, 107172.67, '2022-08-20 22:10:17.014775', 2);
INSERT INTO public.transaction
VALUES (219, 2, 120455.16, '2022-11-30 13:51:17.014775', 2);
INSERT INTO public.transaction
VALUES (220, 3, 35435.74, '2023-03-01 19:26:17.014775', 2);
INSERT INTO public.transaction
VALUES (221, 6, 108918.36, '2022-08-05 12:58:17.014775', 3);
INSERT INTO public.transaction
VALUES (222, 9, 56727.14, '2023-01-24 04:17:17.014775', 1);
INSERT INTO public.transaction
VALUES (223, 4, 119707.31, '2022-07-03 15:52:17.014775', 1);
INSERT INTO public.transaction
VALUES (224, 4, 54360.28, '2023-01-31 13:19:17.014775', 2);
INSERT INTO public.transaction
VALUES (225, 8, 96364.57, '2022-09-13 05:54:17.014775', 3);
INSERT INTO public.transaction
VALUES (226, 9, 71714.89, '2022-08-17 10:09:17.014775', 3);
INSERT INTO public.transaction
VALUES (227, 4, 106355.30, '2022-12-16 11:33:17.014775', 2);
INSERT INTO public.transaction
VALUES (228, 1, 21915.97, '2022-12-05 04:48:17.014775', 2);
INSERT INTO public.transaction
VALUES (229, 2, 52393.67, '2023-01-28 07:43:17.014775', 3);
INSERT INTO public.transaction
VALUES (230, 10, 56291.84, '2023-04-12 07:33:17.014775', 2);
INSERT INTO public.transaction
VALUES (231, 10, 33153.14, '2023-04-12 02:37:17.014775', 1);
INSERT INTO public.transaction
VALUES (232, 9, 23949.70, '2022-07-04 23:31:17.014775', 2);
INSERT INTO public.transaction
VALUES (233, 6, 99369.39, '2022-12-02 02:25:17.014775', 1);
INSERT INTO public.transaction
VALUES (234, 8, 112595.76, '2023-01-18 18:07:17.014775', 2);
INSERT INTO public.transaction
VALUES (235, 1, 64030.72, '2022-11-09 11:39:17.014775', 2);
INSERT INTO public.transaction
VALUES (236, 4, 123960.08, '2023-02-12 19:51:17.014775', 2);
INSERT INTO public.transaction
VALUES (237, 3, 44877.26, '2023-03-14 23:22:17.014775', 2);
INSERT INTO public.transaction
VALUES (238, 6, 94321.95, '2022-12-06 07:34:17.014775', 3);
INSERT INTO public.transaction
VALUES (239, 6, 108174.41, '2023-01-19 19:02:17.014775', 3);
INSERT INTO public.transaction
VALUES (240, 8, 83977.93, '2022-10-29 18:28:17.014775', 2);
INSERT INTO public.transaction
VALUES (241, 8, 77997.43, '2022-11-14 01:46:17.014775', 1);
INSERT INTO public.transaction
VALUES (242, 1, 141488.32, '2023-05-17 20:29:17.014775', 2);
INSERT INTO public.transaction
VALUES (243, 2, 31582.94, '2023-04-01 09:34:17.014775', 1);
INSERT INTO public.transaction
VALUES (244, 3, 25125.87, '2022-07-08 23:34:17.014775', 3);
INSERT INTO public.transaction
VALUES (245, 1, 72350.64, '2022-10-22 11:02:17.014775', 2);
INSERT INTO public.transaction
VALUES (246, 4, 100116.26, '2022-09-14 22:56:17.014775', 3);
INSERT INTO public.transaction
VALUES (247, 2, 193730.96, '2022-08-05 11:01:17.014775', 3);
INSERT INTO public.transaction
VALUES (248, 4, 156025.50, '2022-09-06 21:08:17.014775', 2);
INSERT INTO public.transaction
VALUES (249, 10, 102725.28, '2022-07-04 02:38:17.014775', 2);
INSERT INTO public.transaction
VALUES (250, 6, 64011.03, '2022-11-02 23:28:17.014775', 1);
INSERT INTO public.transaction
VALUES (251, 6, 57027.47, '2023-01-29 21:38:17.014775', 2);
INSERT INTO public.transaction
VALUES (252, 9, 35737.16, '2022-08-21 10:41:17.014775', 1);
INSERT INTO public.transaction
VALUES (253, 7, 72321.86, '2022-10-25 15:51:17.014775', 1);
INSERT INTO public.transaction
VALUES (254, 2, 42111.15, '2023-06-10 02:26:17.014775', 2);
INSERT INTO public.transaction
VALUES (255, 10, 49133.91, '2022-09-07 20:38:17.014775', 2);
INSERT INTO public.transaction
VALUES (256, 3, 21090.78, '2022-12-09 07:55:17.014775', 2);
INSERT INTO public.transaction
VALUES (257, 8, 55692.30, '2022-12-29 01:53:17.014775', 3);
INSERT INTO public.transaction
VALUES (258, 8, 122851.48, '2022-08-15 15:19:17.014775', 2);
INSERT INTO public.transaction
VALUES (259, 2, 39573.58, '2022-12-25 16:17:17.014775', 1);
INSERT INTO public.transaction
VALUES (260, 9, 92428.69, '2022-11-07 23:39:17.014775', 1);
INSERT INTO public.transaction
VALUES (261, 5, 88071.67, '2023-02-06 04:37:17.014775', 1);
INSERT INTO public.transaction
VALUES (262, 10, 135165.23, '2022-06-16 04:26:17.014775', 3);
INSERT INTO public.transaction
VALUES (263, 8, 95706.97, '2022-09-30 07:36:17.014775', 2);
INSERT INTO public.transaction
VALUES (264, 10, 119401.81, '2022-10-24 17:16:17.014775', 1);
INSERT INTO public.transaction
VALUES (265, 9, 121359.79, '2022-08-26 17:21:17.014775', 3);
INSERT INTO public.transaction
VALUES (266, 8, 46441.59, '2023-05-23 20:29:17.014775', 2);
INSERT INTO public.transaction
VALUES (267, 2, 118588.28, '2023-03-24 10:11:17.014775', 1);
INSERT INTO public.transaction
VALUES (268, 8, 38866.66, '2022-06-28 08:27:17.014775', 2);
INSERT INTO public.transaction
VALUES (269, 7, 46877.81, '2023-02-11 03:12:17.014775', 3);
INSERT INTO public.transaction
VALUES (270, 4, 65402.31, '2022-12-11 09:53:17.014775', 1);
INSERT INTO public.transaction
VALUES (271, 1, 50656.65, '2023-05-25 17:46:17.014775', 2);
INSERT INTO public.transaction
VALUES (272, 5, 58031.97, '2022-08-03 02:54:17.014775', 2);
INSERT INTO public.transaction
VALUES (273, 7, 88649.53, '2022-06-29 15:09:17.014775', 1);
INSERT INTO public.transaction
VALUES (274, 4, 91564.30, '2022-08-08 04:46:17.014775', 2);
INSERT INTO public.transaction
VALUES (275, 7, 120542.31, '2023-01-30 11:07:17.014775', 2);
INSERT INTO public.transaction
VALUES (276, 8, 64068.04, '2023-06-04 20:56:17.014775', 2);
INSERT INTO public.transaction
VALUES (277, 4, 108145.80, '2022-09-01 10:42:17.014775', 3);
INSERT INTO public.transaction
VALUES (278, 6, 87833.51, '2022-06-18 20:41:17.014775', 2);
INSERT INTO public.transaction
VALUES (279, 10, 80884.65, '2023-04-07 12:07:17.014775', 2);
INSERT INTO public.transaction
VALUES (280, 1, 60936.81, '2022-10-09 11:22:17.014775', 3);
INSERT INTO public.transaction
VALUES (281, 2, 63195.86, '2023-04-27 10:08:17.014775', 1);
INSERT INTO public.transaction
VALUES (282, 8, 102007.30, '2022-11-02 11:16:17.014775', 1);
INSERT INTO public.transaction
VALUES (283, 9, 82116.26, '2023-01-06 04:49:17.014775', 2);
INSERT INTO public.transaction
VALUES (284, 9, 10304.98, '2023-02-07 01:50:17.014775', 1);
INSERT INTO public.transaction
VALUES (285, 5, 11933.51, '2022-07-30 00:05:17.014775', 2);


--
-- Name: customer_Customer_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.SETVAL('public."customer_Customer_ID_seq"', 5, TRUE);


--
-- Name: customer_card_Customer_Card_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.SETVAL('public."customer_card_Customer_Card_ID_seq"', 10, TRUE);


--
-- Name: group_Group_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.SETVAL('public."group_Group_ID_seq"', 6, TRUE);


--
-- Name: sku_sku_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.SETVAL('public.sku_sku_id_seq', 30, TRUE);


--
-- Name: transaction_Transaction_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: student
--

SELECT pg_catalog.SETVAL('public."transaction_Transaction_ID_seq"', 285, TRUE);
*/

--
-- Name: idx_cci_transaction; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX idx_cci_transaction ON public.transaction USING btree ("Customer_Card_ID");


--
-- Name: idx_sku_id_cheque; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX idx_sku_id_cheque ON public.cheque USING btree (sku_id);


--
-- Name: idx_tsi_si_store; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX idx_tsi_si_store ON public.store USING btree ("Transaction_Store_ID", sku_id);



CREATE OR REPLACE PROCEDURE proc_import_file(tbl character varying, file character varying,
                                             sep character varying = NULL)
    LANGUAGE plpgsql
AS
$$
DECLARE
    e character varying = '';
BEGIN
    IF sep IS NULL THEN
        sep := ';';
    END IF;
    IF sep = '\t' THEN
        e = 'E';
    END IF;
    EXECUTE 'copy "' || tbl || '" from ''' || file || '''' || ' with (format csv, delimiter ' || e || '''' ||
            sep || ''')';
    RAISE NOTICE 'Файл %.csv загружен', file;
END
$$;

CREATE OR REPLACE PROCEDURE proc_export_file(tbl character varying, file character varying = NULL,
                                             sep character varying = NULL)
    LANGUAGE plpgsql
AS
$$
BEGIN
    IF sep IS NULL THEN
        sep := ';';
    END IF;
    EXECUTE 'copy "' || tbl || '" to ''' || file || '''' || ' with (format csv, delimiter ''' || sep ||
            ''')';
    RAISE NOTICE 'Создан файл %.csv', file;
END
$$;

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 14.1

-- Started on 2022-02-11 14:03:15 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 711 (class 1247 OID 19134)
-- Name: ENUM_Status; Type: TYPE; Schema: public; Owner: alpha
--

CREATE TYPE public."ENUM_Status" AS ENUM (
    'Accepted',
    'Packed',
    'Shipped'
);


ALTER TYPE public."ENUM_Status" OWNER TO alpha;

--
-- TOC entry 646 (class 1247 OID 17868)
-- Name: enum; Type: TYPE; Schema: public; Owner: alpha
--

CREATE TYPE public.enum AS ENUM (
    'FIRST_ENUM_VALUE',
    'Accepted, packed and shipped',
    'Accepted',
    'Packed',
    'Shipped'
);


ALTER TYPE public.enum OWNER TO alpha;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 18534)
-- Name: Address; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."Address" (
    address_id integer NOT NULL,
    street character varying NOT NULL,
    street_no integer NOT NULL,
    adress_extra character varying,
    "postal code" integer NOT NULL,
    city_id integer,
    country_id integer
);


ALTER TABLE public."Address" OWNER TO alpha;

--
-- TOC entry 216 (class 1259 OID 18810)
-- Name: Address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."Address" ALTER COLUMN address_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Address_address_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 18581)
-- Name: Article; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."Article" (
    article_id integer NOT NULL,
    supplier_id integer,
    name character varying,
    stock integer
);


ALTER TABLE public."Article" OWNER TO alpha;

--
-- TOC entry 218 (class 1259 OID 18970)
-- Name: Article_article_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."Article" ALTER COLUMN article_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Article_article_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 207 (class 1259 OID 18542)
-- Name: City; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."City" (
    name character varying,
    city integer NOT NULL
);


ALTER TABLE public."City" OWNER TO alpha;

--
-- TOC entry 219 (class 1259 OID 18975)
-- Name: City_city_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."City" ALTER COLUMN city ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."City_city_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 208 (class 1259 OID 18550)
-- Name: Country; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."Country" (
    country_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public."Country" OWNER TO alpha;

--
-- TOC entry 220 (class 1259 OID 18977)
-- Name: Country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."Country" ALTER COLUMN country_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Country_country_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 18560)
-- Name: Group; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."Group" (
    group_id integer NOT NULL,
    name character varying,
    description character varying
);


ALTER TABLE public."Group" OWNER TO alpha;

--
-- TOC entry 209 (class 1259 OID 18555)
-- Name: GroupUser; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."GroupUser" (
    "groupUser_id" integer NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE public."GroupUser" OWNER TO alpha;

--
-- TOC entry 222 (class 1259 OID 18981)
-- Name: GroupUser_groupUser_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."GroupUser" ALTER COLUMN "groupUser_id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."GroupUser_groupUser_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 18979)
-- Name: Group_group_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."Group" ALTER COLUMN group_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Group_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 205 (class 1259 OID 18529)
-- Name: Order; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."Order" (
    order_id integer NOT NULL,
    user_id integer,
    status public."ENUM_Status" NOT NULL
);


ALTER TABLE public."Order" OWNER TO alpha;

--
-- TOC entry 212 (class 1259 OID 18576)
-- Name: OrderRow; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."OrderRow" (
    id integer NOT NULL,
    article_id integer,
    order_id integer,
    amount integer
);


ALTER TABLE public."OrderRow" OWNER TO alpha;

--
-- TOC entry 224 (class 1259 OID 18985)
-- Name: OrderRow_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."OrderRow" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."OrderRow_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 18983)
-- Name: Order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."Order" ALTER COLUMN order_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Order_order_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 204 (class 1259 OID 18523)
-- Name: PM; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."PM" (
    pm_id integer NOT NULL,
    "sender (user_id)" integer,
    "reciever (user_id)" integer,
    message character varying
);


ALTER TABLE public."PM" OWNER TO alpha;

--
-- TOC entry 225 (class 1259 OID 18987)
-- Name: PM_pm_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."PM" ALTER COLUMN pm_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."PM_pm_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 18568)
-- Name: Post; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."Post" (
    post_id integer NOT NULL,
    "groupUser_id" integer,
    message character varying
);


ALTER TABLE public."Post" OWNER TO alpha;

--
-- TOC entry 226 (class 1259 OID 18991)
-- Name: Post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."Post" ALTER COLUMN post_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Post_post_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 18597)
-- Name: Supplier; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."Supplier" (
    supplier_id integer NOT NULL,
    name character varying
);


ALTER TABLE public."Supplier" OWNER TO alpha;

--
-- TOC entry 227 (class 1259 OID 18993)
-- Name: Supplier_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."Supplier" ALTER COLUMN supplier_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Supplier_supplier_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 202 (class 1259 OID 18390)
-- Name: Users; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public."Users" (
    users_id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    address_id integer,
    role_id integer
);


ALTER TABLE public."Users" OWNER TO alpha;

--
-- TOC entry 215 (class 1259 OID 18808)
-- Name: Users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public."Users" ALTER COLUMN users_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 203 (class 1259 OID 18398)
-- Name: role; Type: TABLE; Schema: public; Owner: alpha
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    name character varying
);


ALTER TABLE public.role OWNER TO alpha;

--
-- TOC entry 217 (class 1259 OID 18812)
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: alpha
--

ALTER TABLE public.role ALTER COLUMN role_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3051 (class 0 OID 18534)
-- Dependencies: 206
-- Data for Name: Address; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."Address" (address_id, street, street_no, adress_extra, "postal code", city_id, country_id) FROM stdin;
1	charles	123		12345	\N	\N
\.


--
-- TOC entry 3058 (class 0 OID 18581)
-- Dependencies: 213
-- Data for Name: Article; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."Article" (article_id, supplier_id, name, stock) FROM stdin;
1	1	Leash	7
\.


--
-- TOC entry 3052 (class 0 OID 18542)
-- Dependencies: 207
-- Data for Name: City; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."City" (name, city) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 18550)
-- Dependencies: 208
-- Data for Name: Country; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."Country" (country_id, name) FROM stdin;
1	Sweden
\.


--
-- TOC entry 3055 (class 0 OID 18560)
-- Dependencies: 210
-- Data for Name: Group; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."Group" (group_id, name, description) FROM stdin;
\.


--
-- TOC entry 3054 (class 0 OID 18555)
-- Dependencies: 209
-- Data for Name: GroupUser; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."GroupUser" ("groupUser_id", user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3050 (class 0 OID 18529)
-- Dependencies: 205
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."Order" (order_id, user_id, status) FROM stdin;
1	1	Accepted
\.


--
-- TOC entry 3057 (class 0 OID 18576)
-- Dependencies: 212
-- Data for Name: OrderRow; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."OrderRow" (id, article_id, order_id, amount) FROM stdin;
1	1	1	2
\.


--
-- TOC entry 3049 (class 0 OID 18523)
-- Dependencies: 204
-- Data for Name: PM; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."PM" (pm_id, "sender (user_id)", "reciever (user_id)", message) FROM stdin;
\.


--
-- TOC entry 3056 (class 0 OID 18568)
-- Dependencies: 211
-- Data for Name: Post; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."Post" (post_id, "groupUser_id", message) FROM stdin;
\.


--
-- TOC entry 3059 (class 0 OID 18597)
-- Dependencies: 214
-- Data for Name: Supplier; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."Supplier" (supplier_id, name) FROM stdin;
1	Jarn AB
\.


--
-- TOC entry 3047 (class 0 OID 18390)
-- Dependencies: 202
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public."Users" (users_id, name, email, password, address_id, role_id) FROM stdin;
1	charles	cool@gmail.com	lol123	1	\N
\.


--
-- TOC entry 3048 (class 0 OID 18398)
-- Dependencies: 203
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: alpha
--

COPY public.role (role_id, name) FROM stdin;
\.


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 216
-- Name: Address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."Address_address_id_seq"', 1, true);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 218
-- Name: Article_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."Article_article_id_seq"', 1, true);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 219
-- Name: City_city_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."City_city_seq"', 1, false);


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 220
-- Name: Country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."Country_country_id_seq"', 1, true);


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 222
-- Name: GroupUser_groupUser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."GroupUser_groupUser_id_seq"', 1, false);


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 221
-- Name: Group_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."Group_group_id_seq"', 1, false);


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 224
-- Name: OrderRow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."OrderRow_id_seq"', 1, true);


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 223
-- Name: Order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."Order_order_id_seq"', 1, true);


--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 225
-- Name: PM_pm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."PM_pm_id_seq"', 1, false);


--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 226
-- Name: Post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."Post_post_id_seq"', 1, false);


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 227
-- Name: Supplier_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."Supplier_supplier_id_seq"', 1, true);


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 215
-- Name: Users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public."Users_user_id_seq"', 1, true);


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 217
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alpha
--

SELECT pg_catalog.setval('public.role_role_id_seq', 1, false);


--
-- TOC entry 2891 (class 2606 OID 18541)
-- Name: Address Adress_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Adress_pkey" PRIMARY KEY (address_id);


--
-- TOC entry 2905 (class 2606 OID 18588)
-- Name: Article Article_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Article"
    ADD CONSTRAINT "Article_pkey" PRIMARY KEY (article_id);


--
-- TOC entry 2893 (class 2606 OID 18549)
-- Name: City City_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."City"
    ADD CONSTRAINT "City_pkey" PRIMARY KEY (city);


--
-- TOC entry 2895 (class 2606 OID 18554)
-- Name: Country Country_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Country"
    ADD CONSTRAINT "Country_pkey" PRIMARY KEY (country_id);


--
-- TOC entry 2897 (class 2606 OID 18559)
-- Name: GroupUser GroupUser_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."GroupUser"
    ADD CONSTRAINT "GroupUser_pkey" PRIMARY KEY ("groupUser_id");


--
-- TOC entry 2899 (class 2606 OID 18567)
-- Name: Group Group_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY (group_id);


--
-- TOC entry 2903 (class 2606 OID 18580)
-- Name: OrderRow OrderRow_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."OrderRow"
    ADD CONSTRAINT "OrderRow_pkey" PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 18533)
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (order_id);


--
-- TOC entry 2887 (class 2606 OID 18990)
-- Name: PM PM_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."PM"
    ADD CONSTRAINT "PM_pkey" PRIMARY KEY (pm_id);


--
-- TOC entry 2901 (class 2606 OID 18575)
-- Name: Post Post_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "Post_pkey" PRIMARY KEY (post_id);


--
-- TOC entry 2907 (class 2606 OID 18604)
-- Name: Supplier Supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Supplier"
    ADD CONSTRAINT "Supplier_pkey" PRIMARY KEY (supplier_id);


--
-- TOC entry 2883 (class 2606 OID 18397)
-- Name: Users User_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (users_id);


--
-- TOC entry 2885 (class 2606 OID 18522)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- TOC entry 2908 (class 2606 OID 19023)
-- Name: Users fk; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT fk FOREIGN KEY (address_id) REFERENCES public."Address"(address_id) NOT VALID;


--
-- TOC entry 2918 (class 2606 OID 19103)
-- Name: OrderRow fk_article; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."OrderRow"
    ADD CONSTRAINT fk_article FOREIGN KEY (article_id) REFERENCES public."Article"(article_id) NOT VALID;


--
-- TOC entry 2913 (class 2606 OID 19058)
-- Name: Address fk_city; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES public."City"(city) NOT VALID;


--
-- TOC entry 2914 (class 2606 OID 19063)
-- Name: Address fk_country; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES public."Country"(country_id) NOT VALID;


--
-- TOC entry 2917 (class 2606 OID 19098)
-- Name: Post fk_groupUser_ID; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "fk_groupUser_ID" FOREIGN KEY ("groupUser_id") REFERENCES public."GroupUser"("groupUser_id") NOT VALID;


--
-- TOC entry 2916 (class 2606 OID 19093)
-- Name: GroupUser fk_group_id; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."GroupUser"
    ADD CONSTRAINT fk_group_id FOREIGN KEY ("groupUser_id") REFERENCES public."Group"(group_id) NOT VALID;


--
-- TOC entry 2919 (class 2606 OID 19108)
-- Name: OrderRow fk_order; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."OrderRow"
    ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES public."Order"(order_id) NOT VALID;


--
-- TOC entry 2911 (class 2606 OID 19073)
-- Name: PM fk_reciever; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."PM"
    ADD CONSTRAINT fk_reciever FOREIGN KEY ("reciever (user_id)") REFERENCES public."Users"(users_id) NOT VALID;


--
-- TOC entry 2909 (class 2606 OID 19053)
-- Name: Users fk_role; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES public.role(role_id) NOT VALID;


--
-- TOC entry 2910 (class 2606 OID 19068)
-- Name: PM fk_sender; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."PM"
    ADD CONSTRAINT fk_sender FOREIGN KEY ("sender (user_id)") REFERENCES public."Users"(users_id) NOT VALID;


--
-- TOC entry 2920 (class 2606 OID 19083)
-- Name: Article fk_supplier; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Article"
    ADD CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES public."Supplier"(supplier_id) NOT VALID;


--
-- TOC entry 2915 (class 2606 OID 19088)
-- Name: GroupUser fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."GroupUser"
    ADD CONSTRAINT fk_users_id FOREIGN KEY (user_id) REFERENCES public."Users"(users_id) NOT VALID;


--
-- TOC entry 2912 (class 2606 OID 19113)
-- Name: Order fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: alpha
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT fk_users_id FOREIGN KEY (user_id) REFERENCES public."Users"(users_id) NOT VALID;


-- Completed on 2022-02-11 14:03:18 CET

--
-- PostgreSQL database dump complete
--


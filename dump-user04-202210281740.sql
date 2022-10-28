--
-- PostgreSQL database dump
--

-- Dumped from database version 11.17 (Debian 11.17-astra.se1)
-- Dumped by pg_dump version 15.0

-- Started on 2022-10-28 17:40:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 25761)
-- Name: shiny; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA shiny;


SET default_tablespace = '';

--
-- TOC entry 224 (class 1259 OID 27294)
-- Name: agent; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.agent (
    agentid integer NOT NULL,
    title character varying,
    agenttypeid integer,
    address character varying NOT NULL,
    inn character varying,
    kpp character varying NOT NULL,
    directorname character varying NOT NULL,
    phone character varying,
    email character varying NOT NULL,
    logo character varying NOT NULL,
    priority integer
);


--
-- TOC entry 223 (class 1259 OID 27289)
-- Name: agentpriorityhistory; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.agentpriorityhistory (
    agentpriorityhistoryid integer NOT NULL,
    agentid integer,
    changedate date,
    priorityvalue integer
);


--
-- TOC entry 225 (class 1259 OID 27302)
-- Name: agenttype; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.agenttype (
    agenttypeid integer NOT NULL,
    title character varying,
    image character varying NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 27253)
-- Name: material; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.material (
    materialid integer NOT NULL,
    title character varying,
    countinpack integer,
    unit character varying,
    countinstock real NOT NULL,
    mincount real,
    description character varying NOT NULL,
    "Cost" numeric,
    image character varying NOT NULL,
    materialtypeid integer
);


--
-- TOC entry 217 (class 1259 OID 27245)
-- Name: materialcounthistory; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.materialcounthistory (
    materialcounthistoryid integer NOT NULL,
    materialid integer,
    changedate date,
    countvalue character varying
);


--
-- TOC entry 216 (class 1259 OID 27238)
-- Name: materialsupplier; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.materialsupplier (
    materialid integer NOT NULL,
    supplierid integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 27310)
-- Name: materialtype; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.materialtype (
    materialtypeid integer NOT NULL,
    title character varying,
    defectedpercent real
);


--
-- TOC entry 221 (class 1259 OID 27276)
-- Name: product; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.product (
    productid integer NOT NULL,
    title character varying,
    producttypeid integer NOT NULL,
    description character varying NOT NULL,
    image character varying NOT NULL,
    productionpersoncount integer NOT NULL,
    productionworkshopnumber integer NOT NULL,
    articlenumber character varying,
    mincostforagent numeric
);


--
-- TOC entry 220 (class 1259 OID 27268)
-- Name: productcosthistory; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.productcosthistory (
    productcosthistoryid integer NOT NULL,
    productid integer,
    changedate date,
    costvalue numeric
);


--
-- TOC entry 219 (class 1259 OID 27261)
-- Name: productmaterial; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.productmaterial (
    productid integer NOT NULL,
    materialid integer NOT NULL,
    count real NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 27284)
-- Name: productsale; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.productsale (
    productsaleid integer NOT NULL,
    agentid integer,
    productid integer,
    saledate date,
    productcount integer
);


--
-- TOC entry 227 (class 1259 OID 27318)
-- Name: producttype; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.producttype (
    producttypeid integer NOT NULL,
    title character varying,
    defectedpercent real
);


--
-- TOC entry 215 (class 1259 OID 27073)
-- Name: shop; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.shop (
    shopid integer NOT NULL,
    title character varying,
    address character varying NOT NULL,
    agentid integer
);


--
-- TOC entry 214 (class 1259 OID 26934)
-- Name: supplier; Type: TABLE; Schema: shiny; Owner: -
--

CREATE TABLE shiny.supplier (
    supplierid integer NOT NULL,
    title character varying,
    inn character varying,
    startdate date,
    qualityrating integer NOT NULL,
    suppliertype character varying NOT NULL
);


--
-- TOC entry 3090 (class 0 OID 27294)
-- Dependencies: 224
-- Data for Name: agent; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.agent (agentid, title, agenttypeid, address, inn, kpp, directorname, phone, email, logo, priority) FROM stdin;
\.


--
-- TOC entry 3089 (class 0 OID 27289)
-- Dependencies: 223
-- Data for Name: agentpriorityhistory; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.agentpriorityhistory (agentpriorityhistoryid, agentid, changedate, priorityvalue) FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 27302)
-- Dependencies: 225
-- Data for Name: agenttype; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.agenttype (agenttypeid, title, image) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 27253)
-- Dependencies: 218
-- Data for Name: material; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.material (materialid, title, countinpack, unit, countinstock, mincount, description, "Cost", image, materialtypeid) FROM stdin;
\.


--
-- TOC entry 3083 (class 0 OID 27245)
-- Dependencies: 217
-- Data for Name: materialcounthistory; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.materialcounthistory (materialcounthistoryid, materialid, changedate, countvalue) FROM stdin;
\.


--
-- TOC entry 3082 (class 0 OID 27238)
-- Dependencies: 216
-- Data for Name: materialsupplier; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.materialsupplier (materialid, supplierid) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 27310)
-- Dependencies: 226
-- Data for Name: materialtype; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.materialtype (materialtypeid, title, defectedpercent) FROM stdin;
\.


--
-- TOC entry 3087 (class 0 OID 27276)
-- Dependencies: 221
-- Data for Name: product; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.product (productid, title, producttypeid, description, image, productionpersoncount, productionworkshopnumber, articlenumber, mincostforagent) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 27268)
-- Dependencies: 220
-- Data for Name: productcosthistory; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.productcosthistory (productcosthistoryid, productid, changedate, costvalue) FROM stdin;
\.


--
-- TOC entry 3085 (class 0 OID 27261)
-- Dependencies: 219
-- Data for Name: productmaterial; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.productmaterial (productid, materialid, count) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 27284)
-- Dependencies: 222
-- Data for Name: productsale; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.productsale (productsaleid, agentid, productid, saledate, productcount) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 27318)
-- Dependencies: 227
-- Data for Name: producttype; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.producttype (producttypeid, title, defectedpercent) FROM stdin;
\.


--
-- TOC entry 3081 (class 0 OID 27073)
-- Dependencies: 215
-- Data for Name: shop; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.shop (shopid, title, address, agentid) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 26934)
-- Dependencies: 214
-- Data for Name: supplier; Type: TABLE DATA; Schema: shiny; Owner: -
--

COPY shiny.supplier (supplierid, title, inn, startdate, qualityrating, suppliertype) FROM stdin;
\.


--
-- TOC entry 2939 (class 2606 OID 27301)
-- Name: agent agent_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.agent
    ADD CONSTRAINT agent_pk PRIMARY KEY (agentid);


--
-- TOC entry 2937 (class 2606 OID 27293)
-- Name: agentpriorityhistory agentpriorityhistory_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.agentpriorityhistory
    ADD CONSTRAINT agentpriorityhistory_pk PRIMARY KEY (agentpriorityhistoryid);


--
-- TOC entry 2941 (class 2606 OID 27309)
-- Name: agenttype agenttype_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.agenttype
    ADD CONSTRAINT agenttype_pk PRIMARY KEY (agenttypeid);


--
-- TOC entry 2927 (class 2606 OID 27260)
-- Name: material material_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.material
    ADD CONSTRAINT material_pk PRIMARY KEY (materialid);


--
-- TOC entry 2925 (class 2606 OID 27252)
-- Name: materialcounthistory materialcounthistory_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.materialcounthistory
    ADD CONSTRAINT materialcounthistory_pk PRIMARY KEY (materialcounthistoryid);


--
-- TOC entry 2923 (class 2606 OID 27244)
-- Name: materialsupplier materialsupplier_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.materialsupplier
    ADD CONSTRAINT materialsupplier_pk PRIMARY KEY (materialid, supplierid);


--
-- TOC entry 2943 (class 2606 OID 27317)
-- Name: materialtype materialtype_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.materialtype
    ADD CONSTRAINT materialtype_pk PRIMARY KEY (materialtypeid);


--
-- TOC entry 2933 (class 2606 OID 27283)
-- Name: product product_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.product
    ADD CONSTRAINT product_pk PRIMARY KEY (productid);


--
-- TOC entry 2931 (class 2606 OID 27275)
-- Name: productcosthistory productcosthistory_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.productcosthistory
    ADD CONSTRAINT productcosthistory_pk PRIMARY KEY (productcosthistoryid);


--
-- TOC entry 2929 (class 2606 OID 27267)
-- Name: productmaterial productmaterial_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.productmaterial
    ADD CONSTRAINT productmaterial_pk PRIMARY KEY (productid, materialid);


--
-- TOC entry 2935 (class 2606 OID 27288)
-- Name: productsale productsale_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.productsale
    ADD CONSTRAINT productsale_pk PRIMARY KEY (productsaleid);


--
-- TOC entry 2945 (class 2606 OID 27325)
-- Name: producttype producttype_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.producttype
    ADD CONSTRAINT producttype_pk PRIMARY KEY (producttypeid);


--
-- TOC entry 2921 (class 2606 OID 27080)
-- Name: shop shop_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.shop
    ADD CONSTRAINT shop_pk PRIMARY KEY (shopid);


--
-- TOC entry 2919 (class 2606 OID 26941)
-- Name: supplier supplier_pk; Type: CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.supplier
    ADD CONSTRAINT supplier_pk PRIMARY KEY (supplierid);


--
-- TOC entry 2958 (class 2606 OID 27776)
-- Name: agent agent_fk; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.agent
    ADD CONSTRAINT agent_fk FOREIGN KEY (agenttypeid) REFERENCES shiny.agenttype(agenttypeid);


--
-- TOC entry 2957 (class 2606 OID 27766)
-- Name: agentpriorityhistory agentpriorityhistory_fk; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.agentpriorityhistory
    ADD CONSTRAINT agentpriorityhistory_fk FOREIGN KEY (agentid) REFERENCES shiny.agent(agentid);


--
-- TOC entry 2950 (class 2606 OID 27731)
-- Name: material material_fk; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.material
    ADD CONSTRAINT material_fk FOREIGN KEY (materialtypeid) REFERENCES shiny.materialtype(materialtypeid);


--
-- TOC entry 2949 (class 2606 OID 27726)
-- Name: materialcounthistory materialcounthistory_fk; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.materialcounthistory
    ADD CONSTRAINT materialcounthistory_fk FOREIGN KEY (materialid) REFERENCES shiny.material(materialid);


--
-- TOC entry 2947 (class 2606 OID 27716)
-- Name: materialsupplier materialsupplier_fk; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.materialsupplier
    ADD CONSTRAINT materialsupplier_fk FOREIGN KEY (materialid) REFERENCES shiny.material(materialid);


--
-- TOC entry 2948 (class 2606 OID 27721)
-- Name: materialsupplier materialsupplier_fk_1; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.materialsupplier
    ADD CONSTRAINT materialsupplier_fk_1 FOREIGN KEY (supplierid) REFERENCES shiny.supplier(supplierid);


--
-- TOC entry 2954 (class 2606 OID 27751)
-- Name: product product_fk; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.product
    ADD CONSTRAINT product_fk FOREIGN KEY (producttypeid) REFERENCES shiny.producttype(producttypeid);


--
-- TOC entry 2953 (class 2606 OID 27746)
-- Name: productcosthistory productcosthistory_fk; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.productcosthistory
    ADD CONSTRAINT productcosthistory_fk FOREIGN KEY (productid) REFERENCES shiny.product(productid);


--
-- TOC entry 2951 (class 2606 OID 27736)
-- Name: productmaterial productmaterial_fk; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.productmaterial
    ADD CONSTRAINT productmaterial_fk FOREIGN KEY (productid) REFERENCES shiny.product(productid);


--
-- TOC entry 2952 (class 2606 OID 27741)
-- Name: productmaterial productmaterial_fk_1; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.productmaterial
    ADD CONSTRAINT productmaterial_fk_1 FOREIGN KEY (materialid) REFERENCES shiny.material(materialid);


--
-- TOC entry 2955 (class 2606 OID 27756)
-- Name: productsale productsale_fk; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.productsale
    ADD CONSTRAINT productsale_fk FOREIGN KEY (agentid) REFERENCES shiny.agent(agentid);


--
-- TOC entry 2956 (class 2606 OID 27761)
-- Name: productsale productsale_fk_1; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.productsale
    ADD CONSTRAINT productsale_fk_1 FOREIGN KEY (productid) REFERENCES shiny.product(productid);


--
-- TOC entry 2946 (class 2606 OID 27771)
-- Name: shop shop_fk; Type: FK CONSTRAINT; Schema: shiny; Owner: -
--

ALTER TABLE ONLY shiny.shop
    ADD CONSTRAINT shop_fk FOREIGN KEY (agentid) REFERENCES shiny.agent(agentid);


-- Completed on 2022-10-28 17:40:45

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-19 22:58:22

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

DROP DATABASE crm;
--
-- TOC entry 3294 (class 1262 OID 16394)
-- Name: crm; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE crm WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';


ALTER DATABASE crm OWNER TO postgres;

\connect crm

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
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 3294
-- Name: DATABASE crm; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE crm IS 'CRM';


--
-- TOC entry 221 (class 1255 OID 16411)
-- Name: update_last_upd_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_last_upd_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
   NEW.last_upd = current_date; 
   RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_last_upd_column() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16443)
-- Name: action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action (
    id integer NOT NULL,
    user_id integer NOT NULL,
    customers_id integer NOT NULL,
    description character varying(150) NOT NULL,
    comment text,
    due_date date NOT NULL,
    date_complete date NOT NULL
);


ALTER TABLE public.action OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16442)
-- Name: action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_id_seq OWNER TO postgres;

--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 213
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;


--
-- TOC entry 212 (class 1259 OID 16424)
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    id integer NOT NULL,
    customers_id integer NOT NULL,
    full_name text NOT NULL,
    phone character varying(15) NOT NULL,
    job_title character varying(50),
    note text,
    email text
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16423)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_id_seq OWNER TO postgres;

--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 211
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_id_seq OWNED BY public.contact.id;


--
-- TOC entry 218 (class 1259 OID 16527)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    departament_id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(300) NOT NULL,
    phone character varying(15) NOT NULL,
    "сreated" date DEFAULT CURRENT_DATE NOT NULL,
    inn bigint NOT NULL,
    type_action character varying(20) NOT NULL,
    alias character varying(300) NOT NULL,
    email text,
    time_zone text,
    website text,
    last_upd date DEFAULT CURRENT_DATE NOT NULL,
    address text,
    note text,
    main_reg_number bigint,
    code_reason_reg bigint,
    legal_address text NOT NULL,
    bank character varying(100),
    identification_code bigint,
    corr_account bigint,
    name_manager text,
    job_title_manager text,
    payment_account bigint
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16526)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 217
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 210 (class 1259 OID 16415)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    parent_id integer,
    director text NOT NULL,
    name character varying(300) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16414)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO postgres;

--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 209
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 216 (class 1259 OID 16453)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    departament_id integer NOT NULL,
    full_name text NOT NULL,
    email text,
    birth_day date,
    phone character varying(15) NOT NULL,
    job_title character varying(50),
    note text,
    address text,
    inactive boolean NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16452)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO postgres;

--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 215
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- TOC entry 220 (class 1259 OID 16554)
-- Name: Сomments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Сomments" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    customers_id integer NOT NULL,
    "сreated" date DEFAULT CURRENT_DATE NOT NULL,
    comment text NOT NULL
);


ALTER TABLE public."Сomments" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16553)
-- Name: Сomments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Сomments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Сomments_id_seq" OWNER TO postgres;

--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 219
-- Name: Сomments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Сomments_id_seq" OWNED BY public."Сomments".id;


--
-- TOC entry 3103 (class 2604 OID 16446)
-- Name: action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);


--
-- TOC entry 3102 (class 2604 OID 16427)
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact ALTER COLUMN id SET DEFAULT nextval('public.contact_id_seq'::regclass);


--
-- TOC entry 3105 (class 2604 OID 16530)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 3101 (class 2604 OID 16418)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 3104 (class 2604 OID 16456)
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- TOC entry 3108 (class 2604 OID 16557)
-- Name: Сomments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сomments" ALTER COLUMN id SET DEFAULT nextval('public."Сomments_id_seq"'::regclass);


--
-- TOC entry 3282 (class 0 OID 16443)
-- Dependencies: 214
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3280 (class 0 OID 16424)
-- Dependencies: 212
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contact (id, customers_id, full_name, phone, job_title, note, email) VALUES (1, 1, 'Корнеев В.С.', '67-43-22', 'Руководитель', 'Звонок', NULL);
INSERT INTO public.contact (id, customers_id, full_name, phone, job_title, note, email) VALUES (2, 1, 'Рыбина И.С.', '99-47-21', 'Заместитель', 'Недозвон', NULL);
INSERT INTO public.contact (id, customers_id, full_name, phone, job_title, note, email) VALUES (3, 1, 'Укывцев Г.Ф.', '87-45-12', 'Исполняющие Директора', 'Звонок', NULL);
INSERT INTO public.contact (id, customers_id, full_name, phone, job_title, note, email) VALUES (4, 1, 'Корнеев В.С.', '67-43-22', 'Руководитель', 'Звонок', NULL);
INSERT INTO public.contact (id, customers_id, full_name, phone, job_title, note, email) VALUES (5, 1, 'Рыбина И.С.', '99-47-21', 'Заместитель', 'Недозвон', NULL);
INSERT INTO public.contact (id, customers_id, full_name, phone, job_title, note, email) VALUES (6, 1, 'Укывцев Г.Ф.', '87-45-12', 'Исполняющие Директора', 'Звонок', NULL);


--
-- TOC entry 3286 (class 0 OID 16527)
-- Dependencies: 218
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3278 (class 0 OID 16415)
-- Dependencies: 210
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departments (id, parent_id, director, name) VALUES (1, 0, 'Ковальчук Е.А.', 'CRM');
INSERT INTO public.departments (id, parent_id, director, name) VALUES (2, 1, 'Семенов М.И.', 'МЦПМ');
INSERT INTO public.departments (id, parent_id, director, name) VALUES (3, 1, 'Матвеева Я.С.', 'IT');


--
-- TOC entry 3284 (class 0 OID 16453)
-- Dependencies: 216
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (41, 'bochkov@ukc62.ru', 'AA7-AAY0013', 1, 'Бочков Алексей Александрович', 'bochkov@ukc62.ru', '1999-06-07', '79511023092', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (42, 'stativko@ukc62.ru', 'AA7-AAY002', 1, 'Стативко Алексей Вячеславович', 'stativko@ukc62.ru', '1999-06-07', '79065404240', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (43, 'terentev@ukc62.ru', 'AA7-AAY003', 1, 'Терентев Сергей Максимович', 'terentev@ukc62.ru', '1999-06-07', '79206345517', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (44, 'sholyan@ukc62.ru', 'AA7-AAY004', 1, 'Шолян Руслан Жирайрович', 'sholyan@ukc62.ru', '1999-06-07', '79969118301', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (45, 'yakovlev@ukc62.ru', 'AA7-AAY005', 1, 'Яковлев Борис Размикович', 'yakovlev@ukc62.ru', '1999-06-07', '79066477979', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (46, 'babkin@ukc62.ru', 'AA7-AAY006', 1, 'Бабкин Никита Александрович', 'babkin@ukc62.ru', '1999-06-07', '79521260135', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (47, 'yakimov@ukc62.ru', 'AA7-AAY00', 1, 'Якимов Илья Александрович', 'yakimov@ukc62.ru', '1999-06-07', '79610090309', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (48, 'belavin@ukc62.ru', 'AA7-AAY008', 1, 'Белавин Егор Александрович', 'belavin@ukc62.ru', '1999-06-07', '79209911284', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (49, 'chilikin@ukc62.ru', 'AA7-AAY009', 1, 'Чиликин Дмитрий Игоревич', 'chilikin@ukc62.ru', '1999-06-07', '79106392227', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (50, 'zaretskaya@ukc62.ru', 'AA7-AAY000', 1, 'Зарецкая Анастасия Александровна', 'zaretskaya@ukc62.ru', '1999-06-07', '79105069003', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (51, 'kulikov@ukc62.ru', 'AA7-AAY091', 1, 'Куликов Егор Максимович', 'kulikov@ukc62.ru', '1999-06-07', '79997645441', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (52, 'fomin@ukc62.ru', 'AA7-AAY081', 1, 'Фомин Александр Вадимович', 'fomin@ukc62.ru', '1999-06-07', '79623944650', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (53, 'pavlov@ukc62.ru', 'AA7-AAY051', 1, 'Павлов Алексей Багирович', 'pavlov@ukc62.ru', '1999-06-07', '79997602490', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (54, 'vikulov@ukc62.ru', 'AA7-AAY061', 1, 'Викулов Никита Кириллович', 'vikulov@ukc62.ru', '1999-06-07', '79537316156', 'CRM', 'Филиал', 'Тула', true);
INSERT INTO public.employee (id, login, password, departament_id, full_name, email, birth_day, phone, job_title, note, address, inactive) VALUES (55, 'sobolev@ukc62.ru', 'AA7-AAY071', 1, 'Соболев Григорий Игоревич', 'sobolev@ukc62.ru', '1999-06-07', '79966161992', 'CRM', 'Филиал', 'Тула', true);


--
-- TOC entry 3288 (class 0 OID 16554)
-- Dependencies: 220
-- Data for Name: Сomments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 213
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_id_seq', 6, true);


--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 211
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_id_seq', 6, true);


--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 217
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 3, true);


--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 209
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 3, true);


--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 215
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 55, true);


--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 219
-- Name: Сomments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Сomments_id_seq"', 1, false);


--
-- TOC entry 3115 (class 2606 OID 16450)
-- Name: action action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pkey PRIMARY KEY (id);


--
-- TOC entry 3113 (class 2606 OID 16431)
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- TOC entry 3123 (class 2606 OID 16602)
-- Name: customers customers_identification_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_identification_code_key UNIQUE (identification_code);


--
-- TOC entry 3125 (class 2606 OID 16575)
-- Name: customers customers_inn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_inn_key UNIQUE (inn);


--
-- TOC entry 3127 (class 2606 OID 16538)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3111 (class 2606 OID 16422)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 3117 (class 2606 OID 16462)
-- Name: employee employee_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_login_key UNIQUE (login);


--
-- TOC entry 3119 (class 2606 OID 16464)
-- Name: employee employee_password_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_password_key UNIQUE (password);


--
-- TOC entry 3121 (class 2606 OID 16460)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3129 (class 2606 OID 16562)
-- Name: Сomments Сomments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сomments"
    ADD CONSTRAINT "Сomments_pkey" PRIMARY KEY (id);


--
-- TOC entry 3137 (class 2620 OID 16611)
-- Name: customers update_last_upd_column; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_last_upd_column BEFORE UPDATE ON public.customers FOR EACH ROW EXECUTE FUNCTION public.update_last_upd_column();


--
-- TOC entry 3131 (class 2606 OID 16515)
-- Name: action fk_action_emp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT fk_action_emp FOREIGN KEY (user_id) REFERENCES public.employee(id) ON DELETE SET NULL;


--
-- TOC entry 3136 (class 2606 OID 16568)
-- Name: Сomments fk_comments_cust; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сomments"
    ADD CONSTRAINT fk_comments_cust FOREIGN KEY (customers_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- TOC entry 3135 (class 2606 OID 16563)
-- Name: Сomments fk_comments_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сomments"
    ADD CONSTRAINT fk_comments_user FOREIGN KEY (user_id) REFERENCES public.employee(id) ON DELETE SET NULL;


--
-- TOC entry 3130 (class 2606 OID 16480)
-- Name: contact fk_contact_cust; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT fk_contact_cust FOREIGN KEY (customers_id) REFERENCES public.contact(id) ON DELETE CASCADE;


--
-- TOC entry 3133 (class 2606 OID 16543)
-- Name: customers fk_customers_dep; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_customers_dep FOREIGN KEY (departament_id) REFERENCES public.departments(id) ON DELETE SET NULL;


--
-- TOC entry 3134 (class 2606 OID 16548)
-- Name: customers fk_customers_emp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_customers_emp FOREIGN KEY (user_id) REFERENCES public.employee(id) ON DELETE SET NULL;


--
-- TOC entry 3132 (class 2606 OID 16505)
-- Name: employee fk_employee_dep; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT fk_employee_dep FOREIGN KEY (departament_id) REFERENCES public.departments(id) ON DELETE SET NULL;


-- Completed on 2022-04-19 22:58:23

--
-- PostgreSQL database dump complete
--


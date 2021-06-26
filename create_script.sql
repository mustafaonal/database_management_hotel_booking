--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-11-14 16:40:28

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
-- TOC entry 6 (class 2615 OID 24857)
-- Name: hotel_booking_app; Type: SCHEMA; Schema: -; Owner: hotel_booking_admin
--

CREATE SCHEMA hotel_booking_app;


ALTER SCHEMA hotel_booking_app OWNER TO hotel_booking_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 24907)
-- Name: billing; Type: TABLE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE TABLE hotel_booking_app.billing (
    bill_id integer NOT NULL,
    booking_id integer NOT NULL,
    total_price integer NOT NULL,
    bill_date date NOT NULL
);


ALTER TABLE hotel_booking_app.billing OWNER TO hotel_booking_admin;

--
-- TOC entry 209 (class 1259 OID 24905)
-- Name: billing_bill_id_seq; Type: SEQUENCE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE SEQUENCE hotel_booking_app.billing_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_booking_app.billing_bill_id_seq OWNER TO hotel_booking_admin;

--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 209
-- Name: billing_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER SEQUENCE hotel_booking_app.billing_bill_id_seq OWNED BY hotel_booking_app.billing.bill_id;


--
-- TOC entry 208 (class 1259 OID 24894)
-- Name: booking; Type: TABLE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE TABLE hotel_booking_app.booking (
    booking_id integer NOT NULL,
    guest_id integer NOT NULL,
    check_in_date date NOT NULL,
    check_out_date date NOT NULL
);


ALTER TABLE hotel_booking_app.booking OWNER TO hotel_booking_admin;

--
-- TOC entry 207 (class 1259 OID 24892)
-- Name: booking_booking_id_seq; Type: SEQUENCE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE SEQUENCE hotel_booking_app.booking_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_booking_app.booking_booking_id_seq OWNER TO hotel_booking_admin;

--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 207
-- Name: booking_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER SEQUENCE hotel_booking_app.booking_booking_id_seq OWNED BY hotel_booking_app.booking.booking_id;


--
-- TOC entry 219 (class 1259 OID 24970)
-- Name: employee; Type: TABLE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE TABLE hotel_booking_app.employee (
    emp_id integer NOT NULL,
    emp_first_name text NOT NULL,
    emp_last_name text NOT NULL,
    emp_sex character varying(50),
    emp_birthdate date,
    emp_salary integer NOT NULL,
    super_id integer NOT NULL,
    hotel_id integer NOT NULL
);


ALTER TABLE hotel_booking_app.employee OWNER TO hotel_booking_admin;

--
-- TOC entry 217 (class 1259 OID 24966)
-- Name: employee_emp_id_seq; Type: SEQUENCE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE SEQUENCE hotel_booking_app.employee_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_booking_app.employee_emp_id_seq OWNER TO hotel_booking_admin;

--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 217
-- Name: employee_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER SEQUENCE hotel_booking_app.employee_emp_id_seq OWNED BY hotel_booking_app.employee.emp_id;


--
-- TOC entry 218 (class 1259 OID 24968)
-- Name: employee_super_id_seq; Type: SEQUENCE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE SEQUENCE hotel_booking_app.employee_super_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_booking_app.employee_super_id_seq OWNER TO hotel_booking_admin;

--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_super_id_seq; Type: SEQUENCE OWNED BY; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER SEQUENCE hotel_booking_app.employee_super_id_seq OWNED BY hotel_booking_app.employee.super_id;


--
-- TOC entry 216 (class 1259 OID 24952)
-- Name: facilites; Type: TABLE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE TABLE hotel_booking_app.facilites (
    facility_id integer NOT NULL,
    facility_name text NOT NULL,
    facility_descript text,
    facility_type text,
    facility_price integer,
    hotel_id integer NOT NULL
);


ALTER TABLE hotel_booking_app.facilites OWNER TO hotel_booking_admin;

--
-- TOC entry 215 (class 1259 OID 24950)
-- Name: facilites_facility_id_seq; Type: SEQUENCE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE SEQUENCE hotel_booking_app.facilites_facility_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_booking_app.facilites_facility_id_seq OWNER TO hotel_booking_admin;

--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 215
-- Name: facilites_facility_id_seq; Type: SEQUENCE OWNED BY; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER SEQUENCE hotel_booking_app.facilites_facility_id_seq OWNED BY hotel_booking_app.facilites.facility_id;


--
-- TOC entry 206 (class 1259 OID 24875)
-- Name: guest; Type: TABLE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE TABLE hotel_booking_app.guest (
    guest_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    sex character varying(50),
    email text,
    address_number integer NOT NULL,
    address_city text NOT NULL,
    address_street text NOT NULL,
    phone text[] NOT NULL,
    birtdate date NOT NULL,
    login_id integer,
    CONSTRAINT guest_email_check CHECK ((email ~* '^\w+@\w+[.]\w+$'::text))
);


ALTER TABLE hotel_booking_app.guest OWNER TO hotel_booking_admin;

--
-- TOC entry 205 (class 1259 OID 24873)
-- Name: guest_guest_id_seq; Type: SEQUENCE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE SEQUENCE hotel_booking_app.guest_guest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_booking_app.guest_guest_id_seq OWNER TO hotel_booking_admin;

--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 205
-- Name: guest_guest_id_seq; Type: SEQUENCE OWNED BY; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER SEQUENCE hotel_booking_app.guest_guest_id_seq OWNED BY hotel_booking_app.guest.guest_id;


--
-- TOC entry 212 (class 1259 OID 24920)
-- Name: hotel; Type: TABLE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE TABLE hotel_booking_app.hotel (
    hotel_id integer NOT NULL,
    hotel_name text NOT NULL,
    hotel_addr text NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE hotel_booking_app.hotel OWNER TO hotel_booking_admin;

--
-- TOC entry 211 (class 1259 OID 24918)
-- Name: hotel_hotel_id_seq; Type: SEQUENCE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE SEQUENCE hotel_booking_app.hotel_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_booking_app.hotel_hotel_id_seq OWNER TO hotel_booking_admin;

--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 211
-- Name: hotel_hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER SEQUENCE hotel_booking_app.hotel_hotel_id_seq OWNED BY hotel_booking_app.hotel.hotel_id;


--
-- TOC entry 214 (class 1259 OID 24933)
-- Name: hotel_rating; Type: TABLE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE TABLE hotel_booking_app.hotel_rating (
    hotel_rating_id integer NOT NULL,
    hotel_id integer NOT NULL,
    guest_id integer NOT NULL,
    rate integer NOT NULL,
    CONSTRAINT hotel_rating_rate_check CHECK ((rate = ANY (ARRAY[1, 2, 3, 4, 5])))
);


ALTER TABLE hotel_booking_app.hotel_rating OWNER TO hotel_booking_admin;

--
-- TOC entry 213 (class 1259 OID 24931)
-- Name: hotel_rating_hotel_rating_id_seq; Type: SEQUENCE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE SEQUENCE hotel_booking_app.hotel_rating_hotel_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_booking_app.hotel_rating_hotel_rating_id_seq OWNER TO hotel_booking_admin;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 213
-- Name: hotel_rating_hotel_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER SEQUENCE hotel_booking_app.hotel_rating_hotel_rating_id_seq OWNED BY hotel_booking_app.hotel_rating.hotel_rating_id;


--
-- TOC entry 204 (class 1259 OID 24860)
-- Name: login; Type: TABLE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE TABLE hotel_booking_app.login (
    login_id integer NOT NULL,
    password text NOT NULL,
    login_username text NOT NULL,
    email text NOT NULL,
    CONSTRAINT login_email_check CHECK ((email ~* '^\w+@\w+[.]\w+$'::text)),
    CONSTRAINT login_password_check CHECK ((char_length(password) >= 8))
);


ALTER TABLE hotel_booking_app.login OWNER TO hotel_booking_admin;

--
-- TOC entry 203 (class 1259 OID 24858)
-- Name: login_login_id_seq; Type: SEQUENCE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE SEQUENCE hotel_booking_app.login_login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_booking_app.login_login_id_seq OWNER TO hotel_booking_admin;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 203
-- Name: login_login_id_seq; Type: SEQUENCE OWNED BY; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER SEQUENCE hotel_booking_app.login_login_id_seq OWNED BY hotel_booking_app.login.login_id;


--
-- TOC entry 220 (class 1259 OID 24985)
-- Name: room; Type: TABLE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE TABLE hotel_booking_app.room (
    room_no integer NOT NULL,
    room_status text NOT NULL,
    hotel_id integer NOT NULL
);


ALTER TABLE hotel_booking_app.room OWNER TO hotel_booking_admin;

--
-- TOC entry 222 (class 1259 OID 25000)
-- Name: room_type; Type: TABLE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE TABLE hotel_booking_app.room_type (
    type_id integer NOT NULL,
    max_guest integer NOT NULL,
    room_price integer NOT NULL,
    total_rooms integer NOT NULL,
    room_no integer NOT NULL
);


ALTER TABLE hotel_booking_app.room_type OWNER TO hotel_booking_admin;

--
-- TOC entry 221 (class 1259 OID 24998)
-- Name: room_type_type_id_seq; Type: SEQUENCE; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

CREATE SEQUENCE hotel_booking_app.room_type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hotel_booking_app.room_type_type_id_seq OWNER TO hotel_booking_admin;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 221
-- Name: room_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER SEQUENCE hotel_booking_app.room_type_type_id_seq OWNED BY hotel_booking_app.room_type.type_id;


--
-- TOC entry 2754 (class 2604 OID 24910)
-- Name: billing bill_id; Type: DEFAULT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.billing ALTER COLUMN bill_id SET DEFAULT nextval('hotel_booking_app.billing_bill_id_seq'::regclass);


--
-- TOC entry 2753 (class 2604 OID 24897)
-- Name: booking booking_id; Type: DEFAULT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.booking ALTER COLUMN booking_id SET DEFAULT nextval('hotel_booking_app.booking_booking_id_seq'::regclass);


--
-- TOC entry 2759 (class 2604 OID 24973)
-- Name: employee emp_id; Type: DEFAULT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.employee ALTER COLUMN emp_id SET DEFAULT nextval('hotel_booking_app.employee_emp_id_seq'::regclass);


--
-- TOC entry 2760 (class 2604 OID 24974)
-- Name: employee super_id; Type: DEFAULT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.employee ALTER COLUMN super_id SET DEFAULT nextval('hotel_booking_app.employee_super_id_seq'::regclass);


--
-- TOC entry 2758 (class 2604 OID 24955)
-- Name: facilites facility_id; Type: DEFAULT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.facilites ALTER COLUMN facility_id SET DEFAULT nextval('hotel_booking_app.facilites_facility_id_seq'::regclass);


--
-- TOC entry 2751 (class 2604 OID 24878)
-- Name: guest guest_id; Type: DEFAULT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.guest ALTER COLUMN guest_id SET DEFAULT nextval('hotel_booking_app.guest_guest_id_seq'::regclass);


--
-- TOC entry 2755 (class 2604 OID 24923)
-- Name: hotel hotel_id; Type: DEFAULT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.hotel ALTER COLUMN hotel_id SET DEFAULT nextval('hotel_booking_app.hotel_hotel_id_seq'::regclass);


--
-- TOC entry 2756 (class 2604 OID 24936)
-- Name: hotel_rating hotel_rating_id; Type: DEFAULT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.hotel_rating ALTER COLUMN hotel_rating_id SET DEFAULT nextval('hotel_booking_app.hotel_rating_hotel_rating_id_seq'::regclass);


--
-- TOC entry 2748 (class 2604 OID 24863)
-- Name: login login_id; Type: DEFAULT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.login ALTER COLUMN login_id SET DEFAULT nextval('hotel_booking_app.login_login_id_seq'::regclass);


--
-- TOC entry 2761 (class 2604 OID 25003)
-- Name: room_type type_id; Type: DEFAULT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.room_type ALTER COLUMN type_id SET DEFAULT nextval('hotel_booking_app.room_type_type_id_seq'::regclass);


--
-- TOC entry 2930 (class 0 OID 24907)
-- Dependencies: 210
-- Data for Name: billing; Type: TABLE DATA; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

COPY hotel_booking_app.billing (bill_id, booking_id, total_price, bill_date) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 24894)
-- Dependencies: 208
-- Data for Name: booking; Type: TABLE DATA; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

COPY hotel_booking_app.booking (booking_id, guest_id, check_in_date, check_out_date) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 24970)
-- Dependencies: 219
-- Data for Name: employee; Type: TABLE DATA; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

COPY hotel_booking_app.employee (emp_id, emp_first_name, emp_last_name, emp_sex, emp_birthdate, emp_salary, super_id, hotel_id) FROM stdin;
\.


--
-- TOC entry 2936 (class 0 OID 24952)
-- Dependencies: 216
-- Data for Name: facilites; Type: TABLE DATA; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

COPY hotel_booking_app.facilites (facility_id, facility_name, facility_descript, facility_type, facility_price, hotel_id) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 24875)
-- Dependencies: 206
-- Data for Name: guest; Type: TABLE DATA; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

COPY hotel_booking_app.guest (guest_id, first_name, last_name, sex, email, address_number, address_city, address_street, phone, birtdate, login_id) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 24920)
-- Dependencies: 212
-- Data for Name: hotel; Type: TABLE DATA; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

COPY hotel_booking_app.hotel (hotel_id, hotel_name, hotel_addr, capacity) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 24933)
-- Dependencies: 214
-- Data for Name: hotel_rating; Type: TABLE DATA; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

COPY hotel_booking_app.hotel_rating (hotel_rating_id, hotel_id, guest_id, rate) FROM stdin;
\.


--
-- TOC entry 2924 (class 0 OID 24860)
-- Dependencies: 204
-- Data for Name: login; Type: TABLE DATA; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

COPY hotel_booking_app.login (login_id, password, login_username, email) FROM stdin;
\.


--
-- TOC entry 2940 (class 0 OID 24985)
-- Dependencies: 220
-- Data for Name: room; Type: TABLE DATA; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

COPY hotel_booking_app.room (room_no, room_status, hotel_id) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 25000)
-- Dependencies: 222
-- Data for Name: room_type; Type: TABLE DATA; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

COPY hotel_booking_app.room_type (type_id, max_guest, room_price, total_rooms, room_no) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 209
-- Name: billing_bill_id_seq; Type: SEQUENCE SET; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

SELECT pg_catalog.setval('hotel_booking_app.billing_bill_id_seq', 1, false);


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 207
-- Name: booking_booking_id_seq; Type: SEQUENCE SET; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

SELECT pg_catalog.setval('hotel_booking_app.booking_booking_id_seq', 1, false);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 217
-- Name: employee_emp_id_seq; Type: SEQUENCE SET; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

SELECT pg_catalog.setval('hotel_booking_app.employee_emp_id_seq', 1, false);


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_super_id_seq; Type: SEQUENCE SET; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

SELECT pg_catalog.setval('hotel_booking_app.employee_super_id_seq', 1, false);


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 215
-- Name: facilites_facility_id_seq; Type: SEQUENCE SET; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

SELECT pg_catalog.setval('hotel_booking_app.facilites_facility_id_seq', 1, false);


--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 205
-- Name: guest_guest_id_seq; Type: SEQUENCE SET; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

SELECT pg_catalog.setval('hotel_booking_app.guest_guest_id_seq', 1, false);


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 211
-- Name: hotel_hotel_id_seq; Type: SEQUENCE SET; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

SELECT pg_catalog.setval('hotel_booking_app.hotel_hotel_id_seq', 1, false);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 213
-- Name: hotel_rating_hotel_rating_id_seq; Type: SEQUENCE SET; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

SELECT pg_catalog.setval('hotel_booking_app.hotel_rating_hotel_rating_id_seq', 1, false);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 203
-- Name: login_login_id_seq; Type: SEQUENCE SET; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

SELECT pg_catalog.setval('hotel_booking_app.login_login_id_seq', 1, false);


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 221
-- Name: room_type_type_id_seq; Type: SEQUENCE SET; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

SELECT pg_catalog.setval('hotel_booking_app.room_type_type_id_seq', 1, false);


--
-- TOC entry 2773 (class 2606 OID 24912)
-- Name: billing billing_pkey; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.billing
    ADD CONSTRAINT billing_pkey PRIMARY KEY (bill_id);


--
-- TOC entry 2771 (class 2606 OID 24899)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (booking_id);


--
-- TOC entry 2783 (class 2606 OID 24979)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 2781 (class 2606 OID 24960)
-- Name: facilites facilites_pkey; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.facilites
    ADD CONSTRAINT facilites_pkey PRIMARY KEY (facility_id);


--
-- TOC entry 2767 (class 2606 OID 24886)
-- Name: guest guest_email_key; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.guest
    ADD CONSTRAINT guest_email_key UNIQUE (email);


--
-- TOC entry 2769 (class 2606 OID 24884)
-- Name: guest guest_pkey; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.guest
    ADD CONSTRAINT guest_pkey PRIMARY KEY (guest_id);


--
-- TOC entry 2775 (class 2606 OID 24930)
-- Name: hotel hotel_hotel_name_hotel_addr_key; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.hotel
    ADD CONSTRAINT hotel_hotel_name_hotel_addr_key UNIQUE (hotel_name, hotel_addr);


--
-- TOC entry 2777 (class 2606 OID 24928)
-- Name: hotel hotel_pkey; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (hotel_id);


--
-- TOC entry 2779 (class 2606 OID 24939)
-- Name: hotel_rating hotel_rating_pkey; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.hotel_rating
    ADD CONSTRAINT hotel_rating_pkey PRIMARY KEY (hotel_rating_id);


--
-- TOC entry 2763 (class 2606 OID 24872)
-- Name: login login_email_key; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.login
    ADD CONSTRAINT login_email_key UNIQUE (email);


--
-- TOC entry 2765 (class 2606 OID 24870)
-- Name: login login_pkey; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (login_id);


--
-- TOC entry 2785 (class 2606 OID 24992)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_no);


--
-- TOC entry 2787 (class 2606 OID 25005)
-- Name: room_type room_type_pkey; Type: CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.room_type
    ADD CONSTRAINT room_type_pkey PRIMARY KEY (type_id);


--
-- TOC entry 2790 (class 2606 OID 24913)
-- Name: billing billing_booking_id_fkey; Type: FK CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.billing
    ADD CONSTRAINT billing_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES hotel_booking_app.booking(booking_id);


--
-- TOC entry 2789 (class 2606 OID 24900)
-- Name: booking booking_guest_id_fkey; Type: FK CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.booking
    ADD CONSTRAINT booking_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES hotel_booking_app.guest(guest_id);


--
-- TOC entry 2794 (class 2606 OID 24980)
-- Name: employee employee_hotel_id_fkey; Type: FK CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.employee
    ADD CONSTRAINT employee_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES hotel_booking_app.hotel(hotel_id);


--
-- TOC entry 2793 (class 2606 OID 24961)
-- Name: facilites facilites_hotel_id_fkey; Type: FK CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.facilites
    ADD CONSTRAINT facilites_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES hotel_booking_app.hotel(hotel_id);


--
-- TOC entry 2788 (class 2606 OID 24887)
-- Name: guest guest_login_id_fkey; Type: FK CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.guest
    ADD CONSTRAINT guest_login_id_fkey FOREIGN KEY (login_id) REFERENCES hotel_booking_app.login(login_id);


--
-- TOC entry 2792 (class 2606 OID 24945)
-- Name: hotel_rating hotel_rating_guest_id_fkey; Type: FK CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.hotel_rating
    ADD CONSTRAINT hotel_rating_guest_id_fkey FOREIGN KEY (guest_id) REFERENCES hotel_booking_app.guest(guest_id);


--
-- TOC entry 2791 (class 2606 OID 24940)
-- Name: hotel_rating hotel_rating_hotel_id_fkey; Type: FK CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.hotel_rating
    ADD CONSTRAINT hotel_rating_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES hotel_booking_app.hotel(hotel_id);


--
-- TOC entry 2795 (class 2606 OID 24993)
-- Name: room room_hotel_id_fkey; Type: FK CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.room
    ADD CONSTRAINT room_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES hotel_booking_app.hotel(hotel_id);


--
-- TOC entry 2796 (class 2606 OID 25006)
-- Name: room_type room_type_room_no_fkey; Type: FK CONSTRAINT; Schema: hotel_booking_app; Owner: hotel_booking_admin
--

ALTER TABLE ONLY hotel_booking_app.room_type
    ADD CONSTRAINT room_type_room_no_fkey FOREIGN KEY (room_no) REFERENCES hotel_booking_app.room(room_no);


-- Completed on 2019-11-14 16:40:29

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "Guest";

--
-- Name: portfolios; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.portfolios (
    id bigint NOT NULL,
    user_id bigint,
    stock_id bigint,
    shares integer
);


ALTER TABLE public.portfolios OWNER TO "Guest";

--
-- Name: portfolios_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.portfolios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolios_id_seq OWNER TO "Guest";

--
-- Name: portfolios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.portfolios_id_seq OWNED BY public.portfolios.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "Guest";

--
-- Name: stocks; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.stocks (
    id bigint NOT NULL,
    symbol character varying,
    name character varying,
    gain boolean DEFAULT true,
    current_price numeric(10,4),
    daily_open numeric(10,4),
    daily_close numeric(10,4),
    weekly_open numeric(10,4),
    weekly_close numeric(10,4),
    monthly_open numeric(10,4),
    monthly_close numeric(10,4),
    daily_high numeric(10,4),
    daily_low numeric(10,4),
    weekly_high numeric(10,4),
    weekly_low numeric(10,4),
    monthly_high numeric(10,4),
    monthly_low numeric(10,4),
    yearly_high numeric(10,4),
    yearly_low numeric(10,4),
    volume bigint
);


ALTER TABLE public.stocks OWNER TO "Guest";

--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO "Guest";

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- Name: trades; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.trades (
    id bigint NOT NULL,
    user_id bigint,
    stock_id bigint,
    quantity integer,
    buy_sell_price numeric(10,4),
    log_time timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.trades OWNER TO "Guest";

--
-- Name: trades_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.trades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trades_id_seq OWNER TO "Guest";

--
-- Name: trades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.trades_id_seq OWNED BY public.trades.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying DEFAULT ''::character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    cash numeric(10,2) DEFAULT 10000,
    admin boolean DEFAULT false NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: values; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public."values" (
    id bigint NOT NULL,
    stock_id bigint,
    price numeric(10,4),
    log_time timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public."values" OWNER TO "Guest";

--
-- Name: values_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.values_id_seq OWNER TO "Guest";

--
-- Name: values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.values_id_seq OWNED BY public."values".id;


--
-- Name: portfolios id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.portfolios ALTER COLUMN id SET DEFAULT nextval('public.portfolios_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- Name: trades id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.trades ALTER COLUMN id SET DEFAULT nextval('public.trades_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: values id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public."values" ALTER COLUMN id SET DEFAULT nextval('public.values_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-08-27 23:20:15.260593	2019-08-27 23:20:15.260593
\.


--
-- Data for Name: portfolios; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.portfolios (id, user_id, stock_id, shares) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.schema_migrations (version) FROM stdin;
20190826161211
20190826162115
20190826171724
20190826171827
20190826172214
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.stocks (id, symbol, name, gain, current_price, daily_open, daily_close, weekly_open, weekly_close, monthly_open, monthly_close, daily_high, daily_low, weekly_high, weekly_low, monthly_high, monthly_low, yearly_high, yearly_low, volume) FROM stdin;
1	NUOS	Hettinger-Pacocha	t	50.1000	67.7500	11.4100	21.2800	36.2800	59.0600	75.9100	34.4800	17.3200	97.0700	65.2300	98.9900	69.1900	84.4000	94.9300	347785
2	FFMM	Schmidt, Kuhn and O'Connell	t	31.5800	75.1000	50.1600	35.5500	73.4400	71.6100	67.9500	86.1100	57.5900	76.1700	89.0200	17.1000	62.6300	44.6300	42.6600	579433
3	ZZFU	Dooley-Ernser	t	84.1600	2.1700	99.5900	44.6600	74.1000	56.7100	22.8900	0.4400	70.7900	41.4600	58.4400	9.6800	63.6300	25.8600	98.6700	318033
4	ZYJL	McKenzie, Mohr and Upton	t	78.0200	23.0500	12.6500	75.9600	22.6900	91.3800	96.6200	53.8600	61.5900	54.8300	0.8500	16.7300	33.9000	90.8800	61.7600	281547
5	ENFJ	Murazik and Sons	t	39.0800	37.5200	42.5700	30.1400	12.4700	23.4500	12.6100	98.3100	69.6900	84.3600	51.9000	4.2700	64.4900	96.9300	46.9100	397790
6	IDMZ	Okuneva, Langworth and Fay	t	34.9800	8.4300	15.8600	6.7000	87.4300	71.5200	8.6800	29.6200	40.8300	54.1200	15.6500	2.8500	79.2100	39.5400	25.8100	332827
7	XGOL	Lindgren, Little and Walter	t	91.6400	34.4100	75.5300	23.1600	53.3700	13.1100	0.4900	34.6300	36.9400	78.0800	25.5100	38.1800	68.0500	8.0500	72.2800	509572
8	NTWG	Brekke and Sons	t	87.9000	56.6700	88.0600	95.0900	14.6200	61.1400	44.7400	56.4600	31.1000	93.3300	86.9500	12.8000	59.7700	84.7200	43.6900	315536
9	QKYW	Dooley LLC	t	10.0600	95.3800	65.4800	79.1800	3.8000	34.5100	73.6800	88.3800	67.7900	49.8200	50.7300	65.8700	88.6000	74.6000	49.9600	444352
10	TMVR	Hintz, Weimann and Stoltenberg	t	77.3500	35.0200	31.7600	40.6400	51.4800	33.2200	70.7700	80.1000	16.5100	37.3000	86.7000	63.1900	41.7500	41.3800	17.8300	349875
\.


--
-- Data for Name: trades; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.trades (id, user_id, stock_id, quantity, buy_sell_price, log_time, created_at, updated_at) FROM stdin;
1	1	1	100	50.1000	2019-08-27 23:23:08.88697	2019-08-27 23:23:18.056504	2019-08-27 23:23:18.056504
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.users (id, username, email, encrypted_password, cash, admin, reset_password_token, reset_password_sent_at, remember_created_at, current_sign_in_at, last_sign_in_at, created_at, updated_at) FROM stdin;
1	tae	tae@abc.com	$2a$11$GZ0Xd/L2LU0nl/cuLDTBquUDtDKKQrpENMnL7as4psRiqRAavv5Om	4990.00	f	\N	\N	\N	\N	\N	2019-08-27 23:21:03.682633	2019-08-27 23:23:23.372028
\.


--
-- Data for Name: values; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public."values" (id, stock_id, price, log_time, created_at, updated_at) FROM stdin;
1	1	65.7500	2019-08-28 00:20:20.621923	2019-08-27 23:20:20.63961	2019-08-27 23:20:20.63961
2	1	66.7500	2019-08-28 01:20:20.621923	2019-08-27 23:20:20.643004	2019-08-27 23:20:20.643004
3	1	67.7500	2019-08-28 02:20:20.621923	2019-08-27 23:20:20.645151	2019-08-27 23:20:20.645151
4	1	65.7500	2019-08-28 03:20:20.621923	2019-08-27 23:20:20.647422	2019-08-27 23:20:20.647422
5	1	66.7500	2019-08-28 04:20:20.621923	2019-08-27 23:20:20.649637	2019-08-27 23:20:20.649637
6	1	66.7500	2019-08-28 05:20:20.621923	2019-08-27 23:20:20.651901	2019-08-27 23:20:20.651901
7	1	66.7500	2019-08-28 06:20:20.621923	2019-08-27 23:20:20.654165	2019-08-27 23:20:20.654165
8	1	67.7500	2019-08-28 07:20:20.621923	2019-08-27 23:20:20.656213	2019-08-27 23:20:20.656213
9	1	67.7500	2019-08-28 08:20:20.621923	2019-08-27 23:20:20.658522	2019-08-27 23:20:20.658522
10	1	67.7500	2019-08-28 09:20:20.621923	2019-08-27 23:20:20.660766	2019-08-27 23:20:20.660766
11	2	75.1000	2019-08-28 00:20:20.665018	2019-08-27 23:20:20.665976	2019-08-27 23:20:20.665976
12	2	74.1000	2019-08-28 01:20:20.665018	2019-08-27 23:20:20.668263	2019-08-27 23:20:20.668263
13	2	73.1000	2019-08-28 02:20:20.665018	2019-08-27 23:20:20.670484	2019-08-27 23:20:20.670484
14	2	73.1000	2019-08-28 03:20:20.665018	2019-08-27 23:20:20.672633	2019-08-27 23:20:20.672633
15	2	74.1000	2019-08-28 04:20:20.665018	2019-08-27 23:20:20.675531	2019-08-27 23:20:20.675531
16	2	75.1000	2019-08-28 05:20:20.665018	2019-08-27 23:20:20.677644	2019-08-27 23:20:20.677644
17	2	75.1000	2019-08-28 06:20:20.665018	2019-08-27 23:20:20.679943	2019-08-27 23:20:20.679943
18	2	75.1000	2019-08-28 07:20:20.665018	2019-08-27 23:20:20.682036	2019-08-27 23:20:20.682036
19	2	73.1000	2019-08-28 08:20:20.665018	2019-08-27 23:20:20.684226	2019-08-27 23:20:20.684226
20	2	74.1000	2019-08-28 09:20:20.665018	2019-08-27 23:20:20.686278	2019-08-27 23:20:20.686278
21	3	0.1700	2019-08-28 00:20:20.690606	2019-08-27 23:20:20.691511	2019-08-27 23:20:20.691511
22	3	0.1700	2019-08-28 01:20:20.690606	2019-08-27 23:20:20.693817	2019-08-27 23:20:20.693817
23	3	1.1700	2019-08-28 02:20:20.690606	2019-08-27 23:20:20.695994	2019-08-27 23:20:20.695994
24	3	1.1700	2019-08-28 03:20:20.690606	2019-08-27 23:20:20.698282	2019-08-27 23:20:20.698282
25	3	1.1700	2019-08-28 04:20:20.690606	2019-08-27 23:20:20.700387	2019-08-27 23:20:20.700387
26	3	1.1700	2019-08-28 05:20:20.690606	2019-08-27 23:20:20.702601	2019-08-27 23:20:20.702601
27	3	1.1700	2019-08-28 06:20:20.690606	2019-08-27 23:20:20.704782	2019-08-27 23:20:20.704782
28	3	1.1700	2019-08-28 07:20:20.690606	2019-08-27 23:20:20.707022	2019-08-27 23:20:20.707022
29	3	2.1700	2019-08-28 08:20:20.690606	2019-08-27 23:20:20.709261	2019-08-27 23:20:20.709261
30	3	2.1700	2019-08-28 09:20:20.690606	2019-08-27 23:20:20.711386	2019-08-27 23:20:20.711386
31	4	21.0500	2019-08-28 00:20:20.715659	2019-08-27 23:20:20.716768	2019-08-27 23:20:20.716768
32	4	22.0500	2019-08-28 01:20:20.715659	2019-08-27 23:20:20.719104	2019-08-27 23:20:20.719104
33	4	23.0500	2019-08-28 02:20:20.715659	2019-08-27 23:20:20.721324	2019-08-27 23:20:20.721324
34	4	23.0500	2019-08-28 03:20:20.715659	2019-08-27 23:20:20.723622	2019-08-27 23:20:20.723622
35	4	21.0500	2019-08-28 04:20:20.715659	2019-08-27 23:20:20.725875	2019-08-27 23:20:20.725875
36	4	21.0500	2019-08-28 05:20:20.715659	2019-08-27 23:20:20.728009	2019-08-27 23:20:20.728009
37	4	22.0500	2019-08-28 06:20:20.715659	2019-08-27 23:20:20.729996	2019-08-27 23:20:20.729996
38	4	23.0500	2019-08-28 07:20:20.715659	2019-08-27 23:20:20.732064	2019-08-27 23:20:20.732064
39	4	22.0500	2019-08-28 08:20:20.715659	2019-08-27 23:20:20.734328	2019-08-27 23:20:20.734328
40	4	21.0500	2019-08-28 09:20:20.715659	2019-08-27 23:20:20.736454	2019-08-27 23:20:20.736454
41	5	36.5200	2019-08-28 00:20:20.740743	2019-08-27 23:20:20.741767	2019-08-27 23:20:20.741767
42	5	36.5200	2019-08-28 01:20:20.740743	2019-08-27 23:20:20.744017	2019-08-27 23:20:20.744017
43	5	36.5200	2019-08-28 02:20:20.740743	2019-08-27 23:20:20.746188	2019-08-27 23:20:20.746188
44	5	37.5200	2019-08-28 03:20:20.740743	2019-08-27 23:20:20.748465	2019-08-27 23:20:20.748465
45	5	36.5200	2019-08-28 04:20:20.740743	2019-08-27 23:20:20.750592	2019-08-27 23:20:20.750592
46	5	36.5200	2019-08-28 05:20:20.740743	2019-08-27 23:20:20.752828	2019-08-27 23:20:20.752828
47	5	35.5200	2019-08-28 06:20:20.740743	2019-08-27 23:20:20.755011	2019-08-27 23:20:20.755011
48	5	36.5200	2019-08-28 07:20:20.740743	2019-08-27 23:20:20.757044	2019-08-27 23:20:20.757044
49	5	36.5200	2019-08-28 08:20:20.740743	2019-08-27 23:20:20.759145	2019-08-27 23:20:20.759145
50	5	37.5200	2019-08-28 09:20:20.740743	2019-08-27 23:20:20.761353	2019-08-27 23:20:20.761353
51	6	6.4300	2019-08-28 00:20:20.765635	2019-08-27 23:20:20.766498	2019-08-27 23:20:20.766498
52	6	8.4300	2019-08-28 01:20:20.765635	2019-08-27 23:20:20.768856	2019-08-27 23:20:20.768856
53	6	8.4300	2019-08-28 02:20:20.765635	2019-08-27 23:20:20.771173	2019-08-27 23:20:20.771173
54	6	8.4300	2019-08-28 03:20:20.765635	2019-08-27 23:20:20.773337	2019-08-27 23:20:20.773337
55	6	7.4300	2019-08-28 04:20:20.765635	2019-08-27 23:20:20.775583	2019-08-27 23:20:20.775583
56	6	8.4300	2019-08-28 05:20:20.765635	2019-08-27 23:20:20.778016	2019-08-27 23:20:20.778016
57	6	7.4300	2019-08-28 06:20:20.765635	2019-08-27 23:20:20.780206	2019-08-27 23:20:20.780206
58	6	8.4300	2019-08-28 07:20:20.765635	2019-08-27 23:20:20.7824	2019-08-27 23:20:20.7824
59	6	8.4300	2019-08-28 08:20:20.765635	2019-08-27 23:20:20.784552	2019-08-27 23:20:20.784552
60	6	7.4300	2019-08-28 09:20:20.765635	2019-08-27 23:20:20.789553	2019-08-27 23:20:20.789553
61	7	33.4100	2019-08-28 00:20:20.794381	2019-08-27 23:20:20.795394	2019-08-27 23:20:20.795394
62	7	32.4100	2019-08-28 01:20:20.794381	2019-08-27 23:20:20.797636	2019-08-27 23:20:20.797636
63	7	34.4100	2019-08-28 02:20:20.794381	2019-08-27 23:20:20.799647	2019-08-27 23:20:20.799647
64	7	33.4100	2019-08-28 03:20:20.794381	2019-08-27 23:20:20.801574	2019-08-27 23:20:20.801574
65	7	32.4100	2019-08-28 04:20:20.794381	2019-08-27 23:20:20.803404	2019-08-27 23:20:20.803404
66	7	34.4100	2019-08-28 05:20:20.794381	2019-08-27 23:20:20.805264	2019-08-27 23:20:20.805264
67	7	32.4100	2019-08-28 06:20:20.794381	2019-08-27 23:20:20.807308	2019-08-27 23:20:20.807308
68	7	33.4100	2019-08-28 07:20:20.794381	2019-08-27 23:20:20.809286	2019-08-27 23:20:20.809286
69	7	32.4100	2019-08-28 08:20:20.794381	2019-08-27 23:20:20.811087	2019-08-27 23:20:20.811087
70	7	33.4100	2019-08-28 09:20:20.794381	2019-08-27 23:20:20.813048	2019-08-27 23:20:20.813048
71	8	56.6700	2019-08-28 00:20:20.816947	2019-08-27 23:20:20.817744	2019-08-27 23:20:20.817744
72	8	56.6700	2019-08-28 01:20:20.816947	2019-08-27 23:20:20.819745	2019-08-27 23:20:20.819745
73	8	56.6700	2019-08-28 02:20:20.816947	2019-08-27 23:20:20.821675	2019-08-27 23:20:20.821675
74	8	54.6700	2019-08-28 03:20:20.816947	2019-08-27 23:20:20.823617	2019-08-27 23:20:20.823617
75	8	56.6700	2019-08-28 04:20:20.816947	2019-08-27 23:20:20.825592	2019-08-27 23:20:20.825592
76	8	55.6700	2019-08-28 05:20:20.816947	2019-08-27 23:20:20.827385	2019-08-27 23:20:20.827385
77	8	54.6700	2019-08-28 06:20:20.816947	2019-08-27 23:20:20.829207	2019-08-27 23:20:20.829207
78	8	56.6700	2019-08-28 07:20:20.816947	2019-08-27 23:20:20.831137	2019-08-27 23:20:20.831137
79	8	56.6700	2019-08-28 08:20:20.816947	2019-08-27 23:20:20.833089	2019-08-27 23:20:20.833089
80	8	56.6700	2019-08-28 09:20:20.816947	2019-08-27 23:20:20.834988	2019-08-27 23:20:20.834988
81	9	95.3800	2019-08-28 00:20:20.838688	2019-08-27 23:20:20.839483	2019-08-27 23:20:20.839483
82	9	95.3800	2019-08-28 01:20:20.838688	2019-08-27 23:20:20.841438	2019-08-27 23:20:20.841438
83	9	94.3800	2019-08-28 02:20:20.838688	2019-08-27 23:20:20.84334	2019-08-27 23:20:20.84334
84	9	95.3800	2019-08-28 03:20:20.838688	2019-08-27 23:20:20.845202	2019-08-27 23:20:20.845202
85	9	93.3800	2019-08-28 04:20:20.838688	2019-08-27 23:20:20.847116	2019-08-27 23:20:20.847116
86	9	95.3800	2019-08-28 05:20:20.838688	2019-08-27 23:20:20.849001	2019-08-27 23:20:20.849001
87	9	93.3800	2019-08-28 06:20:20.838688	2019-08-27 23:20:20.850936	2019-08-27 23:20:20.850936
88	9	93.3800	2019-08-28 07:20:20.838688	2019-08-27 23:20:20.852792	2019-08-27 23:20:20.852792
89	9	93.3800	2019-08-28 08:20:20.838688	2019-08-27 23:20:20.854669	2019-08-27 23:20:20.854669
90	9	95.3800	2019-08-28 09:20:20.838688	2019-08-27 23:20:20.856484	2019-08-27 23:20:20.856484
91	10	35.0200	2019-08-28 00:20:20.860235	2019-08-27 23:20:20.861035	2019-08-27 23:20:20.861035
92	10	34.0200	2019-08-28 01:20:20.860235	2019-08-27 23:20:20.862957	2019-08-27 23:20:20.862957
93	10	33.0200	2019-08-28 02:20:20.860235	2019-08-27 23:20:20.86483	2019-08-27 23:20:20.86483
94	10	34.0200	2019-08-28 03:20:20.860235	2019-08-27 23:20:20.866635	2019-08-27 23:20:20.866635
95	10	35.0200	2019-08-28 04:20:20.860235	2019-08-27 23:20:20.868473	2019-08-27 23:20:20.868473
96	10	35.0200	2019-08-28 05:20:20.860235	2019-08-27 23:20:20.870287	2019-08-27 23:20:20.870287
97	10	33.0200	2019-08-28 06:20:20.860235	2019-08-27 23:20:20.87214	2019-08-27 23:20:20.87214
98	10	35.0200	2019-08-28 07:20:20.860235	2019-08-27 23:20:20.874009	2019-08-27 23:20:20.874009
99	10	33.0200	2019-08-28 08:20:20.860235	2019-08-27 23:20:20.875925	2019-08-27 23:20:20.875925
100	10	34.0200	2019-08-28 09:20:20.860235	2019-08-27 23:20:20.877796	2019-08-27 23:20:20.877796
\.


--
-- Name: portfolios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.portfolios_id_seq', 1, false);


--
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.stocks_id_seq', 10, true);


--
-- Name: trades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.trades_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.values_id_seq', 100, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: portfolios portfolios_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT portfolios_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- Name: trades trades_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: values values_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public."values"
    ADD CONSTRAINT values_pkey PRIMARY KEY (id);


--
-- Name: index_portfolios_on_stock_id; Type: INDEX; Schema: public; Owner: Guest
--

CREATE INDEX index_portfolios_on_stock_id ON public.portfolios USING btree (stock_id);


--
-- Name: index_portfolios_on_user_id; Type: INDEX; Schema: public; Owner: Guest
--

CREATE INDEX index_portfolios_on_user_id ON public.portfolios USING btree (user_id);


--
-- Name: index_trades_on_stock_id; Type: INDEX; Schema: public; Owner: Guest
--

CREATE INDEX index_trades_on_stock_id ON public.trades USING btree (stock_id);


--
-- Name: index_trades_on_user_id; Type: INDEX; Schema: public; Owner: Guest
--

CREATE INDEX index_trades_on_user_id ON public.trades USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: Guest
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: Guest
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_values_on_stock_id; Type: INDEX; Schema: public; Owner: Guest
--

CREATE INDEX index_values_on_stock_id ON public."values" USING btree (stock_id);


--
-- Name: trades fk_rails_12b0ea7696; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT fk_rails_12b0ea7696 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: portfolios fk_rails_2abc71c887; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT fk_rails_2abc71c887 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: values fk_rails_2e825a9796; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public."values"
    ADD CONSTRAINT fk_rails_2e825a9796 FOREIGN KEY (stock_id) REFERENCES public.stocks(id);


--
-- Name: portfolios fk_rails_62e22c0de3; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT fk_rails_62e22c0de3 FOREIGN KEY (stock_id) REFERENCES public.stocks(id);


--
-- Name: trades fk_rails_8a8aa453a2; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT fk_rails_8a8aa453a2 FOREIGN KEY (stock_id) REFERENCES public.stocks(id);


--
-- PostgreSQL database dump complete
--


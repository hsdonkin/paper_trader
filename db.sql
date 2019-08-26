--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: hugh
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO hugh;

--
-- Name: portfolios; Type: TABLE; Schema: public; Owner: hugh
--

CREATE TABLE public.portfolios (
    id bigint NOT NULL,
    users_id bigint,
    stocks_id bigint
);


ALTER TABLE public.portfolios OWNER TO hugh;

--
-- Name: portfolios_id_seq; Type: SEQUENCE; Schema: public; Owner: hugh
--

CREATE SEQUENCE public.portfolios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolios_id_seq OWNER TO hugh;

--
-- Name: portfolios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugh
--

ALTER SEQUENCE public.portfolios_id_seq OWNED BY public.portfolios.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: hugh
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO hugh;

--
-- Name: stocks; Type: TABLE; Schema: public; Owner: hugh
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


ALTER TABLE public.stocks OWNER TO hugh;

--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: hugh
--

CREATE SEQUENCE public.stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO hugh;

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugh
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- Name: trades; Type: TABLE; Schema: public; Owner: hugh
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


ALTER TABLE public.trades OWNER TO hugh;

--
-- Name: trades_id_seq; Type: SEQUENCE; Schema: public; Owner: hugh
--

CREATE SEQUENCE public.trades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trades_id_seq OWNER TO hugh;

--
-- Name: trades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugh
--

ALTER SEQUENCE public.trades_id_seq OWNED BY public.trades.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: hugh
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying DEFAULT ''::character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    cash numeric(10,2) DEFAULT 10000.0,
    admin boolean DEFAULT false NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO hugh;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: hugh
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO hugh;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugh
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: values; Type: TABLE; Schema: public; Owner: hugh
--

CREATE TABLE public."values" (
    id bigint NOT NULL,
    stock_id bigint,
    price numeric(10,4),
    log_time timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public."values" OWNER TO hugh;

--
-- Name: values_id_seq; Type: SEQUENCE; Schema: public; Owner: hugh
--

CREATE SEQUENCE public.values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.values_id_seq OWNER TO hugh;

--
-- Name: values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hugh
--

ALTER SEQUENCE public.values_id_seq OWNED BY public."values".id;


--
-- Name: portfolios id; Type: DEFAULT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.portfolios ALTER COLUMN id SET DEFAULT nextval('public.portfolios_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- Name: trades id; Type: DEFAULT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.trades ALTER COLUMN id SET DEFAULT nextval('public.trades_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: values id; Type: DEFAULT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public."values" ALTER COLUMN id SET DEFAULT nextval('public.values_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: portfolios portfolios_pkey; Type: CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT portfolios_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- Name: trades trades_pkey; Type: CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: values values_pkey; Type: CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public."values"
    ADD CONSTRAINT values_pkey PRIMARY KEY (id);


--
-- Name: index_portfolios_on_stocks_id; Type: INDEX; Schema: public; Owner: hugh
--

CREATE INDEX index_portfolios_on_stocks_id ON public.portfolios USING btree (stocks_id);


--
-- Name: index_portfolios_on_users_id; Type: INDEX; Schema: public; Owner: hugh
--

CREATE INDEX index_portfolios_on_users_id ON public.portfolios USING btree (users_id);


--
-- Name: index_trades_on_stock_id; Type: INDEX; Schema: public; Owner: hugh
--

CREATE INDEX index_trades_on_stock_id ON public.trades USING btree (stock_id);


--
-- Name: index_trades_on_user_id; Type: INDEX; Schema: public; Owner: hugh
--

CREATE INDEX index_trades_on_user_id ON public.trades USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: hugh
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: hugh
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_values_on_stock_id; Type: INDEX; Schema: public; Owner: hugh
--

CREATE INDEX index_values_on_stock_id ON public."values" USING btree (stock_id);


--
-- Name: trades fk_rails_12b0ea7696; Type: FK CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT fk_rails_12b0ea7696 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: portfolios fk_rails_19941ce44e; Type: FK CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT fk_rails_19941ce44e FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- Name: values fk_rails_2e825a9796; Type: FK CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public."values"
    ADD CONSTRAINT fk_rails_2e825a9796 FOREIGN KEY (stock_id) REFERENCES public.stocks(id);


--
-- Name: portfolios fk_rails_78173e3fee; Type: FK CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT fk_rails_78173e3fee FOREIGN KEY (stocks_id) REFERENCES public.stocks(id);


--
-- Name: trades fk_rails_8a8aa453a2; Type: FK CONSTRAINT; Schema: public; Owner: hugh
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT fk_rails_8a8aa453a2 FOREIGN KEY (stock_id) REFERENCES public.stocks(id);


--
-- PostgreSQL database dump complete
--


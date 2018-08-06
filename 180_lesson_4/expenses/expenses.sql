--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.expenses DROP CONSTRAINT expenses_pkey;
ALTER TABLE public.expenses ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.expenses_id_seq;
DROP TABLE public.expenses;
DROP FUNCTION public.list();
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: jocie
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO jocie;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: jocie
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: list(); Type: FUNCTION; Schema: public; Owner: jocie
--

CREATE FUNCTION list() RETURNS void
    LANGUAGE plpgsql
    AS $$ 
BEGIN 
  RAISE NOTICE 'hello world';
END; $$;


ALTER FUNCTION public.list() OWNER TO jocie;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: jocie
--

CREATE TABLE expenses (
    id integer NOT NULL,
    amount numeric(6,2) NOT NULL,
    memo text NOT NULL,
    created_on date NOT NULL,
    CONSTRAINT check_positive_amount CHECK ((amount > 0.00))
);


ALTER TABLE expenses OWNER TO jocie;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: jocie
--

CREATE SEQUENCE expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_id_seq OWNER TO jocie;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jocie
--

ALTER SEQUENCE expenses_id_seq OWNED BY expenses.id;


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: jocie
--

ALTER TABLE ONLY expenses ALTER COLUMN id SET DEFAULT nextval('expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: jocie
--

INSERT INTO expenses VALUES (6, 14.56, 'Pencils', '2017-04-16');
INSERT INTO expenses VALUES (7, 3.29, 'Coffee', '2017-04-16');
INSERT INTO expenses VALUES (8, 49.99, 'Text Editor', '2017-04-16');
INSERT INTO expenses VALUES (9, 3.59, 'More Coffee', '2017-04-16');


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jocie
--

SELECT pg_catalog.setval('expenses_id_seq', 11, true);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: jocie
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


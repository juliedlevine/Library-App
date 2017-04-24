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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: Julie
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying,
    author character varying,
    description character varying,
    cover character varying
);


ALTER TABLE books OWNER TO "Julie";

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: Julie
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_id_seq OWNER TO "Julie";

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Julie
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Julie
--

CREATE TABLE users (
    id integer NOT NULL,
    facebook_id text,
    name text
);


ALTER TABLE users OWNER TO "Julie";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Julie
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Julie";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Julie
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: Julie
--

COPY books (id, title, author, description, cover) FROM stdin;
41	The Girl On The Train	Paula Hawkins	Fast read.	https://images.gr-assets.com/books/1490903702m/22557272.jpg
42	When Breath Becomes Air	Paul Kalanithi	I listened to this as an audiobook and was totally hooked.	https://images.gr-assets.com/books/1492677644m/25899336.jpg
45	The Paris Architect	Charles Belfoure	I was on a WWII kick recently and this was one of my favorites from that genre. 	https://images.gr-assets.com/books/1375064865m/17456328.jpg
46	The Martian	Andy Weir	This was so fascinating. When I read that all the science is actually accurate and verified by NASA employees I thought it was the coolest thing.	https://images.gr-assets.com/books/1413706054m/18007564.jpg
48	Harry Potter and the Half Blood Prince	J.K. Rowling	Had to include at least one Harry Potter book. This one is my favorite.	https://images.gr-assets.com/books/1361039191m/1.jpg
49	The Nightingale	Kristin Hannah	My favorite book at the moment. It's SO GOOD. First book I recommend to anyone.	https://images.gr-assets.com/books/1451446316m/21853621.jpg
50	The Glass Castle	Jeannette Walls	This book is super sad but it's amazing.	https://images.gr-assets.com/books/1400930557m/7445.jpg
51	A Man Called Ove	Fredrik Backman	This one was slow at first but ended up being so sweet. I loved it!	https://images.gr-assets.com/books/1405259930m/18774964.jpg
52	Fight Club	Chuck Palahniuk	Everyone should read this.	https://images.gr-assets.com/books/1357128997m/5759.jpg
38	Ready Player One	Ernest Cline	Favorite sci fi book!	https://images.gr-assets.com/books/1489368740m/9969571.jpg
23	Siddhartha	Hermann Hesse	In the novel, Siddhartha, a young man, leaves his family for a contemplative life, then, restless, discards it for one of the flesh. He conceives a son, but bored and sickened by lust and greed, moves on again. Near despair, Siddhartha comes to a river where he hears a unique sound. This sound signals the true beginning of his life—the beginning of suffering, rejection, peace, and, finally, wisdom.	https://images.gr-assets.com/books/1428715580m/52036.jpg
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Julie
--

SELECT pg_catalog.setval('books_id_seq', 52, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Julie
--

COPY users (id, facebook_id, name) FROM stdin;
1	10106990799972660	Julie Dyer
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Julie
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Julie
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


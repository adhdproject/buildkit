CREATE TABLE IF NOT EXISTS requests (
    cip character(32),
    type character varying(16),
    eip character varying(16),
    iip character varying(16),
    dip character varying(16),
    stamp timestamp without time zone DEFAULT now()
);


ALTER TABLE public.requests OWNER TO decloakuser;

-- CREATE DATABASE decloak;
-- \\connect decloak
-- --
-- -- PostgreSQL database dump
-- --

-- SET statement_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SET check_function_bodies = false;
-- SET client_min_messages = warning;

-- --
-- -- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
-- --

-- CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


-- --
-- -- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
-- --

-- COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


-- SET search_path = public, pg_catalog;

-- SET default_tablespace = '';

-- SET default_with_oids = false;

-- --
-- -- Name: requests; Type: TABLE; Schema: public; Owner: decloakuser;
-- -- Tablespace: 
-- --

-- CREATE TABLE requests (
--     cip character(32),
--     type character varying(16),
--     eip character varying(16),
--     iip character varying(16),
--     dip character varying(16),
--     stamp timestamp without time zone DEFAULT now()
-- );


-- ALTER TABLE public.requests OWNER TO decloakuser;

-- --
-- -- Data for Name: requests; Type: TABLE DATA; Schema: public;
-- --          Owner: decloakuser
-- --

-- COPY requests (cip, type, eip, iip, dip, stamp) FROM stdin;
-- \.


-- --
-- -- Name: public; Type: ACL; Schema: -; Owner: postgres
-- --

-- REVOKE ALL ON SCHEMA public FROM PUBLIC;
-- REVOKE ALL ON SCHEMA public FROM postgres;
-- GRANT ALL ON SCHEMA public TO postgres;
-- GRANT ALL ON SCHEMA public TO PUBLIC;


-- --
-- -- PostgreSQL database dump complete
-- --

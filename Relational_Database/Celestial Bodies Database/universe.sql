--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30),
    age integer NOT NULL,
    distance integer NOT NULL,
    diameter numeric(8,4),
    description text,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: meteorite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteorite (
    name character varying(30) NOT NULL,
    meteorite_id integer NOT NULL,
    hash_tag character varying(30)
);


ALTER TABLE public.meteorite OWNER TO freecodecamp;

--
-- Name: meteorite_meteorite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteorite_meteorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteorite_meteorite_id_seq OWNER TO freecodecamp;

--
-- Name: meteorite_meteorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteorite_meteorite_id_seq OWNED BY public.meteorite.meteorite_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30),
    age integer NOT NULL,
    distance integer NOT NULL,
    diameter numeric(8,4),
    description text,
    has_life boolean,
    is_spherical boolean,
    moon_id integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30),
    age integer NOT NULL,
    distance integer NOT NULL,
    diameter numeric(8,4),
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30),
    age integer NOT NULL,
    distance integer NOT NULL,
    diameter numeric(8,4),
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: meteorite meteorite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteorite ALTER COLUMN meteorite_id SET DEFAULT nextval('public.meteorite_meteorite_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('galaxy1', 1000, 4321, 1132.1321, 'desc1', true, true, 1);
INSERT INTO public.galaxy VALUES ('galaxy2', 1000, 4321, 1132.1321, 'desc1', true, true, 3);
INSERT INTO public.galaxy VALUES ('galaxy3', 1000, 4321, 1132.1321, 'desc1', true, true, 4);
INSERT INTO public.galaxy VALUES ('galaxy4', 1000, 4321, 1132.1321, 'desc1', true, true, 5);
INSERT INTO public.galaxy VALUES ('galaxy9', 1000, 4321, 1132.1321, 'desc1', true, true, 7);
INSERT INTO public.galaxy VALUES ('galaxy10', 1000, 4321, 1132.1321, 'desc1', true, true, 8);
INSERT INTO public.galaxy VALUES ('galaxy11', 1000, 4321, 1132.1321, 'desc1', true, true, 9);
INSERT INTO public.galaxy VALUES ('galaxy12', 1000, 4321, 1132.1321, 'desc1', true, true, 10);
INSERT INTO public.galaxy VALUES ('galaxy13', 1000, 4321, 1132.1321, 'desc1', true, true, 11);
INSERT INTO public.galaxy VALUES ('galaxy14', 1000, 4321, 1132.1321, 'desc1', true, true, 12);


--
-- Data for Name: meteorite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteorite VALUES ('met1', 1, NULL);
INSERT INTO public.meteorite VALUES ('met2', 2, NULL);
INSERT INTO public.meteorite VALUES ('met3
', 3, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon1', 1000, 4321, 1132.1321, 'desc1', true, true, 1, 4);
INSERT INTO public.moon VALUES ('moon2', 1000, 4321, 1132.1321, 'desc1', true, true, 2, 4);
INSERT INTO public.moon VALUES ('moon3', 1000, 4321, 1132.1321, 'desc1', true, true, 3, 4);
INSERT INTO public.moon VALUES ('moon4', 1000, 4321, 1132.1321, 'desc1', true, true, 4, 4);
INSERT INTO public.moon VALUES ('moon5', 1000, 4321, 1132.1321, 'desc1', true, true, 5, 4);
INSERT INTO public.moon VALUES ('moon6', 1000, 4321, 1132.1321, 'desc1', true, true, 6, 4);
INSERT INTO public.moon VALUES ('moon7', 1000, 4321, 1132.1321, 'desc1', true, true, 7, 4);
INSERT INTO public.moon VALUES ('moon8', 1000, 4321, 1132.1321, 'desc1', true, true, 8, 4);
INSERT INTO public.moon VALUES ('moon9', 1000, 4321, 1132.1321, 'desc1', true, true, 9, 4);
INSERT INTO public.moon VALUES ('moon10', 1000, 4321, 1132.1321, 'desc1', true, true, 10, 4);
INSERT INTO public.moon VALUES ('moon11', 1000, 4321, 1132.1321, 'desc1', true, true, 11, 4);
INSERT INTO public.moon VALUES ('moon12', 1000, 4321, 1132.1321, 'desc1', true, true, 12, 4);
INSERT INTO public.moon VALUES ('moon21', 1000, 4321, 1132.1321, 'desc1', true, true, 13, 4);
INSERT INTO public.moon VALUES ('moon22', 1000, 4321, 1132.1321, 'desc1', true, true, 14, 4);
INSERT INTO public.moon VALUES ('moon23', 1000, 4321, 1132.1321, 'desc1', true, true, 15, 4);
INSERT INTO public.moon VALUES ('moon24', 1000, 4321, 1132.1321, 'desc1', true, true, 16, 4);
INSERT INTO public.moon VALUES ('moon25', 1000, 4321, 1132.1321, 'desc1', true, true, 17, 4);
INSERT INTO public.moon VALUES ('moon26', 1000, 4321, 1132.1321, 'desc1', true, true, 18, 4);
INSERT INTO public.moon VALUES ('moon27', 1000, 4321, 1132.1321, 'desc1', true, true, 19, 4);
INSERT INTO public.moon VALUES ('moon28', 1000, 4321, 1132.1321, 'desc1', true, true, 20, 4);
INSERT INTO public.moon VALUES ('moon29', 1000, 4321, 1132.1321, 'desc1', true, true, 21, 4);
INSERT INTO public.moon VALUES ('moon210', 1000, 4321, 1132.1321, 'desc1', true, true, 22, 4);
INSERT INTO public.moon VALUES ('moon211', 1000, 4321, 1132.1321, 'desc1', true, true, 23, 4);
INSERT INTO public.moon VALUES ('moon212', 1000, 4321, 1132.1321, 'desc1', true, true, 24, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('planet1', 1000, 4321, 1132.1321, 'desc1', true, true, 1, 4);
INSERT INTO public.planet VALUES ('planet2', 1000, 4321, 1132.1321, 'desc1', true, true, 2, 4);
INSERT INTO public.planet VALUES ('planet3', 1000, 4321, 1132.1321, 'desc1', true, true, 3, 4);
INSERT INTO public.planet VALUES ('planet4', 1000, 4321, 1132.1321, 'desc1', true, true, 4, 4);
INSERT INTO public.planet VALUES ('planet5', 1000, 4321, 1132.1321, 'desc1', true, true, 5, 4);
INSERT INTO public.planet VALUES ('planet6', 1000, 4321, 1132.1321, 'desc1', true, true, 6, 4);
INSERT INTO public.planet VALUES ('planet7', 1000, 4321, 1132.1321, 'desc1', true, true, 7, 4);
INSERT INTO public.planet VALUES ('planet8', 1000, 4321, 1132.1321, 'desc1', true, true, 8, 4);
INSERT INTO public.planet VALUES ('planet9', 1000, 4321, 1132.1321, 'desc1', true, true, 9, 4);
INSERT INTO public.planet VALUES ('planet10', 1000, 4321, 1132.1321, 'desc1', true, true, 10, 4);
INSERT INTO public.planet VALUES ('planet11', 1000, 4321, 1132.1321, 'desc1', true, true, 11, 4);
INSERT INTO public.planet VALUES ('planet12', 1000, 4321, 1132.1321, 'desc1', true, true, 12, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('star1', 1000, 4321, 1132.1321, 'desc1', true, true, 1, 4);
INSERT INTO public.star VALUES ('star2', 1000, 4321, 1132.1321, 'desc1', true, true, 2, 4);
INSERT INTO public.star VALUES ('star3', 1000, 4321, 1132.1321, 'desc1', true, true, 3, 4);
INSERT INTO public.star VALUES ('star4', 1000, 4321, 1132.1321, 'desc1', true, true, 4, 4);
INSERT INTO public.star VALUES ('star5', 1000, 4321, 1132.1321, 'desc1', true, true, 5, 4);
INSERT INTO public.star VALUES ('star6', 1000, 4321, 1132.1321, 'desc1', true, true, 6, 4);
INSERT INTO public.star VALUES ('star7', 1000, 4321, 1132.1321, 'desc1', true, true, 7, 4);
INSERT INTO public.star VALUES ('star8', 1000, 4321, 1132.1321, 'desc1', true, true, 8, 4);
INSERT INTO public.star VALUES ('star9', 1000, 4321, 1132.1321, 'desc1', true, true, 9, 4);
INSERT INTO public.star VALUES ('star10', 1000, 4321, 1132.1321, 'desc1', true, true, 10, 4);
INSERT INTO public.star VALUES ('star11', 1000, 4321, 1132.1321, 'desc1', true, true, 11, 4);
INSERT INTO public.star VALUES ('star12', 1000, 4321, 1132.1321, 'desc1', true, true, 12, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: meteorite_meteorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteorite_meteorite_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: meteorite meteorite_hash_tag_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteorite
    ADD CONSTRAINT meteorite_hash_tag_key UNIQUE (hash_tag);


--
-- Name: meteorite meteorite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteorite
    ADD CONSTRAINT meteorite_pkey PRIMARY KEY (meteorite_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


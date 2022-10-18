--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    age integer NOT NULL,
    total_stars integer,
    has_life boolean,
    is_dwarf boolean,
    distance_from_nearst numeric(10,0)
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    total_confirmed integer NOT NULL,
    total_mysterious integer,
    has_life boolean,
    total_stars numeric(10,0)
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    age integer NOT NULL,
    total_submoons integer,
    has_free boolean,
    is_orbiting boolean,
    distance_from_nearst_planet numeric(10,0),
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
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    age integer NOT NULL,
    total_moons integer,
    has_life boolean,
    is_gaseous boolean,
    distance_from_nearst_star numeric(10,0),
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
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    age integer NOT NULL,
    total_planets integer,
    has_planets boolean,
    is_dwarf boolean,
    distance_from_nearst numeric(10,0),
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'IC 2006', 'Elliptical form of galaxy', 182522, 100620, false, false, 17268000);
INSERT INTO public.galaxy VALUES (2, 'NGC 3810', 'Far away small form of galaxy', 9096322, 230820, false, true, 262268000);
INSERT INTO public.galaxy VALUES (3, 'NGC 13000', 'Another dwarf galaxy so many light years away', 7353, 524231, false, true, 53524151);
INSERT INTO public.galaxy VALUES (4, 'MILKY WAY', 'elliptical galaxy of Earth', 839, 6534, true, false, 2423232);
INSERT INTO public.galaxy VALUES (5, 'ANDROMEDA', 'Nearest to milky way', 735, 65265254, false, false, 625);
INSERT INTO public.galaxy VALUES (6, 'IC 4710', 'Another far away galaxy', 736365, 625242, true, true, 12616787);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'A type of galaxy', 234, 456, true, 12345);
INSERT INTO public.galaxy_types VALUES (3, 'Spiraal', 'A type of galaxy', 234, 456, true, 12345);
INSERT INTO public.galaxy_types VALUES (4, 'Circularl', 'A type of galaxy', 234, 456, true, 12345);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earths moon', 6353, 0, false, true, 161, 1);
INSERT INTO public.moon VALUES (2, 'ALuna', 'Earths moon', 6353, 0, false, true, 161, 1);
INSERT INTO public.moon VALUES (3, 'ADLuna', 'Earths moon', 6353, 0, false, true, 161, 1);
INSERT INTO public.moon VALUES (4, 'ADLunSa', 'Earths moon', 6353, 0, false, true, 161, 1);
INSERT INTO public.moon VALUES (5, 'ADSLunSa', 'Earths moon', 6353, 0, false, true, 161, 1);
INSERT INTO public.moon VALUES (6, 'AddDSLunSa', 'Earths moon', 6353, 0, false, true, 161, 4);
INSERT INTO public.moon VALUES (7, 'ASa', 'Earths moon', 6353, 0, false, true, 161, 4);
INSERT INTO public.moon VALUES (8, 'UmnerASa', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (9, 'TitanaASa', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (10, 'TwtanaASa', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (11, 'Hahga', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (12, 'Hahgaaaa', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (13, 'Juliusa', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (14, ' Charon', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (15, 'baron', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (16, 'Simraon', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (17, 'Ariraon', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (18, 'Rhea', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (19, 'Tethys', 'Earths moon', 6353, 0, false, true, 161, 5);
INSERT INTO public.moon VALUES (20, 'Miranda', 'Earths moon', 6353, 0, false, true, 161, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The blue planet', 10060, 1, true, false, 1800, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'The hottest planet', 10061, 0, false, false, 383, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'The second nearest planet', 10059, 0, false, false, 949, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Earth closest neighbour', 10055, 5, true, false, 1932, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest gaseous giant', 10040, 51, false, true, 11209, 1);
INSERT INTO public.planet VALUES (6, 'Satrun', 'Planet with beautiful rings', 10000, 72, false, true, 17420, 1);
INSERT INTO public.planet VALUES (8, 'Eaarth', 'The blue planet', 10060, 1, true, false, 1800, 1);
INSERT INTO public.planet VALUES (9, 'yMercury', 'The hottest planet', 10061, 0, false, false, 383, 1);
INSERT INTO public.planet VALUES (10, 'hVenus', 'The second nearest planet', 10059, 0, false, false, 949, 1);
INSERT INTO public.planet VALUES (11, 'Mgars', 'Earth closest neighbour', 10055, 5, true, false, 1932, 1);
INSERT INTO public.planet VALUES (12, 'Jupir', 'The largest gaseous giant', 10040, 51, false, true, 11209, 1);
INSERT INTO public.planet VALUES (13, 'San', 'Planet with beautiful rings', 10000, 72, false, true, 17420, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SUN', 'Center of the Solar System', 10062, 9, true, false, 18000, 4);
INSERT INTO public.star VALUES (2, 'Alderbaran', 'Tarus star', 2062, 4, true, false, 2000, 5);
INSERT INTO public.star VALUES (3, 'Algola', 'Discovered by Algo Indians', 7262, 5, true, false, 7654, 5);
INSERT INTO public.star VALUES (4, 'Bellatrix', 'House of lestrage', 5242, 0, false, true, 53632, 6);
INSERT INTO public.star VALUES (5, 'Sirius', 'The wolf planet', 7252, 1, true, true, 7668, 6);
INSERT INTO public.star VALUES (6, 'Alnitak', 'Hhagafad fa acgv agvga', 67356, 19, true, false, 7250, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


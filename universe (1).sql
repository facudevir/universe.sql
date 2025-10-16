--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    radius integer,
    has_life boolean DEFAULT false NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    planet_type text,
    diameter integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    average_temperature integer,
    is_gaseous boolean DEFAULT false NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric,
    temperature integer,
    is_active boolean DEFAULT true NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Argentina', 'Our home galaxy', true, true, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Colombia', 'Nearest spiral galaxy', false, true, 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Ecuador', 'Edge-on spiral galaxy', false, true, 11000, 29000000);
INSERT INTO public.galaxy VALUES (4, 'Uruguay', 'Spiral galaxy with companion', false, true, 9000, 23000000);
INSERT INTO public.galaxy VALUES (5, 'Paraguay', 'Supergiant elliptical galaxy', false, true, 13000, 53000000);
INSERT INTO public.galaxy VALUES (6, 'Brasil', 'Satellite galaxy of Argentina', false, true, 10000, 163000);
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 'Our home galaxy', true, true, 13600, 0);
INSERT INTO public.galaxy VALUES (8, 'Andromeda', 'Nearest spiral galaxy', false, true, 10000, 2537000);
INSERT INTO public.galaxy VALUES (9, 'Sombrero', 'Edge-on spiral galaxy', false, true, 11000, 29000000);
INSERT INTO public.galaxy VALUES (10, 'Whirlpool', 'Spiral galaxy with companion', false, true, 9000, 23000000);
INSERT INTO public.galaxy VALUES (11, 'Messier 87', 'Supergiant elliptical galaxy', false, true, 13000, 53000000);
INSERT INTO public.galaxy VALUES (12, 'Large Magellanic Cloud', 'Satellite galaxy of Milky Way', false, true, 10000, 163000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Gallardo', 1, true, 1737, false);
INSERT INTO public.moon VALUES (2, 'Messi', 2, true, 11, false);
INSERT INTO public.moon VALUES (3, 'Benzema', 2, true, 6, false);
INSERT INTO public.moon VALUES (4, 'Drogba', 3, true, 1821, false);
INSERT INTO public.moon VALUES (5, 'Gerrard', 3, true, 1560, false);
INSERT INTO public.moon VALUES (6, 'Cano', 3, true, 2634, false);
INSERT INTO public.moon VALUES (7, 'Icardi', 3, true, 2410, false);
INSERT INTO public.moon VALUES (8, 'Totti', 4, true, 1353, false);
INSERT INTO public.moon VALUES (9, 'Demichelis', 5, true, 400, false);
INSERT INTO public.moon VALUES (10, 'Bochini', 8, true, 800, false);
INSERT INTO public.moon VALUES (11, 'Veron', 8, true, 600, false);
INSERT INTO public.moon VALUES (12, 'Ortega', 10, true, 300, false);
INSERT INTO public.moon VALUES (13, 'Iniesta', 10, true, 250, false);
INSERT INTO public.moon VALUES (14, 'Casillas', 11, true, 500, false);
INSERT INTO public.moon VALUES (15, 'Lampard', 11, true, 400, false);
INSERT INTO public.moon VALUES (16, 'Salah', 12, true, 1000, false);
INSERT INTO public.moon VALUES (17, 'Ganso', 12, true, 800, false);
INSERT INTO public.moon VALUES (18, 'Lukaku', 12, true, 700, false);
INSERT INTO public.moon VALUES (19, 'Lamela', 12, true, 600, false);
INSERT INTO public.moon VALUES (20, 'Bounannotte', 12, true, 500, false);
INSERT INTO public.moon VALUES (21, 'Moon', 1, true, 1737, false);
INSERT INTO public.moon VALUES (22, 'Phobos', 2, true, 11, false);
INSERT INTO public.moon VALUES (23, 'Deimos', 2, true, 6, false);
INSERT INTO public.moon VALUES (24, 'Io', 3, true, 1821, false);
INSERT INTO public.moon VALUES (25, 'Europa', 3, true, 1560, false);
INSERT INTO public.moon VALUES (26, 'Ganymede', 3, true, 2634, false);
INSERT INTO public.moon VALUES (27, 'Callisto', 3, true, 2410, false);
INSERT INTO public.moon VALUES (28, 'Triton', 4, true, 1353, false);
INSERT INTO public.moon VALUES (29, 'Proxima b I', 5, true, 400, false);
INSERT INTO public.moon VALUES (30, 'Andromeda I-A', 8, true, 800, false);
INSERT INTO public.moon VALUES (31, 'Andromeda I-B', 8, true, 600, false);
INSERT INTO public.moon VALUES (32, 'Whirlpool I-A', 10, true, 300, false);
INSERT INTO public.moon VALUES (33, 'Whirlpool I-B', 10, true, 250, false);
INSERT INTO public.moon VALUES (34, 'Whirlpool II-A', 11, true, 500, false);
INSERT INTO public.moon VALUES (35, 'Whirlpool II-B', 11, true, 400, false);
INSERT INTO public.moon VALUES (36, 'Whirlpool III-A', 12, true, 1000, false);
INSERT INTO public.moon VALUES (37, 'Whirlpool III-B', 12, true, 800, false);
INSERT INTO public.moon VALUES (38, 'Whirlpool III-C', 12, true, 700, false);
INSERT INTO public.moon VALUES (39, 'Whirlpool III-D', 12, true, 600, false);
INSERT INTO public.moon VALUES (40, 'Whirlpool III-E', 12, true, 500, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'River Plate', 1, true, true, 'Terrestres', 12742);
INSERT INTO public.planet VALUES (2, 'Barcelona', 1, false, true, 'Terrestres', 6779);
INSERT INTO public.planet VALUES (3, 'Real Madrid', 1, false, true, 'Gas Enorme', 139820);
INSERT INTO public.planet VALUES (4, 'Chelsea', 1, false, true, 'Hielo Grande', 49244);
INSERT INTO public.planet VALUES (5, 'Liverpool', 2, false, true, 'Terrestres', 12000);
INSERT INTO public.planet VALUES (6, 'Fluminense', 3, false, true, 'Canica', 8000);
INSERT INTO public.planet VALUES (7, 'Inter', 4, false, true, 'Gas Enorme', 150000);
INSERT INTO public.planet VALUES (8, 'Roma', 5, false, true, 'Terrestres', 13000);
INSERT INTO public.planet VALUES (9, 'Milan', 5, false, true, 'Gas Enorme', 110000);
INSERT INTO public.planet VALUES (10, 'Malaga', 6, false, true, 'Terrestres', 9000);
INSERT INTO public.planet VALUES (11, 'Independiente', 6, false, true, 'Canica', 50000);
INSERT INTO public.planet VALUES (12, 'Estudiantes', 6, false, true, 'Atlantico', 130000);
INSERT INTO public.planet VALUES (13, 'Earth', 1, true, true, 'Terrestrial', 12742);
INSERT INTO public.planet VALUES (14, 'Mars', 1, false, true, 'Terrestrial', 6779);
INSERT INTO public.planet VALUES (15, 'Jupiter', 1, false, true, 'Gas Giant', 139820);
INSERT INTO public.planet VALUES (16, 'Neptune', 1, false, true, 'Ice Giant', 49244);
INSERT INTO public.planet VALUES (17, 'Proxima b', 2, false, true, 'Terrestrial', 12000);
INSERT INTO public.planet VALUES (18, 'Sirius b', 3, false, true, 'Dwarf', 8000);
INSERT INTO public.planet VALUES (19, 'Betelgeuse I', 4, false, true, 'Gas Giant', 150000);
INSERT INTO public.planet VALUES (20, 'Andromeda I', 5, false, true, 'Terrestrial', 13000);
INSERT INTO public.planet VALUES (21, 'Andromeda II', 5, false, true, 'Gas Giant', 110000);
INSERT INTO public.planet VALUES (22, 'Whirlpool I', 6, false, true, 'Terrestrial', 9000);
INSERT INTO public.planet VALUES (23, 'Whirlpool II', 6, false, true, 'Ice Giant', 50000);
INSERT INTO public.planet VALUES (24, 'Whirlpool III', 6, false, true, 'Gas Giant', 130000);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestres', 'Rocky planets similar to Earth', 288, false);
INSERT INTO public.planet_type VALUES (2, 'Gas enorme', 'Large gaseous planet like Jupiter', 120, true);
INSERT INTO public.planet_type VALUES (3, 'Hielo grande', 'Planets with icy compositions', 60, true);
INSERT INTO public.planet_type VALUES (4, 'Canica', 'Small planet-like object', 180, false);
INSERT INTO public.planet_type VALUES (5, 'Atlantico', 'Covered in liquid water', 300, false);
INSERT INTO public.planet_type VALUES (6, 'Terrestrial', 'Rocky planets similar to Earth', 288, false);
INSERT INTO public.planet_type VALUES (7, 'Gas Giant', 'Large gaseous planet like Jupiter', 120, true);
INSERT INTO public.planet_type VALUES (8, 'Ice Giant', 'Planets with icy compositions', 60, true);
INSERT INTO public.planet_type VALUES (9, 'Dwarf', 'Small planet-like object', 180, false);
INSERT INTO public.planet_type VALUES (10, 'Ocean', 'Covered in liquid water', 300, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 1.0, 5778, true);
INSERT INTO public.star VALUES (2, 'Maria', 1, 0.12, 3042, true);
INSERT INTO public.star VALUES (3, 'Jose', 1, 2.06, 9940, true);
INSERT INTO public.star VALUES (4, 'Pedro', 1, 20.0, 3500, false);
INSERT INTO public.star VALUES (5, 'Juan', 2, 1.5, 6000, true);
INSERT INTO public.star VALUES (6, 'Simon', 4, 3.0, 7500, true);
INSERT INTO public.star VALUES (7, 'Sun', 1, 1.0, 5778, true);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 1, 0.12, 3042, true);
INSERT INTO public.star VALUES (9, 'Sirius', 1, 2.06, 9940, true);
INSERT INTO public.star VALUES (10, 'Betelgeuse', 1, 20.0, 3500, false);
INSERT INTO public.star VALUES (11, 'Andromeda Star A', 2, 1.5, 6000, true);
INSERT INTO public.star VALUES (12, 'Whirlpool Alpha', 4, 3.0, 7500, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 10, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


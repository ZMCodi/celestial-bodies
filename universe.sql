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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    number_of_systems integer,
    distance_from_earth_in_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30),
    radius_in_km integer,
    orbit_period_in_days numeric(10,5)
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
    star_id integer NOT NULL,
    name character varying(30),
    has_atmosphere boolean,
    has_life boolean,
    atmosphere_composition text
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
    galaxy_id integer NOT NULL,
    mass_in_solar_mass numeric(5,1),
    star_type character varying(30),
    number_of_planets integer,
    name character varying(30)
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
-- Name: universes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universes (
    universes_id integer NOT NULL,
    name character varying(30) NOT NULL,
    cardinality character varying(5)
);


ALTER TABLE public.universes OWNER TO freecodecamp;

--
-- Name: universes_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universes_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universes_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universes_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universes_universe_id_seq OWNED BY public.universes.universes_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


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
-- Name: universes universes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universes ALTER COLUMN universes_id SET DEFAULT nextval('public.universes_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 3916, 26000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 50000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'elliptical', 654861, 54);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'spiral', 154352, 2730000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'spiral', 345721, 29);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'dwarf irregular', 9654523, 163000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 1737, 27.30000);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 11, 0.32000);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 6, 1.26000);
INSERT INTO public.moon VALUES (4, 4, 'Io', 1821, 1.77000);
INSERT INTO public.moon VALUES (5, 4, 'Ganymede', 2634, 7.15000);
INSERT INTO public.moon VALUES (6, 5, 'Selvoria', 450, 15.20000);
INSERT INTO public.moon VALUES (7, 6, 'Lethara', 320, 8.50000);
INSERT INTO public.moon VALUES (9, 8, 'Zynara', 175, 4.10000);
INSERT INTO public.moon VALUES (10, 9, 'Thalesta', 610, 12.90000);
INSERT INTO public.moon VALUES (11, 10, 'Bromius', 990, 48.30000);
INSERT INTO public.moon VALUES (12, 11, 'Kyvera', 530, 22.60000);
INSERT INTO public.moon VALUES (13, 12, 'Lithara', 270, 9.30000);
INSERT INTO public.moon VALUES (14, 13, 'Zephara', 680, 30.50000);
INSERT INTO public.moon VALUES (15, 5, 'Andarus', 110, 3.40000);
INSERT INTO public.moon VALUES (16, 6, 'Quilyra', 800, 44.80000);
INSERT INTO public.moon VALUES (18, 8, 'Veridion', 140, 5.20000);
INSERT INTO public.moon VALUES (19, 8, 'Nestron', 760, 26.90000);
INSERT INTO public.moon VALUES (20, 9, 'Elarion', 300, 14.70000);
INSERT INTO public.moon VALUES (21, 10, 'Trionix', 230, 7.10000);
INSERT INTO public.moon VALUES (22, 11, 'Xandria', 540, 19.85000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', true, true, 'N2 78%, O2 21%, Ar 0.93%, CO2 0.04%');
INSERT INTO public.planet VALUES (2, 1, 'Mars', true, false, 'CO2 95.3%, N2 2.7%, Ar 1.6%, O2 0.13%');
INSERT INTO public.planet VALUES (3, 1, 'Venus', true, false, 'CO2 96.5%, N2 3.5%, SO2 trace, Ar trace');
INSERT INTO public.planet VALUES (4, 1, 'Jupiter', true, false, 'H2 90%, He 10%, CH4 trace, NH3 trace');
INSERT INTO public.planet VALUES (5, 2, 'Volturnia', true, false, 'CH4 45%, N2 35%, H2 20%');
INSERT INTO public.planet VALUES (6, 3, 'Thalmos', false, false, NULL);
INSERT INTO public.planet VALUES (8, 4, 'Xeloria', true, true, 'O2 60%, CO2 30%, N2 10%');
INSERT INTO public.planet VALUES (9, 5, 'Zynthara', true, false, 'He 70%, Ne 20%, H2 10%');
INSERT INTO public.planet VALUES (10, 6, 'Arboria', true, true, 'N2 78%, O2 20%, Ar 2%');
INSERT INTO public.planet VALUES (11, 7, 'Kryon', false, false, NULL);
INSERT INTO public.planet VALUES (12, 8, 'Klyseron', true, false, 'H2 85%, CH4 10%, NH3 5%');
INSERT INTO public.planet VALUES (13, 9, 'Elaria', true, true, 'CO2 40%, O2 35%, N2 25%');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 1.0, 'yellow dwarf', 8, 'Sun');
INSERT INTO public.star VALUES (2, 3, 0.8, 'orange dwarf', 3, 'Zeta-41');
INSERT INTO public.star VALUES (3, 4, 1.3, 'yellow dwarf', 5, 'Kepleron-9');
INSERT INTO public.star VALUES (4, 2, 2.5, 'blue-white dwarf', 2, 'Algara-7');
INSERT INTO public.star VALUES (5, 5, 0.3, 'red dwarf', 1, 'Xylanthus-2');
INSERT INTO public.star VALUES (6, 6, 8.0, 'blue giant', NULL, 'Betelstar');
INSERT INTO public.star VALUES (7, 3, 1.0, 'yellow dwarf', 7, 'Draconic-15');
INSERT INTO public.star VALUES (8, 3, 0.5, 'orange dwarf', 4, 'Heliox-3');
INSERT INTO public.star VALUES (9, 5, 15.0, 'blue supergiant', NULL, 'Tesseron');


--
-- Data for Name: universes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universes VALUES (1, 'OmegaVerse', 'N0');
INSERT INTO public.universes VALUES (2, 'SnyderVerse', 'Fin');
INSERT INTO public.universes VALUES (3, 'SpiderVerse', 'Inf');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: universes_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universes_universe_id_seq', 3, true);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: universes universes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universes
    ADD CONSTRAINT universes_pkey PRIMARY KEY (universes_id);


--
-- Name: universes universes_universe_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universes
    ADD CONSTRAINT universes_universe_id_key UNIQUE (universes_id);


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


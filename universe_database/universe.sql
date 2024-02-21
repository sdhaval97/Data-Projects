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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size_in_meters numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_sun numeric(10,2),
    galaxy_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    galaxy_type character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL
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
    name character varying(255) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric(10,2),
    planet_id integer,
    age_in_millions_of_years integer
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
    name character varying(255) NOT NULL,
    size_in_earth_masses numeric(10,2) NOT NULL,
    has_life boolean NOT NULL,
    star_id integer,
    distance_from_star numeric(10,2)
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
    name character varying(255) NOT NULL,
    temperature integer NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, true, 413.70, 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.40, true, 353.20, 1);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512.20, true, 414.00, 1);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 431.70, true, 469.40, 1);
INSERT INTO public.asteroid VALUES (5, 'Interamnia', 350.50, true, 422.90, 1);
INSERT INTO public.asteroid VALUES (6, 'Davida', 329.60, true, 430.70, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 'Spiral', true, 100000.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 'Spiral', false, 2500000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest galaxy in the Local Group', 'Spiral', false, 3000000.00);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Giant elliptical galaxy in the Virgo Cluster', 'Elliptical', false, 54000000.00);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Interacting grand-design spiral galaxy', 'Spiral', false, 30000000.00);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral galaxy in the constellation Virgo', 'Spiral', false, 29000000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (39, 'Moon', true, 0.38, 1, 4500);
INSERT INTO public.moon VALUES (40, 'Phobos', true, 0.01, 2, 4500);
INSERT INTO public.moon VALUES (41, 'Deimos', true, 0.02, 2, 4500);
INSERT INTO public.moon VALUES (42, 'Io', true, 0.42, 3, 4500);
INSERT INTO public.moon VALUES (43, 'Europa', true, 0.67, 3, 4500);
INSERT INTO public.moon VALUES (44, 'Ganymede', true, 1.07, 3, 4500);
INSERT INTO public.moon VALUES (45, 'Callisto', true, 1.88, 3, 4500);
INSERT INTO public.moon VALUES (46, 'Mercury Moon', true, 0.00, 4, 4500);
INSERT INTO public.moon VALUES (47, 'Alpha Centauri Moon', false, 0.00, 5, 4500);
INSERT INTO public.moon VALUES (48, 'Sirius Moon', true, 0.00, 6, 4500);
INSERT INTO public.moon VALUES (49, 'Vega Moon', false, 0.01, 6, 4500);
INSERT INTO public.moon VALUES (50, 'Betelgeuse Moon', true, 0.01, 7, 4500);
INSERT INTO public.moon VALUES (51, 'Whirlpool Moon', true, 0.01, 8, 4500);
INSERT INTO public.moon VALUES (52, 'Sombrero Moon', true, 0.01, 9, 4500);
INSERT INTO public.moon VALUES (53, 'Andromeda Moon', false, 0.01, 10, 4500);
INSERT INTO public.moon VALUES (54, 'Triangulum Moon', true, 0.00, 11, 4500);
INSERT INTO public.moon VALUES (55, 'Messier 87 Moon', true, 0.00, 12, 4500);
INSERT INTO public.moon VALUES (56, 'Kepler-186f Moon', true, 0.05, 1, 4500);
INSERT INTO public.moon VALUES (57, 'Kepler-62f Moon', true, 0.03, 2, 4500);
INSERT INTO public.moon VALUES (58, 'Triton', true, 354.80, 4, 4500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1.00, true, 1, 1.00);
INSERT INTO public.planet VALUES (2, 'Mars', 0.11, false, 1, 1.50);
INSERT INTO public.planet VALUES (3, 'Venus', 0.81, false, 1, 0.72);
INSERT INTO public.planet VALUES (4, 'Mercury', 0.06, false, 1, 0.39);
INSERT INTO public.planet VALUES (5, 'Kepler-186f', 1.10, true, 6, 2.20);
INSERT INTO public.planet VALUES (6, 'Kepler-62f', 0.68, true, 2, 0.71);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 2.40, false, 3, 0.85);
INSERT INTO public.planet VALUES (8, 'Gliese 581g', 3.10, true, 4, 0.13);
INSERT INTO public.planet VALUES (9, 'HD 40307g', 2.20, true, 5, 0.60);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 1.30, false, 4, 0.05);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 0.62, true, 4, 0.03);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1f', 0.68, true, 4, 0.04);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, true, 1, 4500);
INSERT INTO public.star VALUES (2, 'Sirius', 9940, true, 1, 250);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 5790, true, 1, 6000);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 3042, false, 1, 6000);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3490, true, 2, 8000);
INSERT INTO public.star VALUES (6, 'Vega', 9602, true, 1, 450);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 58, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


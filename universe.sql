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
    name character varying(255) NOT NULL,
    age_in_billions_years numeric(10,2) NOT NULL,
    description text,
    estimated_stars integer,
    type integer,
    is_active boolean,
    is_habitable boolean
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
    age_in_billions_years numeric(10,2) NOT NULL,
    description text,
    diameter_in_km integer,
    type integer,
    is_active boolean,
    has_atmosphere boolean,
    planet_id integer NOT NULL
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
    age_in_billions_years numeric(10,2) NOT NULL,
    description text,
    orbital_period integer,
    average_distance_in_au numeric(100,2),
    diameter_in_km integer,
    is_active boolean,
    is_habitable boolean,
    star_id integer NOT NULL
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
    age_in_billions_years numeric(10,2) NOT NULL,
    description text,
    type character varying(50) NOT NULL,
    mass_in_solar_masses numeric(100,2),
    estimated_planets integer,
    size integer,
    is_active boolean,
    is_habitable boolean,
    galaxy_id integer NOT NULL
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
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


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
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.80, 'Our home galaxy, a barred spiral galaxy', 200000, 1, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2.50, 'Nearest major galaxy to the Milky Way', 1000000, 2, true, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 11.00, 'Third brightest member of the Local Group', 30000, 3, true, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 7.50, 'Known for its prominent dust lane', 100000, 4, true, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 20.00, 'Face-on spiral galaxy with prominent arms', 50000, 1, true, false);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 0.25, 'Ring galaxy with a unique appearance', 100, 5, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4.50, 'Earths only natural satellite, with a large impact crater on its visible face', 3474, 1, true, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 2.00, 'Inner moon of Mars, with an irregular potato-shaped form', 22, 1, true, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 1.50, 'Outer moon of Mars, smaller and more spherical than Phobos', 13, 1, true, false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 4.50, 'Volcanically active moon of Jupiter, with numerous volcanoes spewing sulfur', 3642, 0, true, false, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 1.00, 'Icy moon of Jupiter, believed to have a subsurface ocean', 3138, 2, true, true, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4.50, 'Largest moon in the solar system, with a tenuous oxygen atmosphere', 5268, 2, true, false, 4);
INSERT INTO public.moon VALUES (32, 'Titan', 1.80, 'Largest moon of Saturn, with a thick atmosphere and possibly liquid methane lakes on its surface', 5150, 2, true, true, 8);
INSERT INTO public.moon VALUES (33, 'Mimas', 0.40, 'Smallest moon of Saturn known for its heavily cratered surface', 396, 1, true, false, 8);
INSERT INTO public.moon VALUES (34, 'Enceladus', 0.50, 'Icy moon of Saturn with active geysers spewing water vapor', 500, 2, true, true, 8);
INSERT INTO public.moon VALUES (35, 'Dione', 1.00, 'Icy moon of Saturn with a reflective surface and canyons', 1118, 1, true, false, 8);
INSERT INTO public.moon VALUES (36, 'Tethys', 1.00, 'Icy moon of Saturn with a large valley system called Ithaca Chasma', 1062, 1, true, false, 8);
INSERT INTO public.moon VALUES (37, 'Rhea', 1.50, 'Second-largest moon of Saturn with a ring system and a cratered surface', 1528, 1, true, false, 8);
INSERT INTO public.moon VALUES (38, 'Callisto', 4.50, 'Second-largest moon of Jupiter, with a heavily cratered surface and possibly a subsurface ocean', 4821, 2, true, true, 4);
INSERT INTO public.moon VALUES (39, 'Thebe', 0.10, 'Smallest moon of Jupiter known for its irregular shape and dark surface', 110, 1, true, false, 4);
INSERT INTO public.moon VALUES (40, 'Adrastea', 0.02, 'Innermost moon of Jupiter, with a prograde orbit', 20, 1, true, false, 4);
INSERT INTO public.moon VALUES (41, 'Metis', 0.06, 'Second innermost moon of Jupiter, with a prograde orbit', 60, 1, true, false, 4);
INSERT INTO public.moon VALUES (42, 'Himalia', 6.00, 'Irregular himalia moon of Jupiter with a retrograde orbit', 170, 1, true, false, 4);
INSERT INTO public.moon VALUES (43, 'Elara', 8.00, 'Irregular elara moon of Jupiter with a retrograde orbit', 86, 1, true, false, 4);
INSERT INTO public.moon VALUES (44, 'Pasiphae', 20.00, 'Irregular pasiphae moon of Jupiter with a retrograde orbit', 60, 1, true, false, 4);
INSERT INTO public.moon VALUES (45, 'Sinope', 20.00, 'Irregular moon of Jupiter with a retrograde orbit', 40, 1, true, false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4.50, 'Third planet from the Sun, only known planet to support life', 365, 1.00, 12742, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4.60, 'Fourth planet from the Sun, has a thin atmosphere', 687, 1.52, 6779, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 4.60, 'Second planet from the Sun, hottest planet in the solar system with a thick atmosphere', 225, 0.72, 12104, true, false, 1);
INSERT INTO public.planet VALUES (4, 'Proxima Centauri b', 4.80, 'Closest known exoplanet to Earth, potentially rocky', 11, 0.05, 10, true, false, 2);
INSERT INTO public.planet VALUES (5, 'Gliese 581 g', 10.00, 'Super-Earth exoplanet in the habitable zone of its star', 37, 0.14, 10, true, false, 4);
INSERT INTO public.planet VALUES (6, 'Kepler-186f', 5.00, 'Potentially habitable exoplanet orbiting within its stars habitable zone', 130, 1.00, 10, true, false, 5);
INSERT INTO public.planet VALUES (8, 'Mercury', 4.50, 'Smallest planet in the solar system, with a very thin atmosphere and a heavily cratered surface', 88, 0.39, 4879, true, false, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', 4.60, 'Seventh planet from the Sun, known for its tilted axis and icy rings', 84, 19.18, 51118, true, false, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', 4.50, 'Eighth and farthest planet from the Sun, known for its blue color and supersonic winds', 164, 30.06, 49528, true, false, 1);
INSERT INTO public.planet VALUES (11, 'Jupiter', 4.50, 'Fifth planet from the Sun, largest planet in the solar system, with a thick atmosphere and a Great Red Spot', 12, 5.20, 142984, true, false, 1);
INSERT INTO public.planet VALUES (12, 'Saturn', 4.50, 'Sixth planet from the Sun, second largest planet, known for its prominent rings made of ice and rock particles', 29, 9.53, 116464, true, false, 1);
INSERT INTO public.planet VALUES (13, 'Kepler-452b', 4.60, 'Super-Earth exoplanet orbiting in the habitable zone of its star, potentially rocky and with liquid water', 385, 0.85, 16380, true, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.60, 'Yellow dwarf star', 'G2V', 1.00, 8, 1, true, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 5.00, 'Red dwarf star', 'M5V', 0.12, 1, 1, true, false, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 2.50, 'A-type main sequence star', 'A1V', 2.02, 2, 2, true, false, 2);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 4.80, 'Sun-like star', 'G8V', 1.10, 0, 1, true, false, 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 10.00, 'Red supergiant star', 'M2Iab', 20.00, 0, 20, true, false, 3);
INSERT INTO public.star VALUES (6, 'Rigel', 8.00, 'Blue supergiant star', 'B8Iab', 17.00, 0, 15, true, false, 3);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'Kepler-452b', 'Located in the habitable zone of its star, receiving enough energy for liquid water to exist on the surface. Similar size to Earth, with a radius 1.04 times larger. Orbits its star every 385 days, similar to the length of an Earth year. Possible volcanic activity and magnetic field, important characteristics for life.');
INSERT INTO public.system VALUES (2, 'TRAPPIST-1e', 'System with 7 rocky planets, 4 potentially habitable due to temperature and presence of liquid water. Planets are very close together, with short and synchronized orbits. Star TRAPPIST-1 is an ultra-cool dwarf, but the planets receive enough energy for liquid water due to their proximity.');
INSERT INTO public.system VALUES (3, 'Proxima Centauri b', 'Located in the outer habitable zone of the star, with potential for liquid water. Similar size to Earth, with a radius 1.12 times larger. Orbits its star every 11 Earth days, a very short orbital period. Possible volcanic activity and magnetic field, important characteristics for life.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 45, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 3, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


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
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


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
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


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
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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
-- Name: system system_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_description_key UNIQUE (description);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


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


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
DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
ALTER DATABASE number_guessing_game OWNER TO freecodecamp;
\ connect number_guessing_game
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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
  game_id integer NOT NULL,
  answer integer NOT NULL,
  guess_count integer,
  username character varying(22)
);
ALTER TABLE public.games OWNER TO freecodecamp;
--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;
--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;
--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
  username character varying(22) NOT NULL,
  games_played integer DEFAULT 0 NOT NULL,
  best_game integer
);
ALTER TABLE public.users OWNER TO freecodecamp;
--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
ALTER COLUMN game_id
SET DEFAULT nextval('public.games_game_id_seq'::regclass);
--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games
VALUES (25, 617, 618, 'user_1682751797587');
INSERT INTO public.games
VALUES (26, 808, 809, 'user_1682751797587');
INSERT INTO public.games
VALUES (27, 606, 607, 'user_1682751797586');
INSERT INTO public.games
VALUES (28, 969, 970, 'user_1682751797586');
INSERT INTO public.games
VALUES (29, 334, 337, 'user_1682751797587');
INSERT INTO public.games
VALUES (30, 283, 285, 'user_1682751797587');
INSERT INTO public.games
VALUES (31, 21, 22, 'user_1682751797587');
INSERT INTO public.games
VALUES (32, 108, 109, 'user_1682752036848');
INSERT INTO public.games
VALUES (33, 914, 915, 'user_1682752036848');
INSERT INTO public.games
VALUES (34, 168, 169, 'user_1682752036847');
INSERT INTO public.games
VALUES (35, 401, 402, 'user_1682752036847');
INSERT INTO public.games
VALUES (36, 151, 154, 'user_1682752036848');
INSERT INTO public.games
VALUES (37, 412, 414, 'user_1682752036848');
INSERT INTO public.games
VALUES (38, 748, 749, 'user_1682752036848');
INSERT INTO public.games
VALUES (39, 20, 21, 'user_1682752094822');
INSERT INTO public.games
VALUES (40, 844, 845, 'user_1682752094822');
INSERT INTO public.games
VALUES (41, 945, 946, 'user_1682752094821');
INSERT INTO public.games
VALUES (42, 958, 959, 'user_1682752094821');
INSERT INTO public.games
VALUES (43, 507, 510, 'user_1682752094822');
INSERT INTO public.games
VALUES (44, 898, 900, 'user_1682752094822');
INSERT INTO public.games
VALUES (45, 355, 356, 'user_1682752094822');
--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users
VALUES ('user_1682751797586', 2, 607);
INSERT INTO public.users
VALUES ('user_1682751797587', 5, 22);
INSERT INTO public.users
VALUES ('user_1682752036847', 2, 169);
INSERT INTO public.users
VALUES ('user_1682752036848', 5, 109);
INSERT INTO public.users
VALUES ('user_1682752094821', 2, 946);
INSERT INTO public.users
VALUES ('user_1682752094822', 5, 21);
--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 45, true);
--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);
--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
ADD CONSTRAINT users_pkey PRIMARY KEY (username);
--
-- Name: games games_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
ADD CONSTRAINT games_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);
--
-- PostgreSQL database dump complete
--
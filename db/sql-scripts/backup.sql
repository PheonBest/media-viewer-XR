--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 14.10 (Homebrew)

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
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.admin_permissions_role_links OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order double precision,
    user_order double precision
);


ALTER TABLE public.admin_users_roles_links OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_roles_links_id_seq OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO postgres;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: authors_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors_localizations_links (
    id integer NOT NULL,
    author_id integer,
    inv_author_id integer,
    author_order double precision
);


ALTER TABLE public.authors_localizations_links OWNER TO postgres;

--
-- Name: authors_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_localizations_links_id_seq OWNER TO postgres;

--
-- Name: authors_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_localizations_links_id_seq OWNED BY public.authors_localizations_links.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order double precision
);


ALTER TABLE public.files_folder_links OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_folder_links_id_seq OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_morphs OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_related_morphs_id_seq OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    value character varying(255),
    color character varying(255),
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    id integer NOT NULL,
    title character varying(255),
    description jsonb,
    cover_credit character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: media_authors_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media_authors_links (
    id integer NOT NULL,
    medium_id integer,
    author_id integer,
    author_order double precision,
    medium_order double precision
);


ALTER TABLE public.media_authors_links OWNER TO postgres;

--
-- Name: media_authors_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_authors_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_authors_links_id_seq OWNER TO postgres;

--
-- Name: media_authors_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_authors_links_id_seq OWNED BY public.media_authors_links.id;


--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: media_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media_info (
    id integer NOT NULL,
    release_date timestamp(6) without time zone,
    rating double precision,
    nb_voters integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.media_info OWNER TO postgres;

--
-- Name: media_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_info_id_seq OWNER TO postgres;

--
-- Name: media_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_info_id_seq OWNED BY public.media_info.id;


--
-- Name: media_info_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media_info_links (
    id integer NOT NULL,
    medium_id integer,
    medium_info_id integer
);


ALTER TABLE public.media_info_links OWNER TO postgres;

--
-- Name: media_info_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_info_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_info_links_id_seq OWNER TO postgres;

--
-- Name: media_info_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_info_links_id_seq OWNED BY public.media_info_links.id;


--
-- Name: media_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media_localizations_links (
    id integer NOT NULL,
    medium_id integer,
    inv_medium_id integer,
    medium_order double precision
);


ALTER TABLE public.media_localizations_links OWNER TO postgres;

--
-- Name: media_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_localizations_links_id_seq OWNER TO postgres;

--
-- Name: media_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_localizations_links_id_seq OWNED BY public.media_localizations_links.id;


--
-- Name: media_tags_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media_tags_links (
    id integer NOT NULL,
    medium_id integer,
    tag_id integer,
    tag_order double precision,
    medium_order double precision
);


ALTER TABLE public.media_tags_links OWNER TO postgres;

--
-- Name: media_tags_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_tags_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_tags_links_id_seq OWNER TO postgres;

--
-- Name: media_tags_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_tags_links_id_seq OWNED BY public.media_tags_links.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    title character varying(255),
    background_color character varying(255),
    content jsonb,
    background_image_credit character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: pages_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages_localizations_links (
    id integer NOT NULL,
    page_id integer,
    inv_page_id integer,
    page_order double precision
);


ALTER TABLE public.pages_localizations_links OWNER TO postgres;

--
-- Name: pages_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_localizations_links_id_seq OWNER TO postgres;

--
-- Name: pages_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_localizations_links_id_seq OWNED BY public.pages_localizations_links.id;


--
-- Name: pages_medium_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages_medium_links (
    id integer NOT NULL,
    page_id integer,
    medium_id integer,
    page_order double precision
);


ALTER TABLE public.pages_medium_links OWNER TO postgres;

--
-- Name: pages_medium_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_medium_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_medium_links_id_seq OWNER TO postgres;

--
-- Name: pages_medium_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_medium_links_id_seq OWNED BY public.pages_medium_links.id;


--
-- Name: reader_mediums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reader_mediums (
    id integer NOT NULL,
    read_time integer,
    read boolean,
    archived boolean,
    last_opened_at timestamp(6) without time zone,
    rating character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.reader_mediums OWNER TO postgres;

--
-- Name: reader_mediums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reader_mediums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reader_mediums_id_seq OWNER TO postgres;

--
-- Name: reader_mediums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reader_mediums_id_seq OWNED BY public.reader_mediums.id;


--
-- Name: reader_mediums_medium_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reader_mediums_medium_links (
    id integer NOT NULL,
    reader_medium_id integer,
    medium_id integer,
    reader_medium_order double precision
);


ALTER TABLE public.reader_mediums_medium_links OWNER TO postgres;

--
-- Name: reader_mediums_medium_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reader_mediums_medium_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reader_mediums_medium_links_id_seq OWNER TO postgres;

--
-- Name: reader_mediums_medium_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reader_mediums_medium_links_id_seq OWNED BY public.reader_mediums_medium_links.id;


--
-- Name: reader_mediums_reader_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reader_mediums_reader_links (
    id integer NOT NULL,
    reader_medium_id integer,
    reader_id integer,
    reader_medium_order double precision
);


ALTER TABLE public.reader_mediums_reader_links OWNER TO postgres;

--
-- Name: reader_mediums_reader_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reader_mediums_reader_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reader_mediums_reader_links_id_seq OWNER TO postgres;

--
-- Name: reader_mediums_reader_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reader_mediums_reader_links_id_seq OWNED BY public.reader_mediums_reader_links.id;


--
-- Name: readers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.readers (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    user_name character varying(255),
    email character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.readers OWNER TO postgres;

--
-- Name: readers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.readers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.readers_id_seq OWNER TO postgres;

--
-- Name: readers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.readers_id_seq OWNED BY public.readers.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_token_permissions_token_links (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_order double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_links OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNED BY public.strapi_transfer_token_permissions_token_links.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO postgres;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_transfer_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: tags_localizations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags_localizations_links (
    id integer NOT NULL,
    tag_id integer,
    inv_tag_id integer,
    tag_order double precision
);


ALTER TABLE public.tags_localizations_links OWNER TO postgres;

--
-- Name: tags_localizations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_localizations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_localizations_links_id_seq OWNER TO postgres;

--
-- Name: tags_localizations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_localizations_links_id_seq OWNED BY public.tags_localizations_links.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.up_permissions_role_links OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order double precision
);


ALTER TABLE public.up_users_role_links OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_role_links_id_seq OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_id_seq OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order double precision
);


ALTER TABLE public.upload_folders_parent_links OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_parent_links_id_seq OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: authors_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.authors_localizations_links_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: media_authors_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_authors_links ALTER COLUMN id SET DEFAULT nextval('public.media_authors_links_id_seq'::regclass);


--
-- Name: media_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_info ALTER COLUMN id SET DEFAULT nextval('public.media_info_id_seq'::regclass);


--
-- Name: media_info_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_info_links ALTER COLUMN id SET DEFAULT nextval('public.media_info_links_id_seq'::regclass);


--
-- Name: media_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.media_localizations_links_id_seq'::regclass);


--
-- Name: media_tags_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_tags_links ALTER COLUMN id SET DEFAULT nextval('public.media_tags_links_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: pages_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.pages_localizations_links_id_seq'::regclass);


--
-- Name: pages_medium_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_medium_links ALTER COLUMN id SET DEFAULT nextval('public.pages_medium_links_id_seq'::regclass);


--
-- Name: reader_mediums id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums ALTER COLUMN id SET DEFAULT nextval('public.reader_mediums_id_seq'::regclass);


--
-- Name: reader_mediums_medium_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums_medium_links ALTER COLUMN id SET DEFAULT nextval('public.reader_mediums_medium_links_id_seq'::regclass);


--
-- Name: reader_mediums_reader_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums_reader_links ALTER COLUMN id SET DEFAULT nextval('public.reader_mediums_reader_links_id_seq'::regclass);


--
-- Name: readers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.readers ALTER COLUMN id SET DEFAULT nextval('public.readers_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: tags_localizations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_localizations_links ALTER COLUMN id SET DEFAULT nextval('public.tags_localizations_links_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions (id, action, action_parameters, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::content-manager.explorer.create	{}	api::author.author	{"fields": ["name", "mediums"]}	[]	2024-01-18 09:41:09.509	2024-01-18 09:41:09.509	\N	\N
2	plugin::content-manager.explorer.create	{}	api::language.language	{"fields": ["value", "color", "name"]}	[]	2024-01-18 09:41:09.519	2024-01-18 09:41:09.519	\N	\N
3	plugin::content-manager.explorer.create	{}	api::medium.medium	{"fields": ["title", "description", "cover", "reader_media", "info", "tags", "pages", "coverCredit", "authors"]}	[]	2024-01-18 09:41:09.526	2024-01-18 09:41:09.526	\N	\N
4	plugin::content-manager.explorer.create	{}	api::medium-info.medium-info	{"fields": ["releaseDate", "rating", "nbVoters"]}	[]	2024-01-18 09:41:09.532	2024-01-18 09:41:09.532	\N	\N
5	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["title", "backgroundImage", "backgroundColor", "content", "medium", "backgroundImageCredit"]}	[]	2024-01-18 09:41:09.539	2024-01-18 09:41:09.539	\N	\N
6	plugin::content-manager.explorer.create	{}	api::reader.reader	{"fields": ["firstName", "lastName", "userName", "email", "reader_media"]}	[]	2024-01-18 09:41:09.545	2024-01-18 09:41:09.545	\N	\N
7	plugin::content-manager.explorer.create	{}	api::reader-medium.reader-medium	{"fields": ["reader", "medium", "readTime", "read", "archived", "lastOpenedAt", "rating"]}	[]	2024-01-18 09:41:09.553	2024-01-18 09:41:09.553	\N	\N
8	plugin::content-manager.explorer.create	{}	api::tag.tag	{"fields": ["name", "color", "mediums"]}	[]	2024-01-18 09:41:09.559	2024-01-18 09:41:09.559	\N	\N
9	plugin::content-manager.explorer.read	{}	api::author.author	{"fields": ["name", "mediums"]}	[]	2024-01-18 09:41:09.566	2024-01-18 09:41:09.566	\N	\N
10	plugin::content-manager.explorer.read	{}	api::language.language	{"fields": ["value", "color", "name"]}	[]	2024-01-18 09:41:09.572	2024-01-18 09:41:09.572	\N	\N
11	plugin::content-manager.explorer.read	{}	api::medium.medium	{"fields": ["title", "description", "cover", "reader_media", "info", "tags", "pages", "coverCredit", "authors"]}	[]	2024-01-18 09:41:09.579	2024-01-18 09:41:09.579	\N	\N
12	plugin::content-manager.explorer.read	{}	api::medium-info.medium-info	{"fields": ["releaseDate", "rating", "nbVoters"]}	[]	2024-01-18 09:41:09.585	2024-01-18 09:41:09.585	\N	\N
13	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["title", "backgroundImage", "backgroundColor", "content", "medium", "backgroundImageCredit"]}	[]	2024-01-18 09:41:09.592	2024-01-18 09:41:09.592	\N	\N
14	plugin::content-manager.explorer.read	{}	api::reader.reader	{"fields": ["firstName", "lastName", "userName", "email", "reader_media"]}	[]	2024-01-18 09:41:09.6	2024-01-18 09:41:09.6	\N	\N
15	plugin::content-manager.explorer.read	{}	api::reader-medium.reader-medium	{"fields": ["reader", "medium", "readTime", "read", "archived", "lastOpenedAt", "rating"]}	[]	2024-01-18 09:41:09.606	2024-01-18 09:41:09.606	\N	\N
16	plugin::content-manager.explorer.read	{}	api::tag.tag	{"fields": ["name", "color", "mediums"]}	[]	2024-01-18 09:41:09.612	2024-01-18 09:41:09.612	\N	\N
17	plugin::content-manager.explorer.update	{}	api::author.author	{"fields": ["name", "mediums"]}	[]	2024-01-18 09:41:09.618	2024-01-18 09:41:09.618	\N	\N
18	plugin::content-manager.explorer.update	{}	api::language.language	{"fields": ["value", "color", "name"]}	[]	2024-01-18 09:41:09.626	2024-01-18 09:41:09.626	\N	\N
19	plugin::content-manager.explorer.update	{}	api::medium.medium	{"fields": ["title", "description", "cover", "reader_media", "info", "tags", "pages", "coverCredit", "authors"]}	[]	2024-01-18 09:41:09.632	2024-01-18 09:41:09.632	\N	\N
20	plugin::content-manager.explorer.update	{}	api::medium-info.medium-info	{"fields": ["releaseDate", "rating", "nbVoters"]}	[]	2024-01-18 09:41:09.639	2024-01-18 09:41:09.639	\N	\N
21	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["title", "backgroundImage", "backgroundColor", "content", "medium", "backgroundImageCredit"]}	[]	2024-01-18 09:41:09.646	2024-01-18 09:41:09.646	\N	\N
22	plugin::content-manager.explorer.update	{}	api::reader.reader	{"fields": ["firstName", "lastName", "userName", "email", "reader_media"]}	[]	2024-01-18 09:41:09.652	2024-01-18 09:41:09.652	\N	\N
23	plugin::content-manager.explorer.update	{}	api::reader-medium.reader-medium	{"fields": ["reader", "medium", "readTime", "read", "archived", "lastOpenedAt", "rating"]}	[]	2024-01-18 09:41:09.659	2024-01-18 09:41:09.659	\N	\N
24	plugin::content-manager.explorer.update	{}	api::tag.tag	{"fields": ["name", "color", "mediums"]}	[]	2024-01-18 09:41:09.665	2024-01-18 09:41:09.665	\N	\N
89	plugin::content-manager.explorer.read	{}	api::medium.medium	{"fields": ["title", "description", "cover", "reader_media", "info", "tags", "pages", "coverCredit", "authors"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.736	2024-02-23 15:38:25.736	\N	\N
26	plugin::content-manager.explorer.delete	{}	api::language.language	{}	[]	2024-01-18 09:41:09.678	2024-01-18 09:41:09.678	\N	\N
107	plugin::content-manager.explorer.delete	{}	api::medium.medium	{"locales": ["en", "de"]}	[]	2024-02-23 15:38:25.744	2024-02-23 15:38:25.744	\N	\N
28	plugin::content-manager.explorer.delete	{}	api::medium-info.medium-info	{}	[]	2024-01-18 09:41:09.69	2024-01-18 09:41:09.69	\N	\N
30	plugin::content-manager.explorer.delete	{}	api::reader.reader	{}	[]	2024-01-18 09:41:09.703	2024-01-18 09:41:09.703	\N	\N
31	plugin::content-manager.explorer.delete	{}	api::reader-medium.reader-medium	{}	[]	2024-01-18 09:41:09.71	2024-01-18 09:41:09.71	\N	\N
33	plugin::upload.read	{}	\N	{}	[]	2024-01-18 09:41:09.723	2024-01-18 09:41:09.723	\N	\N
34	plugin::upload.configure-view	{}	\N	{}	[]	2024-01-18 09:41:09.73	2024-01-18 09:41:09.73	\N	\N
35	plugin::upload.assets.create	{}	\N	{}	[]	2024-01-18 09:41:09.736	2024-01-18 09:41:09.736	\N	\N
36	plugin::upload.assets.update	{}	\N	{}	[]	2024-01-18 09:41:09.743	2024-01-18 09:41:09.743	\N	\N
37	plugin::upload.assets.download	{}	\N	{}	[]	2024-01-18 09:41:09.749	2024-01-18 09:41:09.749	\N	\N
38	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-01-18 09:41:09.756	2024-01-18 09:41:09.756	\N	\N
39	plugin::content-manager.explorer.create	{}	api::author.author	{"fields": ["name", "mediums"]}	["admin::is-creator"]	2024-01-18 09:41:09.772	2024-01-18 09:41:09.772	\N	\N
40	plugin::content-manager.explorer.create	{}	api::language.language	{"fields": ["value", "color", "name"]}	["admin::is-creator"]	2024-01-18 09:41:09.78	2024-01-18 09:41:09.78	\N	\N
41	plugin::content-manager.explorer.create	{}	api::medium.medium	{"fields": ["title", "description", "cover", "reader_media", "info", "tags", "pages", "coverCredit", "authors"]}	["admin::is-creator"]	2024-01-18 09:41:09.786	2024-01-18 09:41:09.786	\N	\N
42	plugin::content-manager.explorer.create	{}	api::medium-info.medium-info	{"fields": ["releaseDate", "rating", "nbVoters"]}	["admin::is-creator"]	2024-01-18 09:41:09.792	2024-01-18 09:41:09.792	\N	\N
43	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["title", "backgroundImage", "backgroundColor", "content", "medium", "backgroundImageCredit"]}	["admin::is-creator"]	2024-01-18 09:41:09.798	2024-01-18 09:41:09.798	\N	\N
44	plugin::content-manager.explorer.create	{}	api::reader.reader	{"fields": ["firstName", "lastName", "userName", "email", "reader_media"]}	["admin::is-creator"]	2024-01-18 09:41:09.803	2024-01-18 09:41:09.803	\N	\N
45	plugin::content-manager.explorer.create	{}	api::reader-medium.reader-medium	{"fields": ["reader", "medium", "readTime", "read", "archived", "lastOpenedAt", "rating"]}	["admin::is-creator"]	2024-01-18 09:41:09.809	2024-01-18 09:41:09.809	\N	\N
46	plugin::content-manager.explorer.create	{}	api::tag.tag	{"fields": ["name", "color", "mediums"]}	["admin::is-creator"]	2024-01-18 09:41:09.815	2024-01-18 09:41:09.815	\N	\N
47	plugin::content-manager.explorer.read	{}	api::author.author	{"fields": ["name", "mediums"]}	["admin::is-creator"]	2024-01-18 09:41:09.823	2024-01-18 09:41:09.823	\N	\N
48	plugin::content-manager.explorer.read	{}	api::language.language	{"fields": ["value", "color", "name"]}	["admin::is-creator"]	2024-01-18 09:41:09.828	2024-01-18 09:41:09.828	\N	\N
49	plugin::content-manager.explorer.read	{}	api::medium.medium	{"fields": ["title", "description", "cover", "reader_media", "info", "tags", "pages", "coverCredit", "authors"]}	["admin::is-creator"]	2024-01-18 09:41:09.834	2024-01-18 09:41:09.834	\N	\N
50	plugin::content-manager.explorer.read	{}	api::medium-info.medium-info	{"fields": ["releaseDate", "rating", "nbVoters"]}	["admin::is-creator"]	2024-01-18 09:41:09.84	2024-01-18 09:41:09.84	\N	\N
51	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["title", "backgroundImage", "backgroundColor", "content", "medium", "backgroundImageCredit"]}	["admin::is-creator"]	2024-01-18 09:41:09.846	2024-01-18 09:41:09.846	\N	\N
52	plugin::content-manager.explorer.read	{}	api::reader.reader	{"fields": ["firstName", "lastName", "userName", "email", "reader_media"]}	["admin::is-creator"]	2024-01-18 09:41:09.851	2024-01-18 09:41:09.851	\N	\N
53	plugin::content-manager.explorer.read	{}	api::reader-medium.reader-medium	{"fields": ["reader", "medium", "readTime", "read", "archived", "lastOpenedAt", "rating"]}	["admin::is-creator"]	2024-01-18 09:41:09.857	2024-01-18 09:41:09.857	\N	\N
54	plugin::content-manager.explorer.read	{}	api::tag.tag	{"fields": ["name", "color", "mediums"]}	["admin::is-creator"]	2024-01-18 09:41:09.863	2024-01-18 09:41:09.863	\N	\N
55	plugin::content-manager.explorer.update	{}	api::author.author	{"fields": ["name", "mediums"]}	["admin::is-creator"]	2024-01-18 09:41:09.869	2024-01-18 09:41:09.869	\N	\N
56	plugin::content-manager.explorer.update	{}	api::language.language	{"fields": ["value", "color", "name"]}	["admin::is-creator"]	2024-01-18 09:41:09.876	2024-01-18 09:41:09.876	\N	\N
57	plugin::content-manager.explorer.update	{}	api::medium.medium	{"fields": ["title", "description", "cover", "reader_media", "info", "tags", "pages", "coverCredit", "authors"]}	["admin::is-creator"]	2024-01-18 09:41:09.882	2024-01-18 09:41:09.882	\N	\N
58	plugin::content-manager.explorer.update	{}	api::medium-info.medium-info	{"fields": ["releaseDate", "rating", "nbVoters"]}	["admin::is-creator"]	2024-01-18 09:41:09.889	2024-01-18 09:41:09.889	\N	\N
59	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["title", "backgroundImage", "backgroundColor", "content", "medium", "backgroundImageCredit"]}	["admin::is-creator"]	2024-01-18 09:41:09.895	2024-01-18 09:41:09.895	\N	\N
60	plugin::content-manager.explorer.update	{}	api::reader.reader	{"fields": ["firstName", "lastName", "userName", "email", "reader_media"]}	["admin::is-creator"]	2024-01-18 09:41:09.901	2024-01-18 09:41:09.901	\N	\N
61	plugin::content-manager.explorer.update	{}	api::reader-medium.reader-medium	{"fields": ["reader", "medium", "readTime", "read", "archived", "lastOpenedAt", "rating"]}	["admin::is-creator"]	2024-01-18 09:41:09.911	2024-01-18 09:41:09.911	\N	\N
62	plugin::content-manager.explorer.update	{}	api::tag.tag	{"fields": ["name", "color", "mediums"]}	["admin::is-creator"]	2024-01-18 09:41:09.919	2024-01-18 09:41:09.919	\N	\N
85	plugin::content-manager.explorer.create	{}	api::tag.tag	{"fields": ["name", "color", "mediums"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.75	2024-02-23 15:38:25.75	\N	\N
64	plugin::content-manager.explorer.delete	{}	api::language.language	{}	["admin::is-creator"]	2024-01-18 09:41:09.932	2024-01-18 09:41:09.932	\N	\N
94	plugin::content-manager.explorer.read	{}	api::tag.tag	{"fields": ["name", "color", "mediums"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.757	2024-02-23 15:38:25.757	\N	\N
66	plugin::content-manager.explorer.delete	{}	api::medium-info.medium-info	{}	["admin::is-creator"]	2024-01-18 09:41:09.945	2024-01-18 09:41:09.945	\N	\N
103	plugin::content-manager.explorer.update	{}	api::tag.tag	{"fields": ["name", "color", "mediums"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.764	2024-02-23 15:38:25.764	\N	\N
68	plugin::content-manager.explorer.delete	{}	api::reader.reader	{}	["admin::is-creator"]	2024-01-18 09:41:09.956	2024-01-18 09:41:09.956	\N	\N
69	plugin::content-manager.explorer.delete	{}	api::reader-medium.reader-medium	{}	["admin::is-creator"]	2024-01-18 09:41:09.963	2024-01-18 09:41:09.963	\N	\N
87	plugin::content-manager.explorer.read	{}	api::author.author	{"fields": ["name", "mediums"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.771	2024-02-23 15:38:25.771	\N	\N
71	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2024-01-18 09:41:09.976	2024-01-18 09:41:09.976	\N	\N
72	plugin::upload.configure-view	{}	\N	{}	[]	2024-01-18 09:41:09.982	2024-01-18 09:41:09.982	\N	\N
73	plugin::upload.assets.create	{}	\N	{}	[]	2024-01-18 09:41:09.988	2024-01-18 09:41:09.988	\N	\N
74	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2024-01-18 09:41:09.994	2024-01-18 09:41:09.994	\N	\N
75	plugin::upload.assets.download	{}	\N	{}	[]	2024-01-18 09:41:10.001	2024-01-18 09:41:10.001	\N	\N
76	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-01-18 09:41:10.008	2024-01-18 09:41:10.008	\N	\N
77	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-01-18 09:41:10.081	2024-01-18 09:41:10.081	\N	\N
79	plugin::content-manager.explorer.create	{}	api::language.language	{"fields": ["value", "color", "name"]}	[]	2024-01-18 09:41:10.094	2024-01-18 09:41:10.094	\N	\N
81	plugin::content-manager.explorer.create	{}	api::medium-info.medium-info	{"fields": ["releaseDate", "rating", "nbVoters"]}	[]	2024-01-18 09:41:10.106	2024-01-18 09:41:10.106	\N	\N
83	plugin::content-manager.explorer.create	{}	api::reader.reader	{"fields": ["firstName", "lastName", "userName", "email", "reader_media"]}	[]	2024-01-18 09:41:10.119	2024-01-18 09:41:10.119	\N	\N
84	plugin::content-manager.explorer.create	{}	api::reader-medium.reader-medium	{"fields": ["reader", "medium", "readTime", "read", "archived", "lastOpenedAt", "rating"]}	[]	2024-01-18 09:41:10.125	2024-01-18 09:41:10.125	\N	\N
135	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2024-01-18 09:41:10.547	2024-01-18 09:41:10.547	\N	\N
109	plugin::content-manager.explorer.delete	{}	api::page.page	{"locales": ["en", "de"]}	[]	2024-02-23 15:38:25.777	2024-02-23 15:38:25.777	\N	\N
100	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["title", "backgroundImage", "backgroundColor", "content", "medium", "backgroundImageCredit"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.784	2024-02-23 15:38:25.784	\N	\N
112	plugin::content-manager.explorer.delete	{}	api::tag.tag	{"locales": ["en", "de"]}	[]	2024-02-23 15:38:25.79	2024-02-23 15:38:25.79	\N	\N
86	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-01-18 09:41:10.137	2024-01-18 09:41:10.137	\N	\N
88	plugin::content-manager.explorer.read	{}	api::language.language	{"fields": ["value", "color", "name"]}	[]	2024-01-18 09:41:10.149	2024-01-18 09:41:10.149	\N	\N
90	plugin::content-manager.explorer.read	{}	api::medium-info.medium-info	{"fields": ["releaseDate", "rating", "nbVoters"]}	[]	2024-01-18 09:41:10.174	2024-01-18 09:41:10.174	\N	\N
92	plugin::content-manager.explorer.read	{}	api::reader.reader	{"fields": ["firstName", "lastName", "userName", "email", "reader_media"]}	[]	2024-01-18 09:41:10.194	2024-01-18 09:41:10.194	\N	\N
93	plugin::content-manager.explorer.read	{}	api::reader-medium.reader-medium	{"fields": ["reader", "medium", "readTime", "read", "archived", "lastOpenedAt", "rating"]}	[]	2024-01-18 09:41:10.203	2024-01-18 09:41:10.203	\N	\N
95	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2024-01-18 09:41:10.229	2024-01-18 09:41:10.229	\N	\N
97	plugin::content-manager.explorer.update	{}	api::language.language	{"fields": ["value", "color", "name"]}	[]	2024-01-18 09:41:10.255	2024-01-18 09:41:10.255	\N	\N
99	plugin::content-manager.explorer.update	{}	api::medium-info.medium-info	{"fields": ["releaseDate", "rating", "nbVoters"]}	[]	2024-01-18 09:41:10.267	2024-01-18 09:41:10.267	\N	\N
101	plugin::content-manager.explorer.update	{}	api::reader.reader	{"fields": ["firstName", "lastName", "userName", "email", "reader_media"]}	[]	2024-01-18 09:41:10.294	2024-01-18 09:41:10.294	\N	\N
102	plugin::content-manager.explorer.update	{}	api::reader-medium.reader-medium	{"fields": ["reader", "medium", "readTime", "read", "archived", "lastOpenedAt", "rating"]}	[]	2024-01-18 09:41:10.308	2024-01-18 09:41:10.308	\N	\N
104	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2024-01-18 09:41:10.335	2024-01-18 09:41:10.335	\N	\N
106	plugin::content-manager.explorer.delete	{}	api::language.language	{}	[]	2024-01-18 09:41:10.354	2024-01-18 09:41:10.354	\N	\N
108	plugin::content-manager.explorer.delete	{}	api::medium-info.medium-info	{}	[]	2024-01-18 09:41:10.367	2024-01-18 09:41:10.367	\N	\N
110	plugin::content-manager.explorer.delete	{}	api::reader.reader	{}	[]	2024-01-18 09:41:10.38	2024-01-18 09:41:10.38	\N	\N
111	plugin::content-manager.explorer.delete	{}	api::reader-medium.reader-medium	{}	[]	2024-01-18 09:41:10.386	2024-01-18 09:41:10.386	\N	\N
113	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2024-01-18 09:41:10.398	2024-01-18 09:41:10.398	\N	\N
114	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2024-01-18 09:41:10.405	2024-01-18 09:41:10.405	\N	\N
115	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2024-01-18 09:41:10.411	2024-01-18 09:41:10.411	\N	\N
116	plugin::content-type-builder.read	{}	\N	{}	[]	2024-01-18 09:41:10.418	2024-01-18 09:41:10.418	\N	\N
117	plugin::email.settings.read	{}	\N	{}	[]	2024-01-18 09:41:10.424	2024-01-18 09:41:10.424	\N	\N
118	plugin::upload.read	{}	\N	{}	[]	2024-01-18 09:41:10.43	2024-01-18 09:41:10.43	\N	\N
119	plugin::upload.assets.create	{}	\N	{}	[]	2024-01-18 09:41:10.436	2024-01-18 09:41:10.436	\N	\N
120	plugin::upload.assets.update	{}	\N	{}	[]	2024-01-18 09:41:10.443	2024-01-18 09:41:10.443	\N	\N
121	plugin::upload.assets.download	{}	\N	{}	[]	2024-01-18 09:41:10.45	2024-01-18 09:41:10.45	\N	\N
122	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-01-18 09:41:10.459	2024-01-18 09:41:10.459	\N	\N
123	plugin::upload.configure-view	{}	\N	{}	[]	2024-01-18 09:41:10.466	2024-01-18 09:41:10.466	\N	\N
124	plugin::upload.settings.read	{}	\N	{}	[]	2024-01-18 09:41:10.474	2024-01-18 09:41:10.474	\N	\N
125	plugin::i18n.locale.create	{}	\N	{}	[]	2024-01-18 09:41:10.482	2024-01-18 09:41:10.482	\N	\N
126	plugin::i18n.locale.read	{}	\N	{}	[]	2024-01-18 09:41:10.49	2024-01-18 09:41:10.49	\N	\N
127	plugin::i18n.locale.update	{}	\N	{}	[]	2024-01-18 09:41:10.496	2024-01-18 09:41:10.496	\N	\N
128	plugin::i18n.locale.delete	{}	\N	{}	[]	2024-01-18 09:41:10.502	2024-01-18 09:41:10.502	\N	\N
129	plugin::users-permissions.roles.create	{}	\N	{}	[]	2024-01-18 09:41:10.508	2024-01-18 09:41:10.508	\N	\N
130	plugin::users-permissions.roles.read	{}	\N	{}	[]	2024-01-18 09:41:10.515	2024-01-18 09:41:10.515	\N	\N
131	plugin::users-permissions.roles.update	{}	\N	{}	[]	2024-01-18 09:41:10.522	2024-01-18 09:41:10.522	\N	\N
132	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2024-01-18 09:41:10.528	2024-01-18 09:41:10.528	\N	\N
133	plugin::users-permissions.providers.read	{}	\N	{}	[]	2024-01-18 09:41:10.534	2024-01-18 09:41:10.534	\N	\N
134	plugin::users-permissions.providers.update	{}	\N	{}	[]	2024-01-18 09:41:10.541	2024-01-18 09:41:10.541	\N	\N
136	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2024-01-18 09:41:10.554	2024-01-18 09:41:10.554	\N	\N
137	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2024-01-18 09:41:10.56	2024-01-18 09:41:10.56	\N	\N
138	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2024-01-18 09:41:10.567	2024-01-18 09:41:10.567	\N	\N
139	admin::marketplace.read	{}	\N	{}	[]	2024-01-18 09:41:10.573	2024-01-18 09:41:10.573	\N	\N
140	admin::webhooks.create	{}	\N	{}	[]	2024-01-18 09:41:10.579	2024-01-18 09:41:10.579	\N	\N
141	admin::webhooks.read	{}	\N	{}	[]	2024-01-18 09:41:10.587	2024-01-18 09:41:10.587	\N	\N
142	admin::webhooks.update	{}	\N	{}	[]	2024-01-18 09:41:10.596	2024-01-18 09:41:10.596	\N	\N
143	admin::webhooks.delete	{}	\N	{}	[]	2024-01-18 09:41:10.605	2024-01-18 09:41:10.605	\N	\N
144	admin::users.create	{}	\N	{}	[]	2024-01-18 09:41:10.614	2024-01-18 09:41:10.614	\N	\N
145	admin::users.read	{}	\N	{}	[]	2024-01-18 09:41:10.626	2024-01-18 09:41:10.626	\N	\N
146	admin::users.update	{}	\N	{}	[]	2024-01-18 09:41:10.639	2024-01-18 09:41:10.639	\N	\N
147	admin::users.delete	{}	\N	{}	[]	2024-01-18 09:41:10.652	2024-01-18 09:41:10.652	\N	\N
148	admin::roles.create	{}	\N	{}	[]	2024-01-18 09:41:10.666	2024-01-18 09:41:10.666	\N	\N
149	admin::roles.read	{}	\N	{}	[]	2024-01-18 09:41:10.679	2024-01-18 09:41:10.679	\N	\N
150	admin::roles.update	{}	\N	{}	[]	2024-01-18 09:41:10.69	2024-01-18 09:41:10.69	\N	\N
151	admin::roles.delete	{}	\N	{}	[]	2024-01-18 09:41:10.697	2024-01-18 09:41:10.697	\N	\N
152	admin::api-tokens.access	{}	\N	{}	[]	2024-01-18 09:41:10.704	2024-01-18 09:41:10.704	\N	\N
153	admin::api-tokens.create	{}	\N	{}	[]	2024-01-18 09:41:10.71	2024-01-18 09:41:10.71	\N	\N
154	admin::api-tokens.read	{}	\N	{}	[]	2024-01-18 09:41:10.717	2024-01-18 09:41:10.717	\N	\N
155	admin::api-tokens.update	{}	\N	{}	[]	2024-01-18 09:41:10.723	2024-01-18 09:41:10.723	\N	\N
156	admin::api-tokens.regenerate	{}	\N	{}	[]	2024-01-18 09:41:10.729	2024-01-18 09:41:10.729	\N	\N
157	admin::api-tokens.delete	{}	\N	{}	[]	2024-01-18 09:41:10.736	2024-01-18 09:41:10.736	\N	\N
158	admin::project-settings.update	{}	\N	{}	[]	2024-01-18 09:41:10.743	2024-01-18 09:41:10.743	\N	\N
159	admin::project-settings.read	{}	\N	{}	[]	2024-01-18 09:41:10.75	2024-01-18 09:41:10.75	\N	\N
160	admin::transfer.tokens.access	{}	\N	{}	[]	2024-01-18 09:41:10.756	2024-01-18 09:41:10.756	\N	\N
161	admin::transfer.tokens.create	{}	\N	{}	[]	2024-01-18 09:41:10.763	2024-01-18 09:41:10.763	\N	\N
162	admin::transfer.tokens.read	{}	\N	{}	[]	2024-01-18 09:41:10.77	2024-01-18 09:41:10.77	\N	\N
163	admin::transfer.tokens.update	{}	\N	{}	[]	2024-01-18 09:41:10.776	2024-01-18 09:41:10.776	\N	\N
164	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2024-01-18 09:41:10.783	2024-01-18 09:41:10.783	\N	\N
165	admin::transfer.tokens.delete	{}	\N	{}	[]	2024-01-18 09:41:10.79	2024-01-18 09:41:10.79	\N	\N
96	plugin::content-manager.explorer.update	{}	api::author.author	{"fields": ["name", "mediums"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.797	2024-02-23 15:38:25.797	\N	\N
98	plugin::content-manager.explorer.update	{}	api::medium.medium	{"fields": ["title", "description", "cover", "reader_media", "info", "tags", "pages", "coverCredit", "authors"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.803	2024-02-23 15:38:25.803	\N	\N
82	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["title", "backgroundImage", "backgroundColor", "content", "medium", "backgroundImageCredit"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.809	2024-02-23 15:38:25.809	\N	\N
105	plugin::content-manager.explorer.delete	{}	api::author.author	{"locales": ["en", "de"]}	[]	2024-02-23 15:38:25.816	2024-02-23 15:38:25.816	\N	\N
80	plugin::content-manager.explorer.create	{}	api::medium.medium	{"fields": ["title", "description", "cover", "reader_media", "info", "tags", "pages", "coverCredit", "authors"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.822	2024-02-23 15:38:25.822	\N	\N
91	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["title", "backgroundImage", "backgroundColor", "content", "medium", "backgroundImageCredit"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.829	2024-02-23 15:38:25.829	\N	\N
78	plugin::content-manager.explorer.create	{}	api::author.author	{"fields": ["name", "mediums"], "locales": ["en", "de"]}	[]	2024-02-23 15:38:25.836	2024-02-23 15:38:25.836	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	2	7
8	8	2	8
9	9	2	9
10	10	2	10
11	11	2	11
12	12	2	12
13	13	2	13
14	14	2	14
15	15	2	15
16	16	2	16
17	17	2	17
18	18	2	18
19	19	2	19
20	20	2	20
21	21	2	21
22	22	2	22
23	23	2	23
24	24	2	24
246	89	1	90
26	26	2	26
247	107	1	91
28	28	2	28
248	85	1	92
30	30	2	30
31	31	2	31
249	94	1	93
33	33	2	33
34	34	2	34
35	35	2	35
36	36	2	36
37	37	2	37
38	38	2	38
39	39	3	1
40	40	3	2
41	41	3	3
42	42	3	4
43	43	3	5
44	44	3	6
45	45	3	7
46	46	3	8
47	47	3	9
48	48	3	10
49	49	3	11
50	50	3	12
51	51	3	13
52	52	3	14
53	53	3	15
54	54	3	16
55	55	3	17
56	56	3	18
57	57	3	19
58	58	3	20
59	59	3	21
60	60	3	22
61	61	3	23
62	62	3	24
250	103	1	94
64	64	3	26
251	87	1	95
66	66	3	28
252	109	1	96
68	68	3	30
69	69	3	31
253	100	1	97
71	71	3	33
72	72	3	34
73	73	3	35
74	74	3	36
75	75	3	37
76	76	3	38
77	77	1	1
79	79	1	3
81	81	1	5
83	83	1	7
84	84	1	8
86	86	1	10
88	88	1	12
90	90	1	14
92	92	1	16
93	93	1	17
95	95	1	19
97	97	1	21
99	99	1	23
101	101	1	25
102	102	1	26
104	104	1	28
106	106	1	30
108	108	1	32
110	110	1	34
111	111	1	35
113	113	1	37
114	114	1	38
115	115	1	39
116	116	1	40
117	117	1	41
118	118	1	42
119	119	1	43
120	120	1	44
121	121	1	45
122	122	1	46
123	123	1	47
124	124	1	48
125	125	1	49
126	126	1	50
127	127	1	51
128	128	1	52
129	129	1	53
130	130	1	54
131	131	1	55
132	132	1	56
133	133	1	57
134	134	1	58
135	135	1	59
136	136	1	60
137	137	1	61
138	138	1	62
139	139	1	63
140	140	1	64
141	141	1	65
142	142	1	66
143	143	1	67
144	144	1	68
145	145	1	69
146	146	1	70
147	147	1	71
148	148	1	72
149	149	1	73
150	150	1	74
151	151	1	75
152	152	1	76
153	153	1	77
154	154	1	78
155	155	1	79
156	156	1	80
157	157	1	81
254	112	1	98
255	96	1	99
256	98	1	100
257	82	1	101
258	105	1	102
259	80	1	103
260	91	1	104
261	78	1	105
158	158	1	82
159	159	1	83
160	160	1	84
161	161	1	85
162	162	1	86
163	163	1	87
164	164	1	88
165	165	1	89
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2024-01-18 09:41:09.472	2024-01-18 09:41:09.472	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2024-01-18 09:41:09.481	2024-01-18 09:41:09.481	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2024-01-18 09:41:09.486	2024-01-18 09:41:09.486	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Antonin	Marxer	\N	antoninmarxer@orange.fr	$2a$10$NfrgscAM4qaRfRAbHd3au.vmpSLQ9RICvukXC7IygIDXkKdFc1vK2	\N	\N	t	f	\N	2024-01-18 10:03:23.349	2024-01-18 10:03:23.349	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) FROM stdin;
1	1	1	1	1
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (id, name, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
1	Gorges Massington	2024-01-14 15:35:50.912	2024-02-23 15:54:25.569	1	1	en
2	Gorges Massington	2024-02-23 15:54:25.549	2024-02-23 15:54:31.748	1	1	de
\.


--
-- Data for Name: authors_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors_localizations_links (id, author_id, inv_author_id, author_order) FROM stdin;
1	2	1	1
2	1	2	1
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
3	pawel-czerwinski-2PN18U8CKi0-unsplash.jpg	\N	\N	3000	4500	{"large": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/large_pawel_czerwinski_2_PN_18_U8_C_Ki0_unsplash_356e266617.jpg", "hash": "large_pawel_czerwinski_2_PN_18_U8_C_Ki0_unsplash_356e266617", "mime": "image/jpeg", "name": "large_pawel-czerwinski-2PN18U8CKi0-unsplash.jpg", "path": null, "size": 38.44, "width": 667, "height": 1000}, "small": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_pawel_czerwinski_2_PN_18_U8_C_Ki0_unsplash_356e266617.jpg", "hash": "small_pawel_czerwinski_2_PN_18_U8_C_Ki0_unsplash_356e266617", "mime": "image/jpeg", "name": "small_pawel-czerwinski-2PN18U8CKi0-unsplash.jpg", "path": null, "size": 11.94, "width": 334, "height": 500}, "medium": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_pawel_czerwinski_2_PN_18_U8_C_Ki0_unsplash_356e266617.jpg", "hash": "medium_pawel_czerwinski_2_PN_18_U8_C_Ki0_unsplash_356e266617", "mime": "image/jpeg", "name": "medium_pawel-czerwinski-2PN18U8CKi0-unsplash.jpg", "path": null, "size": 23.84, "width": 500, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_pawel_czerwinski_2_PN_18_U8_C_Ki0_unsplash_356e266617.jpg", "hash": "thumbnail_pawel_czerwinski_2_PN_18_U8_C_Ki0_unsplash_356e266617", "mime": "image/jpeg", "name": "thumbnail_pawel-czerwinski-2PN18U8CKi0-unsplash.jpg", "path": null, "size": 1.77, "width": 104, "height": 156}}	pawel_czerwinski_2_PN_18_U8_C_Ki0_unsplash_356e266617	.jpg	image/jpeg	434.81	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/pawel_czerwinski_2_PN_18_U8_C_Ki0_unsplash_356e266617.jpg	\N	aws-s3	\N	/	2023-12-08 15:43:50.608	2023-12-08 15:43:50.608	1	1
4	jean-philippe-delberghe-75xPHEQBmvA-unsplash(1).jpg	\N	\N	4447	6670	{"large": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/large_jean_philippe_delberghe_75x_PHEQ_Bmv_A_unsplash_1_a8d935c39e.jpg", "hash": "large_jean_philippe_delberghe_75x_PHEQ_Bmv_A_unsplash_1_a8d935c39e", "mime": "image/jpeg", "name": "large_jean-philippe-delberghe-75xPHEQBmvA-unsplash(1).jpg", "path": null, "size": 33.98, "width": 666, "height": 1000}, "small": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_jean_philippe_delberghe_75x_PHEQ_Bmv_A_unsplash_1_a8d935c39e.jpg", "hash": "small_jean_philippe_delberghe_75x_PHEQ_Bmv_A_unsplash_1_a8d935c39e", "mime": "image/jpeg", "name": "small_jean-philippe-delberghe-75xPHEQBmvA-unsplash(1).jpg", "path": null, "size": 13.28, "width": 333, "height": 500}, "medium": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_jean_philippe_delberghe_75x_PHEQ_Bmv_A_unsplash_1_a8d935c39e.jpg", "hash": "medium_jean_philippe_delberghe_75x_PHEQ_Bmv_A_unsplash_1_a8d935c39e", "mime": "image/jpeg", "name": "medium_jean-philippe-delberghe-75xPHEQBmvA-unsplash(1).jpg", "path": null, "size": 23.25, "width": 500, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_jean_philippe_delberghe_75x_PHEQ_Bmv_A_unsplash_1_a8d935c39e.jpg", "hash": "thumbnail_jean_philippe_delberghe_75x_PHEQ_Bmv_A_unsplash_1_a8d935c39e", "mime": "image/jpeg", "name": "thumbnail_jean-philippe-delberghe-75xPHEQBmvA-unsplash(1).jpg", "path": null, "size": 2.16, "width": 104, "height": 156}}	jean_philippe_delberghe_75x_PHEQ_Bmv_A_unsplash_1_a8d935c39e	.jpg	image/jpeg	889.37	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/jean_philippe_delberghe_75x_PHEQ_Bmv_A_unsplash_1_a8d935c39e.jpg	\N	aws-s3	\N	/	2023-12-08 15:43:52.057	2023-12-08 15:43:52.057	1	1
5	bg-white-paint.jpg	\N	\N	3264	4896	{"large": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/large_bg_white_paint_3d56a712b8.jpg", "hash": "large_bg_white_paint_3d56a712b8", "mime": "image/jpeg", "name": "large_bg-white-paint.jpg", "path": null, "size": 116.4, "width": 667, "height": 1000}, "small": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_bg_white_paint_3d56a712b8.jpg", "hash": "small_bg_white_paint_3d56a712b8", "mime": "image/jpeg", "name": "small_bg-white-paint.jpg", "path": null, "size": 27.79, "width": 333, "height": 500}, "medium": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_bg_white_paint_3d56a712b8.jpg", "hash": "medium_bg_white_paint_3d56a712b8", "mime": "image/jpeg", "name": "medium_bg-white-paint.jpg", "path": null, "size": 64.45, "width": 500, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_bg_white_paint_3d56a712b8.jpg", "hash": "thumbnail_bg_white_paint_3d56a712b8", "mime": "image/jpeg", "name": "thumbnail_bg-white-paint.jpg", "path": null, "size": 2.2, "width": 104, "height": 156}}	bg_white_paint_3d56a712b8	.jpg	image/jpeg	1450.27	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/bg_white_paint_3d56a712b8.jpg	\N	aws-s3	\N	/	2023-12-08 15:43:52.617	2023-12-08 15:43:52.617	1	1
6	bia-w-a-PO8Woh4YBD8-unsplash.jpg	\N	\N	3600	3600	{"large": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/large_bia_w_a_PO_8_Woh4_YBD_8_unsplash_0c7e6b650d.jpg", "hash": "large_bia_w_a_PO_8_Woh4_YBD_8_unsplash_0c7e6b650d", "mime": "image/jpeg", "name": "large_bia-w-a-PO8Woh4YBD8-unsplash.jpg", "path": null, "size": 138.91, "width": 1000, "height": 1000}, "small": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_bia_w_a_PO_8_Woh4_YBD_8_unsplash_0c7e6b650d.jpg", "hash": "small_bia_w_a_PO_8_Woh4_YBD_8_unsplash_0c7e6b650d", "mime": "image/jpeg", "name": "small_bia-w-a-PO8Woh4YBD8-unsplash.jpg", "path": null, "size": 42.63, "width": 500, "height": 500}, "medium": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_bia_w_a_PO_8_Woh4_YBD_8_unsplash_0c7e6b650d.jpg", "hash": "medium_bia_w_a_PO_8_Woh4_YBD_8_unsplash_0c7e6b650d", "mime": "image/jpeg", "name": "medium_bia-w-a-PO8Woh4YBD8-unsplash.jpg", "path": null, "size": 85.19, "width": 750, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_bia_w_a_PO_8_Woh4_YBD_8_unsplash_0c7e6b650d.jpg", "hash": "thumbnail_bia_w_a_PO_8_Woh4_YBD_8_unsplash_0c7e6b650d", "mime": "image/jpeg", "name": "thumbnail_bia-w-a-PO8Woh4YBD8-unsplash.jpg", "path": null, "size": 6.66, "width": 156, "height": 156}}	bia_w_a_PO_8_Woh4_YBD_8_unsplash_0c7e6b650d	.jpg	image/jpeg	1348.48	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/bia_w_a_PO_8_Woh4_YBD_8_unsplash_0c7e6b650d.jpg	\N	aws-s3	\N	/	2023-12-08 15:43:52.788	2023-12-08 15:43:52.788	1	1
8	praewthida-k-5Ui5glVjUAQ-unsplash.jpg	\N	\N	3024	4032	{"large": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/large_praewthida_k_5_Ui5gl_Vj_UAQ_unsplash_f8fbed1c0d.jpg", "hash": "large_praewthida_k_5_Ui5gl_Vj_UAQ_unsplash_f8fbed1c0d", "mime": "image/jpeg", "name": "large_praewthida-k-5Ui5glVjUAQ-unsplash.jpg", "path": null, "size": 265.29, "width": 750, "height": 1000}, "small": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_praewthida_k_5_Ui5gl_Vj_UAQ_unsplash_f8fbed1c0d.jpg", "hash": "small_praewthida_k_5_Ui5gl_Vj_UAQ_unsplash_f8fbed1c0d", "mime": "image/jpeg", "name": "small_praewthida-k-5Ui5glVjUAQ-unsplash.jpg", "path": null, "size": 84.66, "width": 375, "height": 500}, "medium": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_praewthida_k_5_Ui5gl_Vj_UAQ_unsplash_f8fbed1c0d.jpg", "hash": "medium_praewthida_k_5_Ui5gl_Vj_UAQ_unsplash_f8fbed1c0d", "mime": "image/jpeg", "name": "medium_praewthida-k-5Ui5glVjUAQ-unsplash.jpg", "path": null, "size": 165.94, "width": 563, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_praewthida_k_5_Ui5gl_Vj_UAQ_unsplash_f8fbed1c0d.jpg", "hash": "thumbnail_praewthida_k_5_Ui5gl_Vj_UAQ_unsplash_f8fbed1c0d", "mime": "image/jpeg", "name": "thumbnail_praewthida-k-5Ui5glVjUAQ-unsplash.jpg", "path": null, "size": 9.27, "width": 117, "height": 156}}	praewthida_k_5_Ui5gl_Vj_UAQ_unsplash_f8fbed1c0d	.jpg	image/jpeg	2334.82	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/praewthida_k_5_Ui5gl_Vj_UAQ_unsplash_f8fbed1c0d.jpg	\N	aws-s3	\N	/	2023-12-08 15:43:53.387	2023-12-08 15:43:53.387	1	1
9	jason-leung-UMncYEfO9-U-unsplash.jpg	\N	\N	4445	6667	{"large": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/large_jason_leung_U_Mnc_Y_Ef_O9_U_unsplash_d077425ebb.jpg", "hash": "large_jason_leung_U_Mnc_Y_Ef_O9_U_unsplash_d077425ebb", "mime": "image/jpeg", "name": "large_jason-leung-UMncYEfO9-U-unsplash.jpg", "path": null, "size": 79.53, "width": 667, "height": 1000}, "small": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_jason_leung_U_Mnc_Y_Ef_O9_U_unsplash_d077425ebb.jpg", "hash": "small_jason_leung_U_Mnc_Y_Ef_O9_U_unsplash_d077425ebb", "mime": "image/jpeg", "name": "small_jason-leung-UMncYEfO9-U-unsplash.jpg", "path": null, "size": 27.52, "width": 333, "height": 500}, "medium": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_jason_leung_U_Mnc_Y_Ef_O9_U_unsplash_d077425ebb.jpg", "hash": "medium_jason_leung_U_Mnc_Y_Ef_O9_U_unsplash_d077425ebb", "mime": "image/jpeg", "name": "medium_jason-leung-UMncYEfO9-U-unsplash.jpg", "path": null, "size": 52.48, "width": 500, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_jason_leung_U_Mnc_Y_Ef_O9_U_unsplash_d077425ebb.jpg", "hash": "thumbnail_jason_leung_U_Mnc_Y_Ef_O9_U_unsplash_d077425ebb", "mime": "image/jpeg", "name": "thumbnail_jason-leung-UMncYEfO9-U-unsplash.jpg", "path": null, "size": 3.72, "width": 104, "height": 156}}	jason_leung_U_Mnc_Y_Ef_O9_U_unsplash_d077425ebb	.jpg	image/jpeg	2739.02	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/jason_leung_U_Mnc_Y_Ef_O9_U_unsplash_d077425ebb.jpg	\N	aws-s3	\N	/	2023-12-08 15:43:53.851	2023-12-08 15:43:53.851	1	1
7	nahil-naseer-xljtGZ2-P3Y-unsplash(2).jpg	\N	\N	2565	4560	{"large": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/large_nahil_naseer_xljt_GZ_2_P3_Y_unsplash_2_4de7613215.jpg", "hash": "large_nahil_naseer_xljt_GZ_2_P3_Y_unsplash_2_4de7613215", "mime": "image/jpeg", "name": "large_nahil-naseer-xljtGZ2-P3Y-unsplash(2).jpg", "path": null, "size": 89.85, "width": 562, "height": 1000}, "small": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_nahil_naseer_xljt_GZ_2_P3_Y_unsplash_2_4de7613215.jpg", "hash": "small_nahil_naseer_xljt_GZ_2_P3_Y_unsplash_2_4de7613215", "mime": "image/jpeg", "name": "small_nahil-naseer-xljtGZ2-P3Y-unsplash(2).jpg", "path": null, "size": 26.67, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_nahil_naseer_xljt_GZ_2_P3_Y_unsplash_2_4de7613215.jpg", "hash": "medium_nahil_naseer_xljt_GZ_2_P3_Y_unsplash_2_4de7613215", "mime": "image/jpeg", "name": "medium_nahil-naseer-xljtGZ2-P3Y-unsplash(2).jpg", "path": null, "size": 53.82, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_nahil_naseer_xljt_GZ_2_P3_Y_unsplash_2_4de7613215.jpg", "hash": "thumbnail_nahil_naseer_xljt_GZ_2_P3_Y_unsplash_2_4de7613215", "mime": "image/jpeg", "name": "thumbnail_nahil-naseer-xljtGZ2-P3Y-unsplash(2).jpg", "path": null, "size": 3.97, "width": 88, "height": 156}}	nahil_naseer_xljt_GZ_2_P3_Y_unsplash_2_4de7613215	.jpg	image/jpeg	1408.45	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/nahil_naseer_xljt_GZ_2_P3_Y_unsplash_2_4de7613215.jpg	\N	aws-s3	\N	/	2023-12-08 15:43:53.04	2023-12-13 20:58:03.195	1	1
10	the_great_gatsby_movie-wide.jpg	\N	\N	2880	1800	{"large": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/large_the_great_gatsby_movie_wide_e43ba217b2.jpg", "hash": "large_the_great_gatsby_movie_wide_e43ba217b2", "mime": "image/jpeg", "name": "large_the_great_gatsby_movie-wide.jpg", "path": null, "size": 158.28, "width": 1000, "height": 625}, "small": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_the_great_gatsby_movie_wide_e43ba217b2.jpg", "hash": "small_the_great_gatsby_movie_wide_e43ba217b2", "mime": "image/jpeg", "name": "small_the_great_gatsby_movie-wide.jpg", "path": null, "size": 48.03, "width": 500, "height": 313}, "medium": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_the_great_gatsby_movie_wide_e43ba217b2.jpg", "hash": "medium_the_great_gatsby_movie_wide_e43ba217b2", "mime": "image/jpeg", "name": "medium_the_great_gatsby_movie-wide.jpg", "path": null, "size": 95.62, "width": 750, "height": 469}, "thumbnail": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_the_great_gatsby_movie_wide_e43ba217b2.jpg", "hash": "thumbnail_the_great_gatsby_movie_wide_e43ba217b2", "mime": "image/jpeg", "name": "thumbnail_the_great_gatsby_movie-wide.jpg", "path": null, "size": 14.89, "width": 245, "height": 153}}	the_great_gatsby_movie_wide_e43ba217b2	.jpg	image/jpeg	944.89	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/the_great_gatsby_movie_wide_e43ba217b2.jpg	\N	aws-s3	\N	/	2023-12-13 20:57:51.636	2023-12-13 20:57:51.636	1	1
11	climate_change.jpg	\N	\N	1800	2373	{"large": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/large_climate_change_e72179521f.jpg", "hash": "large_climate_change_e72179521f", "mime": "image/jpeg", "name": "large_climate_change.jpg", "path": null, "size": 205.28, "width": 759, "height": 1000}, "small": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_climate_change_e72179521f.jpg", "hash": "small_climate_change_e72179521f", "mime": "image/jpeg", "name": "small_climate_change.jpg", "path": null, "size": 53.46, "width": 379, "height": 500}, "medium": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_climate_change_e72179521f.jpg", "hash": "medium_climate_change_e72179521f", "mime": "image/jpeg", "name": "medium_climate_change.jpg", "path": null, "size": 106.08, "width": 569, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_climate_change_e72179521f.jpg", "hash": "thumbnail_climate_change_e72179521f", "mime": "image/jpeg", "name": "thumbnail_climate_change.jpg", "path": null, "size": 7.82, "width": 119, "height": 156}}	climate_change_e72179521f	.jpg	image/jpeg	1232.63	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/climate_change_e72179521f.jpg	\N	aws-s3	\N	/	2024-01-14 14:48:09.885	2024-01-14 14:48:09.885	1	1
13	rising_temperatures.png	\N	\N	2666	1875	{"large": {"ext": ".png", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/large_rising_temperatures_719f499427.png", "hash": "large_rising_temperatures_719f499427", "mime": "image/png", "name": "large_rising_temperatures.png", "path": null, "size": 198.86, "width": 1000, "height": 703}, "small": {"ext": ".png", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_rising_temperatures_719f499427.png", "hash": "small_rising_temperatures_719f499427", "mime": "image/png", "name": "small_rising_temperatures.png", "path": null, "size": 74.11, "width": 500, "height": 352}, "medium": {"ext": ".png", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_rising_temperatures_719f499427.png", "hash": "medium_rising_temperatures_719f499427", "mime": "image/png", "name": "medium_rising_temperatures.png", "path": null, "size": 131.71, "width": 750, "height": 527}, "thumbnail": {"ext": ".png", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_rising_temperatures_719f499427.png", "hash": "thumbnail_rising_temperatures_719f499427", "mime": "image/png", "name": "thumbnail_rising_temperatures.png", "path": null, "size": 22.62, "width": 222, "height": 156}}	rising_temperatures_719f499427	.png	image/png	126.94	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/rising_temperatures_719f499427.png	\N	aws-s3	\N	/	2024-01-14 14:56:46.251	2024-01-14 14:56:46.251	1	1
1	The_Great_Gatsby_Cover_1925_Retouched.jpg	\N	\N	1129	1600	{"large": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/large_The_Great_Gatsby_Cover_1925_Retouched_eb68481e60.jpg", "hash": "large_The_Great_Gatsby_Cover_1925_Retouched_eb68481e60", "mime": "image/jpeg", "name": "large_The_Great_Gatsby_Cover_1925_Retouched.jpg", "path": null, "size": 140.14, "width": 706, "height": 1000}, "small": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_The_Great_Gatsby_Cover_1925_Retouched_eb68481e60.jpg", "hash": "small_The_Great_Gatsby_Cover_1925_Retouched_eb68481e60", "mime": "image/jpeg", "name": "small_The_Great_Gatsby_Cover_1925_Retouched.jpg", "path": null, "size": 38.56, "width": 353, "height": 500}, "medium": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_The_Great_Gatsby_Cover_1925_Retouched_eb68481e60.jpg", "hash": "medium_The_Great_Gatsby_Cover_1925_Retouched_eb68481e60", "mime": "image/jpeg", "name": "medium_The_Great_Gatsby_Cover_1925_Retouched.jpg", "path": null, "size": 79.79, "width": 529, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_The_Great_Gatsby_Cover_1925_Retouched_eb68481e60.jpg", "hash": "thumbnail_The_Great_Gatsby_Cover_1925_Retouched_eb68481e60", "mime": "image/jpeg", "name": "thumbnail_The_Great_Gatsby_Cover_1925_Retouched.jpg", "path": null, "size": 5.45, "width": 110, "height": 156}}	The_Great_Gatsby_Cover_1925_Retouched_eb68481e60	.jpg	image/jpeg	401.56	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/The_Great_Gatsby_Cover_1925_Retouched_eb68481e60.jpg	\N	aws-s3	\N	/	2023-12-08 15:22:26.774	2024-01-15 21:02:36.791	1	1
12	climate_change_bg.jpg	\N	\N	1000	787	{"small": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/small_climate_change_bg_8828aa1a86.jpg", "hash": "small_climate_change_bg_8828aa1a86", "mime": "image/jpeg", "name": "small_climate_change_bg.jpg", "path": null, "size": 59.91, "width": 500, "height": 394}, "medium": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/medium_climate_change_bg_8828aa1a86.jpg", "hash": "medium_climate_change_bg_8828aa1a86", "mime": "image/jpeg", "name": "medium_climate_change_bg.jpg", "path": null, "size": 124.12, "width": 750, "height": 590}, "thumbnail": {"ext": ".jpg", "url": "https://awt-media-viewer.s3.eu-central-1.amazonaws.com/thumbnail_climate_change_bg_8828aa1a86.jpg", "hash": "thumbnail_climate_change_bg_8828aa1a86", "mime": "image/jpeg", "name": "thumbnail_climate_change_bg.jpg", "path": null, "size": 10.44, "width": 199, "height": 156}}	climate_change_bg_8828aa1a86	.jpg	image/jpeg	210.59	https://awt-media-viewer.s3.eu-central-1.amazonaws.com/climate_change_bg_8828aa1a86.jpg	\N	aws-s3	\N	/	2024-01-14 14:49:13.045	2024-02-23 15:50:27.494	1	1
\.


--
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_folder_links (id, file_id, folder_id, file_order) FROM stdin;
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_related_morphs (id, file_id, related_id, related_type, field, "order") FROM stdin;
79	1	2	api::medium.medium	cover	1
108	7	2	api::page.page	backgroundImage	1
122	11	3	api::medium.medium	cover	1
123	11	1	api::medium.medium	cover	1
128	12	10	api::page.page	backgroundImage	1
129	12	3	api::page.page	backgroundImage	1
130	7	11	api::page.page	backgroundImage	1
131	7	4	api::page.page	backgroundImage	1
132	12	12	api::page.page	backgroundImage	1
133	12	5	api::page.page	backgroundImage	1
134	12	13	api::page.page	backgroundImage	1
135	12	6	api::page.page	backgroundImage	1
136	12	14	api::page.page	backgroundImage	1
137	12	7	api::page.page	backgroundImage	1
138	12	1	api::page.page	backgroundImage	1
139	12	9	api::page.page	backgroundImage	1
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	English (en)	en	2024-01-18 09:41:09.337	2024-01-18 09:41:09.337	\N	\N
4	German (de)	de	2024-02-23 15:38:25.59	2024-02-23 15:38:25.59	1	1
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, value, color, name, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	fr	\N	French	2024-01-14 15:02:20.449	2024-01-14 15:02:20.449	1	1
2	en	\N	English	2024-01-14 15:02:27.901	2024-01-14 15:02:27.901	1	1
3	de	\N	German	2024-01-14 15:02:34.492	2024-01-14 15:02:34.492	1	1
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (id, title, description, cover_credit, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
2	The Great Gatsby	[{"type": "paragraph", "children": [{"text": "Inspired a super movie", "type": "text"}]}]	\N	2024-01-15 21:03:15.68	2024-01-15 23:49:37.598	1	1	en
3	Wissenschaftlicher Bericht zum Klimawandel	[{"type": "paragraph", "children": [{"text": "Ein umfassender Bericht über die Auswirkungen des Klimawandels auf die Umwelt.", "type": "text"}]}]	\N	2024-02-23 15:38:48.643	2024-02-23 15:44:08.53	1	1	de
1	Scientific Report on Climate Change	[{"type": "paragraph", "children": [{"text": "A comprehensive report on the impact of climate change on the environment.", "type": "text"}]}]	\N	2024-01-14 14:48:18.236	2024-02-23 15:44:08.581	1	1	en
\.


--
-- Data for Name: media_authors_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media_authors_links (id, medium_id, author_id, author_order, medium_order) FROM stdin;
1	1	1	1	0
2	3	2	1	1
\.


--
-- Data for Name: media_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media_info (id, release_date, rating, nb_voters, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	2024-01-14 00:00:00	5	2	2024-01-14 15:34:58.865	2024-01-14 15:34:58.865	1	1
\.


--
-- Data for Name: media_info_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media_info_links (id, medium_id, medium_info_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: media_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media_localizations_links (id, medium_id, inv_medium_id, medium_order) FROM stdin;
1	3	1	1
2	1	3	1
\.


--
-- Data for Name: media_tags_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media_tags_links (id, medium_id, tag_id, tag_order, medium_order) FROM stdin;
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages (id, title, background_color, content, background_image_credit, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
8	Introduction	\N	[{"type": "paragraph", "children": [{"text": "The Great Gatsby Introduction", "type": "text"}]}]	\N	2024-01-15 23:45:58.197	2024-01-16 00:12:42.844	1	1	en
13	5.Abschwächungs- und Anpassungsstrategien	\N	[{"type": "paragraph", "children": [{"text": "Die Verringerung der Treibhausgasemissionen ist entscheidend für die Eindämmung des Klimawandels.Die Umstellung auf erneuerbare Energiequellen, die Steigerung der Energieeffizienz und die Einführung von Technologien zur Kohlenstoffabscheidung sind wesentliche Schritte. Anpassungsstrategien beinhalten die Vorbereitung auf und die Reaktion auf die Auswirkungen des Klimawandels. Dazu gehören die Entwicklung einer widerstandsfähigen Infrastruktur, eine nachhaltige Flächennutzungsplanung und ein verbessertes Management der Wasserressourcen.", "type": "text"}]}]	\N	2024-02-23 15:50:12.66	2024-02-23 15:50:43.899	1	1	de
4	3. Impacts on Ecosystems	\N	[{"type": "paragraph", "children": [{"text": "Climate change is disrupting ecosystems and biodiversity. Species are facing challenges in adapting to rapid environmental changes, leading to shifts in migration patterns, altered breeding seasons, and, in some cases, extinction.", "type": "text"}]}]	\N	2024-01-14 14:59:20.389	2024-02-23 15:49:02.255	1	1	en
6	5. Mitigation and Adaptation Strategies	\N	[{"type": "paragraph", "children": [{"text": "Reducing GHG emissions is crucial for mitigating climate change. Transitioning to renewable energy sources, increasing energy efficiency, and implementing carbon capture technologies are essential steps. Adaptation strategies involve preparing for and responding to the impacts of climate change. This includes developing resilient infrastructure, sustainable land-use planning, and enhancing water resource management.", "type": "text"}]}]	\N	2024-01-14 15:00:21.739	2024-02-23 15:50:43.97	1	1	en
12	4. Risiken für menschliche Gesellschaften	\N	[{"type": "paragraph", "children": [{"text": "Veränderungen der Temperatur- und Niederschlagsmuster wirken sich auf die landwirtschaftliche Produktivität aus, was zu Verschiebungen bei den Ernteerträgen führt und die weltweite Ernährungssicherheit bedroht. Veränderte Niederschlagsmuster und erhöhte Verdunstung stellen eine Herausforderung für die Verfügbarkeit von Süßwasser dar. Regionen, die von der Schneeschmelze und gletschergespeisten Flüssen abhängig sind, sind erhöhten Risiken ausgesetzt. Die Ausbreitung von Krankheiten, hitzebedingten Erkrankungen und Atemwegsproblemen nimmt aufgrund der veränderten Klimabedingungen zu. Anfällige Bevölkerungsgruppen sind besonders gefährdet.", "type": "text"}]}]	\N	2024-02-23 15:49:23.3	2024-02-23 15:49:52.431	1	1	de
5	4. Risks to Human Societies	\N	[{"type": "paragraph", "children": [{"text": "Changes in temperature and precipitation patterns affect agricultural productivity, leading to shifts in crop yields and threatening global food security. Altered precipitation patterns and increased evaporation pose challenges to freshwater availability. Regions dependent on snowmelt and glacier-fed rivers face heightened risks. The spread of diseases, heat-related illnesses, and respiratory issues are on the rise due to changing climate conditions. Vulnerable populations are particularly at risk.", "type": "text"}]}]	\N	2024-01-14 14:59:43.958	2024-02-23 15:49:52.505	1	1	en
7	6. Conclusion	\N	[{"type": "paragraph", "children": [{"text": "Climate change is a complex and multifaceted challenge that requires global cooperation and immediate action. The scientific evidence presented in this report underscores the urgency of addressing the root causes of climate change and implementing effective mitigation and adaptation strategies. Failure to act will have profound consequences for ecosystems, economies, and the well-being of present and future generations. The time for decisive and coordinated action is now.", "type": "text"}]}]	\N	2024-01-14 15:00:40.909	2024-02-23 15:51:34.827	1	1	en
2	1. Introduction	\N	[{"type": "paragraph", "children": [{"text": "Climate change refers to long-term changes in temperature, precipitation, and other atmospheric conditions on Earth. Over the past century, the planet has experienced a discernible warming trend, with an increase in average global temperatures. This warming is primarily attributed to the buildup of greenhouse gases (GHGs) in the atmosphere, such as carbon dioxide (CO2), methane (CH4), and nitrous oxide (N2O). The main sources of these emissions are the burning of fossil fuels for energy and industrial processes, deforestation, and certain agricultural practices.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}, {"url": "https://embed-ssl.wistia.com/deliveries/ff4dceaf66fe45394a7d43c5b1215e6ca9d6e7f9.bin?disposition=attachment&filename=climate_change.mp4", "type": "link", "children": [{"text": "[embedded-video]", "type": "text"}]}, {"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}, {"url": "https://embed-ssl.wistia.com/deliveries/ff4dceaf66fe45394a7d43c5b1215e6ca9d6e7f9.bin?disposition=attachment&filename=climate_change.mp4", "type": "link", "children": [{"text": "[embedded-video]", "type": "text"}]}, {"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}]	\N	2024-01-14 14:54:15.152	2024-02-10 19:03:34.404	1	1	en
1	Executive Summary	\N	[{"type": "paragraph", "children": [{"text": "Climate change is a pressing global issue that demands urgent attention and comprehensive action. This report provides an overview of the current state of climate change, its causes, and potential impacts. The scientific evidence overwhelmingly supports the conclusion that human activities, particularly the burning of fossil fuels and deforestation, are major contributors to the observed changes in the Earth's climate. The consequences of climate change are far-reaching, affecting ecosystems, weather patterns, and posing significant risks to human societies.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}, {"url": "https://EarthClouds_1_12756.usdz", "type": "link", "children": [{"text": "[embedded-model][local] Globe", "type": "text"}]}, {"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}, {"url": "https://drive.google.com/uc?export=download&id=1j3hFHGudDyWRGdWl37FjPku1wXfQXkb4", "type": "link", "children": [{"text": "[embedded-model] usdz Mangrove", "type": "text"}]}, {"text": "", "type": "text"}]}]	\N	2024-01-14 14:49:35.665	2024-02-23 15:52:40.174	1	1	en
10	2. Wissenschaftliche Beweise	\N	[{"type": "paragraph", "children": [{"text": "Die globalen Temperaturen sind seit der vorindustriellen Ära um etwa 1,1 Grad Celsius angestiegen.Diese Erwärmung zeigt sich in steigenden Meeresoberflächentemperaturen, schmelzenden Gletschern und Verschiebungen in den Temperaturmustern auf dem gesamten Globus.Das Abschmelzen der Polkappen und Gletscher trägt zum Anstieg des Meeresspiegels bei.In den Küstenregionen kommt es vermehrt zu Überschwemmungen, Erosion und dem Eindringen von Salzwasser, was eine Bedrohung für Gemeinden und Ökosysteme darstellt. Der Klimawandel steht im Zusammenhang mit einer Zunahme der Häufigkeit und Intensität extremer Wetterereignisse wie Wirbelstürme, Hitzewellen, Dürren und starke Regenfälle. Diese Ereignisse haben weitreichende Auswirkungen auf die Landwirtschaft, die Infrastruktur und die menschliche Gesundheit. Die Aufnahme von überschüssigem CO2 aus der Atmosphäre durch die Weltmeere hat zu einer Versauerung der Ozeane geführt. Dies stellt eine ernsthafte Bedrohung für marine Ökosysteme dar, insbesondere für Korallenriffe und Muschelorganismen.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}, {"url": "https://ichef.bbci.co.uk/news/2048/cpsprodpb/F03E/production/_110520516_meantemps4-nc.png", "type": "link", "children": [{"text": "Steigende Temperaturen Bild", "type": "text"}]}, {"text": "", "type": "text"}]}]	\N	2024-02-23 15:46:40.607	2024-02-23 15:48:10.805	1	1	de
3	2. Scientific Evidence	\N	[{"type": "paragraph", "children": [{"text": "Global temperatures have risen approximately 1.1 degrees Celsius since the pre-industrial era. This warming is evident in rising sea surface temperatures, melting glaciers, and shifts in temperature patterns across the globe. The melting of polar ice caps and glaciers contributes to rising sea levels. Coastal regions are experiencing increased flooding, erosion, and saltwater intrusion, posing threats to communities and ecosystems. Climate change is linked to an increase in the frequency and intensity of extreme weather events, including hurricanes, heatwaves, droughts, and heavy rainfall. These events have wide-ranging impacts on agriculture, infrastructure, and human health. The absorption of excess atmospheric CO2 by the world's oceans has led to ocean acidification. This poses a serious threat to marine ecosystems, particularly coral reefs and shelled organisms.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}, {"url": "https://ichef.bbci.co.uk/news/2048/cpsprodpb/F03E/production/_110520516_meantemps4-nc.png", "type": "link", "children": [{"text": "Rising temparatures image", "type": "text"}]}, {"text": "", "type": "text"}]}]	\N	2024-01-14 14:58:18.851	2024-02-23 15:48:10.854	1	1	en
11	3. Auswirkungen auf Ökosysteme	\N	[{"type": "paragraph", "children": [{"text": "Der Klimawandel stört die Ökosysteme und die Artenvielfalt. Arten müssen sich an die raschen Umweltveränderungen anpassen, was zu veränderten Migrationsmustern, veränderten Brutzeiten und in einigen Fällen zum Aussterben führt.", "type": "text"}]}]	\N	2024-02-23 15:48:26.998	2024-02-23 15:49:02.207	1	1	de
14	6. Schlussfolgerung	\N	[{"type": "paragraph", "children": [{"text": "Der Klimawandel ist eine komplexe und vielschichtige Herausforderung, die globale Zusammenarbeit und sofortiges Handeln erfordert. Die in diesem Bericht dargelegten wissenschaftlichen Erkenntnisse unterstreichen die Dringlichkeit, die Ursachen des Klimawandels zu bekämpfen und wirksame Strategien zur Eindämmung und Anpassung umzusetzen. Wenn wir nicht handeln, wird dies tiefgreifende Folgen für Ökosysteme, Volkswirtschaften und das Wohlergehen heutiger und künftiger Generationen haben. Die Zeit für entschlossenes und koordiniertes Handeln ist jetzt gekommen.", "type": "text"}]}]	\N	2024-02-23 15:51:04.104	2024-02-23 15:51:34.73	1	1	de
9	Zusammenfassung	\N	[{"type": "paragraph", "children": [{"text": "Der Klimawandel ist ein dringendes globales Problem, das dringend Aufmerksamkeit und umfassende Maßnahmen erfordert. Dieser Bericht gibt einen Überblick über den aktuellen Stand des Klimawandels, seine Ursachen und möglichen Auswirkungen. Die wissenschaftlichen Erkenntnisse stützen in überwältigender Weise die Schlussfolgerung, dass menschliche Aktivitäten, insbesondere die Verbrennung fossiler Brennstoffe und die Abholzung von Wäldern, wesentlich zu den beobachteten Veränderungen des Klimas auf der Erde beitragen. Die Folgen des Klimawandels sind weitreichend, beeinträchtigen Ökosysteme und Wettermuster und bergen erhebliche Risiken für die menschliche Gesellschaft.", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}, {"url": "https://EarthClouds_1_12756.usdz", "type": "link", "children": [{"text": "[embedded-model][local] Globus", "type": "text"}]}, {"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}]}, {"type": "paragraph", "children": [{"text": "", "type": "text"}, {"url": "https://drive.google.com/uc?export=download&id=1j3hFHGudDyWRGdWl37FjPku1wXfQXkb4", "type": "link", "children": [{"text": "[embedded-model] usdz Mangrove", "type": "text"}]}, {"text": "", "type": "text"}]}]	\N	2024-02-23 15:44:54.234	2024-02-23 15:52:40.214	1	1	de
\.


--
-- Data for Name: pages_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_localizations_links (id, page_id, inv_page_id, page_order) FROM stdin;
1	9	1	1
2	1	9	1
3	10	3	1
4	3	10	1
5	11	4	1
6	4	11	1
7	12	5	1
8	5	12	1
9	13	6	1
10	6	13	1
11	14	7	1
12	7	14	1
\.


--
-- Data for Name: pages_medium_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages_medium_links (id, page_id, medium_id, page_order) FROM stdin;
9	8	2	1
10	1	1	1
15	2	1	2
20	3	1	3
19	4	1	4
18	5	1	5
17	6	1	6
16	7	1	7
21	9	3	1
22	10	3	2
23	11	3	3
24	12	3	4
25	13	3	5
26	14	3	6
\.


--
-- Data for Name: reader_mediums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reader_mediums (id, read_time, read, archived, last_opened_at, rating, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	\N	t	t	\N	\N	2024-01-15 17:56:53.373	2024-01-15 23:30:55.649	1	1
2	0	f	f	\N	\N	2024-01-15 21:04:28.461	2024-01-15 23:31:03.185	\N	\N
4	0	f	f	\N	\N	2024-01-18 12:41:36.523	2024-01-18 12:41:36.523	\N	\N
3	0	f	t	\N	\N	2024-01-18 12:02:55.486	2024-02-10 14:08:25.878	\N	\N
5	0	f	f	\N	\N	2024-02-23 15:53:09.602	2024-02-23 15:53:09.602	\N	\N
\.


--
-- Data for Name: reader_mediums_medium_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reader_mediums_medium_links (id, reader_medium_id, medium_id, reader_medium_order) FROM stdin;
1	1	1	1
2	2	2	1
3	3	1	2
4	4	2	2
5	5	3	1
\.


--
-- Data for Name: reader_mediums_reader_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reader_mediums_reader_links (id, reader_medium_id, reader_id, reader_medium_order) FROM stdin;
3	3	1	1
4	4	1	2
5	5	1	3
\.


--
-- Data for Name: readers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.readers (id, first_name, last_name, user_name, email, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	John	Doe	johndoe	john.doe@gmail.com	2024-01-15 17:56:32.224	2024-01-15 17:56:32.224	1	1
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	admin		full-access	f632efa95743f995bed8cf6a3173c8d39b59bab2a59f354bd358b12366e107d218c8823f53e76b9328950c4e6ff1229ad7de8e4d30bb028b7f91cbd7ed5d3a39	\N	\N	\N	2023-12-05 12:51:50.951	2024-01-15 20:56:30.393	\N	\N
2	client	Used in VisionOS app	full-access	24ffd42280d1a19572754d33668f98e9129cbbcbf1ad672bfb2086ba9893902eaaaca9c50c41ed751a10c67c5769c019551c3cf023134b3ff8e5a2d61da31c49	\N	\N	\N	2024-01-15 20:57:42.722	2024-01-15 20:57:42.722	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
2	plugin_content_manager_configuration_content_types::admin::permission	{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::role	{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]}}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::user	{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]}}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::api-token	{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]}}	object	\N	\N
6	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"uid":"admin::transfer-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"uid":"plugin::upload.folder","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]}}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::upload.file	{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]}}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token","connection":"default","uid":"admin::transfer-token","plugin":"admin","globalId":"AdminTransferToken"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token-permission","connection":"default","uid":"admin::transfer-token-permission","plugin":"admin","globalId":"AdminTransferTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"api::author.author":{"kind":"collectionType","collectionName":"authors","info":{"singularName":"author","pluralName":"authors","displayName":"Author"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"mediums":{"type":"relation","relation":"manyToMany","target":"api::medium.medium","mappedBy":"authors"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::author.author"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"authors","info":{"singularName":"author","pluralName":"authors","displayName":"Author"},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"mediums":{"type":"relation","relation":"manyToMany","target":"api::medium.medium","mappedBy":"authors"}},"kind":"collectionType"},"modelType":"contentType","modelName":"author","connection":"default","uid":"api::author.author","apiName":"author","globalId":"Author","actions":{},"lifecycles":{}},"api::language.language":{"kind":"collectionType","collectionName":"languages","info":{"singularName":"language","pluralName":"languages","displayName":"Language","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"value":{"type":"string"},"color":{"type":"string"},"name":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"languages","info":{"singularName":"language","pluralName":"languages","displayName":"Language","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"value":{"type":"string"},"color":{"type":"string"},"name":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"language","connection":"default","uid":"api::language.language","apiName":"language","globalId":"Language","actions":{},"lifecycles":{}},"api::medium.medium":{"kind":"collectionType","collectionName":"media","info":{"singularName":"medium","pluralName":"media","displayName":"Medium","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true,"unique":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"blocks"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"reader_media":{"type":"relation","relation":"oneToMany","target":"api::reader-medium.reader-medium","mappedBy":"medium"},"info":{"type":"relation","relation":"oneToOne","target":"api::medium-info.medium-info"},"tags":{"type":"relation","relation":"manyToMany","target":"api::tag.tag","inversedBy":"mediums"},"pages":{"type":"relation","relation":"oneToMany","target":"api::page.page","mappedBy":"medium"},"coverCredit":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"authors":{"type":"relation","relation":"manyToMany","target":"api::author.author","inversedBy":"mediums"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::medium.medium"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"media","info":{"singularName":"medium","pluralName":"media","displayName":"Medium","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","required":true,"unique":true},"description":{"pluginOptions":{"i18n":{"localized":true}},"type":"blocks"},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"reader_media":{"type":"relation","relation":"oneToMany","target":"api::reader-medium.reader-medium","mappedBy":"medium"},"info":{"type":"relation","relation":"oneToOne","target":"api::medium-info.medium-info"},"tags":{"type":"relation","relation":"manyToMany","target":"api::tag.tag","inversedBy":"mediums"},"pages":{"type":"relation","relation":"oneToMany","target":"api::page.page","mappedBy":"medium"},"coverCredit":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"authors":{"type":"relation","relation":"manyToMany","target":"api::author.author","inversedBy":"mediums"}},"kind":"collectionType"},"modelType":"contentType","modelName":"medium","connection":"default","uid":"api::medium.medium","apiName":"medium","globalId":"Medium","actions":{},"lifecycles":{}},"api::medium-info.medium-info":{"kind":"collectionType","collectionName":"media_info","info":{"singularName":"medium-info","pluralName":"media-info","displayName":"Info","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"releaseDate":{"pluginOptions":{},"type":"datetime"},"rating":{"pluginOptions":{},"type":"float"},"nbVoters":{"pluginOptions":{},"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"media_info","info":{"singularName":"medium-info","pluralName":"media-info","displayName":"Info","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"releaseDate":{"pluginOptions":{},"type":"datetime"},"rating":{"pluginOptions":{},"type":"float"},"nbVoters":{"pluginOptions":{},"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"medium-info","connection":"default","uid":"api::medium-info.medium-info","apiName":"medium-info","globalId":"MediumInfo","actions":{},"lifecycles":{}},"api::page.page":{"kind":"collectionType","collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"Page","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"backgroundImage":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"backgroundColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","regex":"^#(?:[0-9a-fA-F]{3}|[0-9a-fA-F]{6})$"},"content":{"pluginOptions":{"i18n":{"localized":true}},"type":"blocks"},"medium":{"type":"relation","relation":"manyToOne","target":"api::medium.medium","inversedBy":"pages"},"backgroundImageCredit":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::page.page"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"Page","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"},"backgroundImage":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"],"pluginOptions":{"i18n":{"localized":false}}},"backgroundColor":{"pluginOptions":{"i18n":{"localized":false}},"type":"string","regex":"^#(?:[0-9a-fA-F]{3}|[0-9a-fA-F]{6})$"},"content":{"pluginOptions":{"i18n":{"localized":true}},"type":"blocks"},"medium":{"type":"relation","relation":"manyToOne","target":"api::medium.medium","inversedBy":"pages"},"backgroundImageCredit":{"pluginOptions":{"i18n":{"localized":true}},"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"page","connection":"default","uid":"api::page.page","apiName":"page","globalId":"Page","actions":{},"lifecycles":{}},"api::reader.reader":{"kind":"collectionType","collectionName":"readers","info":{"singularName":"reader","pluralName":"readers","displayName":"Reader","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"firstName":{"type":"string"},"lastName":{"type":"string"},"userName":{"type":"string","required":true},"email":{"type":"string","regex":"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\\\.[a-zA-Z]{2,}$","unique":true,"required":true},"reader_media":{"type":"relation","relation":"oneToMany","target":"api::reader-medium.reader-medium","mappedBy":"reader"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"readers","info":{"singularName":"reader","pluralName":"readers","displayName":"Reader","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"firstName":{"type":"string"},"lastName":{"type":"string"},"userName":{"type":"string","required":true},"email":{"type":"string","regex":"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\\\.[a-zA-Z]{2,}$","unique":true,"required":true},"reader_media":{"type":"relation","relation":"oneToMany","target":"api::reader-medium.reader-medium","mappedBy":"reader"}},"kind":"collectionType"},"modelType":"contentType","modelName":"reader","connection":"default","uid":"api::reader.reader","apiName":"reader","globalId":"Reader","actions":{},"lifecycles":{}},"api::reader-medium.reader-medium":{"kind":"collectionType","collectionName":"reader_mediums","info":{"singularName":"reader-medium","pluralName":"reader-mediums","displayName":"ReaderMedium","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"reader":{"type":"relation","relation":"manyToOne","target":"api::reader.reader","inversedBy":"reader_media"},"medium":{"type":"relation","relation":"manyToOne","target":"api::medium.medium","inversedBy":"reader_media"},"readTime":{"type":"integer"},"read":{"type":"boolean"},"archived":{"type":"boolean"},"lastOpenedAt":{"type":"datetime"},"rating":{"type":"enumeration","enum":["up","down"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"reader_mediums","info":{"singularName":"reader-medium","pluralName":"reader-mediums","displayName":"ReaderMedium","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"reader":{"type":"relation","relation":"manyToOne","target":"api::reader.reader","inversedBy":"reader_media"},"medium":{"type":"relation","relation":"manyToOne","target":"api::medium.medium","inversedBy":"reader_media"},"readTime":{"type":"integer"},"read":{"type":"boolean"},"archived":{"type":"boolean"},"lastOpenedAt":{"type":"datetime"},"rating":{"type":"enumeration","enum":["up","down"]}},"kind":"collectionType"},"modelType":"contentType","modelName":"reader-medium","connection":"default","uid":"api::reader-medium.reader-medium","apiName":"reader-medium","globalId":"ReaderMedium","actions":{},"lifecycles":{}},"api::tag.tag":{"kind":"collectionType","collectionName":"tags","info":{"singularName":"tag","pluralName":"tags","displayName":"Tag","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","unique":false,"required":true},"color":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","regex":"^#(?:[0-9a-fA-F]{3}|[0-9a-fA-F]{6})$"},"mediums":{"type":"relation","relation":"manyToMany","target":"api::medium.medium","mappedBy":"tags"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"relation","relation":"oneToMany","target":"api::tag.tag"},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"}},"__schema__":{"collectionName":"tags","info":{"singularName":"tag","pluralName":"tags","displayName":"Tag","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"name":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","unique":false,"required":true},"color":{"pluginOptions":{"i18n":{"localized":true}},"type":"string","regex":"^#(?:[0-9a-fA-F]{3}|[0-9a-fA-F]{6})$"},"mediums":{"type":"relation","relation":"manyToMany","target":"api::medium.medium","mappedBy":"tags"}},"kind":"collectionType"},"modelType":"contentType","modelName":"tag","connection":"default","uid":"api::tag.tag","apiName":"tag","globalId":"Tag","actions":{},"lifecycles":{}}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]}}	object	\N	\N
20	plugin_content_manager_configuration_content_types::api::tag.tag	{"uid":"api::tag.tag","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"mediums":{"edit":{"label":"mediums","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"mediums","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","color","mediums"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"mediums","size":6}]]}}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]}}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]}}	object	\N	\N
13	plugin_content_manager_configuration_content_types::api::author.author	{"uid":"api::author.author","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"mediums":{"edit":{"label":"mediums","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"mediums","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","mediums","createdAt"],"edit":[[{"name":"name","size":6},{"name":"mediums","size":6}]]}}	object	\N	\N
14	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"uid":"admin::api-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
15	plugin_content_manager_configuration_content_types::admin::transfer-token	{"uid":"admin::transfer-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]}}	object	\N	\N
21	plugin_content_manager_configuration_content_types::api::page.page	{"uid":"api::page.page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"backgroundImage":{"edit":{"label":"backgroundImage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"backgroundImage","searchable":false,"sortable":false}},"backgroundColor":{"edit":{"label":"backgroundColor","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"backgroundColor","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"medium":{"edit":{"label":"medium","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"medium","searchable":true,"sortable":true}},"backgroundImageCredit":{"edit":{"label":"backgroundImageCredit","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"backgroundImageCredit","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","backgroundImage","backgroundColor"],"edit":[[{"name":"title","size":6},{"name":"backgroundImage","size":6}],[{"name":"backgroundColor","size":6}],[{"name":"content","size":12}],[{"name":"medium","size":6},{"name":"backgroundImageCredit","size":6}]]}}	object	\N	\N
23	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
24	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
26	plugin_i18n_default_locale	"en"	string	\N	\N
27	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"enabled":false,"icon":"","key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]}}	object	\N	\N
28	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
29	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
25	plugin_upload_metrics	{"weeklySchedule":"9 46 9 * * 4","lastWeeklyUpdate":1708595169023}	object	\N	\N
16	plugin_content_manager_configuration_content_types::api::language.language	{"uid":"api::language.language","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"value","defaultSortBy":"value","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"value":{"edit":{"label":"value","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"value","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","value","color","name"],"edit":[[{"name":"value","size":6},{"name":"color","size":6}],[{"name":"name","size":6}]]}}	object	\N	\N
22	plugin_content_manager_configuration_content_types::api::reader.reader	{"uid":"api::reader.reader","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstName","defaultSortBy":"firstName","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstName":{"edit":{"label":"firstName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstName","searchable":true,"sortable":true}},"lastName":{"edit":{"label":"lastName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastName","searchable":true,"sortable":true}},"userName":{"edit":{"label":"userName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"userName","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"reader_media":{"edit":{"label":"reader_media","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"reader_media","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstName","lastName","userName"],"edit":[[{"name":"firstName","size":6},{"name":"lastName","size":6}],[{"name":"userName","size":6},{"name":"email","size":6}],[{"name":"reader_media","size":6}]]}}	object	\N	\N
17	plugin_content_manager_configuration_content_types::api::medium.medium	{"uid":"api::medium.medium","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"reader_media":{"edit":{"label":"reader_media","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"reader_media","searchable":false,"sortable":false}},"info":{"edit":{"label":"info","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"info","searchable":true,"sortable":true}},"tags":{"edit":{"label":"tags","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"tags","searchable":false,"sortable":false}},"pages":{"edit":{"label":"pages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"pages","searchable":false,"sortable":false}},"coverCredit":{"edit":{"label":"coverCredit","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"coverCredit","searchable":true,"sortable":true}},"authors":{"edit":{"label":"authors","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"authors","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","cover","reader_media"],"edit":[[{"name":"title","size":6}],[{"name":"description","size":12}],[{"name":"cover","size":6},{"name":"reader_media","size":6}],[{"name":"info","size":6},{"name":"tags","size":6}],[{"name":"pages","size":6},{"name":"coverCredit","size":6}],[{"name":"authors","size":6}]]}}	object	\N	\N
30	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
18	plugin_content_manager_configuration_content_types::api::medium-info.medium-info	{"uid":"api::medium-info.medium-info","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"releaseDate":{"edit":{"label":"releaseDate","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releaseDate","searchable":true,"sortable":true}},"rating":{"edit":{"label":"rating","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rating","searchable":true,"sortable":true}},"nbVoters":{"edit":{"label":"nbVoters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nbVoters","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","releaseDate","rating","nbVoters"],"edit":[[{"name":"releaseDate","size":6},{"name":"rating","size":4}],[{"name":"nbVoters","size":4}]]}}	object	\N	\N
19	plugin_content_manager_configuration_content_types::api::reader-medium.reader-medium	{"uid":"api::reader-medium.reader-medium","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"reader":{"edit":{"label":"reader","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstName"},"list":{"label":"reader","searchable":true,"sortable":true}},"medium":{"edit":{"label":"medium","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"medium","searchable":true,"sortable":true}},"readTime":{"edit":{"label":"readTime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"readTime","searchable":true,"sortable":true}},"read":{"edit":{"label":"read","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"read","searchable":true,"sortable":true}},"archived":{"edit":{"label":"archived","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"archived","searchable":true,"sortable":true}},"lastOpenedAt":{"edit":{"label":"lastOpenedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastOpenedAt","searchable":true,"sortable":true}},"rating":{"edit":{"label":"rating","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"rating","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","reader","medium","readTime"],"edit":[[{"name":"reader","size":6},{"name":"medium","size":6}],[{"name":"readTime","size":4},{"name":"read","size":4},{"name":"archived","size":4}],[{"name":"lastOpenedAt","size":6},{"name":"rating","size":6}]]}}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
1	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"authors","indexes":[{"name":"authors_created_by_id_fk","columns":["created_by_id"]},{"name":"authors_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"authors_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"authors_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"languages","indexes":[{"name":"languages_created_by_id_fk","columns":["created_by_id"]},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"languages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"value","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"media","indexes":[{"name":"media_created_by_id_fk","columns":["created_by_id"]},{"name":"media_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"media_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"media_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cover_credit","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"media_info","indexes":[{"name":"media_info_created_by_id_fk","columns":["created_by_id"]},{"name":"media_info_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"media_info_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"media_info_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_date","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rating","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"nb_voters","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages","indexes":[{"name":"pages_created_by_id_fk","columns":["created_by_id"]},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"background_color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"background_image_credit","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"readers","indexes":[{"name":"readers_created_by_id_fk","columns":["created_by_id"]},{"name":"readers_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"readers_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"readers_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"first_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"user_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reader_mediums","indexes":[{"name":"reader_mediums_created_by_id_fk","columns":["created_by_id"]},{"name":"reader_mediums_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"reader_mediums_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"reader_mediums_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"read_time","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"read","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"archived","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_opened_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rating","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"tags","indexes":[{"name":"tags_created_by_id_fk","columns":["created_by_id"]},{"name":"tags_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"tags_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"tags_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]},{"name":"files_related_morphs_order_index","columns":["order"]},{"name":"files_related_morphs_id_column_index","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"authors_localizations_links","indexes":[{"name":"authors_localizations_links_fk","columns":["author_id"]},{"name":"authors_localizations_links_inv_fk","columns":["inv_author_id"]},{"name":"authors_localizations_links_unique","columns":["author_id","inv_author_id"],"type":"unique"},{"name":"authors_localizations_links_order_fk","columns":["author_order"]}],"foreignKeys":[{"name":"authors_localizations_links_fk","columns":["author_id"],"referencedColumns":["id"],"referencedTable":"authors","onDelete":"CASCADE"},{"name":"authors_localizations_links_inv_fk","columns":["inv_author_id"],"referencedColumns":["id"],"referencedTable":"authors","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"author_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_author_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"author_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"media_info_links","indexes":[{"name":"media_info_links_fk","columns":["medium_id"]},{"name":"media_info_links_inv_fk","columns":["medium_info_id"]},{"name":"media_info_links_unique","columns":["medium_id","medium_info_id"],"type":"unique"}],"foreignKeys":[{"name":"media_info_links_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"},{"name":"media_info_links_inv_fk","columns":["medium_info_id"],"referencedColumns":["id"],"referencedTable":"media_info","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_info_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"media_tags_links","indexes":[{"name":"media_tags_links_fk","columns":["medium_id"]},{"name":"media_tags_links_inv_fk","columns":["tag_id"]},{"name":"media_tags_links_unique","columns":["medium_id","tag_id"],"type":"unique"},{"name":"media_tags_links_order_fk","columns":["tag_order"]},{"name":"media_tags_links_order_inv_fk","columns":["medium_order"]}],"foreignKeys":[{"name":"media_tags_links_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"},{"name":"media_tags_links_inv_fk","columns":["tag_id"],"referencedColumns":["id"],"referencedTable":"tags","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"tag_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"tag_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"media_authors_links","indexes":[{"name":"media_authors_links_fk","columns":["medium_id"]},{"name":"media_authors_links_inv_fk","columns":["author_id"]},{"name":"media_authors_links_unique","columns":["medium_id","author_id"],"type":"unique"},{"name":"media_authors_links_order_fk","columns":["author_order"]},{"name":"media_authors_links_order_inv_fk","columns":["medium_order"]}],"foreignKeys":[{"name":"media_authors_links_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"},{"name":"media_authors_links_inv_fk","columns":["author_id"],"referencedColumns":["id"],"referencedTable":"authors","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"author_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"author_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"media_localizations_links","indexes":[{"name":"media_localizations_links_fk","columns":["medium_id"]},{"name":"media_localizations_links_inv_fk","columns":["inv_medium_id"]},{"name":"media_localizations_links_unique","columns":["medium_id","inv_medium_id"],"type":"unique"},{"name":"media_localizations_links_order_fk","columns":["medium_order"]}],"foreignKeys":[{"name":"media_localizations_links_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"},{"name":"media_localizations_links_inv_fk","columns":["inv_medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages_medium_links","indexes":[{"name":"pages_medium_links_fk","columns":["page_id"]},{"name":"pages_medium_links_inv_fk","columns":["medium_id"]},{"name":"pages_medium_links_unique","columns":["page_id","medium_id"],"type":"unique"},{"name":"pages_medium_links_order_inv_fk","columns":["page_order"]}],"foreignKeys":[{"name":"pages_medium_links_fk","columns":["page_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"},{"name":"pages_medium_links_inv_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"page_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages_localizations_links","indexes":[{"name":"pages_localizations_links_fk","columns":["page_id"]},{"name":"pages_localizations_links_inv_fk","columns":["inv_page_id"]},{"name":"pages_localizations_links_unique","columns":["page_id","inv_page_id"],"type":"unique"},{"name":"pages_localizations_links_order_fk","columns":["page_order"]}],"foreignKeys":[{"name":"pages_localizations_links_fk","columns":["page_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"},{"name":"pages_localizations_links_inv_fk","columns":["inv_page_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"page_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reader_mediums_reader_links","indexes":[{"name":"reader_mediums_reader_links_fk","columns":["reader_medium_id"]},{"name":"reader_mediums_reader_links_inv_fk","columns":["reader_id"]},{"name":"reader_mediums_reader_links_unique","columns":["reader_medium_id","reader_id"],"type":"unique"},{"name":"reader_mediums_reader_links_order_inv_fk","columns":["reader_medium_order"]}],"foreignKeys":[{"name":"reader_mediums_reader_links_fk","columns":["reader_medium_id"],"referencedColumns":["id"],"referencedTable":"reader_mediums","onDelete":"CASCADE"},{"name":"reader_mediums_reader_links_inv_fk","columns":["reader_id"],"referencedColumns":["id"],"referencedTable":"readers","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"reader_medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"reader_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"reader_medium_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reader_mediums_medium_links","indexes":[{"name":"reader_mediums_medium_links_fk","columns":["reader_medium_id"]},{"name":"reader_mediums_medium_links_inv_fk","columns":["medium_id"]},{"name":"reader_mediums_medium_links_unique","columns":["reader_medium_id","medium_id"],"type":"unique"},{"name":"reader_mediums_medium_links_order_inv_fk","columns":["reader_medium_order"]}],"foreignKeys":[{"name":"reader_mediums_medium_links_fk","columns":["reader_medium_id"],"referencedColumns":["id"],"referencedTable":"reader_mediums","onDelete":"CASCADE"},{"name":"reader_mediums_medium_links_inv_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"reader_medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"reader_medium_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"tags_localizations_links","indexes":[{"name":"tags_localizations_links_fk","columns":["tag_id"]},{"name":"tags_localizations_links_inv_fk","columns":["inv_tag_id"]},{"name":"tags_localizations_links_unique","columns":["tag_id","inv_tag_id"],"type":"unique"},{"name":"tags_localizations_links_order_fk","columns":["tag_order"]}],"foreignKeys":[{"name":"tags_localizations_links_fk","columns":["tag_id"],"referencedColumns":["id"],"referencedTable":"tags","onDelete":"CASCADE"},{"name":"tags_localizations_links_inv_fk","columns":["inv_tag_id"],"referencedColumns":["id"],"referencedTable":"tags","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"tag_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_tag_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"tag_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2024-01-18 09:41:08.852	1cdf6a9de0a0961bcc61b4db49129bbf
29	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"authors","indexes":[{"name":"authors_created_by_id_fk","columns":["created_by_id"]},{"name":"authors_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"authors_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"authors_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"languages","indexes":[{"name":"languages_created_by_id_fk","columns":["created_by_id"]},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"languages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"languages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"value","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"media","indexes":[{"name":"media_created_by_id_fk","columns":["created_by_id"]},{"name":"media_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"media_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"media_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"cover_credit","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"media_info","indexes":[{"name":"media_info_created_by_id_fk","columns":["created_by_id"]},{"name":"media_info_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"media_info_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"media_info_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_date","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rating","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"nb_voters","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages","indexes":[{"name":"pages_created_by_id_fk","columns":["created_by_id"]},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"background_color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"background_image_credit","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"readers","indexes":[{"name":"readers_created_by_id_fk","columns":["created_by_id"]},{"name":"readers_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"readers_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"readers_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"first_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"user_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reader_mediums","indexes":[{"name":"reader_mediums_created_by_id_fk","columns":["created_by_id"]},{"name":"reader_mediums_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"reader_mediums_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"reader_mediums_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"read_time","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"read","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"archived","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_opened_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"rating","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"tags","indexes":[{"name":"tags_created_by_id_fk","columns":["created_by_id"]},{"name":"tags_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"tags_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"tags_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]},{"name":"files_related_morphs_order_index","columns":["order"]},{"name":"files_related_morphs_id_column_index","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"authors_localizations_links","indexes":[{"name":"authors_localizations_links_fk","columns":["author_id"]},{"name":"authors_localizations_links_inv_fk","columns":["inv_author_id"]},{"name":"authors_localizations_links_unique","columns":["author_id","inv_author_id"],"type":"unique"},{"name":"authors_localizations_links_order_fk","columns":["author_order"]}],"foreignKeys":[{"name":"authors_localizations_links_fk","columns":["author_id"],"referencedColumns":["id"],"referencedTable":"authors","onDelete":"CASCADE"},{"name":"authors_localizations_links_inv_fk","columns":["inv_author_id"],"referencedColumns":["id"],"referencedTable":"authors","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"author_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_author_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"author_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"media_info_links","indexes":[{"name":"media_info_links_fk","columns":["medium_id"]},{"name":"media_info_links_inv_fk","columns":["medium_info_id"]},{"name":"media_info_links_unique","columns":["medium_id","medium_info_id"],"type":"unique"}],"foreignKeys":[{"name":"media_info_links_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"},{"name":"media_info_links_inv_fk","columns":["medium_info_id"],"referencedColumns":["id"],"referencedTable":"media_info","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_info_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"media_tags_links","indexes":[{"name":"media_tags_links_fk","columns":["medium_id"]},{"name":"media_tags_links_inv_fk","columns":["tag_id"]},{"name":"media_tags_links_unique","columns":["medium_id","tag_id"],"type":"unique"},{"name":"media_tags_links_order_fk","columns":["tag_order"]},{"name":"media_tags_links_order_inv_fk","columns":["medium_order"]}],"foreignKeys":[{"name":"media_tags_links_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"},{"name":"media_tags_links_inv_fk","columns":["tag_id"],"referencedColumns":["id"],"referencedTable":"tags","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"tag_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"tag_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"media_authors_links","indexes":[{"name":"media_authors_links_fk","columns":["medium_id"]},{"name":"media_authors_links_inv_fk","columns":["author_id"]},{"name":"media_authors_links_unique","columns":["medium_id","author_id"],"type":"unique"},{"name":"media_authors_links_order_fk","columns":["author_order"]},{"name":"media_authors_links_order_inv_fk","columns":["medium_order"]}],"foreignKeys":[{"name":"media_authors_links_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"},{"name":"media_authors_links_inv_fk","columns":["author_id"],"referencedColumns":["id"],"referencedTable":"authors","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"author_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"author_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"media_localizations_links","indexes":[{"name":"media_localizations_links_fk","columns":["medium_id"]},{"name":"media_localizations_links_inv_fk","columns":["inv_medium_id"]},{"name":"media_localizations_links_unique","columns":["medium_id","inv_medium_id"],"type":"unique"},{"name":"media_localizations_links_order_fk","columns":["medium_order"]}],"foreignKeys":[{"name":"media_localizations_links_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"},{"name":"media_localizations_links_inv_fk","columns":["inv_medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages_medium_links","indexes":[{"name":"pages_medium_links_fk","columns":["page_id"]},{"name":"pages_medium_links_inv_fk","columns":["medium_id"]},{"name":"pages_medium_links_unique","columns":["page_id","medium_id"],"type":"unique"},{"name":"pages_medium_links_order_inv_fk","columns":["page_order"]}],"foreignKeys":[{"name":"pages_medium_links_fk","columns":["page_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"},{"name":"pages_medium_links_inv_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"page_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"pages_localizations_links","indexes":[{"name":"pages_localizations_links_fk","columns":["page_id"]},{"name":"pages_localizations_links_inv_fk","columns":["inv_page_id"]},{"name":"pages_localizations_links_unique","columns":["page_id","inv_page_id"],"type":"unique"},{"name":"pages_localizations_links_order_fk","columns":["page_order"]}],"foreignKeys":[{"name":"pages_localizations_links_fk","columns":["page_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"},{"name":"pages_localizations_links_inv_fk","columns":["inv_page_id"],"referencedColumns":["id"],"referencedTable":"pages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_page_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"page_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reader_mediums_reader_links","indexes":[{"name":"reader_mediums_reader_links_fk","columns":["reader_medium_id"]},{"name":"reader_mediums_reader_links_inv_fk","columns":["reader_id"]},{"name":"reader_mediums_reader_links_unique","columns":["reader_medium_id","reader_id"],"type":"unique"},{"name":"reader_mediums_reader_links_order_inv_fk","columns":["reader_medium_order"]}],"foreignKeys":[{"name":"reader_mediums_reader_links_fk","columns":["reader_medium_id"],"referencedColumns":["id"],"referencedTable":"reader_mediums","onDelete":"CASCADE"},{"name":"reader_mediums_reader_links_inv_fk","columns":["reader_id"],"referencedColumns":["id"],"referencedTable":"readers","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"reader_medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"reader_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"reader_medium_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"reader_mediums_medium_links","indexes":[{"name":"reader_mediums_medium_links_fk","columns":["reader_medium_id"]},{"name":"reader_mediums_medium_links_inv_fk","columns":["medium_id"]},{"name":"reader_mediums_medium_links_unique","columns":["reader_medium_id","medium_id"],"type":"unique"},{"name":"reader_mediums_medium_links_order_inv_fk","columns":["reader_medium_order"]}],"foreignKeys":[{"name":"reader_mediums_medium_links_fk","columns":["reader_medium_id"],"referencedColumns":["id"],"referencedTable":"reader_mediums","onDelete":"CASCADE"},{"name":"reader_mediums_medium_links_inv_fk","columns":["medium_id"],"referencedColumns":["id"],"referencedTable":"media","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"reader_medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"medium_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"reader_medium_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"tags_localizations_links","indexes":[{"name":"tags_localizations_links_fk","columns":["tag_id"]},{"name":"tags_localizations_links_inv_fk","columns":["inv_tag_id"]},{"name":"tags_localizations_links_unique","columns":["tag_id","inv_tag_id"],"type":"unique"},{"name":"tags_localizations_links_order_fk","columns":["tag_order"]}],"foreignKeys":[{"name":"tags_localizations_links_fk","columns":["tag_id"],"referencedColumns":["id"],"referencedTable":"tags","onDelete":"CASCADE"},{"name":"tags_localizations_links_inv_fk","columns":["inv_tag_id"],"referencedColumns":["id"],"referencedTable":"tags","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"tag_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_tag_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"tag_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2024-01-14 12:32:18.782	1cdf6a9de0a0961bcc61b4db49129bbf
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_token_permissions_token_links (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_transfer_tokens (id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name, color, created_at, updated_at, created_by_id, updated_by_id, locale) FROM stdin;
1	environment	\N	2024-01-14 15:02:59.662	2024-01-14 15:02:59.662	1	1	en
2	science	\N	2024-01-14 15:03:08.352	2024-01-14 15:03:08.352	1	1	en
\.


--
-- Data for Name: tags_localizations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags_localizations_links (id, tag_id, inv_tag_id, tag_order) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::users-permissions.user.me	2024-01-18 09:41:09.41	2024-01-18 09:41:09.41	\N	\N
2	plugin::users-permissions.auth.changePassword	2024-01-18 09:41:09.41	2024-01-18 09:41:09.41	\N	\N
3	plugin::users-permissions.auth.callback	2024-01-18 09:41:09.422	2024-01-18 09:41:09.422	\N	\N
4	plugin::users-permissions.auth.connect	2024-01-18 09:41:09.422	2024-01-18 09:41:09.422	\N	\N
5	plugin::users-permissions.auth.forgotPassword	2024-01-18 09:41:09.422	2024-01-18 09:41:09.422	\N	\N
6	plugin::users-permissions.auth.resetPassword	2024-01-18 09:41:09.422	2024-01-18 09:41:09.422	\N	\N
7	plugin::users-permissions.auth.register	2024-01-18 09:41:09.422	2024-01-18 09:41:09.422	\N	\N
8	plugin::users-permissions.auth.emailConfirmation	2024-01-18 09:41:09.422	2024-01-18 09:41:09.422	\N	\N
9	plugin::users-permissions.auth.sendEmailConfirmation	2024-01-18 09:41:09.422	2024-01-18 09:41:09.422	\N	\N
44	api::author.author.find	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
45	api::author.author.findOne	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
46	api::language.language.find	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
47	api::language.language.findOne	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
48	api::medium.medium.find	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
49	api::medium.medium.findOne	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
50	api::medium-info.medium-info.find	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
51	api::medium-info.medium-info.findOne	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
52	api::page.page.find	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
53	api::page.page.findOne	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
54	api::reader.reader.find	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
55	api::reader.reader.findOne	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
56	api::reader-medium.reader-medium.find	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
57	api::reader-medium.reader-medium.findOne	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
58	api::tag.tag.find	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
59	api::tag.tag.findOne	2024-01-25 09:08:46.251	2024-01-25 09:08:46.251	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	1	1
2	2	1	1
3	4	2	1
4	3	2	1
5	7	2	1
6	6	2	1
7	9	2	2
8	5	2	1
9	8	2	2
44	44	2	3
45	45	2	3
46	46	2	3
47	47	2	3
48	48	2	3
49	54	2	3
50	49	2	3
51	56	2	3
52	55	2	3
53	57	2	4
54	50	2	4
55	51	2	4
56	52	2	4
57	53	2	4
58	58	2	4
59	59	2	4
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Authenticated	Default role given to authenticated user.	authenticated	2024-01-18 09:41:09.392	2024-01-18 09:41:09.392	\N	\N
2	Public	Default role given to unauthenticated user.	public	2024-01-18 09:41:09.396	2024-01-25 09:08:46.24	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	John Doe	john.doe@gmail.com	local	$2a$10$Sf1M5TH8JDmYIi.lyIN5D.kAwXp3rKyqAUF.3HwchUOgq4.NYR6eC	\N	\N	t	f	2024-01-15 17:37:39.858	2024-01-15 17:37:39.858	1	1
\.


--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users_role_links (id, user_id, role_id, user_order) FROM stdin;
1	1	1	1
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders_parent_links (id, folder_id, inv_folder_id, folder_order) FROM stdin;
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 201, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 261, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 1, true);


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_id_seq', 2, true);


--
-- Name: authors_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_localizations_links_id_seq', 2, true);


--
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 13, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 139, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 4, true);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 3, true);


--
-- Name: media_authors_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_authors_links_id_seq', 2, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_id_seq', 3, true);


--
-- Name: media_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_info_id_seq', 1, true);


--
-- Name: media_info_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_info_links_id_seq', 1, true);


--
-- Name: media_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_localizations_links_id_seq', 2, true);


--
-- Name: media_tags_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_tags_links_id_seq', 2, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_id_seq', 14, true);


--
-- Name: pages_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_localizations_links_id_seq', 12, true);


--
-- Name: pages_medium_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_medium_links_id_seq', 26, true);


--
-- Name: reader_mediums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reader_mediums_id_seq', 5, true);


--
-- Name: reader_mediums_medium_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reader_mediums_medium_links_id_seq', 5, true);


--
-- Name: reader_mediums_reader_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reader_mediums_reader_links_id_seq', 5, true);


--
-- Name: readers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.readers_id_seq', 1, true);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 2, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 39, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 29, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 2, true);


--
-- Name: tags_localizations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_localizations_links_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 59, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 59, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, true);


--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 1, true);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- Name: authors_localizations_links authors_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors_localizations_links
    ADD CONSTRAINT authors_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: authors_localizations_links authors_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors_localizations_links
    ADD CONSTRAINT authors_localizations_links_unique UNIQUE (author_id, inv_author_id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: media_authors_links media_authors_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_authors_links
    ADD CONSTRAINT media_authors_links_pkey PRIMARY KEY (id);


--
-- Name: media_authors_links media_authors_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_authors_links
    ADD CONSTRAINT media_authors_links_unique UNIQUE (medium_id, author_id);


--
-- Name: media_info_links media_info_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_info_links
    ADD CONSTRAINT media_info_links_pkey PRIMARY KEY (id);


--
-- Name: media_info_links media_info_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_info_links
    ADD CONSTRAINT media_info_links_unique UNIQUE (medium_id, medium_info_id);


--
-- Name: media_info media_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_info
    ADD CONSTRAINT media_info_pkey PRIMARY KEY (id);


--
-- Name: media_localizations_links media_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_localizations_links
    ADD CONSTRAINT media_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: media_localizations_links media_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_localizations_links
    ADD CONSTRAINT media_localizations_links_unique UNIQUE (medium_id, inv_medium_id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: media_tags_links media_tags_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_tags_links
    ADD CONSTRAINT media_tags_links_pkey PRIMARY KEY (id);


--
-- Name: media_tags_links media_tags_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_tags_links
    ADD CONSTRAINT media_tags_links_unique UNIQUE (medium_id, tag_id);


--
-- Name: pages_localizations_links pages_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_localizations_links
    ADD CONSTRAINT pages_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: pages_localizations_links pages_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_localizations_links
    ADD CONSTRAINT pages_localizations_links_unique UNIQUE (page_id, inv_page_id);


--
-- Name: pages_medium_links pages_medium_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_medium_links
    ADD CONSTRAINT pages_medium_links_pkey PRIMARY KEY (id);


--
-- Name: pages_medium_links pages_medium_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_medium_links
    ADD CONSTRAINT pages_medium_links_unique UNIQUE (page_id, medium_id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: reader_mediums_medium_links reader_mediums_medium_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums_medium_links
    ADD CONSTRAINT reader_mediums_medium_links_pkey PRIMARY KEY (id);


--
-- Name: reader_mediums_medium_links reader_mediums_medium_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums_medium_links
    ADD CONSTRAINT reader_mediums_medium_links_unique UNIQUE (reader_medium_id, medium_id);


--
-- Name: reader_mediums reader_mediums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums
    ADD CONSTRAINT reader_mediums_pkey PRIMARY KEY (id);


--
-- Name: reader_mediums_reader_links reader_mediums_reader_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums_reader_links
    ADD CONSTRAINT reader_mediums_reader_links_pkey PRIMARY KEY (id);


--
-- Name: reader_mediums_reader_links reader_mediums_reader_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums_reader_links
    ADD CONSTRAINT reader_mediums_reader_links_unique UNIQUE (reader_medium_id, reader_id);


--
-- Name: readers readers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.readers
    ADD CONSTRAINT readers_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_unique UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: tags_localizations_links tags_localizations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_localizations_links
    ADD CONSTRAINT tags_localizations_links_pkey PRIMARY KEY (id);


--
-- Name: tags_localizations_links tags_localizations_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_localizations_links
    ADD CONSTRAINT tags_localizations_links_unique UNIQUE (tag_id, inv_tag_id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: authors_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authors_created_by_id_fk ON public.authors USING btree (created_by_id);


--
-- Name: authors_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authors_localizations_links_fk ON public.authors_localizations_links USING btree (author_id);


--
-- Name: authors_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authors_localizations_links_inv_fk ON public.authors_localizations_links USING btree (inv_author_id);


--
-- Name: authors_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authors_localizations_links_order_fk ON public.authors_localizations_links USING btree (author_order);


--
-- Name: authors_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authors_updated_by_id_fk ON public.authors USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_related_morphs_id_column_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_id_column_index ON public.files_related_morphs USING btree (related_id);


--
-- Name: files_related_morphs_order_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_order_index ON public.files_related_morphs USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: languages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX languages_created_by_id_fk ON public.languages USING btree (created_by_id);


--
-- Name: languages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX languages_updated_by_id_fk ON public.languages USING btree (updated_by_id);


--
-- Name: media_authors_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_authors_links_fk ON public.media_authors_links USING btree (medium_id);


--
-- Name: media_authors_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_authors_links_inv_fk ON public.media_authors_links USING btree (author_id);


--
-- Name: media_authors_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_authors_links_order_fk ON public.media_authors_links USING btree (author_order);


--
-- Name: media_authors_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_authors_links_order_inv_fk ON public.media_authors_links USING btree (medium_order);


--
-- Name: media_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_created_by_id_fk ON public.media USING btree (created_by_id);


--
-- Name: media_info_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_info_created_by_id_fk ON public.media_info USING btree (created_by_id);


--
-- Name: media_info_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_info_links_fk ON public.media_info_links USING btree (medium_id);


--
-- Name: media_info_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_info_links_inv_fk ON public.media_info_links USING btree (medium_info_id);


--
-- Name: media_info_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_info_updated_by_id_fk ON public.media_info USING btree (updated_by_id);


--
-- Name: media_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_localizations_links_fk ON public.media_localizations_links USING btree (medium_id);


--
-- Name: media_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_localizations_links_inv_fk ON public.media_localizations_links USING btree (inv_medium_id);


--
-- Name: media_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_localizations_links_order_fk ON public.media_localizations_links USING btree (medium_order);


--
-- Name: media_tags_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_tags_links_fk ON public.media_tags_links USING btree (medium_id);


--
-- Name: media_tags_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_tags_links_inv_fk ON public.media_tags_links USING btree (tag_id);


--
-- Name: media_tags_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_tags_links_order_fk ON public.media_tags_links USING btree (tag_order);


--
-- Name: media_tags_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_tags_links_order_inv_fk ON public.media_tags_links USING btree (medium_order);


--
-- Name: media_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_updated_by_id_fk ON public.media USING btree (updated_by_id);


--
-- Name: pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_created_by_id_fk ON public.pages USING btree (created_by_id);


--
-- Name: pages_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_localizations_links_fk ON public.pages_localizations_links USING btree (page_id);


--
-- Name: pages_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_localizations_links_inv_fk ON public.pages_localizations_links USING btree (inv_page_id);


--
-- Name: pages_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_localizations_links_order_fk ON public.pages_localizations_links USING btree (page_order);


--
-- Name: pages_medium_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_medium_links_fk ON public.pages_medium_links USING btree (page_id);


--
-- Name: pages_medium_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_medium_links_inv_fk ON public.pages_medium_links USING btree (medium_id);


--
-- Name: pages_medium_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_medium_links_order_inv_fk ON public.pages_medium_links USING btree (page_order);


--
-- Name: pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_updated_by_id_fk ON public.pages USING btree (updated_by_id);


--
-- Name: reader_mediums_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reader_mediums_created_by_id_fk ON public.reader_mediums USING btree (created_by_id);


--
-- Name: reader_mediums_medium_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reader_mediums_medium_links_fk ON public.reader_mediums_medium_links USING btree (reader_medium_id);


--
-- Name: reader_mediums_medium_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reader_mediums_medium_links_inv_fk ON public.reader_mediums_medium_links USING btree (medium_id);


--
-- Name: reader_mediums_medium_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reader_mediums_medium_links_order_inv_fk ON public.reader_mediums_medium_links USING btree (reader_medium_order);


--
-- Name: reader_mediums_reader_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reader_mediums_reader_links_fk ON public.reader_mediums_reader_links USING btree (reader_medium_id);


--
-- Name: reader_mediums_reader_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reader_mediums_reader_links_inv_fk ON public.reader_mediums_reader_links USING btree (reader_id);


--
-- Name: reader_mediums_reader_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reader_mediums_reader_links_order_inv_fk ON public.reader_mediums_reader_links USING btree (reader_medium_order);


--
-- Name: reader_mediums_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reader_mediums_updated_by_id_fk ON public.reader_mediums USING btree (updated_by_id);


--
-- Name: readers_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX readers_created_by_id_fk ON public.readers USING btree (created_by_id);


--
-- Name: readers_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX readers_updated_by_id_fk ON public.readers USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_token_links_order_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_order);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: tags_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_created_by_id_fk ON public.tags USING btree (created_by_id);


--
-- Name: tags_localizations_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_localizations_links_fk ON public.tags_localizations_links USING btree (tag_id);


--
-- Name: tags_localizations_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_localizations_links_inv_fk ON public.tags_localizations_links USING btree (inv_tag_id);


--
-- Name: tags_localizations_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_localizations_links_order_fk ON public.tags_localizations_links USING btree (tag_order);


--
-- Name: tags_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_updated_by_id_fk ON public.tags USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: authors authors_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: authors_localizations_links authors_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors_localizations_links
    ADD CONSTRAINT authors_localizations_links_fk FOREIGN KEY (author_id) REFERENCES public.authors(id) ON DELETE CASCADE;


--
-- Name: authors_localizations_links authors_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors_localizations_links
    ADD CONSTRAINT authors_localizations_links_inv_fk FOREIGN KEY (inv_author_id) REFERENCES public.authors(id) ON DELETE CASCADE;


--
-- Name: authors authors_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: languages languages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: languages languages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: media_authors_links media_authors_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_authors_links
    ADD CONSTRAINT media_authors_links_fk FOREIGN KEY (medium_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: media_authors_links media_authors_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_authors_links
    ADD CONSTRAINT media_authors_links_inv_fk FOREIGN KEY (author_id) REFERENCES public.authors(id) ON DELETE CASCADE;


--
-- Name: media media_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: media_info media_info_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_info
    ADD CONSTRAINT media_info_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: media_info_links media_info_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_info_links
    ADD CONSTRAINT media_info_links_fk FOREIGN KEY (medium_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: media_info_links media_info_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_info_links
    ADD CONSTRAINT media_info_links_inv_fk FOREIGN KEY (medium_info_id) REFERENCES public.media_info(id) ON DELETE CASCADE;


--
-- Name: media_info media_info_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_info
    ADD CONSTRAINT media_info_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: media_localizations_links media_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_localizations_links
    ADD CONSTRAINT media_localizations_links_fk FOREIGN KEY (medium_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: media_localizations_links media_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_localizations_links
    ADD CONSTRAINT media_localizations_links_inv_fk FOREIGN KEY (inv_medium_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: media_tags_links media_tags_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_tags_links
    ADD CONSTRAINT media_tags_links_fk FOREIGN KEY (medium_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: media_tags_links media_tags_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_tags_links
    ADD CONSTRAINT media_tags_links_inv_fk FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- Name: media media_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: pages pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: pages_localizations_links pages_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_localizations_links
    ADD CONSTRAINT pages_localizations_links_fk FOREIGN KEY (page_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_localizations_links pages_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_localizations_links
    ADD CONSTRAINT pages_localizations_links_inv_fk FOREIGN KEY (inv_page_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_medium_links pages_medium_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_medium_links
    ADD CONSTRAINT pages_medium_links_fk FOREIGN KEY (page_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: pages_medium_links pages_medium_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages_medium_links
    ADD CONSTRAINT pages_medium_links_inv_fk FOREIGN KEY (medium_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: pages pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: reader_mediums reader_mediums_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums
    ADD CONSTRAINT reader_mediums_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: reader_mediums_medium_links reader_mediums_medium_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums_medium_links
    ADD CONSTRAINT reader_mediums_medium_links_fk FOREIGN KEY (reader_medium_id) REFERENCES public.reader_mediums(id) ON DELETE CASCADE;


--
-- Name: reader_mediums_medium_links reader_mediums_medium_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums_medium_links
    ADD CONSTRAINT reader_mediums_medium_links_inv_fk FOREIGN KEY (medium_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: reader_mediums_reader_links reader_mediums_reader_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums_reader_links
    ADD CONSTRAINT reader_mediums_reader_links_fk FOREIGN KEY (reader_medium_id) REFERENCES public.reader_mediums(id) ON DELETE CASCADE;


--
-- Name: reader_mediums_reader_links reader_mediums_reader_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums_reader_links
    ADD CONSTRAINT reader_mediums_reader_links_inv_fk FOREIGN KEY (reader_id) REFERENCES public.readers(id) ON DELETE CASCADE;


--
-- Name: reader_mediums reader_mediums_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reader_mediums
    ADD CONSTRAINT reader_mediums_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: readers readers_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.readers
    ADD CONSTRAINT readers_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: readers readers_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.readers
    ADD CONSTRAINT readers_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: tags tags_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: tags_localizations_links tags_localizations_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_localizations_links
    ADD CONSTRAINT tags_localizations_links_fk FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- Name: tags_localizations_links tags_localizations_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_localizations_links
    ADD CONSTRAINT tags_localizations_links_inv_fk FOREIGN KEY (inv_tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- Name: tags tags_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--


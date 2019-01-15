--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY public.oc_server_sectionrequirement DROP CONSTRAINT IF EXISTS oc_server_sectionreq_section_id_9ee0a523_fk_oc_server;
ALTER TABLE IF EXISTS ONLY public.oc_server_section DROP CONSTRAINT IF EXISTS oc_server_section_lesson_id_8dce139a_fk_oc_server_lesson_id;
ALTER TABLE IF EXISTS ONLY public.oc_server_lesson DROP CONSTRAINT IF EXISTS oc_server_lesson_course_id_e2a3fb9d_fk_oc_server_course_id;
ALTER TABLE IF EXISTS ONLY public.oc_server_feedbacksubmission DROP CONSTRAINT IF EXISTS oc_server_feedbacksu_user_id_4bbe2985_fk_oc_server;
ALTER TABLE IF EXISTS ONLY public.oc_server_draggabletextfield DROP CONSTRAINT IF EXISTS oc_server_draggablet_draggable_id_c8b893ad_fk_oc_server;
ALTER TABLE IF EXISTS ONLY public.oc_server_draggable DROP CONSTRAINT IF EXISTS oc_server_draggable_course_id_a83f6035_fk_oc_server_course_id;
ALTER TABLE IF EXISTS ONLY public.oc_server_draggable_sections DROP CONSTRAINT IF EXISTS oc_server_draggable__section_id_b9720c22_fk_oc_server;
ALTER TABLE IF EXISTS ONLY public.oc_server_draggable_sections DROP CONSTRAINT IF EXISTS oc_server_draggable__draggable_id_a075ac8d_fk_oc_server;
ALTER TABLE IF EXISTS ONLY public.oc_server_baseprofile DROP CONSTRAINT IF EXISTS oc_server_baseprofile_user_id_797255e2_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT IF EXISTS oc_server_baseprofil_section_id_338f7edd_fk_oc_server;
ALTER TABLE IF EXISTS ONLY public.oc_server_baseprofile DROP CONSTRAINT IF EXISTS oc_server_baseprofil_current_section_id_875bad86_fk_oc_server;
ALTER TABLE IF EXISTS ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT IF EXISTS oc_server_baseprofil_baseprofile_id_a938e280_fk_oc_server;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_user_id_c564eba6_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.authtoken_token DROP CONSTRAINT IF EXISTS authtoken_token_user_id_35299eff_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_group_id_97559544_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX IF EXISTS public.oc_server_sectionrequirement_section_id_9ee0a523;
DROP INDEX IF EXISTS public.oc_server_section_lesson_id_8dce139a;
DROP INDEX IF EXISTS public.oc_server_lesson_course_id_e2a3fb9d;
DROP INDEX IF EXISTS public.oc_server_feedbacksubmission_user_id_4bbe2985;
DROP INDEX IF EXISTS public.oc_server_draggabletextfield_draggable_id_c8b893ad;
DROP INDEX IF EXISTS public.oc_server_draggable_sections_section_id_b9720c22;
DROP INDEX IF EXISTS public.oc_server_draggable_sections_draggable_id_a075ac8d;
DROP INDEX IF EXISTS public.oc_server_draggable_course_id_a83f6035;
DROP INDEX IF EXISTS public.oc_server_baseprofile_current_section_id_875bad86;
DROP INDEX IF EXISTS public.oc_server_baseprofile_completed_sections_section_id_338f7edd;
DROP INDEX IF EXISTS public.oc_server_baseprofile_comp_baseprofile_id_a938e280;
DROP INDEX IF EXISTS public.django_session_session_key_c0390e0f_like;
DROP INDEX IF EXISTS public.django_session_expire_date_a5c62663;
DROP INDEX IF EXISTS public.django_celery_results_taskresult_task_id_de0d95bf_like;
DROP INDEX IF EXISTS public.django_celery_results_taskresult_hidden_cd77412f;
DROP INDEX IF EXISTS public.django_admin_log_user_id_c564eba6;
DROP INDEX IF EXISTS public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX IF EXISTS public.authtoken_token_key_10f0b77e_like;
DROP INDEX IF EXISTS public.auth_user_username_6821ab7c_like;
DROP INDEX IF EXISTS public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX IF EXISTS public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX IF EXISTS public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX IF EXISTS public.auth_user_groups_group_id_97559544;
DROP INDEX IF EXISTS public.auth_permission_content_type_id_2f476e4b;
DROP INDEX IF EXISTS public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX IF EXISTS public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX IF EXISTS public.auth_group_name_a6ea08ec_like;
ALTER TABLE IF EXISTS ONLY public.rr_logged_events DROP CONSTRAINT IF EXISTS rr_logged_events_id_pkey;
ALTER TABLE IF EXISTS ONLY public.oc_server_sectionrequirement DROP CONSTRAINT IF EXISTS oc_server_sectionrequirement_pkey;
ALTER TABLE IF EXISTS ONLY public.oc_server_section DROP CONSTRAINT IF EXISTS oc_server_section_pkey;
ALTER TABLE IF EXISTS ONLY public.oc_server_lesson DROP CONSTRAINT IF EXISTS oc_server_lesson_pkey;
ALTER TABLE IF EXISTS ONLY public.oc_server_feedbacksubmission DROP CONSTRAINT IF EXISTS oc_server_feedbacksubmission_pkey;
ALTER TABLE IF EXISTS ONLY public.oc_server_draggabletextfield DROP CONSTRAINT IF EXISTS oc_server_draggabletextfield_pkey;
ALTER TABLE IF EXISTS ONLY public.oc_server_draggable_sections DROP CONSTRAINT IF EXISTS oc_server_draggable_sections_pkey;
ALTER TABLE IF EXISTS ONLY public.oc_server_draggable_sections DROP CONSTRAINT IF EXISTS oc_server_draggable_sect_draggable_id_section_id_c795545f_uniq;
ALTER TABLE IF EXISTS ONLY public.oc_server_draggable DROP CONSTRAINT IF EXISTS oc_server_draggable_pkey;
ALTER TABLE IF EXISTS ONLY public.oc_server_course DROP CONSTRAINT IF EXISTS oc_server_course_pkey;
ALTER TABLE IF EXISTS ONLY public.oc_server_baseprofile DROP CONSTRAINT IF EXISTS oc_server_baseprofile_user_id_key;
ALTER TABLE IF EXISTS ONLY public.oc_server_baseprofile DROP CONSTRAINT IF EXISTS oc_server_baseprofile_pkey;
ALTER TABLE IF EXISTS ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT IF EXISTS oc_server_baseprofile_completed_sections_pkey;
ALTER TABLE IF EXISTS ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT IF EXISTS oc_server_baseprofile_co_baseprofile_id_section_i_8328f6db_uniq;
ALTER TABLE IF EXISTS ONLY public.django_session DROP CONSTRAINT IF EXISTS django_session_pkey;
ALTER TABLE IF EXISTS ONLY public.django_migrations DROP CONSTRAINT IF EXISTS django_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE IF EXISTS ONLY public.django_celery_results_taskresult DROP CONSTRAINT IF EXISTS django_celery_results_taskresult_task_id_key;
ALTER TABLE IF EXISTS ONLY public.django_celery_results_taskresult DROP CONSTRAINT IF EXISTS django_celery_results_taskresult_pkey;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_pkey;
ALTER TABLE IF EXISTS ONLY public.authtoken_token DROP CONSTRAINT IF EXISTS authtoken_token_user_id_key;
ALTER TABLE IF EXISTS ONLY public.authtoken_token DROP CONSTRAINT IF EXISTS authtoken_token_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_user DROP CONSTRAINT IF EXISTS auth_user_username_key;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_user_user_permissions DROP CONSTRAINT IF EXISTS auth_user_user_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_user DROP CONSTRAINT IF EXISTS auth_user_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_user_id_group_id_94350c0c_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_user_groups DROP CONSTRAINT IF EXISTS auth_user_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_name_key;
ALTER TABLE IF EXISTS public.rr_logged_events ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oc_server_sectionrequirement ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oc_server_section ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oc_server_lesson ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oc_server_feedbacksubmission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oc_server_draggabletextfield ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oc_server_draggable_sections ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oc_server_draggable ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oc_server_course ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oc_server_baseprofile_completed_sections ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oc_server_baseprofile ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.django_celery_results_taskresult ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth_group ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.rr_logged_events_id_seq;
DROP TABLE IF EXISTS public.rr_logged_events;
DROP SEQUENCE IF EXISTS public.oc_server_sectionrequirement_id_seq;
DROP TABLE IF EXISTS public.oc_server_sectionrequirement;
DROP SEQUENCE IF EXISTS public.oc_server_section_id_seq;
DROP TABLE IF EXISTS public.oc_server_section;
DROP SEQUENCE IF EXISTS public.oc_server_lesson_id_seq;
DROP TABLE IF EXISTS public.oc_server_lesson;
DROP SEQUENCE IF EXISTS public.oc_server_feedbacksubmission_id_seq;
DROP TABLE IF EXISTS public.oc_server_feedbacksubmission;
DROP SEQUENCE IF EXISTS public.oc_server_draggabletextfield_id_seq;
DROP TABLE IF EXISTS public.oc_server_draggabletextfield;
DROP SEQUENCE IF EXISTS public.oc_server_draggable_sections_id_seq;
DROP TABLE IF EXISTS public.oc_server_draggable_sections;
DROP SEQUENCE IF EXISTS public.oc_server_draggable_id_seq;
DROP TABLE IF EXISTS public.oc_server_draggable;
DROP SEQUENCE IF EXISTS public.oc_server_course_id_seq;
DROP TABLE IF EXISTS public.oc_server_course;
DROP SEQUENCE IF EXISTS public.oc_server_baseprofile_id_seq;
DROP SEQUENCE IF EXISTS public.oc_server_baseprofile_completed_sections_id_seq;
DROP TABLE IF EXISTS public.oc_server_baseprofile_completed_sections;
DROP TABLE IF EXISTS public.oc_server_baseprofile;
DROP TABLE IF EXISTS public.django_session;
DROP SEQUENCE IF EXISTS public.django_migrations_id_seq;
DROP TABLE IF EXISTS public.django_migrations;
DROP SEQUENCE IF EXISTS public.django_content_type_id_seq;
DROP TABLE IF EXISTS public.django_content_type;
DROP SEQUENCE IF EXISTS public.django_celery_results_taskresult_id_seq;
DROP TABLE IF EXISTS public.django_celery_results_taskresult;
DROP SEQUENCE IF EXISTS public.django_admin_log_id_seq;
DROP TABLE IF EXISTS public.django_admin_log;
DROP TABLE IF EXISTS public.authtoken_token;
DROP SEQUENCE IF EXISTS public.auth_user_user_permissions_id_seq;
DROP TABLE IF EXISTS public.auth_user_user_permissions;
DROP SEQUENCE IF EXISTS public.auth_user_id_seq;
DROP SEQUENCE IF EXISTS public.auth_user_groups_id_seq;
DROP TABLE IF EXISTS public.auth_user_groups;
DROP TABLE IF EXISTS public.auth_user;
DROP SEQUENCE IF EXISTS public.auth_permission_id_seq;
DROP TABLE IF EXISTS public.auth_permission;
DROP SEQUENCE IF EXISTS public.auth_group_permissions_id_seq;
DROP TABLE IF EXISTS public.auth_group_permissions;
DROP SEQUENCE IF EXISTS public.auth_group_id_seq;
DROP TABLE IF EXISTS public.auth_group;
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: Donny
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO "Donny";

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: Donny
--

COMMENT ON SCHEMA public IS 'standard public schema';


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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_celery_results_taskresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_celery_results_taskresult (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    hidden boolean NOT NULL,
    meta text
);


ALTER TABLE django_celery_results_taskresult OWNER TO postgres;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_celery_results_taskresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_celery_results_taskresult_id_seq OWNER TO postgres;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_celery_results_taskresult_id_seq OWNED BY django_celery_results_taskresult.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: oc_server_baseprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oc_server_baseprofile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    current_section_id integer
);


ALTER TABLE oc_server_baseprofile OWNER TO postgres;

--
-- Name: oc_server_baseprofile_completed_sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oc_server_baseprofile_completed_sections (
    id integer NOT NULL,
    baseprofile_id integer NOT NULL,
    section_id integer NOT NULL
);


ALTER TABLE oc_server_baseprofile_completed_sections OWNER TO postgres;

--
-- Name: oc_server_baseprofile_completed_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oc_server_baseprofile_completed_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_server_baseprofile_completed_sections_id_seq OWNER TO postgres;

--
-- Name: oc_server_baseprofile_completed_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oc_server_baseprofile_completed_sections_id_seq OWNED BY oc_server_baseprofile_completed_sections.id;


--
-- Name: oc_server_baseprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oc_server_baseprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_server_baseprofile_id_seq OWNER TO postgres;

--
-- Name: oc_server_baseprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oc_server_baseprofile_id_seq OWNED BY oc_server_baseprofile.id;


--
-- Name: oc_server_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oc_server_course (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    author character varying(128) NOT NULL
);


ALTER TABLE oc_server_course OWNER TO postgres;

--
-- Name: oc_server_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oc_server_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_server_course_id_seq OWNER TO postgres;

--
-- Name: oc_server_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oc_server_course_id_seq OWNED BY oc_server_course.id;


--
-- Name: oc_server_draggable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oc_server_draggable (
    id integer NOT NULL,
    "codeName" character varying(16) NOT NULL,
    "descName" character varying(16) NOT NULL,
    "descText" text NOT NULL,
    code text NOT NULL,
    course_id integer
);


ALTER TABLE oc_server_draggable OWNER TO postgres;

--
-- Name: oc_server_draggable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oc_server_draggable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_server_draggable_id_seq OWNER TO postgres;

--
-- Name: oc_server_draggable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oc_server_draggable_id_seq OWNED BY oc_server_draggable.id;


--
-- Name: oc_server_draggable_sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oc_server_draggable_sections (
    id integer NOT NULL,
    draggable_id integer NOT NULL,
    section_id integer NOT NULL
);


ALTER TABLE oc_server_draggable_sections OWNER TO postgres;

--
-- Name: oc_server_draggable_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oc_server_draggable_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_server_draggable_sections_id_seq OWNER TO postgres;

--
-- Name: oc_server_draggable_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oc_server_draggable_sections_id_seq OWNED BY oc_server_draggable_sections.id;


--
-- Name: oc_server_draggabletextfield; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oc_server_draggabletextfield (
    id integer NOT NULL,
    "startChar" integer NOT NULL,
    "endChar" integer NOT NULL,
    "placeholderText" character varying(32) NOT NULL,
    draggable_id integer NOT NULL,
    "lineNumber" integer NOT NULL,
    CONSTRAINT "oc_server_draggabletextfield_endChar_check" CHECK (("endChar" >= 0)),
    CONSTRAINT "oc_server_draggabletextfield_lineNumber_check" CHECK (("lineNumber" >= 0)),
    CONSTRAINT "oc_server_draggabletextfield_startChar_check" CHECK (("startChar" >= 0))
);


ALTER TABLE oc_server_draggabletextfield OWNER TO postgres;

--
-- Name: oc_server_draggabletextfield_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oc_server_draggabletextfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_server_draggabletextfield_id_seq OWNER TO postgres;

--
-- Name: oc_server_draggabletextfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oc_server_draggabletextfield_id_seq OWNED BY oc_server_draggabletextfield.id;


--
-- Name: oc_server_feedbacksubmission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oc_server_feedbacksubmission (
    id integer NOT NULL,
    message text NOT NULL,
    user_id integer NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE oc_server_feedbacksubmission OWNER TO postgres;

--
-- Name: oc_server_feedbacksubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oc_server_feedbacksubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_server_feedbacksubmission_id_seq OWNER TO postgres;

--
-- Name: oc_server_feedbacksubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oc_server_feedbacksubmission_id_seq OWNED BY oc_server_feedbacksubmission.id;


--
-- Name: oc_server_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oc_server_lesson (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    number integer NOT NULL,
    course_id integer
);


ALTER TABLE oc_server_lesson OWNER TO postgres;

--
-- Name: oc_server_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oc_server_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_server_lesson_id_seq OWNER TO postgres;

--
-- Name: oc_server_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oc_server_lesson_id_seq OWNED BY oc_server_lesson.id;


--
-- Name: oc_server_section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oc_server_section (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    number integer NOT NULL,
    text text NOT NULL,
    lesson_id integer
);


ALTER TABLE oc_server_section OWNER TO postgres;

--
-- Name: oc_server_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oc_server_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_server_section_id_seq OWNER TO postgres;

--
-- Name: oc_server_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oc_server_section_id_seq OWNED BY oc_server_section.id;


--
-- Name: oc_server_sectionrequirement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oc_server_sectionrequirement (
    id integer NOT NULL,
    description character varying(128) NOT NULL,
    "unitTests" text NOT NULL,
    section_id integer NOT NULL
);


ALTER TABLE oc_server_sectionrequirement OWNER TO postgres;

--
-- Name: oc_server_sectionrequirement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oc_server_sectionrequirement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_server_sectionrequirement_id_seq OWNER TO postgres;

--
-- Name: oc_server_sectionrequirement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oc_server_sectionrequirement_id_seq OWNED BY oc_server_sectionrequirement.id;


--
-- Name: rr_logged_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rr_logged_events (
    activity character varying,
    change_table character varying,
    diff_type character varying,
    change_key character varying,
    left_change_type character varying,
    right_change_type character varying,
    description character varying(255),
    long_description character varying(1000),
    event_time timestamp without time zone,
    diff_dump character varying(2000),
    id bigint NOT NULL
);


ALTER TABLE rr_logged_events OWNER TO postgres;

--
-- Name: rr_logged_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rr_logged_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rr_logged_events_id_seq OWNER TO postgres;

--
-- Name: rr_logged_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rr_logged_events_id_seq OWNED BY rr_logged_events.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_results_taskresult id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_celery_results_taskresult ALTER COLUMN id SET DEFAULT nextval('django_celery_results_taskresult_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: oc_server_baseprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile ALTER COLUMN id SET DEFAULT nextval('oc_server_baseprofile_id_seq'::regclass);


--
-- Name: oc_server_baseprofile_completed_sections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_sections ALTER COLUMN id SET DEFAULT nextval('oc_server_baseprofile_completed_sections_id_seq'::regclass);


--
-- Name: oc_server_course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_course ALTER COLUMN id SET DEFAULT nextval('oc_server_course_id_seq'::regclass);


--
-- Name: oc_server_draggable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_draggable ALTER COLUMN id SET DEFAULT nextval('oc_server_draggable_id_seq'::regclass);


--
-- Name: oc_server_draggable_sections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_draggable_sections ALTER COLUMN id SET DEFAULT nextval('oc_server_draggable_sections_id_seq'::regclass);


--
-- Name: oc_server_draggabletextfield id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_draggabletextfield ALTER COLUMN id SET DEFAULT nextval('oc_server_draggabletextfield_id_seq'::regclass);


--
-- Name: oc_server_feedbacksubmission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_feedbacksubmission ALTER COLUMN id SET DEFAULT nextval('oc_server_feedbacksubmission_id_seq'::regclass);


--
-- Name: oc_server_lesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_lesson ALTER COLUMN id SET DEFAULT nextval('oc_server_lesson_id_seq'::regclass);


--
-- Name: oc_server_section id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_section ALTER COLUMN id SET DEFAULT nextval('oc_server_section_id_seq'::regclass);


--
-- Name: oc_server_sectionrequirement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_sectionrequirement ALTER COLUMN id SET DEFAULT nextval('oc_server_sectionrequirement_id_seq'::regclass);


--
-- Name: rr_logged_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rr_logged_events ALTER COLUMN id SET DEFAULT nextval('rr_logged_events_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add task result	7	add_taskresult
20	Can change task result	7	change_taskresult
21	Can delete task result	7	delete_taskresult
22	Can add Token	8	add_token
23	Can change Token	8	change_token
24	Can delete Token	8	delete_token
25	Can add course	9	add_course
26	Can change course	9	change_course
27	Can delete course	9	delete_course
28	Can add lesson	10	add_lesson
29	Can change lesson	10	change_lesson
30	Can delete lesson	10	delete_lesson
31	Can add section	11	add_section
32	Can change section	11	change_section
33	Can delete section	11	delete_section
34	Can add draggable	12	add_draggable
35	Can change draggable	12	change_draggable
36	Can delete draggable	12	delete_draggable
37	Can add section requirement	13	add_sectionrequirement
38	Can change section requirement	13	change_sectionrequirement
39	Can delete section requirement	13	delete_sectionrequirement
40	Can add base profile	14	add_baseprofile
41	Can change base profile	14	change_baseprofile
42	Can delete base profile	14	delete_baseprofile
43	Can add draggable text field	15	add_draggabletextfield
44	Can change draggable text field	15	change_draggabletextfield
45	Can delete draggable text field	15	delete_draggabletextfield
46	Can add feedback submission	16	add_feedbacksubmission
47	Can change feedback submission	16	change_feedbacksubmission
48	Can delete feedback submission	16	delete_feedbacksubmission
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 48, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$36000$UMS5yPC3B0iS$Wy4DWajvB0zC8diI10oUp783GsfG6oQNcmuT1rEyWok=	\N	f	testuser				f	t	2017-11-20 08:23:09.531146-06
4	pbkdf2_sha256$36000$VQk51SP0jbns$7fpgX3+bUEBkuLtzPOLhNMEd98ut8G2yFffTgnF8wQU=	2017-12-28 15:20:49.353537-06	f	imauser				f	t	2017-12-28 15:20:41.951045-06
1	pbkdf2_sha256$36000$f6NM5KhbDliC$JE6AkWXFYUvl9VTTsfmOiT7vhf2NmVtTi+U+5UAnJps=	2017-12-28 16:34:19.604955-06	t	treamous				t	t	2017-07-27 11:48:21.01212-05
5	pbkdf2_sha256$36000$bhbW6P0LruRJ$stfwtZ4ltlOKuTDxShoBiW0jGSw5hgpkHkxk17Sml68=	2018-01-21 20:11:24.415961-06	f	thisreallysucks				f	t	2018-01-21 20:11:20.415883-06
7	pbkdf2_sha256$36000$COliPVQ9JksZ$HA0++pSh7NZOoTAETJLMpDNAGBsULu2tsZ8h5Ma4fwA=	2018-02-10 20:58:07.229238-06	f	testing			blah@blah.com	f	t	2018-02-10 14:47:31.793549-06
6	pbkdf2_sha256$36000$WRkM38m5Dycn$TtSiNTNC42fcawJApjqysM2BbdEKy+jbRLhrw9pQsJE=	2018-02-20 11:15:32.615999-06	f	donnyl				f	t	2018-01-22 22:02:11.620042-06
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 7, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authtoken_token (key, created, user_id) FROM stdin;
67a3aa26240ecc165096e7ae5bc7f0ba3fc55ad3	2017-11-13 13:22:14.251257-06	1
155cc3282e8fff962164deaefc7a7edb08fac55f	2017-11-20 08:23:38.758817-06	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-11-26 16:57:55.588314-06	1	Section object	1	[{"added": {}}]	11	1
2	2017-11-26 16:58:11.540031-06	1	Lesson object	1	[{"added": {}}]	10	1
3	2017-11-26 16:58:19.190191-06	1	Course object	1	[{"added": {}}]	9	1
4	2017-11-26 17:25:07.036295-06	1	Start	2	[{"changed": {"fields": ["course"]}}]	10	1
5	2017-11-26 17:26:28.072652-06	1	Section object	2	[{"changed": {"fields": ["text", "sections"]}}]	11	1
6	2017-12-07 18:01:19.412327-06	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["lesson"]}}]	11	1
7	2017-12-11 08:43:48.857014-06	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
8	2017-12-26 20:25:47.295991-06	1	Section Requirement	1	[{"added": {}}]	13	1
9	2017-12-28 16:47:10.65688-06	1	Section Requirement	2	[{"changed": {"fields": ["description", "unitTests"]}}]	13	1
10	2018-01-01 19:04:28.848232-06	1	Section Requirement	2	[{"changed": {"fields": ["unitTests"]}}]	13	1
11	2018-01-01 19:04:58.980889-06	1	Section Requirement	2	[{"changed": {"fields": ["unitTests"]}}]	13	1
12	2018-01-01 19:08:11.510988-06	1	Section Requirement	2	[{"changed": {"fields": ["unitTests"]}}]	13	1
13	2018-01-01 19:09:19.283471-06	1	Section Requirement	2	[{"changed": {"fields": ["unitTests"]}}]	13	1
14	2018-01-01 19:10:02.410079-06	1	Section Requirement	2	[]	13	1
15	2018-01-01 19:10:28.834912-06	2	Section Requirement	1	[{"added": {}}]	13	1
16	2018-01-01 19:14:30.136058-06	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
17	2018-01-01 19:15:55.299409-06	2	Lesson 2: Getting Something On The Screen	1	[{"added": {}}]	10	1
18	2018-01-01 19:16:47.828452-06	2	Section 1: Our First Program!	1	[{"added": {}}]	11	1
19	2018-01-01 19:17:52.861088-06	3	Section 2: Hello, World!	1	[{"added": {}}]	11	1
20	2018-01-01 19:19:30.196516-06	1	print function from Programming Basics with Python by Donny Lawrence	1	[{"added": {}}]	12	1
21	2018-01-01 19:19:43.792725-06	1	Section Requirement	3		13	1
22	2018-01-01 19:20:09.531709-06	2	Section Requirement	2	[{"changed": {"fields": ["description", "unitTests", "section"]}}]	13	1
23	2018-01-01 19:20:54.798037-06	1	print function from Programming Basics with Python by Donny Lawrence	2	[{"changed": {"fields": ["code"]}}]	12	1
24	2018-01-01 19:21:32.67432-06	3	Section 2: Hello, World!	2	[{"changed": {"fields": ["text"]}}]	11	1
25	2018-01-01 19:21:37.998413-06	2	Section 1: Our First Program!	2	[]	11	1
26	2018-01-03 12:08:28.580519-06	4	Section 3: Conclusion	1	[{"added": {}}]	11	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 26, true);


--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, hidden, meta) FROM stdin;
\.


--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_celery_results_taskresult_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	django_celery_results	taskresult
8	authtoken	token
9	oc_server	course
10	oc_server	lesson
11	oc_server	section
12	oc_server	draggable
13	oc_server	sectionrequirement
14	oc_server	baseprofile
15	oc_server	draggabletextfield
16	oc_server	feedbacksubmission
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 16, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-07-02 13:51:31.913099-05
2	auth	0001_initial	2017-07-02 13:51:31.983206-05
3	admin	0001_initial	2017-07-02 13:51:32.017247-05
4	admin	0002_logentry_remove_auto_add	2017-07-02 13:51:32.044444-05
5	contenttypes	0002_remove_content_type_name	2017-07-02 13:51:32.098726-05
6	auth	0002_alter_permission_name_max_length	2017-07-02 13:51:32.107912-05
7	auth	0003_alter_user_email_max_length	2017-07-02 13:51:32.131461-05
8	auth	0004_alter_user_username_opts	2017-07-02 13:51:32.147068-05
9	auth	0005_alter_user_last_login_null	2017-07-02 13:51:32.162726-05
10	auth	0006_require_contenttypes_0002	2017-07-02 13:51:32.16478-05
11	auth	0007_alter_validators_add_error_messages	2017-07-02 13:51:32.180123-05
12	auth	0008_alter_user_username_max_length	2017-07-02 13:51:32.200649-05
13	sessions	0001_initial	2017-07-02 13:51:32.210007-05
14	django_celery_results	0001_initial	2017-08-23 11:51:21.800211-05
15	authtoken	0001_initial	2017-11-13 13:07:56.019646-06
16	authtoken	0002_auto_20160226_1747	2017-11-13 13:07:56.05927-06
17	oc_server	0001_initial	2017-11-26 16:50:02.769701-06
18	oc_server	0002_auto_20171126_2323	2017-11-26 17:23:19.468079-06
19	oc_server	0003_auto_20171126_2324	2017-11-26 17:24:40.10684-06
20	oc_server	0004_auto_20171127_1454	2017-11-27 08:54:59.983591-06
21	oc_server	0005_draggable	2017-12-24 13:13:54.067743-06
22	oc_server	0006_sectionrequirement	2017-12-26 20:08:04.385893-06
23	oc_server	0007_baseprofile	2017-12-28 15:20:23.56341-06
24	oc_server	0008_draggabletextfield	2018-01-16 20:41:06.203627-06
25	oc_server	0009_auto_20180112_2335	2018-01-16 20:41:06.229783-06
26	oc_server	0010_baseprofile_current_section	2018-01-16 20:41:06.250512-06
27	oc_server	0011_feedbacksubmission	2018-02-10 14:47:04.396815-06
28	oc_server	0011_auto_20180129_0040	2018-02-20 11:13:37.68454-06
29	oc_server	0012_auto_20180129_0043	2018-02-20 11:13:37.70291-06
30	oc_server	0013_merge_20180206_0205	2018-02-20 11:13:37.705206-06
31	oc_server	0014_feedbacksubmission_date	2018-02-20 11:13:37.723657-06
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 31, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
4hta0we4vyeq2cbx9nrgkujhbmzhxrm9	Njc2MjBiYjIwM2YyMjYyNDI5Y2E3NjE1MGM0Nzc4ODE3NTYyOWJiZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MjVlMDliNDk4ZTdlNmQzN2Q3NmQ0NDAzMTViOWZhODZhOGIyZjdiIn0=	2017-08-10 11:49:08.596476-05
8fsu5dd6csox44ujpdahfga5cnqlao4u	YzAyNzYwODViM2QxNWIyNGIxNmE2ZTdmNjA2MmJlODg3ZmRhMzE0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YmFjODFkMmQ3MGNiZDdmMjlmMjRjNjBiZjg2OGY3NzZmMmI2NDQ2In0=	2017-12-21 18:01:00.059458-06
zmf5629b22wb3h4ku37jfey64k2mfy2m	YzAyNzYwODViM2QxNWIyNGIxNmE2ZTdmNjA2MmJlODg3ZmRhMzE0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YmFjODFkMmQ3MGNiZDdmMjlmMjRjNjBiZjg2OGY3NzZmMmI2NDQ2In0=	2017-12-25 08:43:13.269852-06
aes4rwv81geok0bobu3dsdia8x5gs0y3	YzAyNzYwODViM2QxNWIyNGIxNmE2ZTdmNjA2MmJlODg3ZmRhMzE0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YmFjODFkMmQ3MGNiZDdmMjlmMjRjNjBiZjg2OGY3NzZmMmI2NDQ2In0=	2018-01-11 16:34:19.608446-06
bq1dcmxkb9bmdj0agut9fur6swx8qq5r	YTQ3NTc4ZDMxOTE5YjQwZTRlOTg5NWZmMDIwYTc4MTg5ZmYzNmE1Yjp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTUwZjNlMmE0M2Y5ZjRmODUxYjU2OTg1NTMzNWQzYzgwMDViMTA1In0=	2018-02-05 22:48:35.726002-06
byn3q7np9xv7kbqmdc7ij6wu8hyssrf0	YTQ3NTc4ZDMxOTE5YjQwZTRlOTg5NWZmMDIwYTc4MTg5ZmYzNmE1Yjp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTUwZjNlMmE0M2Y5ZjRmODUxYjU2OTg1NTMzNWQzYzgwMDViMTA1In0=	2018-02-06 10:17:11.277941-06
1zzr2tsb25b4v0zuba9w8gmwjecvxotw	MWE1ZWRjMzNiY2ZlMTg0MGZiMjZlMDRiODdiYjkwNzZiYTBlZmJkYjp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWRjODllYzFjNjllMzg3YjQ1NGE3ZmVmYjUwZTU3YTIyOTZjMTM0In0=	2018-02-24 14:47:36.365036-06
r4zh71xoqhuooyud1xtei2cz8ept9y2s	MWE1ZWRjMzNiY2ZlMTg0MGZiMjZlMDRiODdiYjkwNzZiYTBlZmJkYjp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyYWRjODllYzFjNjllMzg3YjQ1NGE3ZmVmYjUwZTU3YTIyOTZjMTM0In0=	2018-02-24 20:58:07.232972-06
5j6wx97zkmlx4gq5gwpbdv5wucykzvv1	YTQ3NTc4ZDMxOTE5YjQwZTRlOTg5NWZmMDIwYTc4MTg5ZmYzNmE1Yjp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTUwZjNlMmE0M2Y5ZjRmODUxYjU2OTg1NTMzNWQzYzgwMDViMTA1In0=	2018-03-06 11:15:32.626287-06
\.


--
-- Data for Name: oc_server_baseprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_baseprofile (id, user_id, current_section_id) FROM stdin;
1	4	\N
2	5	\N
4	7	\N
3	6	2
\.


--
-- Data for Name: oc_server_baseprofile_completed_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_baseprofile_completed_sections (id, baseprofile_id, section_id) FROM stdin;
\.


--
-- Name: oc_server_baseprofile_completed_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_baseprofile_completed_sections_id_seq', 1, false);


--
-- Name: oc_server_baseprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_baseprofile_id_seq', 4, true);


--
-- Data for Name: oc_server_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_course (id, name, author) FROM stdin;
1	Programming Basics with Python	Donny Lawrence
\.


--
-- Name: oc_server_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_course_id_seq', 1, true);


--
-- Data for Name: oc_server_draggable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_draggable (id, "codeName", "descName", "descText", code, course_id) FROM stdin;
1	print	function	Outputs text to the screen.	print(\\string\\)	1
\.


--
-- Name: oc_server_draggable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_draggable_id_seq', 1, true);


--
-- Data for Name: oc_server_draggable_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_draggable_sections (id, draggable_id, section_id) FROM stdin;
1	1	3
\.


--
-- Name: oc_server_draggable_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_draggable_sections_id_seq', 1, true);


--
-- Data for Name: oc_server_draggabletextfield; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_draggabletextfield (id, "startChar", "endChar", "placeholderText", draggable_id, "lineNumber") FROM stdin;
\.


--
-- Name: oc_server_draggabletextfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_draggabletextfield_id_seq', 1, false);


--
-- Data for Name: oc_server_feedbacksubmission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_feedbacksubmission (id, message, user_id, date) FROM stdin;
\.


--
-- Name: oc_server_feedbacksubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_feedbacksubmission_id_seq', 1, false);


--
-- Data for Name: oc_server_lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_lesson (id, name, number, course_id) FROM stdin;
1	Start	1	1
2	Getting Something On The Screen	2	1
\.


--
-- Name: oc_server_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_lesson_id_seq', 2, true);


--
-- Data for Name: oc_server_section; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_section (id, name, number, text, lesson_id) FROM stdin;
2	Our First Program!	1	To start, we’ll write the quintessential computer program for beginners: Hello World. The program is simple: it simply outputs the text “Hello, World!” to the screen. There are a couple of ways to accomplish this, but with Python there is a very simple way to do it. Let’s get started!	2
1	Why Learn to Program?	1	# Welcome!\r\n\r\nWelcome to fluidcode! This site is designed to help you learn to program real world applications in a (hopefully) painless way. Software is taking over the world-- literally. In the coming years, it will be essential to know at least a little bit about software development. Even if you aren’t interested in mastering programming, it will still be helpful to know what’s going on when you’re inevitably confronted with some sort of problem that involves software.\r\n\r\nThis course teaches the scripting language Python, which is known as a great language for beginners to programming in general. First, however, you will learn the basics of programming using draggable blocks. After you get the hang of the logic behind the creation of software, the training wheels will be taken off, and you’ll learn the skills that will eventually be transferable to the real world.\r\n\r\nPress “Next Section” to get started!	1
3	Hello, World!	2	You may notice a block has appeared on the right sidebar. These are code blocks: the things that are going to help you grasp the basic concepts of software development before needing to get into the nitty gritty of the syntax of Python. Having to learn the syntax of a specific language while also learning the basics of computer science can be very difficult for a learner, and often causes them to quit out of frustration.\r\n\r\nGo ahead and drag the code block into the editor. This will insert the snippet of code needed to print something to the screen. You’ll also have an option to fill in a single parameter: the text to print. What we’re using here is called a function, similar to functions used in algebra and calculus, and we will go deeper into their inner workings in a later section. For now, though, all you need to worry about is that a function takes input, performs an operation of some kind, and then returns to the next line of your code.\r\n\r\nIn this case though, all we have is the print function, so go ahead and press Run to see your results.	2
4	Conclusion	3	If you’ve made it this far, then congratulations! You’ve successfully run your first program with real functionality. It may seem pretty useless right now, but these are the roots of great things to come.	2
\.


--
-- Name: oc_server_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_section_id_seq', 4, true);


--
-- Data for Name: oc_server_sectionrequirement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_sectionrequirement (id, description, "unitTests", section_id) FROM stdin;
2	Print "Hello, World!"	def test(result):\r\n    return result == "Hello, World!\\n"	3
\.


--
-- Name: oc_server_sectionrequirement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_sectionrequirement_id_seq', 2, true);


--
-- Data for Name: rr_logged_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rr_logged_events (activity, change_table, diff_type, change_key, left_change_type, right_change_type, description, long_description, event_time, diff_dump, id) FROM stdin;
sync	oc_server_draggable	conflict	1	\N	\N	ignore	\N	2018-01-22 02:09:18.670819	\N	1
sync	oc_server_section	conflict	1	\N	\N	ignore	\N	2018-01-22 02:09:19.967935	\N	2
sync	oc_server_section	conflict	2	\N	\N	ignore	\N	2018-01-22 02:09:19.972977	\N	3
\.


--
-- Name: rr_logged_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rr_logged_events_id_seq', 3, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_task_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_task_id_key UNIQUE (task_id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: oc_server_baseprofile_completed_sections oc_server_baseprofile_co_baseprofile_id_section_i_8328f6db_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_sections
    ADD CONSTRAINT oc_server_baseprofile_co_baseprofile_id_section_i_8328f6db_uniq UNIQUE (baseprofile_id, section_id);


--
-- Name: oc_server_baseprofile_completed_sections oc_server_baseprofile_completed_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_sections
    ADD CONSTRAINT oc_server_baseprofile_completed_sections_pkey PRIMARY KEY (id);


--
-- Name: oc_server_baseprofile oc_server_baseprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile
    ADD CONSTRAINT oc_server_baseprofile_pkey PRIMARY KEY (id);


--
-- Name: oc_server_baseprofile oc_server_baseprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile
    ADD CONSTRAINT oc_server_baseprofile_user_id_key UNIQUE (user_id);


--
-- Name: oc_server_course oc_server_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_course
    ADD CONSTRAINT oc_server_course_pkey PRIMARY KEY (id);


--
-- Name: oc_server_draggable oc_server_draggable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_draggable
    ADD CONSTRAINT oc_server_draggable_pkey PRIMARY KEY (id);


--
-- Name: oc_server_draggable_sections oc_server_draggable_sect_draggable_id_section_id_c795545f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_draggable_sections
    ADD CONSTRAINT oc_server_draggable_sect_draggable_id_section_id_c795545f_uniq UNIQUE (draggable_id, section_id);


--
-- Name: oc_server_draggable_sections oc_server_draggable_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_draggable_sections
    ADD CONSTRAINT oc_server_draggable_sections_pkey PRIMARY KEY (id);


--
-- Name: oc_server_draggabletextfield oc_server_draggabletextfield_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_draggabletextfield
    ADD CONSTRAINT oc_server_draggabletextfield_pkey PRIMARY KEY (id);


--
-- Name: oc_server_feedbacksubmission oc_server_feedbacksubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_feedbacksubmission
    ADD CONSTRAINT oc_server_feedbacksubmission_pkey PRIMARY KEY (id);


--
-- Name: oc_server_lesson oc_server_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_lesson
    ADD CONSTRAINT oc_server_lesson_pkey PRIMARY KEY (id);


--
-- Name: oc_server_section oc_server_section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_section
    ADD CONSTRAINT oc_server_section_pkey PRIMARY KEY (id);


--
-- Name: oc_server_sectionrequirement oc_server_sectionrequirement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_sectionrequirement
    ADD CONSTRAINT oc_server_sectionrequirement_pkey PRIMARY KEY (id);


--
-- Name: rr_logged_events rr_logged_events_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rr_logged_events
    ADD CONSTRAINT rr_logged_events_id_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_celery_results_taskresult_hidden_cd77412f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_taskresult_hidden_cd77412f ON django_celery_results_taskresult USING btree (hidden);


--
-- Name: django_celery_results_taskresult_task_id_de0d95bf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_results_taskresult_task_id_de0d95bf_like ON django_celery_results_taskresult USING btree (task_id varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: oc_server_baseprofile_comp_baseprofile_id_a938e280; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_baseprofile_comp_baseprofile_id_a938e280 ON oc_server_baseprofile_completed_sections USING btree (baseprofile_id);


--
-- Name: oc_server_baseprofile_completed_sections_section_id_338f7edd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_baseprofile_completed_sections_section_id_338f7edd ON oc_server_baseprofile_completed_sections USING btree (section_id);


--
-- Name: oc_server_baseprofile_current_section_id_875bad86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_baseprofile_current_section_id_875bad86 ON oc_server_baseprofile USING btree (current_section_id);


--
-- Name: oc_server_draggable_course_id_a83f6035; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_draggable_course_id_a83f6035 ON oc_server_draggable USING btree (course_id);


--
-- Name: oc_server_draggable_sections_draggable_id_a075ac8d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_draggable_sections_draggable_id_a075ac8d ON oc_server_draggable_sections USING btree (draggable_id);


--
-- Name: oc_server_draggable_sections_section_id_b9720c22; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_draggable_sections_section_id_b9720c22 ON oc_server_draggable_sections USING btree (section_id);


--
-- Name: oc_server_draggabletextfield_draggable_id_c8b893ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_draggabletextfield_draggable_id_c8b893ad ON oc_server_draggabletextfield USING btree (draggable_id);


--
-- Name: oc_server_feedbacksubmission_user_id_4bbe2985; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_feedbacksubmission_user_id_4bbe2985 ON oc_server_feedbacksubmission USING btree (user_id);


--
-- Name: oc_server_lesson_course_id_e2a3fb9d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_lesson_course_id_e2a3fb9d ON oc_server_lesson USING btree (course_id);


--
-- Name: oc_server_section_lesson_id_8dce139a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_section_lesson_id_8dce139a ON oc_server_section USING btree (lesson_id);


--
-- Name: oc_server_sectionrequirement_section_id_9ee0a523; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_sectionrequirement_section_id_9ee0a523 ON oc_server_sectionrequirement USING btree (section_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_baseprofile_completed_sections oc_server_baseprofil_baseprofile_id_a938e280_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_sections
    ADD CONSTRAINT oc_server_baseprofil_baseprofile_id_a938e280_fk_oc_server FOREIGN KEY (baseprofile_id) REFERENCES oc_server_baseprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_baseprofile oc_server_baseprofil_current_section_id_875bad86_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile
    ADD CONSTRAINT oc_server_baseprofil_current_section_id_875bad86_fk_oc_server FOREIGN KEY (current_section_id) REFERENCES oc_server_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_baseprofile_completed_sections oc_server_baseprofil_section_id_338f7edd_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_sections
    ADD CONSTRAINT oc_server_baseprofil_section_id_338f7edd_fk_oc_server FOREIGN KEY (section_id) REFERENCES oc_server_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_baseprofile oc_server_baseprofile_user_id_797255e2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile
    ADD CONSTRAINT oc_server_baseprofile_user_id_797255e2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_draggable_sections oc_server_draggable__draggable_id_a075ac8d_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_draggable_sections
    ADD CONSTRAINT oc_server_draggable__draggable_id_a075ac8d_fk_oc_server FOREIGN KEY (draggable_id) REFERENCES oc_server_draggable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_draggable_sections oc_server_draggable__section_id_b9720c22_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_draggable_sections
    ADD CONSTRAINT oc_server_draggable__section_id_b9720c22_fk_oc_server FOREIGN KEY (section_id) REFERENCES oc_server_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_draggable oc_server_draggable_course_id_a83f6035_fk_oc_server_course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_draggable
    ADD CONSTRAINT oc_server_draggable_course_id_a83f6035_fk_oc_server_course_id FOREIGN KEY (course_id) REFERENCES oc_server_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_draggabletextfield oc_server_draggablet_draggable_id_c8b893ad_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_draggabletextfield
    ADD CONSTRAINT oc_server_draggablet_draggable_id_c8b893ad_fk_oc_server FOREIGN KEY (draggable_id) REFERENCES oc_server_draggable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_feedbacksubmission oc_server_feedbacksu_user_id_4bbe2985_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_feedbacksubmission
    ADD CONSTRAINT oc_server_feedbacksu_user_id_4bbe2985_fk_oc_server FOREIGN KEY (user_id) REFERENCES oc_server_baseprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_lesson oc_server_lesson_course_id_e2a3fb9d_fk_oc_server_course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_lesson
    ADD CONSTRAINT oc_server_lesson_course_id_e2a3fb9d_fk_oc_server_course_id FOREIGN KEY (course_id) REFERENCES oc_server_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_section oc_server_section_lesson_id_8dce139a_fk_oc_server_lesson_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_section
    ADD CONSTRAINT oc_server_section_lesson_id_8dce139a_fk_oc_server_lesson_id FOREIGN KEY (lesson_id) REFERENCES oc_server_lesson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_sectionrequirement oc_server_sectionreq_section_id_9ee0a523_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_sectionrequirement
    ADD CONSTRAINT oc_server_sectionreq_section_id_9ee0a523_fk_oc_server FOREIGN KEY (section_id) REFERENCES oc_server_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: Donny
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


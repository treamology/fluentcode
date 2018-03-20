--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
    user_id integer NOT NULL
);


ALTER TABLE oc_server_baseprofile OWNER TO postgres;

--
-- Name: oc_server_baseprofile_completed_section_requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oc_server_baseprofile_completed_section_requirements (
    id integer NOT NULL,
    baseprofile_id integer NOT NULL,
    sectionrequirement_id integer NOT NULL
);


ALTER TABLE oc_server_baseprofile_completed_section_requirements OWNER TO postgres;

--
-- Name: oc_server_baseprofile_completed_section_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oc_server_baseprofile_completed_section_requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oc_server_baseprofile_completed_section_requirements_id_seq OWNER TO postgres;

--
-- Name: oc_server_baseprofile_completed_section_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oc_server_baseprofile_completed_section_requirements_id_seq OWNED BY oc_server_baseprofile_completed_section_requirements.id;


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
    AS integer
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
    AS integer
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
-- Name: oc_server_baseprofile_completed_section_requirements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_section_requirements ALTER COLUMN id SET DEFAULT nextval('oc_server_baseprofile_completed_section_requirements_id_seq'::regclass);


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
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


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
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$36000$UMS5yPC3B0iS$Wy4DWajvB0zC8diI10oUp783GsfG6oQNcmuT1rEyWok=	\N	f	testuser				f	t	2017-11-20 14:23:09.531146+00
24	pbkdf2_sha256$36000$oDQFmfNHrZY0$PB8Ob041X31WzwaGWCdaOzRnvjI4ivVvVSD/73ZKcu8=	2018-02-27 02:18:30.332032+00	f	don.l@mac.com			don.l@mac.com	f	t	2018-02-27 02:08:04.842236+00
18	pbkdf2_sha256$36000$21TvmCjCFXgi$sZ4GSyVG97Ty+/ZW6zb0ZbV0jz227orVschINmqyW30=	2018-01-29 17:18:45.774102+00	f	donnylawrence				f	t	2018-01-29 17:18:41.389218+00
4	pbkdf2_sha256$36000$dPxh4lVpz6Yn$A8tKMG9Ur8B5+jQKrb8UN38N56Dw6PSCRvdtaxCE3uU=	\N	f	blepblop				f	t	2018-01-16 23:43:35.770637+00
5	pbkdf2_sha256$36000$A7qZ3drNP6JF$HB87vjBieEHix6hySBpG6CmW2uC9Pc68SJzAWLL1GDc=	2018-01-16 23:45:51.959288+00	f	treamousbutnot				f	t	2018-01-16 23:45:43.414224+00
6	pbkdf2_sha256$36000$iIh9nZfbXErm$VaMM7I5vkfH/j3tG3tpBoPmxwJQRweGp6qGH5yjpsgM=	\N	f	test1				f	t	2018-01-16 23:48:38.649947+00
7	pbkdf2_sha256$36000$3pbBOd01GWeR$cZjRJRIvKtabZFg3rCxMhuLlfuhvcnHYEeqV2TuaTFI=	\N	f	what				f	t	2018-01-17 01:50:08.756905+00
8	pbkdf2_sha256$36000$Rh0VVOD3Z685$wEc7SsECheYohX4dXuW6eTw3geMQ9C5Kz9SKLuKC1bI=	2018-01-17 01:52:45.831672+00	f	seriously				f	t	2018-01-17 01:52:45.49031+00
9	pbkdf2_sha256$36000$P71wrqrKTL3O$iVqBM6WviNB3TCIzXihYS8HFNCr/mXGbnFQmvj/ha8Y=	2018-01-17 02:04:54.437673+00	f	pleasehelp				f	t	2018-01-17 02:04:54.177269+00
10	pbkdf2_sha256$36000$gGEbCgs4kCcT$80mdkxY4kW1VGPfRUbBAtHe4xL0+aH40UNnJYvjLkuc=	2018-01-17 02:06:43.63589+00	f	anotheruser2				f	t	2018-01-17 02:06:31.577636+00
11	pbkdf2_sha256$36000$C1VP6Td26fij$e+f0qeI5mJ2AD9bXU4b5O36X3vuh1jzsigJcyQ7RLtM=	2018-01-17 02:12:25.426115+00	f	TigerTrot65				f	t	2018-01-17 02:12:25.310386+00
12	pbkdf2_sha256$36000$O63logRhJnYe$1D64KRVKczcXJ0E/66ktgkZlgsjKGKwzc1LkMnq7/3I=	2018-01-17 02:17:49.054918+00	f	TigerTrot69				f	t	2018-01-17 02:17:33.438051+00
19	pbkdf2_sha256$36000$VdXQuIEV15YS$xY2/HtVaRFOetCZUlYqjgL0OsDm3Z9ulfd3C9wOn/TQ=	2018-02-05 01:08:40.14252+00	f	justanothertest				f	t	2018-02-05 01:08:33.979718+00
1	pbkdf2_sha256$36000$f6NM5KhbDliC$JE6AkWXFYUvl9VTTsfmOiT7vhf2NmVtTi+U+5UAnJps=	2018-02-18 00:17:53.376203+00	t	treamous				t	t	2017-07-27 16:48:21.01212+00
13	pbkdf2_sha256$36000$rhnTmhR2zWLT$cp4XcPiSFq+/2GUniipcEE+ieOOrxY3xpOaVutnzBAw=	2018-01-17 23:49:19.084085+00	f	testingtesting				f	t	2018-01-17 23:49:14.554654+00
25	pbkdf2_sha256$36000$bC9VDXFbNAz0$1JulA1z5G9u200lFBOKBsyaahi9ADCwW5xapQxV94Go=	2018-02-27 02:47:11.925125+00	f	blakeburdeen			blake@burdeen.com	f	t	2018-02-27 02:46:58.818156+00
14	pbkdf2_sha256$36000$x78TrqB5kP7s$1a/rdbWIVe1xlfOo8XqmQAxJ0H8xn15HyAEfqShhFuQ=	2018-01-22 02:10:43.183158+00	f	ihatemyself				f	t	2018-01-22 02:10:38.288511+00
16	pbkdf2_sha256$36000$yF5NJWH0vZo9$iBSZuisLEB5XEQ/jsToQSaWIYN4fgUYefBDs/COd/Eg=	2018-03-18 16:03:49.928796+00	t	donnyl				t	t	2018-01-23 16:18:40+00
15	pbkdf2_sha256$36000$7m1aewumU35b$rYLoJvSoFYCslxCTHjVS9vH+pZfa6vp+t5vxJzTYqY4=	2018-01-22 02:16:55.926492+00	f	bleh				f	t	2018-01-22 02:16:51.872022+00
17	pbkdf2_sha256$36000$KnP6OHehWH65$P63fKZLV1u2gBhn32IQjrK44NKTWrtZ4XWq+VoHmKvc=	2018-01-28 23:51:00.312904+00	f	treatest				f	t	2018-01-28 23:51:00.167286+00
20	pbkdf2_sha256$36000$SlaSBugFL8yF$m2FC2wz8QzYkNVUmriEBZANjpe5GuxJapzUr4KHvOK8=	2018-02-20 18:13:56.415491+00	f	karenboles			bolesk@ensworth.com	f	t	2018-02-20 18:13:44.569724+00
21	pbkdf2_sha256$36000$YY8v3aHGG2KQ$eQomPLW5/+yXECJRnS+/XQSu+LM7/w2cjWWV7aY3oUo=	2018-02-25 01:26:42.292752+00	f	testing10			duckster1999@gmail.com	f	t	2018-02-25 01:26:34.845276+00
3	pbkdf2_sha256$36000$v6rcupzLqPOg$D6ZBceYu3eMI7xMKWL2ULRDUtmOEnGFunl8TZ8yuleU=	2018-01-29 14:46:20.209881+00	f	Giggidy				f	t	2018-01-11 17:12:42.943503+00
26	pbkdf2_sha256$36000$0RpWiGj19xtZ$KESBV0UByQVgbyt3SrJwuPgJPJHYUQuKg2czUChGhdQ=	2018-02-27 19:17:54.403838+00	f	KathyLawrence			kathrynlawrence1@me.com	f	t	2018-02-27 19:11:49.375576+00
27	pbkdf2_sha256$36000$XmZqXI0qrSEC$tfvbitJ+sqQUFp+zzl59LabmrIkfHdIWyxGZI7DX9R0=	2018-02-27 19:58:48.899038+00	f	sarah_frances_morris			morriss20@ensworth.com	f	t	2018-02-27 19:58:48.797011+00
23	pbkdf2_sha256$36000$cwMwiR2dMiJ0$jRafAgtc9Rz67lEE56CAdQIJgsFATIUA1G7bfuum5bQ=	2018-02-27 01:27:37.14364+00	f	seitzc18			seitzc18@ensworth.com	f	t	2018-02-27 01:26:08.098035+00
28	pbkdf2_sha256$36000$UaqZPp3t8P5C$rnFHfOW++cj26uiuQay6D3KzcKhiMP7YeGaINPffx6M=	2018-03-01 00:22:57.356828+00	f	david			allend18@ensworth.com	f	t	2018-03-01 00:12:32.157969+00
22	pbkdf2_sha256$36000$h3acPyvLWroU$Ek4kfuxfWzzFnD/OzFiZzI2zWs8rUfmj5fgMFD4Mv0M=	2018-03-12 20:16:46.782344+00	f	CaptainZ			zwiebeli18@ensworth.com	f	t	2018-02-27 01:24:20.43091+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	16	1
2	16	2
3	16	3
4	16	4
5	16	5
6	16	6
7	16	7
8	16	8
9	16	9
10	16	10
11	16	11
12	16	12
13	16	13
14	16	14
15	16	15
16	16	16
17	16	17
18	16	18
19	16	19
20	16	20
21	16	21
22	16	22
23	16	23
24	16	24
25	16	25
26	16	26
27	16	27
28	16	28
29	16	29
30	16	30
31	16	31
32	16	32
33	16	33
34	16	34
35	16	35
36	16	36
37	16	37
38	16	38
39	16	39
40	16	40
41	16	41
42	16	42
43	16	43
44	16	44
45	16	45
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authtoken_token (key, created, user_id) FROM stdin;
67a3aa26240ecc165096e7ae5bc7f0ba3fc55ad3	2017-11-13 19:22:14.251257+00	1
155cc3282e8fff962164deaefc7a7edb08fac55f	2017-11-20 14:23:38.758817+00	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-11-26 22:57:55.588314+00	1	Section object	1	[{"added": {}}]	11	1
2	2017-11-26 22:58:11.540031+00	1	Lesson object	1	[{"added": {}}]	10	1
3	2017-11-26 22:58:19.190191+00	1	Course object	1	[{"added": {}}]	9	1
4	2017-11-26 23:25:07.036295+00	1	Start	2	[{"changed": {"fields": ["course"]}}]	10	1
5	2017-11-26 23:26:28.072652+00	1	Section object	2	[{"changed": {"fields": ["text", "sections"]}}]	11	1
6	2017-12-08 00:01:19.412327+00	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["lesson"]}}]	11	1
7	2017-12-11 14:43:48.857014+00	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
8	2017-12-23 20:52:38.383533+00	1	if statement from Programming Basics with Python by Donny Lawrence	1	[{"added": {}}]	12	1
9	2017-12-23 21:42:38.861519+00	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
10	2017-12-23 21:44:51.732329+00	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
11	2017-12-23 21:47:39.889543+00	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
12	2017-12-23 21:52:48.716706+00	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
13	2017-12-26 00:30:54.239495+00	1	Section Requirement	1	[{"added": {}}]	13	1
14	2017-12-31 01:16:20.905897+00	1	Section Requirement	2	[{"changed": {"fields": ["unitTests"]}}]	13	1
15	2017-12-31 01:17:02.065654+00	1	Section Requirement	2	[{"changed": {"fields": ["unitTests"]}}]	13	1
16	2017-12-31 18:41:48.742842+00	1	Section Requirement	2	[{"changed": {"fields": ["unitTests"]}}]	13	1
17	2018-01-03 00:11:56.047027+00	2	Section 2: Another Test	1	[{"added": {}}]	11	1
18	2018-01-03 00:53:08.851679+00	2	Lesson 2: Second Lesson	1	[{"added": {}}]	10	1
19	2018-01-03 00:53:10.521083+00	3	Section 1: Blah Blah	1	[{"added": {}}]	11	1
20	2018-01-11 19:13:34.819809+00	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
21	2018-01-11 19:14:37.731397+00	2	Lesson 2: Second Lesson	3		10	1
22	2018-01-29 00:02:24.865491+00	16	donnyl	2	[{"changed": {"fields": ["is_staff", "is_superuser", "user_permissions"]}}]	4	1
23	2018-01-29 00:06:18.443201+00	1	print function	2	[{"changed": {"fields": ["code"]}}]	12	16
24	2018-01-29 00:06:53.936133+00	1	output (in quotes)[6, 23]	1	[{"added": {}}]	15	16
25	2018-01-29 00:07:18.229593+00	1	print function	2	[{"changed": {"fields": ["code"]}}]	12	16
26	2018-01-29 00:20:56.552492+00	3	Lesson 3: Introduction to Variables	1	[{"added": {}}]	10	16
27	2018-01-29 00:22:29.971944+00	5	Section 1: Getting our Hands Dirty	1	[{"added": {}}]	11	16
28	2018-01-29 00:27:16.925443+00	5	Section 1: Getting our Hands Dirty	2	[{"changed": {"fields": ["text"]}}]	11	16
29	2018-01-29 00:28:25.605589+00	1	print function	2	[{"changed": {"fields": ["sections"]}}]	12	16
30	2018-01-29 00:30:39.951551+00	2	variable ...	1	[{"added": {}}]	12	16
31	2018-01-29 00:31:31.883117+00	2	variable name[0, 12]	1	[{"added": {}}]	15	16
32	2018-01-29 00:31:46.499264+00	3	contents of variable[16, 35]	1	[{"added": {}}]	15	16
33	2018-01-29 00:46:08.995421+00	2	variable 	2	[{"changed": {"fields": ["descName"]}}]	12	16
34	2018-01-29 00:47:39.932733+00	1	output[6, 11]	2	[{"changed": {"fields": ["endChar", "placeholderText"]}}]	15	16
35	2018-01-29 00:47:53.911573+00	1	print function	2	[{"changed": {"fields": ["code"]}}]	12	16
36	2018-01-29 00:49:50.847737+00	3	Section 2: Hello, World!	2	[{"changed": {"fields": ["text"]}}]	11	16
37	2018-01-29 00:54:10.757078+00	6	Section 2: Adding two Numbers	1	[{"added": {}}]	11	16
38	2018-01-29 00:54:21.347232+00	1	print function	2	[{"changed": {"fields": ["sections"]}}]	12	16
39	2018-01-29 00:54:28.978134+00	2	variable 	2	[{"changed": {"fields": ["sections"]}}]	12	16
40	2018-01-29 00:56:18.03865+00	6	Section 2: Adding Two Numbers	2	[{"changed": {"fields": ["name"]}}]	11	16
41	2018-01-29 00:56:23.188794+00	5	Section 1: Getting Our Hands Dirty	2	[{"changed": {"fields": ["name"]}}]	11	16
42	2018-01-29 00:57:21.582158+00	4	Lesson 4: Conversation with the Computer	1	[{"added": {}}]	10	16
43	2018-01-29 00:57:53.309423+00	2	Lesson 2: Getting Something on the Screen	2	[{"changed": {"fields": ["name"]}}]	10	16
44	2018-01-29 00:58:19.561904+00	5	Lesson 5: Fucntions	1	[{"added": {}}]	10	16
45	2018-01-29 00:58:26.652418+00	5	Lesson 5: Functions	2	[{"changed": {"fields": ["name"]}}]	10	16
46	2018-01-29 00:58:50.858568+00	6	Lesson 6: Conditionals	1	[{"added": {}}]	10	16
47	2018-01-29 00:59:17.055715+00	7	Lesson 7: Strings	1	[{"added": {}}]	10	16
48	2018-01-29 00:59:55.209022+00	5	Lesson 5: Modularization with Functions	2	[{"changed": {"fields": ["name"]}}]	10	16
49	2018-01-29 01:00:07.374797+00	7	Lesson 7: Advanced String Usage	2	[{"changed": {"fields": ["name"]}}]	10	16
50	2018-01-29 01:00:15.909507+00	6	Lesson 6: Conditional Logic	2	[{"changed": {"fields": ["name"]}}]	10	16
51	2018-01-29 01:01:14.766848+00	8	Lesson 8: Loops	1	[{"added": {}}]	10	16
52	2018-01-29 01:01:32.978738+00	9	Lesson 9: Storing Variables in Lists	1	[{"added": {}}]	10	16
53	2018-01-29 01:02:07.938578+00	10	Lesson 10: Furthering Your Knowledge	1	[{"added": {}}]	10	16
54	2018-02-18 00:23:13.080895+00	5	Section 1: Getting Our Hands Dirty	2	[{"changed": {"fields": ["text"]}}]	11	16
55	2018-02-18 00:31:21.674231+00	3	contents of variable[16, 35]	2	[{"changed": {"fields": ["lineNumber"]}}]	15	16
56	2018-02-18 00:32:38.457436+00	3	contents of variable[16, 35]	2	[{"changed": {"fields": ["lineNumber"]}}]	15	16
57	2018-02-19 03:42:39.280039+00	2	Print "Hello, World!"	2	[{"changed": {"fields": ["unitTests"]}}]	13	16
58	2018-02-19 04:15:55.04977+00	2	Print "Hello, World!"	2	[{"changed": {"fields": ["unitTests"]}}]	13	16
59	2018-02-20 01:39:54.665658+00	3	Assign a variable containing "Hello, World!"	1	[{"added": {}}]	13	16
60	2018-02-20 01:40:23.156943+00	4	Print "Hello, World!" again	1	[{"added": {}}]	13	16
61	2018-02-20 01:47:21.863602+00	7	Section 1: Making the Calculator More Useful	1	[{"added": {}}]	11	16
62	2018-02-20 01:48:15.219972+00	8	Section 2: Accepting User Input	1	[{"added": {}}]	11	16
63	2018-02-20 01:48:25.277902+00	7	Section 1: Making the Calculator More Useful	2	[{"changed": {"fields": ["text"]}}]	11	16
64	2018-02-20 01:48:34.913686+00	8	Section 2: Accepting User Input	2	[{"changed": {"fields": ["text"]}}]	11	16
65	2018-02-20 01:49:35.167343+00	9	Section 3: Applying the Knowledge	1	[{"added": {}}]	11	16
66	2018-02-20 01:50:47.137005+00	10	Section 4: Applying the Knowledge	1	[{"added": {}}]	11	16
67	2018-02-20 01:50:57.508378+00	9	Section 3: Applying the Knowledge	3		11	16
68	2018-02-20 01:51:03.570796+00	10	Section 3: Applying the Knowledge	2	[{"changed": {"fields": ["number"]}}]	11	16
69	2018-02-20 01:51:13.589984+00	8	Section 2: Accepting User Input	2	[{"changed": {"fields": ["text"]}}]	11	16
70	2018-02-20 01:52:02.75928+00	11	Section 1: The Meat of Programming	1	[{"added": {}}]	11	16
71	2018-02-20 01:52:51.350578+00	12	Section 2: Our First Function	1	[{"added": {}}]	11	16
72	2018-02-20 01:53:54.266006+00	13	Section 3: Using Our Function	1	[{"added": {}}]	11	16
73	2018-02-20 01:55:45.739582+00	14	Section 4: A Sidenote About Functions	1	[{"added": {}}]	11	16
74	2018-02-20 01:56:19.147407+00	15	Section 5: Adding Functions to the Calculator	1	[{"added": {}}]	11	16
75	2018-02-20 02:00:54.612142+00	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	16
76	2018-02-20 02:24:27.047144+00	16	Section 1: The "if statement"	1	[{"added": {}}]	11	16
77	2018-02-20 02:25:02.418395+00	17	Section 2: Is False True?	1	[{"added": {}}]	11	16
78	2018-02-20 02:27:00.271232+00	18	Section 3: Using the Conditional	1	[{"added": {}}]	11	16
79	2018-02-20 02:27:11.667779+00	6	Lesson 6: Conditionals and Boolean Logic	2	[{"changed": {"fields": ["name"]}}]	10	16
80	2018-02-20 02:28:59.149464+00	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	16
81	2018-02-20 03:05:41.347353+00	19	Section 1: Diving Deeper	1	[{"added": {}}]	11	16
82	2018-02-20 03:06:14.497285+00	20	Section 2: Hello, Computer	1	[{"added": {}}]	11	16
83	2018-02-20 03:06:35.299121+00	21	Section 3: More String Tricks	1	[{"added": {}}]	11	16
84	2018-02-20 03:07:35.097915+00	22	Section 1: Repitition Is Key	1	[{"added": {}}]	11	16
85	2018-02-20 03:07:47.703858+00	23	Section 2: The Fibonacci Sequence	1	[{"added": {}}]	11	16
86	2018-02-20 03:08:14.058151+00	24	Section 1: Why Lists?	1	[{"added": {}}]	11	16
87	2018-02-24 23:44:35.61513+00	10	Section 3: Applying the Knowledge	2	[{"changed": {"fields": ["text"]}}]	11	16
88	2018-02-24 23:45:14.948707+00	18	Section 3: Applying Conditionals to our Calculator	2	[{"changed": {"fields": ["name", "text"]}}]	11	16
89	2018-02-24 23:45:45.544781+00	25	Section 4: Deciphering Our User Input	1	[{"added": {}}]	11	16
90	2018-02-24 23:52:18.006119+00	25	Section 4: Deciphering Our User Input	2	[{"changed": {"fields": ["text"]}}]	11	16
91	2018-02-24 23:52:38.209718+00	26	Section 5: Creating a Default Action	1	[{"added": {}}]	11	16
92	2018-03-05 02:12:19.923688+00	22	Section 1: Repetition Is Key	2	[{"changed": {"fields": ["name"]}}]	11	16
93	2018-03-05 02:13:38.667226+00	5	Create two variables, each containing a number	1	[{"added": {}}]	13	16
94	2018-03-05 02:16:49.217987+00	5	Create two variables, each containing a number	2	[{"changed": {"fields": ["unitTests"]}}]	13	16
95	2018-03-05 02:17:29.133485+00	5	Create two variables, each containing a number	2	[{"changed": {"fields": ["unitTests"]}}]	13	16
96	2018-03-05 02:17:49.251528+00	5	Create two variables, each containing a number	2	[{"changed": {"fields": ["unitTests"]}}]	13	16
97	2018-03-05 02:18:27.955157+00	5	Create two variables, each containing a number	2	[{"changed": {"fields": ["unitTests"]}}]	13	16
98	2018-03-05 02:21:15.242218+00	6	Print the sum	1	[{"added": {}}]	13	16
99	2018-03-05 02:22:04.794547+00	6	Print the sum	2	[{"changed": {"fields": ["unitTests"]}}]	13	16
100	2018-03-05 02:22:27.203457+00	6	Print the sum	2	[{"changed": {"fields": ["unitTests"]}}]	13	16
101	2018-03-05 02:24:02.617413+00	6	Print the sum	2	[{"changed": {"fields": ["unitTests"]}}]	13	16
102	2018-03-05 02:24:35.167002+00	6	Print the sum	2	[{"changed": {"fields": ["unitTests"]}}]	13	16
103	2018-03-05 02:25:44.70446+00	6	Print the sum	2	[{"changed": {"fields": ["unitTests"]}}]	13	16
104	2018-03-18 16:07:44.964412+00	3	function 	1	[{"added": {}}]	12	16
105	2018-03-18 16:08:31.118962+00	1	print function	2	[{"changed": {"fields": ["sections"]}}]	12	16
106	2018-03-18 16:08:45.352842+00	1	print function	2	[{"changed": {"fields": ["sections"]}}]	12	16
107	2018-03-18 16:09:00.055348+00	3	function 	2	[]	12	16
108	2018-03-18 16:09:11.065313+00	2	variable 	2	[{"changed": {"fields": ["sections"]}}]	12	16
109	2018-03-18 16:09:16.970355+00	3	function 	2	[]	12	16
\.


--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, hidden, meta) FROM stdin;
\.


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
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-07-02 18:51:31.913099+00
2	auth	0001_initial	2017-07-02 18:51:31.983206+00
3	admin	0001_initial	2017-07-02 18:51:32.017247+00
4	admin	0002_logentry_remove_auto_add	2017-07-02 18:51:32.044444+00
5	contenttypes	0002_remove_content_type_name	2017-07-02 18:51:32.098726+00
6	auth	0002_alter_permission_name_max_length	2017-07-02 18:51:32.107912+00
7	auth	0003_alter_user_email_max_length	2017-07-02 18:51:32.131461+00
8	auth	0004_alter_user_username_opts	2017-07-02 18:51:32.147068+00
9	auth	0005_alter_user_last_login_null	2017-07-02 18:51:32.162726+00
10	auth	0006_require_contenttypes_0002	2017-07-02 18:51:32.16478+00
11	auth	0007_alter_validators_add_error_messages	2017-07-02 18:51:32.180123+00
12	auth	0008_alter_user_username_max_length	2017-07-02 18:51:32.200649+00
13	sessions	0001_initial	2017-07-02 18:51:32.210007+00
14	django_celery_results	0001_initial	2017-08-23 16:51:21.800211+00
15	authtoken	0001_initial	2017-11-13 19:07:56.019646+00
16	authtoken	0002_auto_20160226_1747	2017-11-13 19:07:56.05927+00
17	oc_server	0001_initial	2017-11-26 22:50:02.769701+00
18	oc_server	0002_auto_20171126_2323	2017-11-26 23:23:19.468079+00
19	oc_server	0003_auto_20171126_2324	2017-11-26 23:24:40.10684+00
20	oc_server	0004_auto_20171127_1454	2017-11-27 14:54:59.983591+00
21	oc_server	0005_draggable	2017-12-23 20:49:56.878855+00
22	oc_server	0006_sectionrequirement	2017-12-26 00:29:42.218959+00
23	oc_server	0007_baseprofile	2017-12-30 23:49:41.156465+00
24	oc_server	0008_draggabletextfield	2018-01-16 23:26:06.85989+00
25	oc_server	0009_auto_20180112_2335	2018-01-16 23:26:06.933981+00
26	oc_server	0010_baseprofile_current_section	2018-01-16 23:26:06.980036+00
27	oc_server	0011_auto_20180129_0040	2018-01-29 00:45:25.965767+00
28	oc_server	0012_auto_20180129_0043	2018-01-29 00:45:25.994717+00
29	oc_server	0011_feedbacksubmission	2018-02-06 02:06:42.380509+00
30	oc_server	0013_merge_20180206_0205	2018-02-06 02:06:42.387846+00
31	oc_server	0014_feedbacksubmission_date	2018-02-20 03:52:59.310697+00
32	oc_server	0012_baseprofile_completed_section_requirements	2018-02-28 03:17:48.652455+00
33	oc_server	0013_remove_baseprofile_current_section	2018-02-28 03:17:48.709044+00
34	oc_server	0015_merge_20180228_0316	2018-02-28 03:17:48.712324+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
4hta0we4vyeq2cbx9nrgkujhbmzhxrm9	Njc2MjBiYjIwM2YyMjYyNDI5Y2E3NjE1MGM0Nzc4ODE3NTYyOWJiZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MjVlMDliNDk4ZTdlNmQzN2Q3NmQ0NDAzMTViOWZhODZhOGIyZjdiIn0=	2017-08-10 16:49:08.596476+00
8fsu5dd6csox44ujpdahfga5cnqlao4u	YzAyNzYwODViM2QxNWIyNGIxNmE2ZTdmNjA2MmJlODg3ZmRhMzE0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YmFjODFkMmQ3MGNiZDdmMjlmMjRjNjBiZjg2OGY3NzZmMmI2NDQ2In0=	2017-12-22 00:01:00.059458+00
zmf5629b22wb3h4ku37jfey64k2mfy2m	YzAyNzYwODViM2QxNWIyNGIxNmE2ZTdmNjA2MmJlODg3ZmRhMzE0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YmFjODFkMmQ3MGNiZDdmMjlmMjRjNjBiZjg2OGY3NzZmMmI2NDQ2In0=	2017-12-25 14:43:13.269852+00
ulcbveruk1oil2cmh8ajt5ay87wq36wt	YzAyNzYwODViM2QxNWIyNGIxNmE2ZTdmNjA2MmJlODg3ZmRhMzE0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YmFjODFkMmQ3MGNiZDdmMjlmMjRjNjBiZjg2OGY3NzZmMmI2NDQ2In0=	2018-01-06 20:50:36.200447+00
h64dhoa4v7pwogl32bvs20rxemwy1noh	NGZiOGNhYTYxMWU3MzA5NmY1MDNiYzVkNzk4NDQ5YzY0YzYxNjk5YTp7Il9hdXRoX3VzZXJfaWQiOiIyNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTMzNjIyZWRmODJlYmIxODRkMzlmNTc3ZjBmNjhkOWY0NjgxNGNiZCJ9	2018-03-13 02:18:30.334522+00
1bnat0pitz0qlwqypu2jzwhyclsdnzus	MzQxY2RiNzRlMzc1ZmVjNmY5OTk3NjBkMjRjMzIyNDhmZTMxYmYxNTp7fQ==	2018-01-25 17:12:43.141959+00
x5831q0d5g5l7yfrzutsfkpyk40n83sq	ZjYyNzRkODM0NmVmZWQ4OTJlZTA2NDg5Mzg0MzYwMDg1MDhmOGRhYTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNzRhNGM0MjQ0ZDFjYmUyNDc1NzU4YWM0YTFiMjFlYmNjNmE2M2I3In0=	2018-01-25 17:20:22.480016+00
ggltp6x76utttt3dv23x0z8ilipke8c2	OTI4NWQ5MTNhOTJiNzFkOWMyMDcyN2Y3OWI0MTcyNDQ5OThjZGYwNzp7Il9hdXRoX3VzZXJfaWQiOiIyNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTM2MjQ2OWRjMGExZjI4ZDM5YmM3ZGRmODkzMzRkNThkY2E1Yjk1YiJ9	2018-03-13 02:47:11.927568+00
mu3yoctcmwh9a90gafi5yon0njmbk0q6	ZGJmZjk3MDMxYzI4NzY0MjVkYjRmMTkxMzMyNTM0MTcyNmVhODIxNzp7Il9hdXRoX3VzZXJfaWQiOiIyMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDhiMzcxMjYxYWMwMmRhZTJjNDQzZDAxN2UzMzliYjdhMzQ1MmVkMCJ9	2018-03-13 02:54:32.943959+00
2qf49s63kwsvjl7nkj1i5mufvtv7v0xc	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-03-13 03:15:41.910219+00
p6f19m2d91f17u79cpeaezuxfjzoquua	ZGJmZjk3MDMxYzI4NzY0MjVkYjRmMTkxMzMyNTM0MTcyNmVhODIxNzp7Il9hdXRoX3VzZXJfaWQiOiIyMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDhiMzcxMjYxYWMwMmRhZTJjNDQzZDAxN2UzMzliYjdhMzQ1MmVkMCJ9	2018-03-13 14:27:01.742359+00
pwgc5qijtpqg41cqin0m1eozjkeh9a8f	OGI3MmJmZjAzNjlmNWNlN2VlNDg1Y2FmODk4OGI1Mzg5OTJmNTIzYTp7Il9hdXRoX3VzZXJfaWQiOiIyNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmM0ZGQyZjY0ZTZjYWY2OThlYmM2MzAwYjMwZWFiYTIxODUzYmU0YyJ9	2018-03-13 19:17:54.406462+00
nxdj2uh3vspvpekhs598dmbaxxyubnmo	YTg0M2Y1N2E1NGExYThmOTRlZGNjZTI4NjEwODM0ZjBlYzk0ODRjMTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWI3ZWU2NDZmMGYzZWFkNzUyZWI4ZDA5YTI5M2QyY2M0NjE5NjkwZiJ9	2018-01-31 02:12:25.42937+00
bzburrd842rmfbyrdbzfdx6uc7w0d5fu	ZmM3OTBhMmNjOTU2ZTFkOTFjYWJkYzIwYWVlZDJiYTc5MTA1NDQ4OTp7Il9hdXRoX3VzZXJfaWQiOiIyNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTE3MWNmYzBmZTE2YWEzZTg4YmIxNDM1MTBlY2Q2YjQ5ODA0OGE2NyJ9	2018-03-13 19:58:48.901009+00
jvafzlmpyf84wp6i7lf80phqxygrc1vq	ZDQ0NjVkZDkyZGVlM2ZjNjJhOGUxNWE2Njg4ZGNhM2E2ZjVjOTNjMDp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGFlMTAyMmQzYWZiZTQxNzkwNzI2NTdkMjViYTU5OGRhOGU1MDliYSJ9	2018-01-31 02:17:49.058734+00
9s7mrs32qqlsq7qwebsnsd1badgew37a	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-02-11 23:52:52.578965+00
ddkc4xmro4rws1h5omouvrbmsuxvmrzp	ZjYyNzRkODM0NmVmZWQ4OTJlZTA2NDg5Mzg0MzYwMDg1MDhmOGRhYTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNzRhNGM0MjQ0ZDFjYmUyNDc1NzU4YWM0YTFiMjFlYmNjNmE2M2I3In0=	2018-02-12 14:46:20.212575+00
6uy7h9gp2o2vsu93ndwnqwqcgvs8mvkb	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-02-12 14:48:08.044466+00
mscraotjiq7ecm80xmtpft4k9lahguzk	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-02-12 14:49:00.18782+00
1j3bu8lbsqydnpizft3jcj0ns3dpvnib	OWFlNmU4YWRmYTUwNjBkYTM4NTUyOTAzNzc1MzQxNjVkZTc4OGFjODp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTAzNzU2ZjVlYTVlNDE5ZmExYzc2ODhjM2Y4NzBkOTU0ZDY3YzZjNCJ9	2018-02-12 17:18:45.777285+00
u97kj3duqrordnonrkep2ihg9knavxb4	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-03-04 00:29:18.869552+00
upsihgadq80rn9ax3xzy1fbfqykc9keh	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-03-06 16:26:41.724686+00
egzupty7r6hw9mrh79h1f0aat8r7tkx6	YmRmZWIyYjhiYTg5YTU0ODY1ZmI3MmJmZGQ2YjU3N2MzNjE0NDY1ODp7Il9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjNlMTE2MGFkNmQzZjI5ZTE3MGUwNTc0ZmY1ZDliY2UzOGEwMmE0ZiJ9	2018-03-06 18:13:56.419321+00
xnk2xmijszdd2ezyc3vmy56k64zhggk0	Y2IyN2JhYzE1MDY1MzY3ZjhiOGNkZGViMDE2YmFmODUxYTE4NzNmZDp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzgzZDEyMzAzNzQwMmRkNzZiYTMyZmYxM2ZkNmNiODAyOWU4ODI1YyJ9	2018-03-13 01:27:37.146339+00
25hhma0jzyhbang8y1yt788kzvedqz5z	NDk0NDhhNDIyODFjNDc3ZDFhYjAwMWYzZDdjNWRiMDA2MDJhYThhYjp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjI1MzI0NDJhZDY1NDQ0YTdiMWU4N2FlYzRmN2Q0ZWEwODQ0NmZkYyJ9	2018-03-15 00:22:57.359462+00
x5w5msvkxh0wvav5tyun3tyksymtdn51	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-03-19 01:42:23.984504+00
8ift2hurum4n06k3drigs211rtmbs5fa	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-03-19 01:42:48.53906+00
leky8w1ytq6mbervhe5b35ouut1kac3y	ZGJmZjk3MDMxYzI4NzY0MjVkYjRmMTkxMzMyNTM0MTcyNmVhODIxNzp7Il9hdXRoX3VzZXJfaWQiOiIyMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDhiMzcxMjYxYWMwMmRhZTJjNDQzZDAxN2UzMzliYjdhMzQ1MmVkMCJ9	2018-03-26 20:16:46.787859+00
p8jq9xejensz7zgdbg7igk6kdx1iylly	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-03-27 16:59:49.064636+00
1guudeytvxl1ox4dc2dr3bmosyqgk87f	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-03-27 17:00:51.557692+00
xiho6wruabu7k4ovjt6taq5gi8e6cbtt	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-03-27 17:01:12.029367+00
jq610nf0epqphweqa88l6urqn4pmrhqf	YzBjMTRjZThmZjA2ZmVhMzAwOGM2YmY3ZDRlOGE1MzJlZjhiYTM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWU4MGVkM2RlOTc5MDlhMTAyMGQxM2M0MTgwMDhjZTM2NmQ2YTBjNyJ9	2018-04-01 16:03:49.931927+00
\.


--
-- Data for Name: oc_server_baseprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_baseprofile (id, user_id) FROM stdin;
1	3
2	4
3	5
4	6
5	7
6	8
7	9
8	10
9	11
10	12
11	13
12	14
13	15
15	17
16	18
17	19
18	20
19	21
21	23
22	24
23	25
20	22
24	26
25	27
14	16
26	28
\.


--
-- Data for Name: oc_server_baseprofile_completed_section_requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_baseprofile_completed_section_requirements (id, baseprofile_id, sectionrequirement_id) FROM stdin;
1	26	2
2	14	5
3	14	6
\.


--
-- Data for Name: oc_server_baseprofile_completed_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_baseprofile_completed_sections (id, baseprofile_id, section_id) FROM stdin;
1	14	1
2	14	2
3	14	4
4	14	5
5	1	1
6	1	2
7	14	3
8	16	1
9	16	2
10	16	3
11	17	5
12	17	4
13	19	3
14	20	1
15	21	1
16	21	3
17	21	4
18	22	1
19	23	1
20	23	2
21	23	3
22	23	4
23	20	2
24	23	5
25	20	3
26	23	6
27	20	4
28	23	7
29	20	5
30	26	1
31	26	3
32	26	2
33	26	4
34	14	6
35	14	7
36	14	11
\.


--
-- Data for Name: oc_server_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_course (id, name, author) FROM stdin;
1	Programming Basics with Python	Donny Lawrence
\.


--
-- Data for Name: oc_server_draggable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_draggable (id, "codeName", "descName", "descText", code, course_id) FROM stdin;
1	print	function	Outputs text to the screen.	print(output)	1
2	variable		Creates a named variable, similar to a variable that you would see in algebra.	variable name = contents of variable	1
3	function		A reusable block of code, that takes some input and gives some output as a result.	def function_name(arguments):	1
\.


--
-- Data for Name: oc_server_draggable_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_draggable_sections (id, draggable_id, section_id) FROM stdin;
1	1	3
4	1	6
5	2	6
6	3	12
7	1	12
\.


--
-- Data for Name: oc_server_draggabletextfield; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_draggabletextfield (id, "startChar", "endChar", "placeholderText", draggable_id, "lineNumber") FROM stdin;
2	0	12	variable name	2	0
1	6	11	output	1	0
3	16	35	contents of variable	2	0
\.


--
-- Data for Name: oc_server_feedbacksubmission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_feedbacksubmission (id, message, user_id, date) FROM stdin;
1	vefefewf	14	2018-02-20 16:26:53.55027+00
2	course content and is subject to change. (no comma before and there)	21	2018-02-27 01:27:29.033933+00
3	Having trouble dragging the variable draggable to the screen	21	2018-02-27 01:41:53.348076+00
4	This is awesome!  Love it.  You're right, conceptually it is solid, but I don't think there are as many rough edges as you prepared me for.  \r\n\r\nI got stuck a little on where to put "Hello World".  Wasn't clear to me to put it inside the ( ). But after a couple of misplaced attempts, which BTW you handled the error very nicely, I finally figured out to put it in the (  ).\r\n\r\nSo maybe a little more guidance here.	22	2018-02-27 02:16:58.634888+00
5	When I left you feedback, it logged me out when I hit 'submit'.  Should go back to editor.	22	2018-02-27 02:17:40.089183+00
6	Should leave a bookmark or some visual indicator of where you left off.	22	2018-02-27 02:18:28.122271+00
7	In lesson 2.2 and probably onwards, the case sensitivity is initally annoying. I know it becomes important for syntax later, but mentioning something about it in your instructions would be good and help stop a user's annoyance.	20	2018-02-27 02:54:30.85001+00
8	Error messages are going to be scary for people staring out. You might wanna bypass the generated error message and show something nicer for beginners.	20	2018-02-27 02:58:17.840984+00
9	in the first calc section - the blocks started to act weird - meaning the first var block seemed ok, the second one would not allow input	23	2018-02-27 02:58:35.471611+00
10	Bug: when adding two variable blocks on two subsequent lines, the second variable name box in unwritable.	20	2018-02-27 03:00:07.616808+00
11	When i opened it...I wasn't sure if I should "Start" lesson 1 or "Run".  I thought there might be a video explaining what I'm suppose to do if I hit the "run" button.  But obviously that wasn't correct.  So I proceeded to lesson 1.  I needed to exit and come back later to complete it...but was not sure how to exit.  Perhaps there should be a button to guide me.  Also - the very first page should include an "overview" that is more dominate .	24	2018-02-27 19:17:29.662465+00
12	Also menat to tell you how much I love the following:\r\n-you email invitation\r\n-the name of the program\r\n- the mission/goals of the program\r\n- this is something Im excited about personally and feel I can learn from	24	2018-02-27 19:20:14.310265+00
13	Section 3 states "It may seem pretty useless right now, but these are the roots of great things to come." This phrase is somewhat confusing as I the "it" is no the roots as it is one thing. This is really picky, but I thought I would mention it. I would probably change it to, "It may seem useless right now, but these basic concepts form the roots of great programs."	26	2018-03-01 00:22:54.764946+00
\.


--
-- Data for Name: oc_server_lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_lesson (id, name, number, course_id) FROM stdin;
1	Start	1	1
3	Introduction to Variables	3	1
4	Conversation with the Computer	4	1
2	Getting Something on the Screen	2	1
5	Modularization with Functions	5	1
7	Advanced String Usage	7	1
8	Loops	8	1
9	Storing Variables in Lists	9	1
10	Furthering Your Knowledge	10	1
6	Conditionals and Boolean Logic	6	1
\.


--
-- Data for Name: oc_server_section; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_section (id, name, number, text, lesson_id) FROM stdin;
4	Conclusion	3	If you’ve made it this far, then congratulations! You’ve successfully run your first program with real functionality. It may seem pretty useless right now, but these are the roots of great things to come.	2
2	Our First Program!	1	To start, we’ll write the quintessential computer program for beginners: Hello World. The program is simple: it simply outputs the text “Hello, World!” to the screen. There are a couple of ways to accomplish this, but with Python there is a very simple way to do it. Let’s get started!	2
3	Hello, World!	2	You may notice a block has appeared on the right sidebar. These are code blocks: the things that are going to help you grasp the basic concepts of software development before needing to get into the nitty gritty of the syntax of Python. Having to learn the syntax of a specific language while also learning the basics of computer science can be very difficult for a learner, and often causes them to quit out of frustration.\r\n\r\nGo ahead and drag the code block into the editor. This will insert the snippet of code needed to print something to the screen. You’ll also have an option to fill in a single parameter: the text to print. What we’re using here is called a function, similar to functions used in algebra and calculus, and we will go deeper into their inner workings in a later section. For now, though, all you need to worry about is that a function takes input, performs an operation of some kind, and then returns to the next line of your code.\r\n\r\nWhen filling in your text, "Hello, World!", you should be sure to use double quotes. This helps the interpreter differentiate between regular words and special keywords defined by either you or the language.\r\n\r\nIn this case though, all we have is the print function, so go ahead and press Run to see your results.	2
6	Adding Two Numbers	2	Now that you know how to assign to a variable, we can begin building our calculator.\r\n\r\nFor now, our calculator will be more like an adding machine. Given two variables, it will output the sum of them to the screen. This is simpler than it may sound; it only requires one new concept beyond what we know.\r\n\r\nGo ahead and create two variables that represent the numbers we want to add. Then, drag in the print function. In order to add two variables to each other, you use the `+` operator, like this: `first + second`.\r\n\r\nTry it out.	3
1	Why Learn to Program?	1	*Thank you for testing fluentcode. The following is still a draft of the actual course content, and is subject to change. Some content may be missing or broken. Please use the feedback button in the upper right corner if there is a grammatical error, something is broken/not appearing, or if you are still confused about by a certain topic after reading it (which means I can probably go into more detail on it).*\r\n\r\n# Welcome!\r\n\r\nWelcome to fluentcode! This site is designed to help you learn to program real world applications in a (hopefully) painless way. Software is taking over the world-- literally. In the coming years, it will be essential to know at least a little bit about software development. Even if you aren’t interested in mastering programming, it will still be helpful to know what’s going on when you’re inevitably confronted with some sort of problem that involves software.\r\n\r\nThis course teaches the scripting language Python, which is known as a great language for beginners to programming in general. First, however, you will learn the basics of programming using draggable blocks. After you get the hang of the logic behind the creation of software, the training wheels will be taken off, and you’ll learn the skills that will eventually be transferable to the real world.\r\n\r\nPress “Complete Section” to get started!	1
5	Getting Our Hands Dirty	1	Now that you know that we can tell the computer to do what we want, you can start delving into the basics of computer science. One of the most fundamental aspects of this is **variables**.\r\n\r\nYou may know variables from your high school algebra class; but in this case, variables can store much more complex values than just numbers. Think numbers, strings of text, objects… any type of data that you would want to store, pretty much. In this lesson, you’ll learn how to store two numbers into a variable and print the sum of the two numbers. It may sound complicated, but it’s easy in practice.\r\n\r\nBefore we get to our little calculator, though, let’s just learn the basics of assigning a variable. You assign a variable just like you do in algebra: the variable name, an equals sign, and the value of the variable. Notice that a new draggable has been added to the right section to make this process easier.\r\n\r\nUse the draggable to create a new variable that contains the same "Hello, World!" text we used in the previous lesson, and give it an appropriate name. Then, use the print function to output the variable to the string by referencing it with the name you gave it.\r\n\r\nThe use of double quotes is how the interpreter differentiates between regular strings of text and other important things, like variable names and language keywords. Because we want to print the *contents* of the variable, rather than the variable name itself, we shouldn't use double quotes when referencing the variable in the print statement.	3
7	Making the Calculator More Useful	1	The calculator we just built is pretty useful, but it seems pretty limited if we have to go in and edit our script. To build on the previous lesson, we’re going to make some text go the other way. As in, we’re gonna give some input to the computer, and the computer is going give us a result based on that input. \r\n\r\nLet’s get started!	4
12	Our First Function	2	Another new block! This one contains the template for creating a function. A function has a name, parameters (separated by commas), and then the function itself.\r\n\r\nThe name part is obvious: when you want to call your function, you use the name that you gave it!\r\n\r\nWe’re already familiar with parameters as well, even if you don’t realize it. We’ve been giving them to the `input` and `print` functions. From the function’s perspective, parameters are just variables that are used within the function to help it do its job. Every parameter you define will create a corresponding variable for when the function is called, which can be used when programming the function body.\r\n\r\nThe function body is where the meat of the function is. A function can do something simple, or it can be hundreds of lines of code long. The code that belongs to the function is denoted by the indentation of the code. When you want code to belong to a certain function, you indent every line of it below the definition. When the function is over, the code quits being indented. If you don’t indent your code properly, the interpreter will complain and will likely throw out an error.\r\n\r\nCreate a function and give it a name, but don’t give it parameters quite yet. The body of the function will be one line: a print function. Have the print function contain the text “Hello there!”	5
8	Accepting User Input	2	A few more blocks have appeared in the right sidebar. As you go through each lesson, the blocks will change depending on what you’re doing to help guide you along. There’s a button that allows you to access the rest of the blocks if you’d like. \r\n\r\nGo ahead and drag in the “input” block. This function has no parameters, just opening and closing parenthesis. Functions can take multiple parameters, or none at all; you’ll learn more about this later.\r\n\r\nThis function does, however, have an output. When we’re setting the variable equal to a function, we’re really setting the variable equal to the output of that function. So in this case, `input()` takes what the user types and puts it into the variable. After this line of code has been run, the variable you named will hold that value, and it can be manipulated just like any other variable.\r\n\r\nThis is a good time to test what you previously learned. Take the variable that contains the user’s input, and output it back to the screen. This will require you to give the print function the variable, and not just a string of text.	4
11	The Meat of Programming	1	Now is when we start to get into the fun stuff. Running a program is fine and all, but what if you need to something multiple times? After all, oftentimes the reason to create a script or application is to automate a repetitive task. This is where functions come in. \r\n\r\nWe’ve already used two of them: `input` and `print`, but now we’re going to learn to create our own.	5
13	Using Our Function	3	Now that the function is defined, we can use it. It’s used just like the other one’s we’ve used so far. Somewhere after the definition of the function, write the name of the function (with parentheses after it!)\r\n\r\nWhen you run this, you’re first giving the interpreter the definition of the function itself. After the interpreter knows this, you’ll be able to call it, which is what we’re doing below the function. This may not seem useful in this situation, but its uses will come out later.	5
14	A Sidenote About Functions	4	You may be asking yourself, “Why use parentheses if I’m not giving the function anything? Can’t I just leave them out?”. Well, you can leave them out, but it probably won’t have the effect that you want. As it turns out, functions are actually variables themselves. They can be manipulated like other variables can, and can even be passed to other functions when calling them (yes, you can give a function to another function).\r\n\r\nWhen using the name of the function without the parenthesis, you’re referring to the variable form of the function instead of actually calling it. For example, if you wrote this code:\r\n\r\n`myResult = input`\r\n\r\nyou would be setting `myResult` to the function `input` itself! This means you would be able to do `myResult()`, because you just set `myResult` to be the same as the `input` function.\r\n\r\nWhen you use parentheses, you’re saying that you want to run the function and then return the result to the variable. Running\r\n\r\n`myResult = input()`\r\n\r\nwould work as expected (the user input would be put into the variable `myResult`)\r\n\r\nIf that just flew over your head, don’t worry, it’s not too important at this point in your programming journey. Just remember, when you want to call a function, be sure to use parentheses after you write the name of it.	5
15	Adding Functions to the Calculator	5	Hey, it’s the calculator again! We’re going to put the calculator’s ability to add into its own function (mostly for organizational purposes at the moment). Start by creating a function and calling it `add`. Give it two parameters, one for each number. Now that you have the parameters, you should know how to write the function body.	5
16	The "if statement"	1	Let’s keep building on what we know! Functions are already pretty useful, but there are many more things to learn. One of these things is conditionals!\r\n\r\nSay you’re walking down a path, and you come across a person’s wallet. If you’re a good person, then you’ll try to find the wallet’s owner. If not, you’ll keep the money for yourself. This is how choices work in computing: something is either true, or false. There are keywords in Python for that embody the concept of something being true or false: `True` and `False` (Be sure to use capital “T” and “F”!).\r\n\r\nWe can tell the computer to evaluate if something is true or false. To do this, we use something called the `if` statement. Go ahead and drag out an if block.\r\n    \r\n`if` statements are relatively simple. You give it a conditional to evaluate, and it will make a decision on if it should run the code associated with it. Code is associated with an `if` statement just like they’re associated with functions: indentation. Any indented code under an `if` statement will be a part of that statement, and will only run if the conditional is satisfied.\r\n\r\nIn the if block you just dragged out, we’ll start with something simple: write in `True` as the conditional (skip the dropdown box for now). Indented under the if statement, print some string of text (it doesn’t matter what) and run it.	6
17	Is False True?	2	Running this code, the interpreter sees the `if` statement, and begins evaluating the conditional. In this case, it will ask itself: “Is `True` true?”. This may seem odd, but this is the way that the computer thinks (very rigidly). `True` is obviously true, but `True` is the embodiment of truth when it comes to the computer. As a result, our statement will print.\r\n\r\nNow, replace the `True` that you wrote with `False`, and run the code.\r\n\r\nThe interpreter sees the conditional and asks: “Is `False` true?”. Because `False` is the embodiment of something that is not true, the condition to run the code will not be satisfied, and the computer will skip over the block of code in the if statement. This is a rather silly `if` statement, because it will never run! (This is what we call dead code).	6
19	Diving Deeper	1	We’ve gotten pretty far! You can do quite a bit with what you’ve learned so far. For this lesson, we’re going to take a short detour from totally new concepts, and talk about something that is integral to most applications in the real world -- strings. A string is a collection of characters, which is something we’ve used extensively up to this point. Even in the first program we created, we passed the `print` function the string “Hello World!”. It may seem simple enough, but there are actually a lot of different facets to the string that are worth going over.\r\n\r\n`string` is one of the many “datatypes” in Python. A datatype (or type, for short) is literally the type of object a variable holds. A string is one of these. In Python, other types include `number`s, `list`s, `tuple`s, and more. Each type has specific functionality attached to it, and changes how the interpreter behaves in many cases. For example, adding two variables of type `number` will do something different than adding two `string`s together. Strings have many operations and functions specific to it, and we’re going to go over a few of them.	7
20	Hello, Computer	2	*WIP*	7
21	More String Tricks	3	*WIP*	7
23	The Fibonacci Sequence	2	*WIP*	8
24	Why Lists?	1	Up to this point, we’ve been creating individual variables for everything we want to store. This is fine for smaller-scale applications, but it can be tedious and impractical when trying to make something flexible. What if you have a group of people whose names you need to store, but you don’t know how many people there actually are when you write the program?\r\n\r\nThe usual way to solve this problem is with a list. It allows you to store a sequence of values inside of a single variable.	9
10	Applying the Knowledge	3	Now that you’ve done that, we can add onto our previous calculator. The calculator works, but you have to “hardcode” the numbers into the source code. That’s not ideal, because the person who wants to use the program will have to change it every time they want different numbers. \r\n\r\nNow that we know how to take user input, however, we can ask for the numbers to add instead of putting them straight into the script.\r\n\r\nReplace the variables we had that contained the numbers before with an input function each. Now you can type the number straight into the console. Input the first number, press enter, input the second number, then press enter again.	4
18	Applying Conditionals to our Calculator	3	Now that you know the jist of how an `if` statement works, we can start using it to make comparisons! Before we start though, we need to do some setup. Create a variable and store some user input inside of it first.\r\n\r\nBefore we give the calculator the two numbers we want to perform the calculation on, we should tell it what operation we want it to perform. `add`, `subtract`, `multiply`, and `divide` seem like good ones to start with.	6
25	Deciphering Our User Input	4	Create a new variable that will contain the operation we want to perform, filling it with `input()` like we did with the other numbers. Now, when you run the calculator, you will be able to put in the desired operation.\r\n\r\nGo ahead and drag out an `if` statement. First, let’s just get adding two numbers working. We want to check if the operation variable contains the word `add`, and if it does, we’ll add the two numbers. Type in the variable name into the variable box, select the appropriate operation (which is `==` in this case), then put `add` into the final box.\r\n\r\nWe can move the call to our addition function into the body of this `if` statement, so it will only run if we actually want to run something.	6
26	Creating a Default Action	5	Now, although we only support four functions, we are letting our user type anything into the operation input. We should probably add some default behavior for when the user types something in we don’t support. We can do this with an `else` statement, which was just added in with the rest of the draggables.\r\n\r\n`else` statements are a catch-all for anything that wasn’t fulfilled by an `if` statement, and because of this must be directly after the end of an `if` statement. You can never have an `else` statement hanging by itself.\r\n\r\nLet’s go ahead and add that default action. Drag out the `else` statement. For now, we’ll just print a friendly message that lets the user know that they typed in something wrong.	6
22	Repetition Is Key	1	Learning about strings makes what you’re about to learn much more useful. We’ve already learned how to create branching logic, but there’s something else we need to learn: how to do a single task multiple times. The most obvious use of this is doing something multiple times, but it’s also useful for mathematical operations, lists, and strings, as already mentioned.	8
\.


--
-- Data for Name: oc_server_sectionrequirement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_sectionrequirement (id, description, "unitTests", section_id) FROM stdin;
2	Print "Hello, World!"	def test(output, function, locals):\r\n    return output == "Hello, World!\\n"	3
3	Assign a variable containing "Hello, World!"	def test(output, function, locals):\r\n    for var in locals:\r\n        if locals[var] == 'Hello, World!':\r\n            return True\r\n    return False	5
4	Print "Hello, World!" again	def test(output, function, locals):\r\n    return output == "Hello, World!\\n"	5
5	Create two variables, each containing a number	def test(output, function, locals):\r\n    num_of_numbers = 0\r\n    for var in locals:\r\n        if type(locals[var]) == int:\r\n            num_of_numbers += 1\r\n    return num_of_numbers >= 2	6
6	Print the sum	def test(output, function, locals):\r\n    num_of_numbers = 0\r\n    first = 0\r\n    second = 0\r\n    for var in locals:\r\n        if type(locals[var]) == int:\r\n            if num_of_numbers == 0:\r\n                first = locals[var]\r\n            else:\r\n                second = locals[var]\r\n            num_of_numbers += 1\r\n        if num_of_numbers == 2:\r\n            break\r\n    print(str(first + second) + '\\n')\r\n    return output == str(first + second) + '\\n'	6
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 28, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 45, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 109, true);


--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_celery_results_taskresult_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 34, true);


--
-- Name: oc_server_baseprofile_completed_section_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_baseprofile_completed_section_requirements_id_seq', 3, true);


--
-- Name: oc_server_baseprofile_completed_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_baseprofile_completed_sections_id_seq', 36, true);


--
-- Name: oc_server_baseprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_baseprofile_id_seq', 26, true);


--
-- Name: oc_server_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_course_id_seq', 1, true);


--
-- Name: oc_server_draggable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_draggable_id_seq', 3, true);


--
-- Name: oc_server_draggable_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_draggable_sections_id_seq', 7, true);


--
-- Name: oc_server_draggabletextfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_draggabletextfield_id_seq', 3, true);


--
-- Name: oc_server_feedbacksubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_feedbacksubmission_id_seq', 13, true);


--
-- Name: oc_server_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_lesson_id_seq', 10, true);


--
-- Name: oc_server_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_section_id_seq', 26, true);


--
-- Name: oc_server_sectionrequirement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_sectionrequirement_id_seq', 6, true);


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
-- Name: oc_server_baseprofile_completed_section_requirements oc_server_baseprofile_co_baseprofile_id_sectionre_60e2be96_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_section_requirements
    ADD CONSTRAINT oc_server_baseprofile_co_baseprofile_id_sectionre_60e2be96_uniq UNIQUE (baseprofile_id, sectionrequirement_id);


--
-- Name: oc_server_baseprofile_completed_section_requirements oc_server_baseprofile_completed_section_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_section_requirements
    ADD CONSTRAINT oc_server_baseprofile_completed_section_requirements_pkey PRIMARY KEY (id);


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
-- Name: oc_server_baseprofile_comp_baseprofile_id_0b5d3118; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_baseprofile_comp_baseprofile_id_0b5d3118 ON oc_server_baseprofile_completed_section_requirements USING btree (baseprofile_id);


--
-- Name: oc_server_baseprofile_comp_baseprofile_id_a938e280; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_baseprofile_comp_baseprofile_id_a938e280 ON oc_server_baseprofile_completed_sections USING btree (baseprofile_id);


--
-- Name: oc_server_baseprofile_comp_sectionrequirement_id_2e88706b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_baseprofile_comp_sectionrequirement_id_2e88706b ON oc_server_baseprofile_completed_section_requirements USING btree (sectionrequirement_id);


--
-- Name: oc_server_baseprofile_completed_sections_section_id_338f7edd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_baseprofile_completed_sections_section_id_338f7edd ON oc_server_baseprofile_completed_sections USING btree (section_id);


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
-- Name: oc_server_baseprofile_completed_section_requirements oc_server_baseprofil_baseprofile_id_0b5d3118_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_section_requirements
    ADD CONSTRAINT oc_server_baseprofil_baseprofile_id_0b5d3118_fk_oc_server FOREIGN KEY (baseprofile_id) REFERENCES oc_server_baseprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_baseprofile_completed_sections oc_server_baseprofil_baseprofile_id_a938e280_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_sections
    ADD CONSTRAINT oc_server_baseprofil_baseprofile_id_a938e280_fk_oc_server FOREIGN KEY (baseprofile_id) REFERENCES oc_server_baseprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_baseprofile_completed_sections oc_server_baseprofil_section_id_338f7edd_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_sections
    ADD CONSTRAINT oc_server_baseprofil_section_id_338f7edd_fk_oc_server FOREIGN KEY (section_id) REFERENCES oc_server_section(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oc_server_baseprofile_completed_section_requirements oc_server_baseprofil_sectionrequirement_i_2e88706b_fk_oc_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oc_server_baseprofile_completed_section_requirements
    ADD CONSTRAINT oc_server_baseprofil_sectionrequirement_i_2e88706b_fk_oc_server FOREIGN KEY (sectionrequirement_id) REFERENCES oc_server_sectionrequirement(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


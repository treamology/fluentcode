toc.dat                                                                                             0000600 0004000 0002000 00000176456 13224031116 0014453 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       :                     v            oc_dev    9.6.6    9.6.6 �    �	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         �	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �	           1262    16384    oc_dev    DATABASE     x   CREATE DATABASE oc_dev WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE oc_dev;
             postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         �	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7         �	           0    0    public    ACL     &   GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                     3079    12427    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         �	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1         �            1259    16958 
   auth_group    TABLE     ^   CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    7         �            1259    16961    auth_group_id_seq    SEQUENCE     s   CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    185    7         �	           0    0    auth_group_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;
            public       postgres    false    186         �            1259    16963    auth_group_permissions    TABLE     �   CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    7         �            1259    16966    auth_group_permissions_id_seq    SEQUENCE        CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    187    7         �	           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;
            public       postgres    false    188         �            1259    16968    auth_permission    TABLE     �   CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    7         �            1259    16971    auth_permission_id_seq    SEQUENCE     x   CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    189    7         �	           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;
            public       postgres    false    190         �            1259    16973 	   auth_user    TABLE     �  CREATE TABLE auth_user (
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
    DROP TABLE public.auth_user;
       public         postgres    false    7         �            1259    16979    auth_user_groups    TABLE     x   CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false    7         �            1259    16982    auth_user_groups_id_seq    SEQUENCE     y   CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    192    7         �	           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;
            public       postgres    false    193         �            1259    16984    auth_user_id_seq    SEQUENCE     r   CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    7    191         �	           0    0    auth_user_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;
            public       postgres    false    194         �            1259    16986    auth_user_user_permissions    TABLE     �   CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false    7         �            1259    16989 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    7    195         �	           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;
            public       postgres    false    196         �            1259    16991    authtoken_token    TABLE     �   CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 #   DROP TABLE public.authtoken_token;
       public         postgres    false    7         �            1259    16994    django_admin_log    TABLE     �  CREATE TABLE django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         postgres    false    7         �            1259    17001    django_admin_log_id_seq    SEQUENCE     y   CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    198    7         �	           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;
            public       postgres    false    199         �            1259    17003     django_celery_results_taskresult    TABLE     �  CREATE TABLE django_celery_results_taskresult (
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
 4   DROP TABLE public.django_celery_results_taskresult;
       public         postgres    false    7         �            1259    17009 '   django_celery_results_taskresult_id_seq    SEQUENCE     �   CREATE SEQUENCE django_celery_results_taskresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.django_celery_results_taskresult_id_seq;
       public       postgres    false    7    200         �	           0    0 '   django_celery_results_taskresult_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE django_celery_results_taskresult_id_seq OWNED BY django_celery_results_taskresult.id;
            public       postgres    false    201         �            1259    17011    django_content_type    TABLE     �   CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    7         �            1259    17014    django_content_type_id_seq    SEQUENCE     |   CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    202    7         �	           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;
            public       postgres    false    203         �            1259    17016    django_migrations    TABLE     �   CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    7         �            1259    17022    django_migrations_id_seq    SEQUENCE     z   CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    204    7         �	           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;
            public       postgres    false    205         �            1259    17024    django_session    TABLE     �   CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    7         �            1259    17246    oc_server_baseprofile    TABLE     ^   CREATE TABLE oc_server_baseprofile (
    id integer NOT NULL,
    user_id integer NOT NULL
);
 )   DROP TABLE public.oc_server_baseprofile;
       public         postgres    false    7         �            1259    17256 (   oc_server_baseprofile_completed_sections    TABLE     �   CREATE TABLE oc_server_baseprofile_completed_sections (
    id integer NOT NULL,
    baseprofile_id integer NOT NULL,
    section_id integer NOT NULL
);
 <   DROP TABLE public.oc_server_baseprofile_completed_sections;
       public         postgres    false    7         �            1259    17254 /   oc_server_baseprofile_completed_sections_id_seq    SEQUENCE     �   CREATE SEQUENCE oc_server_baseprofile_completed_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.oc_server_baseprofile_completed_sections_id_seq;
       public       postgres    false    222    7         �	           0    0 /   oc_server_baseprofile_completed_sections_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE oc_server_baseprofile_completed_sections_id_seq OWNED BY oc_server_baseprofile_completed_sections.id;
            public       postgres    false    221         �            1259    17244    oc_server_baseprofile_id_seq    SEQUENCE     ~   CREATE SEQUENCE oc_server_baseprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.oc_server_baseprofile_id_seq;
       public       postgres    false    7    220         �	           0    0    oc_server_baseprofile_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE oc_server_baseprofile_id_seq OWNED BY oc_server_baseprofile.id;
            public       postgres    false    219         �            1259    17030    oc_server_course    TABLE     �   CREATE TABLE oc_server_course (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    author character varying(128) NOT NULL
);
 $   DROP TABLE public.oc_server_course;
       public         postgres    false    7         �            1259    17033    oc_server_course_id_seq    SEQUENCE     y   CREATE SEQUENCE oc_server_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.oc_server_course_id_seq;
       public       postgres    false    7    207         �	           0    0    oc_server_course_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE oc_server_course_id_seq OWNED BY oc_server_course.id;
            public       postgres    false    208         �            1259    17189    oc_server_draggable    TABLE     �   CREATE TABLE oc_server_draggable (
    id integer NOT NULL,
    "codeName" character varying(16) NOT NULL,
    "descName" character varying(16) NOT NULL,
    "descText" text NOT NULL,
    code text NOT NULL,
    course_id integer
);
 '   DROP TABLE public.oc_server_draggable;
       public         postgres    false    7         �            1259    17187    oc_server_draggable_id_seq    SEQUENCE     |   CREATE SEQUENCE oc_server_draggable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.oc_server_draggable_id_seq;
       public       postgres    false    214    7         �	           0    0    oc_server_draggable_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE oc_server_draggable_id_seq OWNED BY oc_server_draggable.id;
            public       postgres    false    213         �            1259    17200    oc_server_draggable_sections    TABLE     �   CREATE TABLE oc_server_draggable_sections (
    id integer NOT NULL,
    draggable_id integer NOT NULL,
    section_id integer NOT NULL
);
 0   DROP TABLE public.oc_server_draggable_sections;
       public         postgres    false    7         �            1259    17198 #   oc_server_draggable_sections_id_seq    SEQUENCE     �   CREATE SEQUENCE oc_server_draggable_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.oc_server_draggable_sections_id_seq;
       public       postgres    false    216    7         �	           0    0 #   oc_server_draggable_sections_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE oc_server_draggable_sections_id_seq OWNED BY oc_server_draggable_sections.id;
            public       postgres    false    215         �            1259    17035    oc_server_lesson    TABLE     �   CREATE TABLE oc_server_lesson (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    number integer NOT NULL,
    course_id integer
);
 $   DROP TABLE public.oc_server_lesson;
       public         postgres    false    7         �            1259    17038    oc_server_lesson_id_seq    SEQUENCE     y   CREATE SEQUENCE oc_server_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.oc_server_lesson_id_seq;
       public       postgres    false    7    209         �	           0    0    oc_server_lesson_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE oc_server_lesson_id_seq OWNED BY oc_server_lesson.id;
            public       postgres    false    210         �            1259    17040    oc_server_section    TABLE     �   CREATE TABLE oc_server_section (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    number integer NOT NULL,
    text text NOT NULL,
    lesson_id integer
);
 %   DROP TABLE public.oc_server_section;
       public         postgres    false    7         �            1259    17046    oc_server_section_id_seq    SEQUENCE     z   CREATE SEQUENCE oc_server_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.oc_server_section_id_seq;
       public       postgres    false    7    211         �	           0    0    oc_server_section_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE oc_server_section_id_seq OWNED BY oc_server_section.id;
            public       postgres    false    212         �            1259    17229    oc_server_sectionrequirement    TABLE     �   CREATE TABLE oc_server_sectionrequirement (
    id integer NOT NULL,
    description character varying(128) NOT NULL,
    "unitTests" text NOT NULL,
    section_id integer NOT NULL
);
 0   DROP TABLE public.oc_server_sectionrequirement;
       public         postgres    false    7         �            1259    17227 #   oc_server_sectionrequirement_id_seq    SEQUENCE     �   CREATE SEQUENCE oc_server_sectionrequirement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.oc_server_sectionrequirement_id_seq;
       public       postgres    false    7    218         �	           0    0 #   oc_server_sectionrequirement_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE oc_server_sectionrequirement_id_seq OWNED BY oc_server_sectionrequirement.id;
            public       postgres    false    217         m           2604    17048    auth_group id    DEFAULT     `   ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    185         n           2604    17049    auth_group_permissions id    DEFAULT     x   ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    188    187         o           2604    17050    auth_permission id    DEFAULT     j   ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    190    189         p           2604    17051    auth_user id    DEFAULT     ^   ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    194    191         q           2604    17052    auth_user_groups id    DEFAULT     l   ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    192         r           2604    17053    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    195         s           2604    17054    django_admin_log id    DEFAULT     l   ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198         u           2604    17055 #   django_celery_results_taskresult id    DEFAULT     �   ALTER TABLE ONLY django_celery_results_taskresult ALTER COLUMN id SET DEFAULT nextval('django_celery_results_taskresult_id_seq'::regclass);
 R   ALTER TABLE public.django_celery_results_taskresult ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200         v           2604    17056    django_content_type id    DEFAULT     r   ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202         w           2604    17057    django_migrations id    DEFAULT     n   ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204         ~           2604    17249    oc_server_baseprofile id    DEFAULT     v   ALTER TABLE ONLY oc_server_baseprofile ALTER COLUMN id SET DEFAULT nextval('oc_server_baseprofile_id_seq'::regclass);
 G   ALTER TABLE public.oc_server_baseprofile ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    220    220                    2604    17259 +   oc_server_baseprofile_completed_sections id    DEFAULT     �   ALTER TABLE ONLY oc_server_baseprofile_completed_sections ALTER COLUMN id SET DEFAULT nextval('oc_server_baseprofile_completed_sections_id_seq'::regclass);
 Z   ALTER TABLE public.oc_server_baseprofile_completed_sections ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    221    222    222         x           2604    17058    oc_server_course id    DEFAULT     l   ALTER TABLE ONLY oc_server_course ALTER COLUMN id SET DEFAULT nextval('oc_server_course_id_seq'::regclass);
 B   ALTER TABLE public.oc_server_course ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    207         {           2604    17192    oc_server_draggable id    DEFAULT     r   ALTER TABLE ONLY oc_server_draggable ALTER COLUMN id SET DEFAULT nextval('oc_server_draggable_id_seq'::regclass);
 E   ALTER TABLE public.oc_server_draggable ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    214    214         |           2604    17203    oc_server_draggable_sections id    DEFAULT     �   ALTER TABLE ONLY oc_server_draggable_sections ALTER COLUMN id SET DEFAULT nextval('oc_server_draggable_sections_id_seq'::regclass);
 N   ALTER TABLE public.oc_server_draggable_sections ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    216    215    216         y           2604    17059    oc_server_lesson id    DEFAULT     l   ALTER TABLE ONLY oc_server_lesson ALTER COLUMN id SET DEFAULT nextval('oc_server_lesson_id_seq'::regclass);
 B   ALTER TABLE public.oc_server_lesson ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    209         z           2604    17060    oc_server_section id    DEFAULT     n   ALTER TABLE ONLY oc_server_section ALTER COLUMN id SET DEFAULT nextval('oc_server_section_id_seq'::regclass);
 C   ALTER TABLE public.oc_server_section ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    211         }           2604    17232    oc_server_sectionrequirement id    DEFAULT     �   ALTER TABLE ONLY oc_server_sectionrequirement ALTER COLUMN id SET DEFAULT nextval('oc_server_sectionrequirement_id_seq'::regclass);
 N   ALTER TABLE public.oc_server_sectionrequirement ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    218    218         `	          0    16958 
   auth_group 
   TABLE DATA               '   COPY auth_group (id, name) FROM stdin;
    public       postgres    false    185       2400.dat �	           0    0    auth_group_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('auth_group_id_seq', 1, false);
            public       postgres    false    186         b	          0    16963    auth_group_permissions 
   TABLE DATA               F   COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    187       2402.dat �	           0    0    auth_group_permissions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);
            public       postgres    false    188         d	          0    16968    auth_permission 
   TABLE DATA               G   COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    189       2404.dat �	           0    0    auth_permission_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('auth_permission_id_seq', 42, true);
            public       postgres    false    190         f	          0    16973 	   auth_user 
   TABLE DATA               �   COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    191       2406.dat g	          0    16979    auth_user_groups 
   TABLE DATA               :   COPY auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    192       2407.dat �	           0    0    auth_user_groups_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);
            public       postgres    false    193         �	           0    0    auth_user_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('auth_user_id_seq', 2, true);
            public       postgres    false    194         j	          0    16986    auth_user_user_permissions 
   TABLE DATA               I   COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    195       2410.dat �	           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    196         l	          0    16991    authtoken_token 
   TABLE DATA               9   COPY authtoken_token (key, created, user_id) FROM stdin;
    public       postgres    false    197       2412.dat m	          0    16994    django_admin_log 
   TABLE DATA               �   COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    198       2413.dat �	           0    0    django_admin_log_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('django_admin_log_id_seq', 19, true);
            public       postgres    false    199         o	          0    17003     django_celery_results_taskresult 
   TABLE DATA               �   COPY django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, hidden, meta) FROM stdin;
    public       postgres    false    200       2415.dat �	           0    0 '   django_celery_results_taskresult_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('django_celery_results_taskresult_id_seq', 1, false);
            public       postgres    false    201         q	          0    17011    django_content_type 
   TABLE DATA               <   COPY django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    202       2417.dat �	           0    0    django_content_type_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('django_content_type_id_seq', 14, true);
            public       postgres    false    203         s	          0    17016    django_migrations 
   TABLE DATA               <   COPY django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    204       2419.dat �	           0    0    django_migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('django_migrations_id_seq', 23, true);
            public       postgres    false    205         u	          0    17024    django_session 
   TABLE DATA               I   COPY django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    206       2421.dat �	          0    17246    oc_server_baseprofile 
   TABLE DATA               5   COPY oc_server_baseprofile (id, user_id) FROM stdin;
    public       postgres    false    220       2435.dat �	          0    17256 (   oc_server_baseprofile_completed_sections 
   TABLE DATA               [   COPY oc_server_baseprofile_completed_sections (id, baseprofile_id, section_id) FROM stdin;
    public       postgres    false    222       2437.dat �	           0    0 /   oc_server_baseprofile_completed_sections_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('oc_server_baseprofile_completed_sections_id_seq', 1, false);
            public       postgres    false    221         �	           0    0    oc_server_baseprofile_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('oc_server_baseprofile_id_seq', 1, false);
            public       postgres    false    219         v	          0    17030    oc_server_course 
   TABLE DATA               5   COPY oc_server_course (id, name, author) FROM stdin;
    public       postgres    false    207       2422.dat �	           0    0    oc_server_course_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('oc_server_course_id_seq', 1, true);
            public       postgres    false    208         }	          0    17189    oc_server_draggable 
   TABLE DATA               _   COPY oc_server_draggable (id, "codeName", "descName", "descText", code, course_id) FROM stdin;
    public       postgres    false    214       2429.dat �	           0    0    oc_server_draggable_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('oc_server_draggable_id_seq', 1, true);
            public       postgres    false    213         	          0    17200    oc_server_draggable_sections 
   TABLE DATA               M   COPY oc_server_draggable_sections (id, draggable_id, section_id) FROM stdin;
    public       postgres    false    216       2431.dat �	           0    0 #   oc_server_draggable_sections_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('oc_server_draggable_sections_id_seq', 1, true);
            public       postgres    false    215         x	          0    17035    oc_server_lesson 
   TABLE DATA               @   COPY oc_server_lesson (id, name, number, course_id) FROM stdin;
    public       postgres    false    209       2424.dat �	           0    0    oc_server_lesson_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('oc_server_lesson_id_seq', 2, true);
            public       postgres    false    210         z	          0    17040    oc_server_section 
   TABLE DATA               G   COPY oc_server_section (id, name, number, text, lesson_id) FROM stdin;
    public       postgres    false    211       2426.dat �	           0    0    oc_server_section_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('oc_server_section_id_seq', 3, true);
            public       postgres    false    212         �	          0    17229    oc_server_sectionrequirement 
   TABLE DATA               Y   COPY oc_server_sectionrequirement (id, description, "unitTests", section_id) FROM stdin;
    public       postgres    false    218       2433.dat �	           0    0 #   oc_server_sectionrequirement_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('oc_server_sectionrequirement_id_seq', 1, true);
            public       postgres    false    217         �           2606    17062    auth_group auth_group_name_key 
   CONSTRAINT     R   ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    185    185         �           2606    17064 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    187    187    187         �           2606    17066 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    187    187         �           2606    17068    auth_group auth_group_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    185    185         �           2606    17070 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    189    189    189         �           2606    17072 $   auth_permission auth_permission_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    189    189         �           2606    17074 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    192    192         �           2606    17076 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    192    192    192         �           2606    17078    auth_user auth_user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    191    191         �           2606    17080 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    195    195         �           2606    17082 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    195    195    195         �           2606    17084     auth_user auth_user_username_key 
   CONSTRAINT     X   ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    191    191         �           2606    17086 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 N   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       public         postgres    false    197    197         �           2606    17088 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     b   ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       public         postgres    false    197    197         �           2606    17090 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    198    198         �           2606    17092 F   django_celery_results_taskresult django_celery_results_taskresult_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.django_celery_results_taskresult DROP CONSTRAINT django_celery_results_taskresult_pkey;
       public         postgres    false    200    200         �           2606    17094 M   django_celery_results_taskresult django_celery_results_taskresult_task_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_task_id_key UNIQUE (task_id);
 w   ALTER TABLE ONLY public.django_celery_results_taskresult DROP CONSTRAINT django_celery_results_taskresult_task_id_key;
       public         postgres    false    200    200         �           2606    17096 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    202    202    202         �           2606    17098 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    202    202         �           2606    17100 (   django_migrations django_migrations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    204    204         �           2606    17102 "   django_session django_session_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    206    206         �           2606    17278 h   oc_server_baseprofile_completed_sections oc_server_baseprofile_co_baseprofile_id_section_i_8328f6db_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY oc_server_baseprofile_completed_sections
    ADD CONSTRAINT oc_server_baseprofile_co_baseprofile_id_section_i_8328f6db_uniq UNIQUE (baseprofile_id, section_id);
 �   ALTER TABLE ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT oc_server_baseprofile_co_baseprofile_id_section_i_8328f6db_uniq;
       public         postgres    false    222    222    222         �           2606    17261 V   oc_server_baseprofile_completed_sections oc_server_baseprofile_completed_sections_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY oc_server_baseprofile_completed_sections
    ADD CONSTRAINT oc_server_baseprofile_completed_sections_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT oc_server_baseprofile_completed_sections_pkey;
       public         postgres    false    222    222         �           2606    17251 0   oc_server_baseprofile oc_server_baseprofile_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY oc_server_baseprofile
    ADD CONSTRAINT oc_server_baseprofile_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.oc_server_baseprofile DROP CONSTRAINT oc_server_baseprofile_pkey;
       public         postgres    false    220    220         �           2606    17253 7   oc_server_baseprofile oc_server_baseprofile_user_id_key 
   CONSTRAINT     n   ALTER TABLE ONLY oc_server_baseprofile
    ADD CONSTRAINT oc_server_baseprofile_user_id_key UNIQUE (user_id);
 a   ALTER TABLE ONLY public.oc_server_baseprofile DROP CONSTRAINT oc_server_baseprofile_user_id_key;
       public         postgres    false    220    220         �           2606    17104 &   oc_server_course oc_server_course_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY oc_server_course
    ADD CONSTRAINT oc_server_course_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.oc_server_course DROP CONSTRAINT oc_server_course_pkey;
       public         postgres    false    207    207         �           2606    17197 ,   oc_server_draggable oc_server_draggable_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY oc_server_draggable
    ADD CONSTRAINT oc_server_draggable_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.oc_server_draggable DROP CONSTRAINT oc_server_draggable_pkey;
       public         postgres    false    214    214         �           2606    17223 [   oc_server_draggable_sections oc_server_draggable_sect_draggable_id_section_id_c795545f_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY oc_server_draggable_sections
    ADD CONSTRAINT oc_server_draggable_sect_draggable_id_section_id_c795545f_uniq UNIQUE (draggable_id, section_id);
 �   ALTER TABLE ONLY public.oc_server_draggable_sections DROP CONSTRAINT oc_server_draggable_sect_draggable_id_section_id_c795545f_uniq;
       public         postgres    false    216    216    216         �           2606    17205 >   oc_server_draggable_sections oc_server_draggable_sections_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY oc_server_draggable_sections
    ADD CONSTRAINT oc_server_draggable_sections_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.oc_server_draggable_sections DROP CONSTRAINT oc_server_draggable_sections_pkey;
       public         postgres    false    216    216         �           2606    17106 &   oc_server_lesson oc_server_lesson_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY oc_server_lesson
    ADD CONSTRAINT oc_server_lesson_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.oc_server_lesson DROP CONSTRAINT oc_server_lesson_pkey;
       public         postgres    false    209    209         �           2606    17108 (   oc_server_section oc_server_section_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY oc_server_section
    ADD CONSTRAINT oc_server_section_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.oc_server_section DROP CONSTRAINT oc_server_section_pkey;
       public         postgres    false    211    211         �           2606    17237 >   oc_server_sectionrequirement oc_server_sectionrequirement_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY oc_server_sectionrequirement
    ADD CONSTRAINT oc_server_sectionrequirement_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.oc_server_sectionrequirement DROP CONSTRAINT oc_server_sectionrequirement_pkey;
       public         postgres    false    218    218         �           1259    17109    auth_group_name_a6ea08ec_like    INDEX     a   CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    185         �           1259    17110 (   auth_group_permissions_group_id_b120cbf9    INDEX     h   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    187         �           1259    17111 -   auth_group_permissions_permission_id_84c5c92e    INDEX     r   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    187         �           1259    17112 (   auth_permission_content_type_id_2f476e4b    INDEX     h   CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    189         �           1259    17113 "   auth_user_groups_group_id_97559544    INDEX     \   CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    192         �           1259    17114 !   auth_user_groups_user_id_6a12ed8b    INDEX     Z   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    192         �           1259    17115 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     z   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    195         �           1259    17116 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     n   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    195         �           1259    17117     auth_user_username_6821ab7c_like    INDEX     g   CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    191         �           1259    17118 !   authtoken_token_key_10f0b77e_like    INDEX     i   CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);
 5   DROP INDEX public.authtoken_token_key_10f0b77e_like;
       public         postgres    false    197         �           1259    17119 )   django_admin_log_content_type_id_c4bce8eb    INDEX     j   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    198         �           1259    17120 !   django_admin_log_user_id_c564eba6    INDEX     Z   CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    198         �           1259    17121 0   django_celery_results_taskresult_hidden_cd77412f    INDEX     x   CREATE INDEX django_celery_results_taskresult_hidden_cd77412f ON django_celery_results_taskresult USING btree (hidden);
 D   DROP INDEX public.django_celery_results_taskresult_hidden_cd77412f;
       public         postgres    false    200         �           1259    17122 6   django_celery_results_taskresult_task_id_de0d95bf_like    INDEX     �   CREATE INDEX django_celery_results_taskresult_task_id_de0d95bf_like ON django_celery_results_taskresult USING btree (task_id varchar_pattern_ops);
 J   DROP INDEX public.django_celery_results_taskresult_task_id_de0d95bf_like;
       public         postgres    false    200         �           1259    17123 #   django_session_expire_date_a5c62663    INDEX     ^   CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    206         �           1259    17124 (   django_session_session_key_c0390e0f_like    INDEX     w   CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    206         �           1259    17279 2   oc_server_baseprofile_comp_baseprofile_id_a938e280    INDEX     �   CREATE INDEX oc_server_baseprofile_comp_baseprofile_id_a938e280 ON oc_server_baseprofile_completed_sections USING btree (baseprofile_id);
 F   DROP INDEX public.oc_server_baseprofile_comp_baseprofile_id_a938e280;
       public         postgres    false    222         �           1259    17280 <   oc_server_baseprofile_completed_sections_section_id_338f7edd    INDEX     �   CREATE INDEX oc_server_baseprofile_completed_sections_section_id_338f7edd ON oc_server_baseprofile_completed_sections USING btree (section_id);
 P   DROP INDEX public.oc_server_baseprofile_completed_sections_section_id_338f7edd;
       public         postgres    false    222         �           1259    17211 &   oc_server_draggable_course_id_a83f6035    INDEX     d   CREATE INDEX oc_server_draggable_course_id_a83f6035 ON oc_server_draggable USING btree (course_id);
 :   DROP INDEX public.oc_server_draggable_course_id_a83f6035;
       public         postgres    false    214         �           1259    17224 2   oc_server_draggable_sections_draggable_id_a075ac8d    INDEX     |   CREATE INDEX oc_server_draggable_sections_draggable_id_a075ac8d ON oc_server_draggable_sections USING btree (draggable_id);
 F   DROP INDEX public.oc_server_draggable_sections_draggable_id_a075ac8d;
       public         postgres    false    216         �           1259    17225 0   oc_server_draggable_sections_section_id_b9720c22    INDEX     x   CREATE INDEX oc_server_draggable_sections_section_id_b9720c22 ON oc_server_draggable_sections USING btree (section_id);
 D   DROP INDEX public.oc_server_draggable_sections_section_id_b9720c22;
       public         postgres    false    216         �           1259    17125 #   oc_server_lesson_course_id_e2a3fb9d    INDEX     ^   CREATE INDEX oc_server_lesson_course_id_e2a3fb9d ON oc_server_lesson USING btree (course_id);
 7   DROP INDEX public.oc_server_lesson_course_id_e2a3fb9d;
       public         postgres    false    209         �           1259    17126 $   oc_server_section_lesson_id_8dce139a    INDEX     `   CREATE INDEX oc_server_section_lesson_id_8dce139a ON oc_server_section USING btree (lesson_id);
 8   DROP INDEX public.oc_server_section_lesson_id_8dce139a;
       public         postgres    false    211         �           1259    17243 0   oc_server_sectionrequirement_section_id_9ee0a523    INDEX     x   CREATE INDEX oc_server_sectionrequirement_section_id_9ee0a523 ON oc_server_sectionrequirement USING btree (section_id);
 D   DROP INDEX public.oc_server_sectionrequirement_section_id_9ee0a523;
       public         postgres    false    218         �           2606    17127 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    189    2191    187         �           2606    17132 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    2180    185    187         �           2606    17137 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    189    202    2227         �           2606    17142 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    192    185    2180         �           2606    17147 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    191    2193    192         �           2606    17152 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    2191    195    189         �           2606    17157 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    195    191    2193         �           2606    17162 @   authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id;
       public       postgres    false    191    197    2193         �           2606    17167 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    2227    198    202         �           2606    17172 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    198    191    2193         �           2606    17267 b   oc_server_baseprofile_completed_sections oc_server_baseprofil_baseprofile_id_a938e280_fk_oc_server    FK CONSTRAINT     �   ALTER TABLE ONLY oc_server_baseprofile_completed_sections
    ADD CONSTRAINT oc_server_baseprofil_baseprofile_id_a938e280_fk_oc_server FOREIGN KEY (baseprofile_id) REFERENCES oc_server_baseprofile(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT oc_server_baseprofil_baseprofile_id_a938e280_fk_oc_server;
       public       postgres    false    222    220    2255         �           2606    17272 ^   oc_server_baseprofile_completed_sections oc_server_baseprofil_section_id_338f7edd_fk_oc_server    FK CONSTRAINT     �   ALTER TABLE ONLY oc_server_baseprofile_completed_sections
    ADD CONSTRAINT oc_server_baseprofil_section_id_338f7edd_fk_oc_server FOREIGN KEY (section_id) REFERENCES oc_server_section(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT oc_server_baseprofil_section_id_338f7edd_fk_oc_server;
       public       postgres    false    222    2241    211         �           2606    17262 L   oc_server_baseprofile oc_server_baseprofile_user_id_797255e2_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY oc_server_baseprofile
    ADD CONSTRAINT oc_server_baseprofile_user_id_797255e2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.oc_server_baseprofile DROP CONSTRAINT oc_server_baseprofile_user_id_797255e2_fk_auth_user_id;
       public       postgres    false    2193    191    220         �           2606    17212 T   oc_server_draggable_sections oc_server_draggable__draggable_id_a075ac8d_fk_oc_server    FK CONSTRAINT     �   ALTER TABLE ONLY oc_server_draggable_sections
    ADD CONSTRAINT oc_server_draggable__draggable_id_a075ac8d_fk_oc_server FOREIGN KEY (draggable_id) REFERENCES oc_server_draggable(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.oc_server_draggable_sections DROP CONSTRAINT oc_server_draggable__draggable_id_a075ac8d_fk_oc_server;
       public       postgres    false    214    2244    216         �           2606    17217 R   oc_server_draggable_sections oc_server_draggable__section_id_b9720c22_fk_oc_server    FK CONSTRAINT     �   ALTER TABLE ONLY oc_server_draggable_sections
    ADD CONSTRAINT oc_server_draggable__section_id_b9720c22_fk_oc_server FOREIGN KEY (section_id) REFERENCES oc_server_section(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.oc_server_draggable_sections DROP CONSTRAINT oc_server_draggable__section_id_b9720c22_fk_oc_server;
       public       postgres    false    2241    211    216         �           2606    17206 Q   oc_server_draggable oc_server_draggable_course_id_a83f6035_fk_oc_server_course_id    FK CONSTRAINT     �   ALTER TABLE ONLY oc_server_draggable
    ADD CONSTRAINT oc_server_draggable_course_id_a83f6035_fk_oc_server_course_id FOREIGN KEY (course_id) REFERENCES oc_server_course(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.oc_server_draggable DROP CONSTRAINT oc_server_draggable_course_id_a83f6035_fk_oc_server_course_id;
       public       postgres    false    214    207    2235         �           2606    17177 K   oc_server_lesson oc_server_lesson_course_id_e2a3fb9d_fk_oc_server_course_id    FK CONSTRAINT     �   ALTER TABLE ONLY oc_server_lesson
    ADD CONSTRAINT oc_server_lesson_course_id_e2a3fb9d_fk_oc_server_course_id FOREIGN KEY (course_id) REFERENCES oc_server_course(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.oc_server_lesson DROP CONSTRAINT oc_server_lesson_course_id_e2a3fb9d_fk_oc_server_course_id;
       public       postgres    false    2235    207    209         �           2606    17182 M   oc_server_section oc_server_section_lesson_id_8dce139a_fk_oc_server_lesson_id    FK CONSTRAINT     �   ALTER TABLE ONLY oc_server_section
    ADD CONSTRAINT oc_server_section_lesson_id_8dce139a_fk_oc_server_lesson_id FOREIGN KEY (lesson_id) REFERENCES oc_server_lesson(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.oc_server_section DROP CONSTRAINT oc_server_section_lesson_id_8dce139a_fk_oc_server_lesson_id;
       public       postgres    false    211    2238    209         �           2606    17238 R   oc_server_sectionrequirement oc_server_sectionreq_section_id_9ee0a523_fk_oc_server    FK CONSTRAINT     �   ALTER TABLE ONLY oc_server_sectionrequirement
    ADD CONSTRAINT oc_server_sectionreq_section_id_9ee0a523_fk_oc_server FOREIGN KEY (section_id) REFERENCES oc_server_section(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.oc_server_sectionrequirement DROP CONSTRAINT oc_server_sectionreq_section_id_9ee0a523_fk_oc_server;
       public       postgres    false    218    2241    211                                                                                                                                                                                                                          2400.dat                                                                                            0000600 0004000 0002000 00000000005 13224031116 0014223 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2402.dat                                                                                            0000600 0004000 0002000 00000000005 13224031116 0014225 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2404.dat                                                                                            0000600 0004000 0002000 00000003236 13224031116 0014240 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Can add log entry	1	add_logentry
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
\.


                                                                                                                                                                                                                                                                                                                                                                  2406.dat                                                                                            0000600 0004000 0002000 00000000445 13224031116 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	pbkdf2_sha256$36000$UMS5yPC3B0iS$Wy4DWajvB0zC8diI10oUp783GsfG6oQNcmuT1rEyWok=	\N	f	testuser				f	t	2017-11-20 08:23:09.531146-06
1	pbkdf2_sha256$36000$f6NM5KhbDliC$JE6AkWXFYUvl9VTTsfmOiT7vhf2NmVtTi+U+5UAnJps=	2017-12-23 14:50:36.198281-06	t	treamous				t	t	2017-07-27 11:48:21.01212-05
\.


                                                                                                                                                                                                                           2407.dat                                                                                            0000600 0004000 0002000 00000000005 13224031116 0014232 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2410.dat                                                                                            0000600 0004000 0002000 00000000005 13224031116 0014224 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2412.dat                                                                                            0000600 0004000 0002000 00000000227 13224031116 0014234 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        67a3aa26240ecc165096e7ae5bc7f0ba3fc55ad3	2017-11-13 13:22:14.251257-06	1
155cc3282e8fff962164deaefc7a7edb08fac55f	2017-11-20 08:23:38.758817-06	2
\.


                                                                                                                                                                                                                                                                                                                                                                         2413.dat                                                                                            0000600 0004000 0002000 00000003442 13224031116 0014237 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2017-11-26 16:57:55.588314-06	1	Section object	1	[{"added": {}}]	11	1
2	2017-11-26 16:58:11.540031-06	1	Lesson object	1	[{"added": {}}]	10	1
3	2017-11-26 16:58:19.190191-06	1	Course object	1	[{"added": {}}]	9	1
4	2017-11-26 17:25:07.036295-06	1	Start	2	[{"changed": {"fields": ["course"]}}]	10	1
5	2017-11-26 17:26:28.072652-06	1	Section object	2	[{"changed": {"fields": ["text", "sections"]}}]	11	1
6	2017-12-07 18:01:19.412327-06	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["lesson"]}}]	11	1
7	2017-12-11 08:43:48.857014-06	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
8	2017-12-23 14:52:38.383533-06	1	if statement from Programming Basics with Python by Donny Lawrence	1	[{"added": {}}]	12	1
9	2017-12-23 15:42:38.861519-06	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
10	2017-12-23 15:44:51.732329-06	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
11	2017-12-23 15:47:39.889543-06	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
12	2017-12-23 15:52:48.716706-06	1	Section 1: Why Learn to Program?	2	[{"changed": {"fields": ["text"]}}]	11	1
13	2017-12-25 18:30:54.239495-06	1	Section Requirement	1	[{"added": {}}]	13	1
14	2017-12-30 19:16:20.905897-06	1	Section Requirement	2	[{"changed": {"fields": ["unitTests"]}}]	13	1
15	2017-12-30 19:17:02.065654-06	1	Section Requirement	2	[{"changed": {"fields": ["unitTests"]}}]	13	1
16	2017-12-31 12:41:48.742842-06	1	Section Requirement	2	[{"changed": {"fields": ["unitTests"]}}]	13	1
17	2018-01-02 18:11:56.047027-06	2	Section 2: Another Test	1	[{"added": {}}]	11	1
18	2018-01-02 18:53:08.851679-06	2	Lesson 2: Second Lesson	1	[{"added": {}}]	10	1
19	2018-01-02 18:53:10.521083-06	3	Section 1: Blah Blah	1	[{"added": {}}]	11	1
\.


                                                                                                                                                                                                                              2415.dat                                                                                            0000600 0004000 0002000 00000000005 13224031116 0014231 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2417.dat                                                                                            0000600 0004000 0002000 00000000460 13224031116 0014240 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	admin	logentry
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
\.


                                                                                                                                                                                                                2419.dat                                                                                            0000600 0004000 0002000 00000002727 13224031116 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	contenttypes	0001_initial	2017-07-02 13:51:31.913099-05
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
21	oc_server	0005_draggable	2017-12-23 14:49:56.878855-06
22	oc_server	0006_sectionrequirement	2017-12-25 18:29:42.218959-06
23	oc_server	0007_baseprofile	2017-12-30 17:49:41.156465-06
\.


                                         2421.dat                                                                                            0000600 0004000 0002000 00000002365 13224031116 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4hta0we4vyeq2cbx9nrgkujhbmzhxrm9	Njc2MjBiYjIwM2YyMjYyNDI5Y2E3NjE1MGM0Nzc4ODE3NTYyOWJiZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MjVlMDliNDk4ZTdlNmQzN2Q3NmQ0NDAzMTViOWZhODZhOGIyZjdiIn0=	2017-08-10 11:49:08.596476-05
8fsu5dd6csox44ujpdahfga5cnqlao4u	YzAyNzYwODViM2QxNWIyNGIxNmE2ZTdmNjA2MmJlODg3ZmRhMzE0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YmFjODFkMmQ3MGNiZDdmMjlmMjRjNjBiZjg2OGY3NzZmMmI2NDQ2In0=	2017-12-21 18:01:00.059458-06
zmf5629b22wb3h4ku37jfey64k2mfy2m	YzAyNzYwODViM2QxNWIyNGIxNmE2ZTdmNjA2MmJlODg3ZmRhMzE0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YmFjODFkMmQ3MGNiZDdmMjlmMjRjNjBiZjg2OGY3NzZmMmI2NDQ2In0=	2017-12-25 08:43:13.269852-06
ulcbveruk1oil2cmh8ajt5ay87wq36wt	YzAyNzYwODViM2QxNWIyNGIxNmE2ZTdmNjA2MmJlODg3ZmRhMzE0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YmFjODFkMmQ3MGNiZDdmMjlmMjRjNjBiZjg2OGY3NzZmMmI2NDQ2In0=	2018-01-06 14:50:36.200447-06
\.


                                                                                                                                                                                                                                                                           2435.dat                                                                                            0000600 0004000 0002000 00000000005 13224031116 0014233 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2437.dat                                                                                            0000600 0004000 0002000 00000000005 13224031116 0014235 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2422.dat                                                                                            0000600 0004000 0002000 00000000065 13224031116 0014235 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Programming Basics with Python	Donny Lawrence
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2429.dat                                                                                            0000600 0004000 0002000 00000000107 13224031116 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	if	statement	Something about an if statement.	if conditional:	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                         2431.dat                                                                                            0000600 0004000 0002000 00000000013 13224031116 0014226 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     2424.dat                                                                                            0000600 0004000 0002000 00000000045 13224031116 0014235 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Start	1	1
2	Second Lesson	2	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2426.dat                                                                                            0000600 0004000 0002000 00000002021 13224031116 0014233 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Why Learn to Program?	1	### Welcome!\r\n\r\nWelcome to fluentcode! This site is designed to help you learn to program real world applications in a (hopefully) painless way. Software is taking over the world-- literally. In the coming years, it will be essential to know at least a little bit about software development. Even if you aren’t interested in mastering programming, it will still be helpful to know what’s going on when you’re inevitably confronted with some sort of problem that involves software.\r\n\r\nThis course teaches the scripting language Python, which is known as a great language for beginners to programming in general. First, however, you will learn the basics of programming using draggable blocks. After you get the hang of the logic behind the creation of software, the training wheels will be taken off, and you’ll learn the skills that will eventually be transferable to the real world.\r\n\r\nPress “Next Section” to get started!	1
2	Another Test	2	Blah blah	1
3	Blah Blah	1	Something else	2
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               2433.dat                                                                                            0000600 0004000 0002000 00000000127 13224031116 0014236 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Hey, it's a requirement!	def test():\r\n    print("nope!")\r\n    return True	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                         restore.sql                                                                                         0000600 0004000 0002000 00000160567 13224031116 0015374 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.oc_server_sectionrequirement DROP CONSTRAINT oc_server_sectionreq_section_id_9ee0a523_fk_oc_server;
ALTER TABLE ONLY public.oc_server_section DROP CONSTRAINT oc_server_section_lesson_id_8dce139a_fk_oc_server_lesson_id;
ALTER TABLE ONLY public.oc_server_lesson DROP CONSTRAINT oc_server_lesson_course_id_e2a3fb9d_fk_oc_server_course_id;
ALTER TABLE ONLY public.oc_server_draggable DROP CONSTRAINT oc_server_draggable_course_id_a83f6035_fk_oc_server_course_id;
ALTER TABLE ONLY public.oc_server_draggable_sections DROP CONSTRAINT oc_server_draggable__section_id_b9720c22_fk_oc_server;
ALTER TABLE ONLY public.oc_server_draggable_sections DROP CONSTRAINT oc_server_draggable__draggable_id_a075ac8d_fk_oc_server;
ALTER TABLE ONLY public.oc_server_baseprofile DROP CONSTRAINT oc_server_baseprofile_user_id_797255e2_fk_auth_user_id;
ALTER TABLE ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT oc_server_baseprofil_section_id_338f7edd_fk_oc_server;
ALTER TABLE ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT oc_server_baseprofil_baseprofile_id_a938e280_fk_oc_server;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX public.oc_server_sectionrequirement_section_id_9ee0a523;
DROP INDEX public.oc_server_section_lesson_id_8dce139a;
DROP INDEX public.oc_server_lesson_course_id_e2a3fb9d;
DROP INDEX public.oc_server_draggable_sections_section_id_b9720c22;
DROP INDEX public.oc_server_draggable_sections_draggable_id_a075ac8d;
DROP INDEX public.oc_server_draggable_course_id_a83f6035;
DROP INDEX public.oc_server_baseprofile_completed_sections_section_id_338f7edd;
DROP INDEX public.oc_server_baseprofile_comp_baseprofile_id_a938e280;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_celery_results_taskresult_task_id_de0d95bf_like;
DROP INDEX public.django_celery_results_taskresult_hidden_cd77412f;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.authtoken_token_key_10f0b77e_like;
DROP INDEX public.auth_user_username_6821ab7c_like;
DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX public.auth_user_groups_group_id_97559544;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
ALTER TABLE ONLY public.oc_server_sectionrequirement DROP CONSTRAINT oc_server_sectionrequirement_pkey;
ALTER TABLE ONLY public.oc_server_section DROP CONSTRAINT oc_server_section_pkey;
ALTER TABLE ONLY public.oc_server_lesson DROP CONSTRAINT oc_server_lesson_pkey;
ALTER TABLE ONLY public.oc_server_draggable_sections DROP CONSTRAINT oc_server_draggable_sections_pkey;
ALTER TABLE ONLY public.oc_server_draggable_sections DROP CONSTRAINT oc_server_draggable_sect_draggable_id_section_id_c795545f_uniq;
ALTER TABLE ONLY public.oc_server_draggable DROP CONSTRAINT oc_server_draggable_pkey;
ALTER TABLE ONLY public.oc_server_course DROP CONSTRAINT oc_server_course_pkey;
ALTER TABLE ONLY public.oc_server_baseprofile DROP CONSTRAINT oc_server_baseprofile_user_id_key;
ALTER TABLE ONLY public.oc_server_baseprofile DROP CONSTRAINT oc_server_baseprofile_pkey;
ALTER TABLE ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT oc_server_baseprofile_completed_sections_pkey;
ALTER TABLE ONLY public.oc_server_baseprofile_completed_sections DROP CONSTRAINT oc_server_baseprofile_co_baseprofile_id_section_i_8328f6db_uniq;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_celery_results_taskresult DROP CONSTRAINT django_celery_results_taskresult_task_id_key;
ALTER TABLE ONLY public.django_celery_results_taskresult DROP CONSTRAINT django_celery_results_taskresult_pkey;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE public.oc_server_sectionrequirement ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.oc_server_section ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.oc_server_lesson ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.oc_server_draggable_sections ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.oc_server_draggable ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.oc_server_course ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.oc_server_baseprofile_completed_sections ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.oc_server_baseprofile ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_celery_results_taskresult ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.oc_server_sectionrequirement_id_seq;
DROP TABLE public.oc_server_sectionrequirement;
DROP SEQUENCE public.oc_server_section_id_seq;
DROP TABLE public.oc_server_section;
DROP SEQUENCE public.oc_server_lesson_id_seq;
DROP TABLE public.oc_server_lesson;
DROP SEQUENCE public.oc_server_draggable_sections_id_seq;
DROP TABLE public.oc_server_draggable_sections;
DROP SEQUENCE public.oc_server_draggable_id_seq;
DROP TABLE public.oc_server_draggable;
DROP SEQUENCE public.oc_server_course_id_seq;
DROP TABLE public.oc_server_course;
DROP SEQUENCE public.oc_server_baseprofile_id_seq;
DROP SEQUENCE public.oc_server_baseprofile_completed_sections_id_seq;
DROP TABLE public.oc_server_baseprofile_completed_sections;
DROP TABLE public.oc_server_baseprofile;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_migrations_id_seq;
DROP TABLE public.django_migrations;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_celery_results_taskresult_id_seq;
DROP TABLE public.django_celery_results_taskresult;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP TABLE public.authtoken_token;
DROP SEQUENCE public.auth_user_user_permissions_id_seq;
DROP TABLE public.auth_user_user_permissions;
DROP SEQUENCE public.auth_user_id_seq;
DROP SEQUENCE public.auth_user_groups_id_seq;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
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
    user_id integer NOT NULL
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
COPY auth_group (id, name) FROM '$$PATH$$/2400.dat';

--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.
COPY auth_group_permissions (id, group_id, permission_id) FROM '$$PATH$$/2402.dat';

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
\.
COPY auth_permission (id, name, content_type_id, codename) FROM '$$PATH$$/2404.dat';

--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 42, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.
COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM '$$PATH$$/2406.dat';

--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.
COPY auth_user_groups (id, user_id, group_id) FROM '$$PATH$$/2407.dat';

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.
COPY auth_user_user_permissions (id, user_id, permission_id) FROM '$$PATH$$/2410.dat';

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authtoken_token (key, created, user_id) FROM stdin;
\.
COPY authtoken_token (key, created, user_id) FROM '$$PATH$$/2412.dat';

--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.
COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM '$$PATH$$/2413.dat';

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 19, true);


--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, hidden, meta) FROM stdin;
\.
COPY django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, hidden, meta) FROM '$$PATH$$/2415.dat';

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_celery_results_taskresult_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
\.
COPY django_content_type (id, app_label, model) FROM '$$PATH$$/2417.dat';

--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 14, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
\.
COPY django_migrations (id, app, name, applied) FROM '$$PATH$$/2419.dat';

--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 23, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.
COPY django_session (session_key, session_data, expire_date) FROM '$$PATH$$/2421.dat';

--
-- Data for Name: oc_server_baseprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_baseprofile (id, user_id) FROM stdin;
\.
COPY oc_server_baseprofile (id, user_id) FROM '$$PATH$$/2435.dat';

--
-- Data for Name: oc_server_baseprofile_completed_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_baseprofile_completed_sections (id, baseprofile_id, section_id) FROM stdin;
\.
COPY oc_server_baseprofile_completed_sections (id, baseprofile_id, section_id) FROM '$$PATH$$/2437.dat';

--
-- Name: oc_server_baseprofile_completed_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_baseprofile_completed_sections_id_seq', 1, false);


--
-- Name: oc_server_baseprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_baseprofile_id_seq', 1, false);


--
-- Data for Name: oc_server_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_course (id, name, author) FROM stdin;
\.
COPY oc_server_course (id, name, author) FROM '$$PATH$$/2422.dat';

--
-- Name: oc_server_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_course_id_seq', 1, true);


--
-- Data for Name: oc_server_draggable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_draggable (id, "codeName", "descName", "descText", code, course_id) FROM stdin;
\.
COPY oc_server_draggable (id, "codeName", "descName", "descText", code, course_id) FROM '$$PATH$$/2429.dat';

--
-- Name: oc_server_draggable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_draggable_id_seq', 1, true);


--
-- Data for Name: oc_server_draggable_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_draggable_sections (id, draggable_id, section_id) FROM stdin;
\.
COPY oc_server_draggable_sections (id, draggable_id, section_id) FROM '$$PATH$$/2431.dat';

--
-- Name: oc_server_draggable_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_draggable_sections_id_seq', 1, true);


--
-- Data for Name: oc_server_lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_lesson (id, name, number, course_id) FROM stdin;
\.
COPY oc_server_lesson (id, name, number, course_id) FROM '$$PATH$$/2424.dat';

--
-- Name: oc_server_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_lesson_id_seq', 2, true);


--
-- Data for Name: oc_server_section; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_section (id, name, number, text, lesson_id) FROM stdin;
\.
COPY oc_server_section (id, name, number, text, lesson_id) FROM '$$PATH$$/2426.dat';

--
-- Name: oc_server_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_section_id_seq', 3, true);


--
-- Data for Name: oc_server_sectionrequirement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oc_server_sectionrequirement (id, description, "unitTests", section_id) FROM stdin;
\.
COPY oc_server_sectionrequirement (id, description, "unitTests", section_id) FROM '$$PATH$$/2433.dat';

--
-- Name: oc_server_sectionrequirement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oc_server_sectionrequirement_id_seq', 1, true);


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
-- Name: oc_server_baseprofile_comp_baseprofile_id_a938e280; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oc_server_baseprofile_comp_baseprofile_id_a938e280 ON oc_server_baseprofile_completed_sections USING btree (baseprofile_id);


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
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
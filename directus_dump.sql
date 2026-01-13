WARNING:  database "directus" has a collation version mismatch
DETAIL:  The database was created using collation version 2.36, but the operating system provides version 2.41.
HINT:  Rebuild all objects in this database that use the default collation and run ALTER DATABASE directus REFRESH COLLATION VERSION, or build PostgreSQL with the right library version.
--
-- PostgreSQL database dump
--

\restrict EYZMYoB5aBZsyDRqvc6Cj2LwUtUKeDaR6UWX0YYXh7sgTVMBCpdnTITOQgEVijB

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 16.10 (Debian 16.10-1.pgdg13+1)

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
-- Name: categories; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.categories (
    id uuid NOT NULL,
    name character varying(255),
    slug character varying(255)
);


ALTER TABLE public.categories OWNER TO directus;

--
-- Name: certifications; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.certifications (
    id uuid NOT NULL,
    name character varying(255),
    logo uuid
);


ALTER TABLE public.certifications OWNER TO directus;

--
-- Name: colors; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.colors (
    id uuid NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    product_id uuid,
    name character varying(255),
    image uuid
);


ALTER TABLE public.colors OWNER TO directus;

--
-- Name: contact_messages; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.contact_messages (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    subject character varying(255),
    messages text,
    phone character varying(50),
    source character varying(255) DEFAULT 'homepage_contact_section'::character varying,
    user_agent text,
    ip character varying(255),
    status character varying(255)
);


ALTER TABLE public.contact_messages OWNER TO directus;

--
-- Name: contact_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.contact_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_messages_id_seq OWNER TO directus;

--
-- Name: contact_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.contact_messages_id_seq OWNED BY public.contact_messages.id;


--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO directus;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_activity_id_seq OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO directus;

--
-- Name: directus_comments; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_comments OWNER TO directus;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO directus;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO directus;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_fields_id_seq OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


ALTER TABLE public.directus_files OWNER TO directus;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO directus;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO directus;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO directus;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_notifications_id_seq OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO directus;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO directus;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE public.directus_permissions OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_permissions_id_seq OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO directus;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_presets_id_seq OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_relations_id_seq OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_revisions_id_seq OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE public.directus_roles OWNER TO directus;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO directus;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json,
    visual_editor_urls json
);


ALTER TABLE public.directus_settings OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_settings_id_seq OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO directus;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO directus;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json
);


ALTER TABLE public.directus_users OWNER TO directus;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);


ALTER TABLE public.directus_versions OWNER TO directus;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json,
    was_active_before_deprecation boolean DEFAULT false NOT NULL,
    migrated_flow uuid
);


ALTER TABLE public.directus_webhooks OWNER TO directus;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_webhooks_id_seq OWNER TO directus;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.products (
    id uuid NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    name character varying(255) NOT NULL,
    slug character varying(255),
    content text,
    notices text,
    category uuid
);


ALTER TABLE public.products OWNER TO directus;

--
-- Name: products_certifications; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.products_certifications (
    id integer NOT NULL,
    products_id uuid,
    certifications_id uuid
);


ALTER TABLE public.products_certifications OWNER TO directus;

--
-- Name: products_certifications_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.products_certifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_certifications_id_seq OWNER TO directus;

--
-- Name: products_certifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.products_certifications_id_seq OWNED BY public.products_certifications.id;


--
-- Name: products_files; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.products_files (
    id integer NOT NULL,
    products_id uuid,
    directus_files_id uuid
);


ALTER TABLE public.products_files OWNER TO directus;

--
-- Name: products_files_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.products_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_files_id_seq OWNER TO directus;

--
-- Name: products_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.products_files_id_seq OWNED BY public.products_files.id;


--
-- Name: products_tags; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.products_tags (
    id integer NOT NULL,
    products_id uuid,
    tags_id uuid
);


ALTER TABLE public.products_tags OWNER TO directus;

--
-- Name: products_tags_1; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.products_tags_1 (
    id integer NOT NULL,
    products_id uuid,
    tags_id uuid
);


ALTER TABLE public.products_tags_1 OWNER TO directus;

--
-- Name: products_tags_1_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.products_tags_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_tags_1_id_seq OWNER TO directus;

--
-- Name: products_tags_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.products_tags_1_id_seq OWNED BY public.products_tags_1.id;


--
-- Name: products_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.products_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_tags_id_seq OWNER TO directus;

--
-- Name: products_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.products_tags_id_seq OWNED BY public.products_tags.id;


--
-- Name: specs; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.specs (
    id uuid NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    color_id uuid,
    gsm integer,
    thickness integer,
    size character varying(255)
);


ALTER TABLE public.specs OWNER TO directus;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.tags (
    id uuid NOT NULL,
    name character varying(255),
    slug character varying(255)
);


ALTER TABLE public.tags OWNER TO directus;

--
-- Name: tags_products; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.tags_products (
    id integer NOT NULL,
    tags_id uuid,
    products_id uuid
);


ALTER TABLE public.tags_products OWNER TO directus;

--
-- Name: tags_products_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.tags_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_products_id_seq OWNER TO directus;

--
-- Name: tags_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.tags_products_id_seq OWNED BY public.tags_products.id;


--
-- Name: contact_messages id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.contact_messages ALTER COLUMN id SET DEFAULT nextval('public.contact_messages_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: products_certifications id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_certifications ALTER COLUMN id SET DEFAULT nextval('public.products_certifications_id_seq'::regclass);


--
-- Name: products_files id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_files ALTER COLUMN id SET DEFAULT nextval('public.products_files_id_seq'::regclass);


--
-- Name: products_tags id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_tags ALTER COLUMN id SET DEFAULT nextval('public.products_tags_id_seq'::regclass);


--
-- Name: products_tags_1 id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_tags_1 ALTER COLUMN id SET DEFAULT nextval('public.products_tags_1_id_seq'::regclass);


--
-- Name: tags_products id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.tags_products ALTER COLUMN id SET DEFAULT nextval('public.tags_products_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.categories (id, name, slug) FROM stdin;
11927347-43ef-4610-8cab-55ab5b98b9b3	色紙	colored
\.


--
-- Data for Name: certifications; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.certifications (id, name, logo) FROM stdin;
6fe89fdc-f717-4c45-9307-9835fda97c38	FSC	\N
0b729be2-c784-4524-b0cd-c31888d685a8	鹼性儲備物含量>2% alkaline reserve>2%	\N
df8e8f7e-2878-44d8-8a34-32d7471d73ff	無重金屬 HEAVYMETAL ABSENCE 94/62/CE	\N
3ca813e7-a3f3-489d-9580-d1e5c047e225	中性紙 NEUTRAL pH	\N
17916087-4de8-418e-bb77-87afbedc80cb	 未印刷回收漿 pre-consumer secondary fibers	\N
35a64350-b167-40c2-ac1b-6ab20bfafb39	已印刷回收漿 post-consumer secondary fibers	\N
479482d5-1371-4205-a879-566288fa89fc	FSC RECYCLED CREDIT (FSC-C015523)	\N
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.colors (id, status, sort, product_id, name, image) FROM stdin;
0fd284cf-f18b-47a5-9386-ca0456e6dfcd	draft	\N	\N	灰色	dc31066a-d184-4012-af18-acc66968901f
27b65559-1874-4610-8244-044a19e85e61	draft	\N	96b04970-36f0-4a2a-b459-79a6335bd82a	灰	\N
\.


--
-- Data for Name: contact_messages; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.contact_messages (id, name, email, subject, messages, phone, source, user_agent, ip, status) FROM stdin;
1	123123	123123@mail.com	\N	\N	\N	homepage_contact_section	\N	\N	\N
2	123123	123123@123.con	\N	\N	123131321	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
3	123123	123123@123123.1231	\N	\N	12312312312	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
4	123123	12312@1231.com	\N	\N	12312311123	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
5	12312	12312@1223.123	\N	\N	1231223	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
6	12312	12312@1223.123	\N	\N	1231223	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
7	12312	123123@1231.com	\N	\N	12312	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
8	123123	12312@mail.com	\N	\N	123123	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
9	123123	1321321@mail.com	\N	\N	1231231213	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
10	3333	1231@mail.com	\N	\N	33332323	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
11	32131	12312@mail.com	\N	\N	123131312	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
12	123123	1231232@mail.com	\N	\N	123123	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
13	12312123123	12123123@mail.com	\N	\N	12123123123123	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
14	12312123	123123123@sad.csss	\N	\N	312213123123	homepage_contact_section	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	::1	new
\.


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
0045d22d-fdf1-44c8-b880-ccbb51df1dda	c2e61469-bb36-41c7-8d5d-246e0ed96a60	\N	aa914419-9e0e-45f0-8bb9-37ab3b851bf8	\N
8008efad-23a6-404d-b350-a47c62b0a5c2	d1a0a382-8da1-495a-b503-25305608bfde	\N	871ba27f-82d4-4f41-804a-3574ba599884	1
ce48a6d3-fe69-4727-8939-f00761679047	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
06c6b87a-6093-4d62-b6f7-8682c7c1255a	\N	c1801ab5-2a1e-4d3f-b64e-7503073aaced	58ddf098-7368-4e81-a8ee-58eaca7838d5	1
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
1	login	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 14:24:40.277+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	http://localhost:8055
2	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 14:32:57.6+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
3	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:19:59.727+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
4	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:20:57.96+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
5	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:20:57.964+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products	http://localhost:8055
6	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:21:51.959+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
7	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:23:53.968+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
8	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:24:36.358+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	4	http://localhost:8055
9	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:24:48.231+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	4	http://localhost:8055
10	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:24:56.499+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	5	http://localhost:8055
11	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:25:41.694+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	6	http://localhost:8055
12	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:25:41.697+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	certifications	http://localhost:8055
13	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:25:50.49+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	7	http://localhost:8055
14	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:26:01.007+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
15	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:32:24.53+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	certifications	http://localhost:8055
16	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:32:24.533+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	6	http://localhost:8055
17	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:32:24.533+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	7	http://localhost:8055
18	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:32:24.534+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
19	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:33:40.079+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	9	http://localhost:8055
20	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:33:40.081+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	certifications	http://localhost:8055
21	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:33:53.132+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	10	http://localhost:8055
22	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:34:01.455+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	11	http://localhost:8055
23	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:34:59.989+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	certifications	http://localhost:8055
24	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:35:21.542+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	12	http://localhost:8055
25	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:35:21.59+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	13	http://localhost:8055
26	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:35:21.593+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products_certifications	http://localhost:8055
27	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:35:21.616+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	14	http://localhost:8055
28	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:35:21.653+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	15	http://localhost:8055
29	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:35:56.361+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	16	http://localhost:8055
30	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:35:56.363+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	color	http://localhost:8055
31	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:23.327+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	color	http://localhost:8055
32	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:23.328+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	16	http://localhost:8055
33	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:38.108+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	15	http://localhost:8055
34	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:38.144+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	certifications	http://localhost:8055
35	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:38.147+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	9	http://localhost:8055
36	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:38.147+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	10	http://localhost:8055
37	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:38.148+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	11	http://localhost:8055
38	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:41.842+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	12	http://localhost:8055
39	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:41.846+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	14	http://localhost:8055
40	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:41.877+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products	http://localhost:8055
41	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:41.879+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
42	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:41.88+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
43	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:41.88+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
44	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:41.881+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	5	http://localhost:8055
45	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:45.287+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products_certifications	http://localhost:8055
46	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:39:45.288+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	13	http://localhost:8055
47	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:44:16.283+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
48	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:44:16.285+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
49	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:44:16.287+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	19	http://localhost:8055
50	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:44:16.288+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
51	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:44:16.289+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	21	http://localhost:8055
52	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:44:16.291+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	22	http://localhost:8055
53	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:44:16.293+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	23	http://localhost:8055
54	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:44:16.297+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	product	http://localhost:8055
55	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:46:17.016+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	24	http://localhost:8055
56	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:48:15.947+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	25	http://localhost:8055
57	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:48:52.082+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	26	http://localhost:8055
58	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:48:52.146+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
59	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:48:52.147+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	product_files	http://localhost:8055
60	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:48:52.169+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
61	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:48:52.216+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
62	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:49:21.063+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
63	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:49:37.402+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
64	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:50:07.448+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
65	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:50:07.451+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
66	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:50:07.456+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
67	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:50:07.459+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
68	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:50:07.462+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
69	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:50:07.464+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
70	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:50:07.466+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
71	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:50:07.468+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	certifications	http://localhost:8055
72	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:50:25.539+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
73	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:50:35.234+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
74	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:01.643+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
75	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:01.713+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
76	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:01.716+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	product_certifications	http://localhost:8055
77	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:01.737+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	43	http://localhost:8055
78	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:01.789+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
79	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:18.847+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
80	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:18.85+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
81	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:18.851+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	47	http://localhost:8055
82	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:18.856+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	48	http://localhost:8055
83	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:18.857+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	49	http://localhost:8055
84	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:18.86+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	50	http://localhost:8055
85	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:18.863+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	51	http://localhost:8055
86	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:51:18.866+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	colors	http://localhost:8055
87	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:02.974+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	52	http://localhost:8055
88	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:03.066+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	53	http://localhost:8055
89	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:03.075+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	colors_product_id	http://localhost:8055
90	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:03.099+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	54	http://localhost:8055
91	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:03.143+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	55	http://localhost:8055
92	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:03.217+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	56	http://localhost:8055
93	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:11.767+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	57	http://localhost:8055
94	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:25.654+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	58	http://localhost:8055
95	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:55.61+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	59	http://localhost:8055
96	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:55.612+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	60	http://localhost:8055
97	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:55.614+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	61	http://localhost:8055
98	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:55.616+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	62	http://localhost:8055
99	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:55.618+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	63	http://localhost:8055
100	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:55.621+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	64	http://localhost:8055
101	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:55.623+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	65	http://localhost:8055
102	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:52:55.625+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	specs	http://localhost:8055
103	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:53:29.641+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	66	http://localhost:8055
104	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:53:29.71+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	67	http://localhost:8055
105	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:53:29.712+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	specs_color_id	http://localhost:8055
106	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:53:29.734+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	68	http://localhost:8055
107	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:53:29.782+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	69	http://localhost:8055
108	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:53:29.832+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	70	http://localhost:8055
109	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:53:39.291+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	71	http://localhost:8055
110	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:53:49.917+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	72	http://localhost:8055
111	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:53:55.446+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	73	http://localhost:8055
112	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:59:05.318+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	74	http://localhost:8055
113	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 15:59:14.169+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	74	http://localhost:8055
114	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:06:18.903+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	66	http://localhost:8055
115	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:06:59.498+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	75	http://localhost:8055
116	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:06:59.57+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	76	http://localhost:8055
117	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:06:59.572+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	specs_color_id_1	http://localhost:8055
118	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:06:59.596+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	77	http://localhost:8055
119	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:06:59.657+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
120	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:06:59.716+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	79	http://localhost:8055
121	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:07:53.23+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	80	http://localhost:8055
122	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:08:06.637+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	80	http://localhost:8055
123	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:11:26.647+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	b4c5aa04-aef9-4388-9388-8f430d4eeb24	http://localhost:8055
124	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:11:58.933+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	36fbbe81-90a8-41ca-8a43-32eab16646c0	http://localhost:8055
125	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:13:30.809+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	47c21c49-baf4-43da-9006-f3142d653d41	http://localhost:8055
130	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:14:28.631+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	52	http://localhost:8055
131	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:07.516+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	81	http://localhost:8055
132	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:12.746+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
133	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:12.754+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
134	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:12.762+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	47	http://localhost:8055
135	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:12.769+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	48	http://localhost:8055
136	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:12.778+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	49	http://localhost:8055
137	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:12.781+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	50	http://localhost:8055
138	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:12.784+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	51	http://localhost:8055
139	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:12.787+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	81	http://localhost:8055
140	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:12.79+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	57	http://localhost:8055
141	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:12.793+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	58	http://localhost:8055
142	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:12.795+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	80	http://localhost:8055
143	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:15:37.441+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	82	http://localhost:8055
144	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:16:24.818+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	842010c4-1b1f-4280-80ba-e1aae5998e9f	http://localhost:8055
145	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:16:52.531+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	1b2a312c-93ca-43b9-b0a3-24817a82804a	http://localhost:8055
146	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 16:17:22.335+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	a934f351-bd90-4eed-b6bc-7daceeb96d8e	http://localhost:8055
153	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:30.593+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
154	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:30.64+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	certifications	http://localhost:8055
155	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:30.641+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
156	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:30.642+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
157	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:30.642+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
158	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:30.642+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
159	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:30.643+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
160	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:30.643+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
161	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:30.643+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
162	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:30.644+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
163	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:30.645+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
164	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.863+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	54	http://localhost:8055
165	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.905+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	80	http://localhost:8055
166	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.909+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	75	http://localhost:8055
167	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.949+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	colors	http://localhost:8055
168	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.951+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
183	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.455+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
184	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.458+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	43	http://localhost:8055
169	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.952+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
170	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.952+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	47	http://localhost:8055
171	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.953+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	48	http://localhost:8055
172	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.954+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	49	http://localhost:8055
173	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.954+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	50	http://localhost:8055
174	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.954+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	51	http://localhost:8055
175	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.958+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	57	http://localhost:8055
176	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.96+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	58	http://localhost:8055
177	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.962+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	81	http://localhost:8055
178	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:33.973+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	82	http://localhost:8055
179	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:36.515+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	colors_product_id	http://localhost:8055
180	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:36.517+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	53	http://localhost:8055
181	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:36.518+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	55	http://localhost:8055
182	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:36.518+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	56	http://localhost:8055
199	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:42.415+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	product_certifications	http://localhost:8055
200	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:42.416+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
201	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:45.144+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	product_files	http://localhost:8055
202	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:45.147+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
203	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:45.147+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
204	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.788+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	68	http://localhost:8055
205	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.817+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	specs	http://localhost:8055
206	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.819+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	59	http://localhost:8055
207	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.819+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	60	http://localhost:8055
208	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.82+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	61	http://localhost:8055
209	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.82+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	62	http://localhost:8055
210	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.82+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	63	http://localhost:8055
211	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.821+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	64	http://localhost:8055
212	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.821+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	65	http://localhost:8055
213	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.821+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	71	http://localhost:8055
214	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.821+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	72	http://localhost:8055
215	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:47.822+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	73	http://localhost:8055
220	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:53.329+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	specs_color_id_1	http://localhost:8055
185	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.492+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	26	http://localhost:8055
186	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.495+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
187	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.531+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	product	http://localhost:8055
188	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.532+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
189	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.532+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
190	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.533+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	19	http://localhost:8055
191	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.533+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
192	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.533+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	21	http://localhost:8055
193	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.534+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	22	http://localhost:8055
194	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.534+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	23	http://localhost:8055
195	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.534+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	24	http://localhost:8055
196	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.535+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	25	http://localhost:8055
197	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.536+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
198	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:39.536+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
216	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:50.364+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	specs_color_id	http://localhost:8055
217	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:50.367+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	67	http://localhost:8055
218	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:50.368+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	69	http://localhost:8055
219	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:50.368+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	70	http://localhost:8055
221	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:53.331+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	76	http://localhost:8055
222	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:53.331+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	77	http://localhost:8055
223	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:53.332+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
224	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:22:53.333+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	79	http://localhost:8055
225	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:23:21.705+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	83	http://localhost:8055
226	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:23:21.708+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	84	http://localhost:8055
227	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:23:21.711+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	85	http://localhost:8055
228	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:23:21.713+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	86	http://localhost:8055
229	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:23:21.716+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	87	http://localhost:8055
230	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:23:21.718+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products	http://localhost:8055
231	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:24:19.421+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	88	http://localhost:8055
232	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:24:34.898+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	89	http://localhost:8055
233	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:25:16.398+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	90	http://localhost:8055
234	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:25:16.443+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	91	http://localhost:8055
235	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:25:16.446+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products_files	http://localhost:8055
236	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:25:16.47+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	92	http://localhost:8055
237	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:25:16.504+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	93	http://localhost:8055
238	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:25:30.146+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	94	http://localhost:8055
239	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:25:40.73+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	95	http://localhost:8055
240	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:26:20.579+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	96	http://localhost:8055
241	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:26:20.583+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	certifications	http://localhost:8055
242	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:26:29.636+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	97	http://localhost:8055
243	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:26:39.693+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	98	http://localhost:8055
244	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:27:43.161+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	99	http://localhost:8055
245	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:27:43.206+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	100	http://localhost:8055
246	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:27:43.211+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products_certifications	http://localhost:8055
247	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:27:43.244+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	101	http://localhost:8055
248	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:27:43.283+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	102	http://localhost:8055
249	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:28:10.929+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	103	http://localhost:8055
250	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:28:10.933+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	104	http://localhost:8055
251	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:28:10.936+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	105	http://localhost:8055
252	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:28:10.938+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	colors	http://localhost:8055
253	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:28:58.184+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	106	http://localhost:8055
254	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:29:08.176+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	107	http://localhost:8055
255	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:29:19.561+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	108	http://localhost:8055
260	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:30:32.253+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	112	http://localhost:8055
261	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:31:04.089+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	113	http://localhost:8055
262	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:31:15.175+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	114	http://localhost:8055
263	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:31:23.133+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	115	http://localhost:8055
264	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:31:58.139+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
256	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:29:44.399+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	109	http://localhost:8055
257	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:29:44.402+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	110	http://localhost:8055
258	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:29:44.404+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	111	http://localhost:8055
259	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:29:44.406+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	specs	http://localhost:8055
265	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:32:30.295+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	117	http://localhost:8055
266	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:35:58.243+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	certifications	6fe89fdc-f717-4c45-9307-9835fda97c38	http://localhost:8055
267	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:35:58.247+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_certifications	1	http://localhost:8055
268	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:35:58.251+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_files	1	http://localhost:8055
269	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:35:58.252+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
270	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:36:37.423+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	colors	27b65559-1874-4610-8244-044a19e85e61	http://localhost:8055
271	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:36:37.426+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
272	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:37:33.756+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	specs	ac4217ad-bbfa-4b5a-b0b9-ad60eb0bc65b	http://localhost:8055
273	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:37:33.758+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	specs	7db304ef-eb30-4beb-abf9-8db5b96e1835	http://localhost:8055
274	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:37:33.76+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	colors	27b65559-1874-4610-8244-044a19e85e61	http://localhost:8055
275	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:37:33.762+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
276	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:37:55.596+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	colors	27b65559-1874-4610-8244-044a19e85e61	http://localhost:8055
277	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:37:55.599+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
278	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.367+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	1	http://localhost:8055
279	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.371+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	2	http://localhost:8055
280	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.374+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	3	http://localhost:8055
281	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.375+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	4	http://localhost:8055
282	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.377+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	5	http://localhost:8055
283	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.38+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	6	http://localhost:8055
284	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.382+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	7	http://localhost:8055
285	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.384+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	8	http://localhost:8055
286	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.387+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	9	http://localhost:8055
287	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.389+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	10	http://localhost:8055
288	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.391+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	11	http://localhost:8055
289	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.393+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	12	http://localhost:8055
290	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.395+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	13	http://localhost:8055
291	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.396+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	14	http://localhost:8055
292	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.398+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	15	http://localhost:8055
293	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.4+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	16	http://localhost:8055
294	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.401+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	17	http://localhost:8055
295	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.403+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	18	http://localhost:8055
296	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.405+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	19	http://localhost:8055
297	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.406+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	20	http://localhost:8055
298	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-19 17:41:14.408+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
299	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 03:25:15.169+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
300	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 04:18:47.346+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	http://localhost:8055
301	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 04:27:44.89+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	http://localhost:8055
302	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 05:11:17.963+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	106	http://localhost:8055
303	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 05:12:26.997+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
304	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 05:12:58.253+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	112	http://localhost:8055
305	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 05:19:07.613+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	117	http://localhost:8055
306	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 05:20:06.533+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	99	http://localhost:8055
307	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 05:21:48.562+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	specs	5a2e2e73-b987-4938-a019-30d1726a0e63	http://localhost:8055
308	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 05:21:48.564+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	specs	4aea6668-94c5-42c5-bbf9-b764dcd2c0fc	http://localhost:8055
309	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 05:21:48.566+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	colors	0fd284cf-f18b-47a5-9386-ca0456e6dfcd	http://localhost:8055
310	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 05:21:48.57+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
311	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 05:22:27.912+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
312	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 05:23:25.855+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
313	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 08:38:31.302+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	21	http://localhost:8055
314	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 08:38:31.305+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
315	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 08:38:31.31+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_access	ce48a6d3-fe69-4727-8939-f00761679047	http://localhost:8055
316	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 08:40:28.475+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	22	http://localhost:8055
317	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 08:40:28.481+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	21	http://localhost:8055
318	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 08:40:28.482+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
319	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 08:40:28.486+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_access	ce48a6d3-fe69-4727-8939-f00761679047	http://localhost:8055
320	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 09:13:23+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
321	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 09:28:45.098+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
322	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:02:28.751+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	96f4a43c-8e8c-45c5-b27a-c52a5efe7de9	http://localhost:8055
323	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:03:21.68+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	colors	27b65559-1874-4610-8244-044a19e85e61	http://localhost:8055
324	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:03:35.971+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	colors	0fd284cf-f18b-47a5-9386-ca0456e6dfcd	http://localhost:8055
325	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:03:48.593+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	dc31066a-d184-4012-af18-acc66968901f	http://localhost:8055
326	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:03:50.392+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	colors	0fd284cf-f18b-47a5-9386-ca0456e6dfcd	http://localhost:8055
327	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:10:58.456+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	267f3111-6841-4b41-9c16-c75ea9cb499c	http://localhost:8055
328	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:11:08.751+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_files	2	http://localhost:8055
329	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:11:08.754+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_files	1	http://localhost:8055
330	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:11:08.756+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
331	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:11:43.427+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	27cd5d72-4ddb-4586-832b-eec6624def7f	http://localhost:8055
332	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:11:46.048+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_files	3	http://localhost:8055
333	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:11:46.051+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_files	2	http://localhost:8055
334	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:11:46.053+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
335	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:12:01.351+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	908951a5-a38f-4fa3-8f8e-b8256c9cf5b2	http://localhost:8055
336	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:12:02.929+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_files	4	http://localhost:8055
337	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:12:02.931+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
338	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:12:45.385+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	267f3111-6841-4b41-9c16-c75ea9cb499c	http://localhost:8055
339	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:12:45.386+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	a934f351-bd90-4eed-b6bc-7daceeb96d8e	http://localhost:8055
340	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:12:45.387+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	1b2a312c-93ca-43b9-b0a3-24817a82804a	http://localhost:8055
341	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:12:45.387+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	842010c4-1b1f-4280-80ba-e1aae5998e9f	http://localhost:8055
342	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:12:45.388+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	47c21c49-baf4-43da-9006-f3142d653d41	http://localhost:8055
343	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:12:45.389+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	36fbbe81-90a8-41ca-8a43-32eab16646c0	http://localhost:8055
344	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:12:45.389+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_files	b4c5aa04-aef9-4388-9388-8f430d4eeb24	http://localhost:8055
345	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 14:29:29.139+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_certifications	1	http://localhost:8055
346	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 14:29:29.145+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
347	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 15:08:25.535+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
348	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 15:08:36.99+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
349	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 15:08:57.107+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
350	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 15:09:51.761+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
351	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-21 04:58:41.134+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products	http://localhost:8055
352	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-21 04:59:03.335+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products	http://localhost:8055
353	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-21 04:59:32.79+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products	http://localhost:8055
354	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-21 04:59:41.403+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products	http://localhost:8055
355	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-21 04:59:47.591+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products	http://localhost:8055
356	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-21 05:00:02.643+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products	http://localhost:8055
357	login	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:27:12.825+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	http://localhost:8055
358	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:28:15.633+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	90	http://localhost:8055
359	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:29:02.702+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
360	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:29:13.065+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
361	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:29:22.199+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
362	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:30:29.945+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	118	http://localhost:8055
363	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:30:29.947+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	119	http://localhost:8055
364	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:30:29.95+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	120	http://localhost:8055
365	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:30:29.953+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	tags	http://localhost:8055
366	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:30:41.363+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	121	http://localhost:8055
367	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:31:00.58+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	122	http://localhost:8055
368	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:31:42.166+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	123	http://localhost:8055
369	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:31:42.211+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	124	http://localhost:8055
370	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:31:42.213+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	tags_products	http://localhost:8055
371	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:31:42.234+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	125	http://localhost:8055
372	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:31:42.268+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	126	http://localhost:8055
373	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:31:56.743+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
374	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:32:02.698+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
375	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:32:10.531+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
376	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:33:21.496+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	127	http://localhost:8055
377	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:33:35.952+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	127	http://localhost:8055
378	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:33:57.075+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	127	http://localhost:8055
379	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:34:27.303+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	128	http://localhost:8055
380	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:34:27.359+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	129	http://localhost:8055
381	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:34:27.361+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products_tags	http://localhost:8055
382	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:34:27.384+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	130	http://localhost:8055
383	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:34:27.435+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	131	http://localhost:8055
384	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:34:40.082+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	128	http://localhost:8055
385	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:37:05.23+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	tags	91e69dda-7bd3-4b15-8aa0-ae8696967150	http://localhost:8055
386	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:37:05.233+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_tags	1	http://localhost:8055
387	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:37:05.235+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
388	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:37:27.119+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	123	http://localhost:8055
389	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:37:44.579+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	128	http://localhost:8055
390	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:38:27.857+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	tags	d1e8698b-2e24-47a1-8e51-3db6d58908d3	http://localhost:8055
391	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:39:08.773+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	tags	d1b03a91-f851-4235-8473-5024da8ec845	http://localhost:8055
392	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:39:34.324+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_tags	2	http://localhost:8055
393	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:39:34.326+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_tags	3	http://localhost:8055
394	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 07:39:34.328+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
395	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 19:32:38.647+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	128	http://localhost:8055
396	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 19:36:57.589+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	132	http://localhost:8055
397	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 19:36:57.692+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	133	http://localhost:8055
398	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 19:36:57.694+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	products_tags_1	http://localhost:8055
399	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 19:36:57.732+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	134	http://localhost:8055
400	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 19:36:57.797+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	135	http://localhost:8055
401	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 19:37:19.406+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_tags_1	1	http://localhost:8055
402	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 19:37:19.408+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_tags_1	2	http://localhost:8055
403	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 19:37:19.41+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products_tags_1	3	http://localhost:8055
404	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 19:37:19.412+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
405	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 19:37:39.508+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	132	http://localhost:8055
406	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.112+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	23	http://localhost:8055
407	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.114+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	24	http://localhost:8055
408	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.118+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	12	http://localhost:8055
409	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.121+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	17	http://localhost:8055
410	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.124+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	1	http://localhost:8055
411	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.127+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	7	http://localhost:8055
412	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.13+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	2	http://localhost:8055
413	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.13+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	3	http://localhost:8055
414	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.131+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	4	http://localhost:8055
415	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.131+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	5	http://localhost:8055
416	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.132+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	6	http://localhost:8055
417	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.132+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	8	http://localhost:8055
418	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.133+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	9	http://localhost:8055
419	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.134+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	10	http://localhost:8055
420	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.134+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	11	http://localhost:8055
421	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.135+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	13	http://localhost:8055
422	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.135+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	14	http://localhost:8055
423	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.136+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	15	http://localhost:8055
424	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.136+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	16	http://localhost:8055
425	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.136+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	18	http://localhost:8055
426	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.137+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	19	http://localhost:8055
427	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.137+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	20	http://localhost:8055
428	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:20.138+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
429	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:47.856+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	7	http://localhost:8055
430	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:22:47.856+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
431	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:23:12.605+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	25	http://localhost:8055
432	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:23:12.607+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
433	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:24:31.504+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	26	http://localhost:8055
434	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:24:31.508+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	27	http://localhost:8055
435	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:24:31.509+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	28	http://localhost:8055
436	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:24:31.511+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	29	http://localhost:8055
437	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:24:31.512+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
438	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:28:07.769+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	120	http://localhost:8055
439	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:28:14.114+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	119	http://localhost:8055
440	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.343+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	83	http://localhost:8055
441	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.348+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	84	http://localhost:8055
442	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.352+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	85	http://localhost:8055
443	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.357+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	86	http://localhost:8055
444	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.362+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	87	http://localhost:8055
445	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.365+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	88	http://localhost:8055
446	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.368+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	89	http://localhost:8055
447	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.37+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	90	http://localhost:8055
448	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.373+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	94	http://localhost:8055
449	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.376+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	95	http://localhost:8055
450	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.379+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	117	http://localhost:8055
451	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.383+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	99	http://localhost:8055
452	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:36:00.386+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	132	http://localhost:8055
453	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:42:25.374+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	136	http://localhost:8055
454	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:42:25.378+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_collections	categories	http://localhost:8055
455	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:42:33.957+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	137	http://localhost:8055
456	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:42:39.204+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	138	http://localhost:8055
457	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:30.551+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	139	http://localhost:8055
458	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.155+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	139	http://localhost:8055
459	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.16+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	83	http://localhost:8055
460	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.163+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	84	http://localhost:8055
461	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.168+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	85	http://localhost:8055
462	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.174+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	86	http://localhost:8055
463	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.178+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	87	http://localhost:8055
464	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.182+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	88	http://localhost:8055
465	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.186+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	89	http://localhost:8055
466	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.19+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	90	http://localhost:8055
467	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.194+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	94	http://localhost:8055
468	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.197+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	95	http://localhost:8055
469	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.2+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	117	http://localhost:8055
470	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.202+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	99	http://localhost:8055
471	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:35.204+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_fields	132	http://localhost:8055
472	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:46:58.949+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	categories	11927347-43ef-4610-8cab-55ab5b98b9b3	http://localhost:8055
473	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:47:33.134+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
474	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:48:13.789+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_permissions	30	http://localhost:8055
475	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-24 20:48:13.793+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
476	login	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 15:54:46.959+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	http://localhost:8055
477	login	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 16:44:47.441+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	http://localhost:8055
478	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:02:34.538+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_certifications	1	http://localhost:8055
479	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:02:34.547+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_files	3	http://localhost:8055
480	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:02:34.548+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_files	4	http://localhost:8055
481	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:02:34.553+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
482	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.267+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	tags	0e2c59a4-cd60-4eaf-8b55-bc8160b09d0d	http://localhost:8055
483	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.273+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_tags_1	4	http://localhost:8055
484	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.277+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	tags	e18dddde-9c40-4168-9ba7-aaed1ef9b3f7	http://localhost:8055
485	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.279+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_tags_1	5	http://localhost:8055
486	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.282+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	tags	afb18732-5f67-4d12-8122-95564e686c22	http://localhost:8055
487	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.283+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_tags_1	6	http://localhost:8055
488	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.286+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	tags	09c58be0-5596-453a-ab28-401cfc3eeefb	http://localhost:8055
489	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.287+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_tags_1	7	http://localhost:8055
490	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.29+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	tags	dab7f800-dd22-4b1f-9187-87112f6719ef	http://localhost:8055
491	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.292+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_tags_1	8	http://localhost:8055
492	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.298+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_tags_1	1	http://localhost:8055
493	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.299+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_tags_1	2	http://localhost:8055
494	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.3+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_tags_1	3	http://localhost:8055
495	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.304+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	certifications	0b729be2-c784-4524-b0cd-c31888d685a8	http://localhost:8055
496	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.306+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_certifications	2	http://localhost:8055
497	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.309+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	certifications	df8e8f7e-2878-44d8-8a34-32d7471d73ff	http://localhost:8055
498	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.31+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_certifications	3	http://localhost:8055
499	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.312+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	certifications	3ca813e7-a3f3-489d-9580-d1e5c047e225	http://localhost:8055
500	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.314+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_certifications	4	http://localhost:8055
501	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.317+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	certifications	17916087-4de8-418e-bb77-87afbedc80cb	http://localhost:8055
502	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.318+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_certifications	5	http://localhost:8055
503	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.32+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	certifications	35a64350-b167-40c2-ac1b-6ab20bfafb39	http://localhost:8055
504	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.322+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_certifications	6	http://localhost:8055
505	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.325+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	certifications	479482d5-1371-4205-a879-566288fa89fc	http://localhost:8055
506	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.327+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products_certifications	7	http://localhost:8055
507	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:04:46.329+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
508	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:05:49.843+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	colors	0fd284cf-f18b-47a5-9386-ca0456e6dfcd	http://localhost:8055
509	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:05:49.846+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
510	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:06:28.394+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	colors	27b65559-1874-4610-8244-044a19e85e61	http://localhost:8055
511	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-09-09 17:06:28.4+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36	products	96b04970-36f0-4a2a-b459-79a6335bd82a	http://localhost:8055
512	login	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 08:34:32.541+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	http://localhost:8055
513	login	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:10:46.168+00	192.168.65.1	node	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	\N
514	login	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:19:06.584+00	192.168.65.1	node	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	\N
515	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:26:34.474+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	140	http://localhost:8055
516	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:26:34.484+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	141	http://localhost:8055
517	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:26:34.49+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	142	http://localhost:8055
518	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:26:34.495+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	contact_messages	http://localhost:8055
519	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:26:47.169+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	141	http://localhost:8055
520	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:26:50.533+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	142	http://localhost:8055
521	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:27:03.571+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	143	http://localhost:8055
522	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:27:22.454+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	144	http://localhost:8055
523	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:27:31.647+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	145	http://localhost:8055
524	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:27:50.604+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	146	http://localhost:8055
525	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:28:41.876+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	31	http://localhost:8055
526	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:28:41.879+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
527	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:28:41.885+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	ce48a6d3-fe69-4727-8939-f00761679047	http://localhost:8055
528	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:32:19.577+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	d1a0a382-8da1-495a-b503-25305608bfde	http://localhost:8055
529	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:33:39.896+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	32	http://localhost:8055
530	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:33:39.9+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	871ba27f-82d4-4f41-804a-3574ba599884	http://localhost:8055
531	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:33:39.906+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	8008efad-23a6-404d-b350-a47c62b0a5c2	http://localhost:8055
532	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 09:33:39.91+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	d1a0a382-8da1-495a-b503-25305608bfde	http://localhost:8055
533	create	\N	2025-12-22 09:40:27.751+00	192.168.65.1	node	contact_messages	1	\N
534	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 12:43:40.281+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	ce48a6d3-fe69-4727-8939-f00761679047	http://localhost:8055
535	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 12:50:43.956+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	c1801ab5-2a1e-4d3f-b64e-7503073aaced	http://localhost:8055
536	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 12:51:13.086+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	c1801ab5-2a1e-4d3f-b64e-7503073aaced	http://localhost:8055
537	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 12:52:02.955+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	33	http://localhost:8055
538	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 12:52:02.96+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	58ddf098-7368-4e81-a8ee-58eaca7838d5	http://localhost:8055
539	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 12:52:02.964+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	06c6b87a-6093-4d62-b6f7-8682c7c1255a	http://localhost:8055
540	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-22 12:52:02.969+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	c1801ab5-2a1e-4d3f-b64e-7503073aaced	http://localhost:8055
541	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-23 01:21:48.518+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	147	http://localhost:8055
542	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-23 01:23:06.311+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	148	http://localhost:8055
543	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-23 01:23:35.052+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	149	http://localhost:8055
544	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-23 01:24:00.32+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	150	http://localhost:8055
545	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-23 01:24:11.197+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	151	http://localhost:8055
546	create	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-23 01:40:12.187+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	152	http://localhost:8055
547	create	\N	2025-12-23 01:47:41+00	192.168.65.1	node	contact_messages	2	\N
548	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-23 02:35:03.344+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	c1801ab5-2a1e-4d3f-b64e-7503073aaced	http://localhost:8055
549	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-23 02:35:03.353+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	d1a0a382-8da1-495a-b503-25305608bfde	http://localhost:8055
550	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 02:35:17.986+00	192.168.65.1	node	contact_messages	3	\N
551	update	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-23 02:41:03.933+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_settings	1	http://localhost:8055
552	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 02:48:18.075+00	192.168.65.1	node	contact_messages	4	\N
553	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 02:51:10.015+00	192.168.65.1	node	contact_messages	5	\N
554	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 02:52:32.878+00	192.168.65.1	node	contact_messages	6	\N
555	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 02:52:59.52+00	192.168.65.1	node	contact_messages	7	\N
556	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 02:55:44.987+00	192.168.65.1	node	contact_messages	8	\N
557	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 02:58:02.601+00	192.168.65.1	node	contact_messages	9	\N
558	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 06:25:01.862+00	192.168.65.1	node	contact_messages	10	\N
559	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 06:25:34.006+00	192.168.65.1	node	contact_messages	11	\N
560	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 06:27:56.621+00	192.168.65.1	node	contact_messages	12	\N
561	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 07:24:28.136+00	192.168.65.1	node	contact_messages	13	\N
562	create	c1801ab5-2a1e-4d3f-b64e-7503073aaced	2025-12-23 07:27:02.407+00	192.168.65.1	node	contact_messages	14	\N
563	delete	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-12-23 08:03:41.945+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	149	http://localhost:8055
564	login	79e05c01-2824-458a-8e28-4fa9f391d91f	2026-01-09 18:11:47.442+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	http://localhost:8055
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
products_files	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
certifications	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
products_certifications	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
colors	\N	\N	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	\N	\N	open	\N	f
specs	\N	\N	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	\N	\N	open	\N	f
products	dual_screen	\N	{{name}}	f	f	\N	status	t	archived	draft	sort	all	#FFC23B	\N	\N	\N	open	\N	f
tags_products	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
products_tags	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
products_tags_1	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
tags	\N	\N	\N	f	f	\N	\N	t	archived	draft	\N	all	\N	\N	\N	\N	open	\N	f
categories	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
contact_messages	\N	\N	\N	f	f	\N	\N	t	archived	draft	\N	all	\N	\N	\N	\N	open	\N	f
\.


--
-- Data for Name: directus_comments; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
91	products_files	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
92	products_files	products_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
93	products_files	directus_files_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
96	certifications	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
97	certifications	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
98	certifications	logo	file	file-image	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
100	products_certifications	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
101	products_certifications	products_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
102	products_certifications	certifications_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
103	colors	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
104	colors	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
105	colors	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
107	colors	name	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
108	colors	image	file	file-image	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
109	specs	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
110	specs	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
111	specs	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
113	specs	gsm	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
114	specs	thickness	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
115	specs	size	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
106	colors	product_id	m2o	select-dropdown-m2o	{"template":"{{name}}"}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
122	tags	slug	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
112	specs	color_id	m2o	select-dropdown-m2o	{"template":"{{name}}"}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
138	categories	slug	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
116	colors	specs	o2m	list-o2m	{"template":"{{gsm}}gsm,{{thickness}}g,{{size}}"}	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
99	products	certifications	m2m	list-m2m	{"template":"{{certifications_id}}"}	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N
118	tags	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
121	tags	name	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
124	tags_products	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
125	tags_products	tags_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
126	tags_products	products_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
130	products_tags	products_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
129	products_tags	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
131	products_tags	tags_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
133	products_tags_1	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
134	products_tags_1	products_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
135	products_tags_1	tags_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
139	products	category	m2o	select-dropdown-m2o	{"template":"{{name}}"}	\N	\N	f	f	1	full	\N	\N	\N	f	\N	\N	\N
85	products	sort	\N	input	\N	\N	\N	f	t	4	full	\N	\N	\N	f	\N	\N	\N
86	products	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
88	products	name	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
89	products	slug	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
94	products	content	\N	input-rich-text-html	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
95	products	notices	\N	input-rich-text-html	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
117	products	colors	o2m	list-o2m	{"template":"{{name}}"}	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
132	products	tags	m2m	list-m2m	{"template":"{{tags_id.name}}"}	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N
140	contact_messages	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
136	categories	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
137	categories	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
83	products	id	uuid	input	\N	\N	\N	t	t	2	full	\N	\N	\N	f	\N	\N	\N
84	products	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	3	full	\N	\N	\N	f	\N	\N	\N
87	products	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
90	products	covers	files	files	{"template":"{{products_id}}"}	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
143	contact_messages	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
144	contact_messages	email	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
145	contact_messages	subject	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
146	contact_messages	messages	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
147	contact_messages	phone	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
148	contact_messages	source	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
150	contact_messages	user_agent	\N	input-multiline	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
151	contact_messages	ip	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
152	contact_messages	status	\N	select-dropdown	{"choices":[{"text":"new","value":"new"},{"text":"read","value":"read"}]}	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
96f4a43c-8e8c-45c5-b27a-c52a5efe7de9	local	96f4a43c-8e8c-45c5-b27a-c52a5efe7de9.png	cork oak mahogany_thumbnail.png	Cork Oak Mahogany Thumbnail	image/png	\N	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:02:28.747+00	\N	2025-04-20 12:02:28.767+00	\N	21098	400	560	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-04-20 12:02:28.766+00
dc31066a-d184-4012-af18-acc66968901f	local	dc31066a-d184-4012-af18-acc66968901f.png	striped blush_thumbnail.png	Striped Blush Thumbnail	image/png	\N	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:03:48.591+00	\N	2025-04-20 12:03:48.599+00	\N	21034	400	560	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-04-20 12:03:48.598+00
27cd5d72-4ddb-4586-832b-eec6624def7f	local	27cd5d72-4ddb-4586-832b-eec6624def7f.JPG	R0007557.JPG	R0007557	image/jpeg	\N	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:11:43.42+00	\N	2025-04-20 12:11:43.563+00	\N	12523577	6000	4000	\N	\N	\N	\N	\N	{"ifd0":{"Make":"RICOH IMAGING COMPANY, LTD.","Model":"RICOH GR IIIx"},"exif":{"FNumber":2.8,"ExposureTime":0.025,"FocalLength":26,"ISOSpeedRatings":100}}	\N	\N	\N	\N	2025-04-20 12:11:43.562+00
908951a5-a38f-4fa3-8f8e-b8256c9cf5b2	local	908951a5-a38f-4fa3-8f8e-b8256c9cf5b2.JPG	R0007550.JPG	R0007550	image/jpeg	\N	79e05c01-2824-458a-8e28-4fa9f391d91f	2025-04-20 12:12:01.35+00	\N	2025-04-20 12:12:01.419+00	\N	11024248	6000	4000	\N	\N	\N	\N	\N	{"ifd0":{"Make":"RICOH IMAGING COMPANY, LTD.","Model":"RICOH GR IIIx"},"exif":{"FNumber":2.8,"ExposureTime":0.025,"FocalLength":26,"ISOSpeedRatings":100}}	\N	\N	\N	\N	2025-04-20 12:12:01.419+00
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2025-04-19 14:20:38.586088+00
20201029A	Remove System Relations	2025-04-19 14:20:38.589534+00
20201029B	Remove System Collections	2025-04-19 14:20:38.594708+00
20201029C	Remove System Fields	2025-04-19 14:20:38.601882+00
20201105A	Add Cascade System Relations	2025-04-19 14:20:38.616565+00
20201105B	Change Webhook URL Type	2025-04-19 14:20:38.620892+00
20210225A	Add Relations Sort Field	2025-04-19 14:20:38.624409+00
20210304A	Remove Locked Fields	2025-04-19 14:20:38.626015+00
20210312A	Webhooks Collections Text	2025-04-19 14:20:38.628697+00
20210331A	Add Refresh Interval	2025-04-19 14:20:38.630356+00
20210415A	Make Filesize Nullable	2025-04-19 14:20:38.634588+00
20210416A	Add Collections Accountability	2025-04-19 14:20:38.637055+00
20210422A	Remove Files Interface	2025-04-19 14:20:38.638411+00
20210506A	Rename Interfaces	2025-04-19 14:20:38.651463+00
20210510A	Restructure Relations	2025-04-19 14:20:38.66009+00
20210518A	Add Foreign Key Constraints	2025-04-19 14:20:38.665287+00
20210519A	Add System Fk Triggers	2025-04-19 14:20:38.676973+00
20210521A	Add Collections Icon Color	2025-04-19 14:20:38.679104+00
20210525A	Add Insights	2025-04-19 14:20:38.688139+00
20210608A	Add Deep Clone Config	2025-04-19 14:20:38.689846+00
20210626A	Change Filesize Bigint	2025-04-19 14:20:38.695292+00
20210716A	Add Conditions to Fields	2025-04-19 14:20:38.696718+00
20210721A	Add Default Folder	2025-04-19 14:20:38.699547+00
20210802A	Replace Groups	2025-04-19 14:20:38.702762+00
20210803A	Add Required to Fields	2025-04-19 14:20:38.704453+00
20210805A	Update Groups	2025-04-19 14:20:38.706933+00
20210805B	Change Image Metadata Structure	2025-04-19 14:20:38.709343+00
20210811A	Add Geometry Config	2025-04-19 14:20:38.710792+00
20210831A	Remove Limit Column	2025-04-19 14:20:38.71191+00
20210903A	Add Auth Provider	2025-04-19 14:20:38.718062+00
20210907A	Webhooks Collections Not Null	2025-04-19 14:20:38.722289+00
20210910A	Move Module Setup	2025-04-19 14:20:38.724236+00
20210920A	Webhooks URL Not Null	2025-04-19 14:20:38.727678+00
20210924A	Add Collection Organization	2025-04-19 14:20:38.730403+00
20210927A	Replace Fields Group	2025-04-19 14:20:38.734222+00
20210927B	Replace M2M Interface	2025-04-19 14:20:38.735331+00
20210929A	Rename Login Action	2025-04-19 14:20:38.736517+00
20211007A	Update Presets	2025-04-19 14:20:38.739572+00
20211009A	Add Auth Data	2025-04-19 14:20:38.741492+00
20211016A	Add Webhook Headers	2025-04-19 14:20:38.742852+00
20211103A	Set Unique to User Token	2025-04-19 14:20:38.744725+00
20211103B	Update Special Geometry	2025-04-19 14:20:38.745992+00
20211104A	Remove Collections Listing	2025-04-19 14:20:38.747125+00
20211118A	Add Notifications	2025-04-19 14:20:38.753261+00
20211211A	Add Shares	2025-04-19 14:20:38.760981+00
20211230A	Add Project Descriptor	2025-04-19 14:20:38.762593+00
20220303A	Remove Default Project Color	2025-04-19 14:20:38.765721+00
20220308A	Add Bookmark Icon and Color	2025-04-19 14:20:38.766998+00
20220314A	Add Translation Strings	2025-04-19 14:20:38.768082+00
20220322A	Rename Field Typecast Flags	2025-04-19 14:20:38.770376+00
20220323A	Add Field Validation	2025-04-19 14:20:38.771779+00
20220325A	Fix Typecast Flags	2025-04-19 14:20:38.77434+00
20220325B	Add Default Language	2025-04-19 14:20:38.778139+00
20220402A	Remove Default Value Panel Icon	2025-04-19 14:20:38.78165+00
20220429A	Add Flows	2025-04-19 14:20:38.795802+00
20220429B	Add Color to Insights Icon	2025-04-19 14:20:38.797539+00
20220429C	Drop Non Null From IP of Activity	2025-04-19 14:20:38.798705+00
20220429D	Drop Non Null From Sender of Notifications	2025-04-19 14:20:38.79986+00
20220614A	Rename Hook Trigger to Event	2025-04-19 14:20:38.801459+00
20220801A	Update Notifications Timestamp Column	2025-04-19 14:20:38.804701+00
20220802A	Add Custom Aspect Ratios	2025-04-19 14:20:38.806351+00
20220826A	Add Origin to Accountability	2025-04-19 14:20:38.809062+00
20230401A	Update Material Icons	2025-04-19 14:20:38.81306+00
20230525A	Add Preview Settings	2025-04-19 14:20:38.814308+00
20230526A	Migrate Translation Strings	2025-04-19 14:20:38.818703+00
20230721A	Require Shares Fields	2025-04-19 14:20:38.82172+00
20230823A	Add Content Versioning	2025-04-19 14:20:38.830314+00
20230927A	Themes	2025-04-19 14:20:38.836982+00
20231009A	Update CSV Fields to Text	2025-04-19 14:20:38.840261+00
20231009B	Update Panel Options	2025-04-19 14:20:38.841758+00
20231010A	Add Extensions	2025-04-19 14:20:38.844006+00
20231215A	Add Focalpoints	2025-04-19 14:20:38.845361+00
20240122A	Add Report URL Fields	2025-04-19 14:20:38.847102+00
20240204A	Marketplace	2025-04-19 14:20:38.856252+00
20240305A	Change Useragent Type	2025-04-19 14:20:38.860815+00
20240311A	Deprecate Webhooks	2025-04-19 14:20:38.868999+00
20240422A	Public Registration	2025-04-19 14:20:38.871951+00
20240515A	Add Session Window	2025-04-19 14:20:38.873234+00
20240701A	Add Tus Data	2025-04-19 14:20:38.874367+00
20240716A	Update Files Date Fields	2025-04-19 14:20:38.877931+00
20240806A	Permissions Policies	2025-04-19 14:20:38.894718+00
20240817A	Update Icon Fields Length	2025-04-19 14:20:38.904127+00
20240909A	Separate Comments	2025-04-19 14:20:38.909586+00
20240909B	Consolidate Content Versioning	2025-04-19 14:20:38.910958+00
20240924A	Migrate Legacy Comments	2025-04-19 14:20:38.914122+00
20240924B	Populate Versioning Deltas	2025-04-19 14:20:38.91668+00
20250224A	Visual Editor	2025-04-19 14:20:38.918507+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
22	directus_files	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
23	certifications	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
24	tags	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
12	specs	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
17	products_files	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
1	products	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
25	colors	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
26	tags_products	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
27	products_certifications	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
28	products_tags	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
29	products_tags_1	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
30	categories	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
31	contact_messages	create	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
32	contact_messages	create	\N	\N	\N	*	871ba27f-82d4-4f41-804a-3574ba599884
33	contact_messages	create	\N	\N	\N	*	58ddf098-7368-4e81-a8ee-58eaca7838d5
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
aa914419-9e0e-45f0-8bb9-37ab3b851bf8	Administrator	verified	$t:admin_description	\N	f	t	t
871ba27f-82d4-4f41-804a-3574ba599884	contact_form	badge	\N	\N	f	f	f
58ddf098-7368-4e81-a8ee-58eaca7838d5	contact	badge	\N	\N	f	f	f
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
3	\N	79e05c01-2824-458a-8e28-4fa9f391d91f	\N	colors	\N	\N	{"tabular":{"page":1,"sort":["sort"]}}	\N	\N	\N	bookmark	\N
4	\N	79e05c01-2824-458a-8e28-4fa9f391d91f	\N	specs	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
5	\N	79e05c01-2824-458a-8e28-4fa9f391d91f	\N	tags	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
1	\N	79e05c01-2824-458a-8e28-4fa9f391d91f	\N	products	\N	\N	{"tabular":{"page":1,"fields":["name","slug","status"]}}	\N	\N	\N	bookmark	\N
2	\N	79e05c01-2824-458a-8e28-4fa9f391d91f	\N	certifications	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
6	\N	79e05c01-2824-458a-8e28-4fa9f391d91f	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
27	products_files	directus_files_id	directus_files	\N	\N	\N	products_id	\N	nullify
28	products_files	products_id	products	covers	\N	\N	directus_files_id	\N	nullify
29	certifications	logo	directus_files	\N	\N	\N	\N	\N	nullify
30	products_certifications	certifications_id	certifications	\N	\N	\N	products_id	\N	nullify
31	products_certifications	products_id	products	certifications	\N	\N	certifications_id	\N	nullify
33	colors	image	directus_files	\N	\N	\N	\N	\N	nullify
34	specs	color_id	colors	specs	\N	\N	\N	\N	nullify
32	colors	product_id	products	colors	\N	\N	\N	\N	nullify
35	tags_products	products_id	products	\N	\N	\N	tags_id	\N	nullify
37	products_tags	tags_id	tags	\N	\N	\N	products_id	\N	nullify
36	tags_products	tags_id	tags	\N	\N	\N	products_id	\N	nullify
38	products_tags	products_id	products	\N	\N	\N	tags_id	\N	nullify
39	products_tags_1	tags_id	tags	\N	\N	\N	products_id	\N	nullify
40	products_tags_1	products_id	products	tags	\N	\N	tags_id	\N	nullify
41	products	category	categories	\N	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	2	directus_settings	1	{"default_language":"zh-TW"}	{"default_language":"zh-TW"}	\N	\N
2	3	directus_settings	1	{"id":1,"project_name":"jypaper","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"zh-TW","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null}	{"project_name":"jypaper"}	\N	\N
3	4	directus_fields	1	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"products"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"products"}	\N	\N
4	5	directus_collections	products	{"singleton":true,"collection":"products"}	{"singleton":true,"collection":"products"}	\N	\N
5	6	directus_fields	2	{"sort":2,"interface":"input","special":null,"options":{"placeholder":"產品名稱"},"collection":"products","field":"name"}	{"sort":2,"interface":"input","special":null,"options":{"placeholder":"產品名稱"},"collection":"products","field":"name"}	\N	\N
6	7	directus_fields	3	{"sort":3,"interface":"input","special":null,"collection":"products","field":"slug"}	{"sort":3,"interface":"input","special":null,"collection":"products","field":"slug"}	\N	\N
7	8	directus_fields	4	{"sort":4,"interface":"file-image","special":["file"],"options":{"letterbox":true},"collection":"products","field":"Cover"}	{"sort":4,"interface":"file-image","special":["file"],"options":{"letterbox":true},"collection":"products","field":"Cover"}	\N	\N
8	10	directus_fields	5	{"sort":4,"interface":"file-image","special":["file"],"collection":"products","field":"cover"}	{"sort":4,"interface":"file-image","special":["file"],"collection":"products","field":"cover"}	\N	\N
9	11	directus_fields	6	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"certifications"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"certifications"}	\N	\N
10	12	directus_collections	certifications	{"singleton":true,"collection":"certifications"}	{"singleton":true,"collection":"certifications"}	\N	\N
11	13	directus_fields	7	{"sort":2,"interface":"input","special":null,"collection":"certifications","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"certifications","field":"name"}	\N	\N
12	14	directus_fields	8	{"sort":3,"interface":"file-image","special":["file"],"collection":"certifications","field":"logo"}	{"sort":3,"interface":"file-image","special":["file"],"collection":"certifications","field":"logo"}	\N	\N
13	19	directus_fields	9	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"certifications"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"certifications"}	\N	\N
14	20	directus_collections	certifications	{"singleton":true,"collection":"certifications"}	{"singleton":true,"collection":"certifications"}	\N	\N
15	21	directus_fields	10	{"sort":2,"interface":"input","special":null,"collection":"certifications","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"certifications","field":"name"}	\N	\N
16	22	directus_fields	11	{"sort":3,"interface":"file-image","special":["file"],"collection":"certifications","field":"logo"}	{"sort":3,"interface":"file-image","special":["file"],"collection":"certifications","field":"logo"}	\N	\N
17	23	directus_collections	certifications	{"collection":"certifications","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"singleton":false}	\N	\N
18	24	directus_fields	12	{"sort":5,"interface":"list-m2m","special":["m2m"],"collection":"products","field":"certification"}	{"sort":5,"interface":"list-m2m","special":["m2m"],"collection":"products","field":"certification"}	\N	\N
19	25	directus_fields	13	{"sort":1,"hidden":true,"field":"id","collection":"products_certifications"}	{"sort":1,"hidden":true,"field":"id","collection":"products_certifications"}	\N	\N
20	26	directus_collections	products_certifications	{"hidden":true,"icon":"import_export","collection":"products_certifications"}	{"hidden":true,"icon":"import_export","collection":"products_certifications"}	\N	\N
21	27	directus_fields	14	{"sort":2,"hidden":true,"collection":"products_certifications","field":"products_id"}	{"sort":2,"hidden":true,"collection":"products_certifications","field":"products_id"}	\N	\N
22	28	directus_fields	15	{"sort":3,"hidden":true,"collection":"products_certifications","field":"certifications_id"}	{"sort":3,"hidden":true,"collection":"products_certifications","field":"certifications_id"}	\N	\N
23	29	directus_fields	16	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"color"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"color"}	\N	\N
24	30	directus_collections	color	{"singleton":false,"collection":"color"}	{"singleton":false,"collection":"color"}	\N	\N
25	47	directus_fields	17	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"product"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"product"}	\N	\N
42	64	directus_fields	32	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"certifications"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"certifications"}	\N	\N
61	83	directus_fields	49	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"colors"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"colors"}	\N	\N
62	84	directus_fields	50	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"colors"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"colors"}	\N	\N
26	48	directus_fields	18	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"product"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"product"}	\N	\N
27	49	directus_fields	19	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"product"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"product"}	\N	\N
28	50	directus_fields	20	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"product"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"product"}	\N	\N
29	51	directus_fields	21	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"product"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"product"}	\N	\N
30	52	directus_fields	22	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"product"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"product"}	\N	\N
31	53	directus_fields	23	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"product"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"product"}	\N	\N
32	54	directus_collections	product	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"product"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"product"}	\N	\N
33	55	directus_fields	24	{"sort":8,"interface":"input","special":null,"options":{"placeholder":"產品名稱"},"collection":"product","field":"name"}	{"sort":8,"interface":"input","special":null,"options":{"placeholder":"產品名稱"},"collection":"product","field":"name"}	\N	\N
34	56	directus_fields	25	{"sort":9,"interface":"input","special":null,"validation":null,"collection":"product","field":"slug"}	{"sort":9,"interface":"input","special":null,"validation":null,"collection":"product","field":"slug"}	\N	\N
35	57	directus_fields	26	{"sort":10,"interface":"files","special":["files"],"collection":"product","field":"covers"}	{"sort":10,"interface":"files","special":["files"],"collection":"product","field":"covers"}	\N	\N
36	58	directus_fields	27	{"sort":1,"hidden":true,"field":"id","collection":"product_files"}	{"sort":1,"hidden":true,"field":"id","collection":"product_files"}	\N	\N
37	59	directus_collections	product_files	{"hidden":true,"icon":"import_export","collection":"product_files"}	{"hidden":true,"icon":"import_export","collection":"product_files"}	\N	\N
38	60	directus_fields	28	{"sort":2,"hidden":true,"collection":"product_files","field":"product_id"}	{"sort":2,"hidden":true,"collection":"product_files","field":"product_id"}	\N	\N
39	61	directus_fields	29	{"sort":3,"hidden":true,"collection":"product_files","field":"directus_files_id"}	{"sort":3,"hidden":true,"collection":"product_files","field":"directus_files_id"}	\N	\N
40	62	directus_fields	30	{"sort":11,"interface":"input-rich-text-html","special":null,"collection":"product","field":"content"}	{"sort":11,"interface":"input-rich-text-html","special":null,"collection":"product","field":"content"}	\N	\N
41	63	directus_fields	31	{"sort":12,"interface":"input-multiline","special":null,"collection":"product","field":"notice"}	{"sort":12,"interface":"input-multiline","special":null,"collection":"product","field":"notice"}	\N	\N
52	74	directus_fields	41	{"sort":13,"interface":"list-m2m","special":["m2m"],"collection":"product","field":"certs"}	{"sort":13,"interface":"list-m2m","special":["m2m"],"collection":"product","field":"certs"}	\N	\N
53	75	directus_fields	42	{"sort":1,"hidden":true,"field":"id","collection":"product_certifications"}	{"sort":1,"hidden":true,"field":"id","collection":"product_certifications"}	\N	\N
54	76	directus_collections	product_certifications	{"hidden":true,"icon":"import_export","collection":"product_certifications"}	{"hidden":true,"icon":"import_export","collection":"product_certifications"}	\N	\N
55	77	directus_fields	43	{"sort":2,"hidden":true,"collection":"product_certifications","field":"product_id"}	{"sort":2,"hidden":true,"collection":"product_certifications","field":"product_id"}	\N	\N
56	78	directus_fields	44	{"sort":3,"hidden":true,"collection":"product_certifications","field":"certifications_id"}	{"sort":3,"hidden":true,"collection":"product_certifications","field":"certifications_id"}	\N	\N
43	65	directus_fields	33	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"certifications"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"certifications"}	\N	\N
44	66	directus_fields	34	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"certifications"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"certifications"}	\N	\N
45	67	directus_fields	35	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"certifications"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"certifications"}	\N	\N
46	68	directus_fields	36	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"certifications"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"certifications"}	\N	\N
47	69	directus_fields	37	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"certifications"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"certifications"}	\N	\N
48	70	directus_fields	38	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"certifications"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"certifications"}	\N	\N
49	71	directus_collections	certifications	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"certifications"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"certifications"}	\N	\N
50	72	directus_fields	39	{"sort":8,"interface":"input","special":null,"collection":"certifications","field":"name"}	{"sort":8,"interface":"input","special":null,"collection":"certifications","field":"name"}	\N	\N
51	73	directus_fields	40	{"sort":9,"interface":"file-image","special":["file"],"collection":"certifications","field":"logo"}	{"sort":9,"interface":"file-image","special":["file"],"collection":"certifications","field":"logo"}	\N	\N
57	79	directus_fields	45	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"colors"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"colors"}	\N	\N
58	80	directus_fields	46	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"colors"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"colors"}	\N	\N
59	81	directus_fields	47	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"colors"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"colors"}	\N	\N
60	82	directus_fields	48	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"colors"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"colors"}	\N	\N
63	85	directus_fields	51	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"colors"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"colors"}	\N	\N
64	86	directus_collections	colors	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"colors"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"colors"}	\N	\N
65	87	directus_fields	52	{"sort":8,"interface":"list-m2a","special":["m2a"],"collection":"colors","field":"product_id"}	{"sort":8,"interface":"list-m2a","special":["m2a"],"collection":"colors","field":"product_id"}	\N	\N
66	88	directus_fields	53	{"sort":1,"hidden":true,"field":"id","collection":"colors_product_id"}	{"sort":1,"hidden":true,"field":"id","collection":"colors_product_id"}	\N	\N
67	89	directus_collections	colors_product_id	{"hidden":true,"icon":"import_export","collection":"colors_product_id"}	{"hidden":true,"icon":"import_export","collection":"colors_product_id"}	\N	\N
68	90	directus_fields	54	{"sort":2,"hidden":true,"collection":"colors_product_id","field":"colors_id"}	{"sort":2,"hidden":true,"collection":"colors_product_id","field":"colors_id"}	\N	\N
69	91	directus_fields	55	{"sort":3,"hidden":true,"collection":"colors_product_id","field":"item"}	{"sort":3,"hidden":true,"collection":"colors_product_id","field":"item"}	\N	\N
70	92	directus_fields	56	{"sort":4,"hidden":true,"collection":"colors_product_id","field":"collection"}	{"sort":4,"hidden":true,"collection":"colors_product_id","field":"collection"}	\N	\N
71	93	directus_fields	57	{"sort":9,"interface":"input","special":null,"collection":"colors","field":"name"}	{"sort":9,"interface":"input","special":null,"collection":"colors","field":"name"}	\N	\N
72	94	directus_fields	58	{"sort":10,"interface":"file-image","special":["file"],"collection":"colors","field":"image"}	{"sort":10,"interface":"file-image","special":["file"],"collection":"colors","field":"image"}	\N	\N
73	95	directus_fields	59	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"specs"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"specs"}	\N	\N
74	96	directus_fields	60	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"specs"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"specs"}	\N	\N
75	97	directus_fields	61	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"specs"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"specs"}	\N	\N
76	98	directus_fields	62	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"specs"}	{"sort":4,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"specs"}	\N	\N
77	99	directus_fields	63	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"specs"}	{"sort":5,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"specs"}	\N	\N
78	100	directus_fields	64	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"specs"}	{"sort":6,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"specs"}	\N	\N
79	101	directus_fields	65	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"specs"}	{"sort":7,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"specs"}	\N	\N
80	102	directus_collections	specs	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"specs"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"specs"}	\N	\N
81	103	directus_fields	66	{"sort":8,"interface":"list-m2a","special":["m2a"],"collection":"specs","field":"color_id"}	{"sort":8,"interface":"list-m2a","special":["m2a"],"collection":"specs","field":"color_id"}	\N	\N
82	104	directus_fields	67	{"sort":1,"hidden":true,"field":"id","collection":"specs_color_id"}	{"sort":1,"hidden":true,"field":"id","collection":"specs_color_id"}	\N	\N
83	105	directus_collections	specs_color_id	{"hidden":true,"icon":"import_export","collection":"specs_color_id"}	{"hidden":true,"icon":"import_export","collection":"specs_color_id"}	\N	\N
84	106	directus_fields	68	{"sort":2,"hidden":true,"collection":"specs_color_id","field":"specs_id"}	{"sort":2,"hidden":true,"collection":"specs_color_id","field":"specs_id"}	\N	\N
85	107	directus_fields	69	{"sort":3,"hidden":true,"collection":"specs_color_id","field":"item"}	{"sort":3,"hidden":true,"collection":"specs_color_id","field":"item"}	\N	\N
86	108	directus_fields	70	{"sort":4,"hidden":true,"collection":"specs_color_id","field":"collection"}	{"sort":4,"hidden":true,"collection":"specs_color_id","field":"collection"}	\N	\N
87	109	directus_fields	71	{"sort":9,"interface":"input","special":null,"collection":"specs","field":"gsm"}	{"sort":9,"interface":"input","special":null,"collection":"specs","field":"gsm"}	\N	\N
88	110	directus_fields	72	{"sort":10,"interface":"input","special":null,"collection":"specs","field":"thickness"}	{"sort":10,"interface":"input","special":null,"collection":"specs","field":"thickness"}	\N	\N
89	111	directus_fields	73	{"sort":11,"interface":"input","special":null,"collection":"specs","field":"size"}	{"sort":11,"interface":"input","special":null,"collection":"specs","field":"size"}	\N	\N
90	112	directus_fields	74	{"sort":14,"interface":"list-o2m","special":["o2m"],"options":{"layout":"table"},"collection":"product","field":"colors"}	{"sort":14,"interface":"list-o2m","special":["o2m"],"options":{"layout":"table"},"collection":"product","field":"colors"}	\N	\N
91	115	directus_fields	75	{"sort":12,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"specs","field":"color_id"}	{"sort":12,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"specs","field":"color_id"}	\N	\N
92	116	directus_fields	76	{"sort":1,"hidden":true,"field":"id","collection":"specs_color_id_1"}	{"sort":1,"hidden":true,"field":"id","collection":"specs_color_id_1"}	\N	\N
93	117	directus_collections	specs_color_id_1	{"hidden":true,"icon":"import_export","collection":"specs_color_id_1"}	{"hidden":true,"icon":"import_export","collection":"specs_color_id_1"}	\N	\N
94	118	directus_fields	77	{"sort":2,"hidden":true,"collection":"specs_color_id_1","field":"specs_id"}	{"sort":2,"hidden":true,"collection":"specs_color_id_1","field":"specs_id"}	\N	\N
95	119	directus_fields	78	{"sort":3,"hidden":true,"collection":"specs_color_id_1","field":"item"}	{"sort":3,"hidden":true,"collection":"specs_color_id_1","field":"item"}	\N	\N
96	120	directus_fields	79	{"sort":4,"hidden":true,"collection":"specs_color_id_1","field":"collection"}	{"sort":4,"hidden":true,"collection":"specs_color_id_1","field":"collection"}	\N	\N
97	121	directus_fields	80	{"sort":11,"interface":"list-o2m","special":["o2m"],"options":{"sort":null},"collection":"colors","field":"specs"}	{"sort":11,"interface":"list-o2m","special":["o2m"],"options":{"sort":null},"collection":"colors","field":"specs"}	\N	\N
98	122	directus_fields	80	{"id":80,"collection":"colors","field":"specs","special":["o2m"],"interface":"list-o2m","options":{"sort":null,"layout":"table"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"specs","options":{"sort":null,"layout":"table"}}	\N	\N
99	123	directus_files	b4c5aa04-aef9-4388-9388-8f430d4eeb24	{"title":"Movie Image From Unsplash","filename_download":"Movie Image from Unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Movie Image From Unsplash","filename_download":"Movie Image from Unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
100	124	directus_files	36fbbe81-90a8-41ca-8a43-32eab16646c0	{"title":"Star","filename_download":"star.png","type":"image/png","storage":"local"}	{"title":"Star","filename_download":"star.png","type":"image/png","storage":"local"}	\N	\N
101	125	directus_files	47c21c49-baf4-43da-9006-f3142d653d41	{"title":"8 Pinterest","filename_download":"8 Pinterest.png","type":"image/png","storage":"local"}	{"title":"8 Pinterest","filename_download":"8 Pinterest.png","type":"image/png","storage":"local"}	\N	\N
145	242	directus_fields	97	{"sort":2,"interface":"input","special":null,"collection":"certifications","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"certifications","field":"name"}	\N	\N
106	131	directus_fields	81	{"sort":12,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"colors","field":"product_id"}	{"sort":12,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"colors","field":"product_id"}	\N	\N
107	132	directus_fields	45	{"id":45,"collection":"colors","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"id","sort":1,"group":null}	\N	\N
146	243	directus_fields	98	{"sort":3,"interface":"file-image","special":["file"],"collection":"certifications","field":"logo"}	{"sort":3,"interface":"file-image","special":["file"],"collection":"certifications","field":"logo"}	\N	\N
147	244	directus_fields	99	{"sort":11,"interface":"list-m2m","special":["m2m"],"required":false,"collection":"products","field":"certifications"}	{"sort":11,"interface":"list-m2m","special":["m2m"],"required":false,"collection":"products","field":"certifications"}	\N	\N
108	133	directus_fields	46	{"id":46,"collection":"colors","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"status","sort":2,"group":null}	\N	\N
109	134	directus_fields	47	{"id":47,"collection":"colors","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"sort","sort":3,"group":null}	\N	\N
110	135	directus_fields	48	{"id":48,"collection":"colors","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"user_created","sort":4,"group":null}	\N	\N
111	136	directus_fields	49	{"id":49,"collection":"colors","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"date_created","sort":5,"group":null}	\N	\N
112	137	directus_fields	50	{"id":50,"collection":"colors","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"user_updated","sort":6,"group":null}	\N	\N
113	138	directus_fields	51	{"id":51,"collection":"colors","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":7,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"date_updated","sort":7,"group":null}	\N	\N
114	139	directus_fields	81	{"id":81,"collection":"colors","field":"product_id","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"product_id","sort":8,"group":null}	\N	\N
115	140	directus_fields	57	{"id":57,"collection":"colors","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"name","sort":9,"group":null}	\N	\N
116	141	directus_fields	58	{"id":58,"collection":"colors","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"image","sort":10,"group":null}	\N	\N
117	142	directus_fields	80	{"id":80,"collection":"colors","field":"specs","special":["o2m"],"interface":"list-o2m","options":{"sort":null,"layout":"table"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"specs","sort":11,"group":null}	\N	\N
118	143	directus_fields	82	{"sort":14,"interface":"list-o2m","special":["o2m"],"collection":"product","field":"colors"}	{"sort":14,"interface":"list-o2m","special":["o2m"],"collection":"product","field":"colors"}	\N	\N
119	144	directus_files	842010c4-1b1f-4280-80ba-e1aae5998e9f	{"title":"Retro Beige","filename_download":"retro beige.jpg","type":"image/jpeg","storage":"local"}	{"title":"Retro Beige","filename_download":"retro beige.jpg","type":"image/jpeg","storage":"local"}	\N	\N
120	145	directus_files	1b2a312c-93ca-43b9-b0a3-24817a82804a	{"title":"Retro Beige Thumbnail","filename_download":"retro beige_thumbnail.png","type":"image/png","storage":"local"}	{"title":"Retro Beige Thumbnail","filename_download":"retro beige_thumbnail.png","type":"image/png","storage":"local"}	\N	\N
121	146	directus_files	a934f351-bd90-4eed-b6bc-7daceeb96d8e	{"title":"Cork Oak Mahogany Thumbnail","filename_download":"cork oak mahogany_thumbnail.png","type":"image/png","storage":"local"}	{"title":"Cork Oak Mahogany Thumbnail","filename_download":"cork oak mahogany_thumbnail.png","type":"image/png","storage":"local"}	\N	\N
128	225	directus_fields	83	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"products"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"products"}	\N	\N
129	226	directus_fields	84	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"products"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"products"}	\N	\N
130	227	directus_fields	85	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"products"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"products"}	\N	\N
131	228	directus_fields	86	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"products"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"products"}	\N	\N
132	229	directus_fields	87	{"sort":5,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"products"}	{"sort":5,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"products"}	\N	\N
133	230	directus_collections	products	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"products"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"products"}	\N	\N
134	231	directus_fields	88	{"sort":6,"interface":"input","special":null,"required":true,"collection":"products","field":"name"}	{"sort":6,"interface":"input","special":null,"required":true,"collection":"products","field":"name"}	\N	\N
135	232	directus_fields	89	{"sort":7,"interface":"input","special":null,"collection":"products","field":"slug"}	{"sort":7,"interface":"input","special":null,"collection":"products","field":"slug"}	\N	\N
136	233	directus_fields	90	{"sort":8,"interface":"files","special":["files"],"collection":"products","field":"covers"}	{"sort":8,"interface":"files","special":["files"],"collection":"products","field":"covers"}	\N	\N
137	234	directus_fields	91	{"sort":1,"hidden":true,"field":"id","collection":"products_files"}	{"sort":1,"hidden":true,"field":"id","collection":"products_files"}	\N	\N
138	235	directus_collections	products_files	{"hidden":true,"icon":"import_export","collection":"products_files"}	{"hidden":true,"icon":"import_export","collection":"products_files"}	\N	\N
139	236	directus_fields	92	{"sort":2,"hidden":true,"collection":"products_files","field":"products_id"}	{"sort":2,"hidden":true,"collection":"products_files","field":"products_id"}	\N	\N
140	237	directus_fields	93	{"sort":3,"hidden":true,"collection":"products_files","field":"directus_files_id"}	{"sort":3,"hidden":true,"collection":"products_files","field":"directus_files_id"}	\N	\N
141	238	directus_fields	94	{"sort":9,"interface":"input-rich-text-html","special":null,"collection":"products","field":"content"}	{"sort":9,"interface":"input-rich-text-html","special":null,"collection":"products","field":"content"}	\N	\N
142	239	directus_fields	95	{"sort":10,"interface":"input-rich-text-html","special":null,"collection":"products","field":"notices"}	{"sort":10,"interface":"input-rich-text-html","special":null,"collection":"products","field":"notices"}	\N	\N
143	240	directus_fields	96	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"certifications"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"certifications"}	\N	\N
144	241	directus_collections	certifications	{"singleton":false,"collection":"certifications"}	{"singleton":false,"collection":"certifications"}	\N	\N
148	245	directus_fields	100	{"sort":1,"hidden":true,"field":"id","collection":"products_certifications"}	{"sort":1,"hidden":true,"field":"id","collection":"products_certifications"}	\N	\N
149	246	directus_collections	products_certifications	{"hidden":true,"icon":"import_export","collection":"products_certifications"}	{"hidden":true,"icon":"import_export","collection":"products_certifications"}	\N	\N
150	247	directus_fields	101	{"sort":2,"hidden":true,"collection":"products_certifications","field":"products_id"}	{"sort":2,"hidden":true,"collection":"products_certifications","field":"products_id"}	\N	\N
151	248	directus_fields	102	{"sort":3,"hidden":true,"collection":"products_certifications","field":"certifications_id"}	{"sort":3,"hidden":true,"collection":"products_certifications","field":"certifications_id"}	\N	\N
152	249	directus_fields	103	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"colors"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"colors"}	\N	\N
153	250	directus_fields	104	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"colors"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"colors"}	\N	\N
154	251	directus_fields	105	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"colors"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"colors"}	\N	\N
155	252	directus_collections	colors	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"colors"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"colors"}	\N	\N
156	253	directus_fields	106	{"sort":4,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"colors","field":"product_id"}	{"sort":4,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"colors","field":"product_id"}	\N	\N
157	254	directus_fields	107	{"sort":5,"interface":"input","special":null,"collection":"colors","field":"name"}	{"sort":5,"interface":"input","special":null,"collection":"colors","field":"name"}	\N	\N
158	255	directus_fields	108	{"sort":6,"interface":"file-image","special":["file"],"collection":"colors","field":"image"}	{"sort":6,"interface":"file-image","special":["file"],"collection":"colors","field":"image"}	\N	\N
159	256	directus_fields	109	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"specs"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"specs"}	\N	\N
160	257	directus_fields	110	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"specs"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"specs"}	\N	\N
161	258	directus_fields	111	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"specs"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"specs"}	\N	\N
162	259	directus_collections	specs	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"specs"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"specs"}	\N	\N
163	260	directus_fields	112	{"sort":4,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"specs","field":"color_id"}	{"sort":4,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"specs","field":"color_id"}	\N	\N
164	261	directus_fields	113	{"sort":5,"interface":"input","special":null,"collection":"specs","field":"gsm"}	{"sort":5,"interface":"input","special":null,"collection":"specs","field":"gsm"}	\N	\N
165	262	directus_fields	114	{"sort":6,"interface":"input","special":null,"collection":"specs","field":"thickness"}	{"sort":6,"interface":"input","special":null,"collection":"specs","field":"thickness"}	\N	\N
166	263	directus_fields	115	{"sort":7,"interface":"input","special":null,"collection":"specs","field":"size"}	{"sort":7,"interface":"input","special":null,"collection":"specs","field":"size"}	\N	\N
167	264	directus_fields	116	{"sort":7,"interface":"list-o2m","special":["o2m"],"collection":"colors","field":"specs"}	{"sort":7,"interface":"list-o2m","special":["o2m"],"collection":"colors","field":"specs"}	\N	\N
168	265	directus_fields	117	{"sort":12,"interface":"list-o2m","special":["o2m"],"collection":"products","field":"colors"}	{"sort":12,"interface":"list-o2m","special":["o2m"],"collection":"products","field":"colors"}	\N	\N
169	266	certifications	6fe89fdc-f717-4c45-9307-9835fda97c38	{"name":"FSC"}	{"name":"FSC"}	170	\N
172	269	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"status":"published","name":"純粹紙","slug":"pure-paper","covers":{"create":[{"products_id":"+","directus_files_id":{"id":"b4c5aa04-aef9-4388-9388-8f430d4eeb24"}}],"update":[],"delete":[]},"content":"<p>柔軟觸感，適合高階印刷應用。</p>","notices":"<ul>\\n<li>不適合用於平版印刷。</li>\\n<li>數位噴墨列印時，需自然乾燥。</li>\\n<li>適合燙金、凹凸壓印</li>\\n</ul>","certifications":{"create":[{"certifications_id":{"name":"FSC"}}],"update":[],"delete":[]}}	{"status":"published","name":"純粹紙","slug":"pure-paper","covers":{"create":[{"products_id":"+","directus_files_id":{"id":"b4c5aa04-aef9-4388-9388-8f430d4eeb24"}}],"update":[],"delete":[]},"content":"<p>柔軟觸感，適合高階印刷應用。</p>","notices":"<ul>\\n<li>不適合用於平版印刷。</li>\\n<li>數位噴墨列印時，需自然乾燥。</li>\\n<li>適合燙金、凹凸壓印</li>\\n</ul>","certifications":{"create":[{"certifications_id":{"name":"FSC"}}],"update":[],"delete":[]}}	\N	\N
170	267	products_certifications	1	{"certifications_id":{"name":"FSC"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"certifications_id":{"name":"FSC"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	172	\N
171	268	products_files	1	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","directus_files_id":{"id":"b4c5aa04-aef9-4388-9388-8f430d4eeb24"}}	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","directus_files_id":{"id":"b4c5aa04-aef9-4388-9388-8f430d4eeb24"}}	172	\N
174	271	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":null,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-19T17:36:37.421Z","name":"純粹紙","slug":"pure-paper","content":"<p>柔軟觸感，適合高階印刷應用。</p>","notices":"<ul>\\n<li>不適合用於平版印刷。</li>\\n<li>數位噴墨列印時，需自然乾燥。</li>\\n<li>適合燙金、凹凸壓印</li>\\n</ul>","covers":[1],"certifications":[1],"colors":["27b65559-1874-4610-8244-044a19e85e61"]}	{"date_updated":"2025-04-19T17:36:37.421Z"}	\N	\N
173	270	colors	27b65559-1874-4610-8244-044a19e85e61	{"name":"純白","image":"1b2a312c-93ca-43b9-b0a3-24817a82804a","product_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"name":"純白","image":"1b2a312c-93ca-43b9-b0a3-24817a82804a","product_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	174	\N
175	272	specs	ac4217ad-bbfa-4b5a-b0b9-ad60eb0bc65b	{"gsm":100,"thickness":120,"size":"35*31","color_id":"27b65559-1874-4610-8244-044a19e85e61"}	{"gsm":100,"thickness":120,"size":"35*31","color_id":"27b65559-1874-4610-8244-044a19e85e61"}	\N	\N
176	273	specs	7db304ef-eb30-4beb-abf9-8db5b96e1835	{"gsm":200,"thickness":200,"size":"35*31","color_id":"27b65559-1874-4610-8244-044a19e85e61"}	{"gsm":200,"thickness":200,"size":"35*31","color_id":"27b65559-1874-4610-8244-044a19e85e61"}	\N	\N
196	295	directus_permissions	18	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_files","action":"update"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_files","action":"update"}	\N	\N
228	331	directus_files	27cd5d72-4ddb-4586-832b-eec6624def7f	{"title":"R0007557","filename_download":"R0007557.JPG","type":"image/jpeg","storage":"local"}	{"title":"R0007557","filename_download":"R0007557.JPG","type":"image/jpeg","storage":"local"}	\N	\N
177	275	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":null,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-19T17:37:33.753Z","name":"純粹紙","slug":"pure-paper","content":"<p>柔軟觸感，適合高階印刷應用。</p>","notices":"<ul>\\n<li>不適合用於平版印刷。</li>\\n<li>數位噴墨列印時，需自然乾燥。</li>\\n<li>適合燙金、凹凸壓印</li>\\n</ul>","covers":[1],"certifications":[1],"colors":["27b65559-1874-4610-8244-044a19e85e61"]}	{"date_updated":"2025-04-19T17:37:33.753Z"}	\N	\N
178	277	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":null,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-19T17:37:55.594Z","name":"純粹紙","slug":"pure-paper","content":"<p>柔軟觸感，適合高階印刷應用。</p>","notices":"<ul>\\n<li>不適合用於平版印刷。</li>\\n<li>數位噴墨列印時，需自然乾燥。</li>\\n<li>適合燙金、凹凸壓印</li>\\n</ul>","covers":[1],"certifications":[1],"colors":["27b65559-1874-4610-8244-044a19e85e61"]}	{"date_updated":"2025-04-19T17:37:55.594Z"}	\N	\N
179	278	directus_permissions	1	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products","action":"read"}	\N	\N
180	279	directus_permissions	2	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products","action":"update"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products","action":"update"}	\N	\N
181	280	directus_permissions	3	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products","action":"create"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products","action":"create"}	\N	\N
182	281	directus_permissions	4	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products","action":"delete"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products","action":"delete"}	\N	\N
183	282	directus_permissions	5	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products","action":"share"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products","action":"share"}	\N	\N
184	283	directus_permissions	6	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"create"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"create"}	\N	\N
185	284	directus_permissions	7	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"read"}	\N	\N
186	285	directus_permissions	8	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"update"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"update"}	\N	\N
187	286	directus_permissions	9	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"delete"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"delete"}	\N	\N
188	287	directus_permissions	10	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"share"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"share"}	\N	\N
189	288	directus_permissions	11	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"specs","action":"create"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"specs","action":"create"}	\N	\N
190	289	directus_permissions	12	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"specs","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"specs","action":"read"}	\N	\N
191	290	directus_permissions	13	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"specs","action":"update"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"specs","action":"update"}	\N	\N
192	291	directus_permissions	14	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"specs","action":"delete"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"specs","action":"delete"}	\N	\N
193	292	directus_permissions	15	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"specs","action":"share"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"specs","action":"share"}	\N	\N
194	293	directus_permissions	16	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_files","action":"create"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_files","action":"create"}	\N	\N
195	294	directus_permissions	17	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_files","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_files","action":"read"}	\N	\N
197	296	directus_permissions	19	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_files","action":"delete"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_files","action":"delete"}	\N	\N
198	297	directus_permissions	20	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_files","action":"share"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_files","action":"share"}	\N	\N
199	299	directus_settings	1	{"id":1,"project_name":"jypaper","project_url":"http://localhost:3000","project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"zh-TW","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":true,"public_registration_verify_email":true,"public_registration_role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","public_registration_email_filter":null,"visual_editor_urls":null}	{"project_url":"http://localhost:3000","public_registration":true,"public_registration_role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60"}	\N	\N
200	300	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	{"id":"79e05c01-2824-458a-8e28-4fa9f391d91f","first_name":"Admin","last_name":"User","email":"admin@example.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","token":"**********","last_access":"2025-04-20T04:09:14.644Z","last_page":"/users/roles/c2e61469-bb36-41c7-8d5d-246e0ed96a60","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"policies":[]}	{"token":"**********"}	\N	\N
201	301	directus_users	79e05c01-2824-458a-8e28-4fa9f391d91f	{"id":"79e05c01-2824-458a-8e28-4fa9f391d91f","first_name":"Admin","last_name":"User","email":"admin@example.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","token":"**********","last_access":"2025-04-20T04:09:14.644Z","last_page":"/users/79e05c01-2824-458a-8e28-4fa9f391d91f","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"policies":[]}	{"token":"**********"}	\N	\N
202	302	directus_fields	106	{"id":106,"collection":"colors","field":"product_id","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"product_id","options":{"template":"{{name}}"}}	\N	\N
203	303	directus_fields	116	{"id":116,"collection":"colors","field":"specs","special":["o2m"],"interface":"list-o2m","options":{"template":"{{thickness}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"specs","options":{"template":"{{thickness}}"}}	\N	\N
204	304	directus_fields	112	{"id":112,"collection":"specs","field":"color_id","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"specs","field":"color_id","options":{"template":"{{name}}"}}	\N	\N
205	305	directus_fields	117	{"id":117,"collection":"products","field":"colors","special":["o2m"],"interface":"list-o2m","options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"colors","options":{"template":"{{name}}"}}	\N	\N
206	306	directus_fields	99	{"id":99,"collection":"products","field":"certifications","special":["m2m"],"interface":"list-m2m","options":{"template":"{{certifications_id}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"certifications","options":{"template":"{{certifications_id}}"}}	\N	\N
207	307	specs	5a2e2e73-b987-4938-a019-30d1726a0e63	{"gsm":120,"thickness":200,"size":"35*32","color_id":"0fd284cf-f18b-47a5-9386-ca0456e6dfcd"}	{"gsm":120,"thickness":200,"size":"35*32","color_id":"0fd284cf-f18b-47a5-9386-ca0456e6dfcd"}	209	\N
208	308	specs	4aea6668-94c5-42c5-bbf9-b764dcd2c0fc	{"gsm":300,"thickness":400,"size":"30*31","color_id":"0fd284cf-f18b-47a5-9386-ca0456e6dfcd"}	{"gsm":300,"thickness":400,"size":"30*31","color_id":"0fd284cf-f18b-47a5-9386-ca0456e6dfcd"}	209	\N
227	330	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-20T12:11:08.747Z","name":"純粹紙","slug":"pure-paper","content":"<p>柔軟觸感，適合高階印刷應用。</p>","notices":"<ul>\\n<li>不適合用於平版印刷。</li>\\n<li>數位噴墨列印時，需自然乾燥。</li>\\n<li>適合燙金、凹凸壓印</li>\\n</ul>","covers":[2],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1]}	{"date_updated":"2025-04-20T12:11:08.747Z"}	\N	\N
225	328	products_files	2	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","directus_files_id":{"id":"267f3111-6841-4b41-9c16-c75ea9cb499c"}}	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","directus_files_id":{"id":"267f3111-6841-4b41-9c16-c75ea9cb499c"}}	227	\N
226	329	products_files	1	{"id":1,"products_id":null,"directus_files_id":"b4c5aa04-aef9-4388-9388-8f430d4eeb24"}	{"products_id":null}	227	\N
210	310	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-20T05:21:48.556Z","name":"純粹紙","slug":"pure-paper","content":"<p>柔軟觸感，適合高階印刷應用。</p>","notices":"<ul>\\n<li>不適合用於平版印刷。</li>\\n<li>數位噴墨列印時，需自然乾燥。</li>\\n<li>適合燙金、凹凸壓印</li>\\n</ul>","covers":[1],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1]}	{"date_updated":"2025-04-20T05:21:48.556Z"}	\N	\N
209	309	colors	0fd284cf-f18b-47a5-9386-ca0456e6dfcd	{"name":"灰色","image":"a934f351-bd90-4eed-b6bc-7daceeb96d8e","specs":{"create":[{"gsm":120,"thickness":200,"size":"35*32"},{"gsm":300,"thickness":400,"size":"30*31"}],"update":[],"delete":[]},"product_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"name":"灰色","image":"a934f351-bd90-4eed-b6bc-7daceeb96d8e","specs":{"create":[{"gsm":120,"thickness":200,"size":"35*32"},{"gsm":300,"thickness":400,"size":"30*31"}],"update":[],"delete":[]},"product_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	210	\N
211	311	directus_fields	116	{"id":116,"collection":"colors","field":"specs","special":["o2m"],"interface":"list-o2m","options":{"template":"{{gsm}}{{thickness}}{{size}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"specs","options":{"template":"{{gsm}}{{thickness}}{{size}}"}}	\N	\N
212	312	directus_fields	116	{"id":116,"collection":"colors","field":"specs","special":["o2m"],"interface":"list-o2m","options":{"template":"{{gsm}}gsm,{{thickness}}g,{{size}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"colors","field":"specs","options":{"template":"{{gsm}}gsm,{{thickness}}g,{{size}}"}}	\N	\N
213	313	directus_permissions	21	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"read"}	\N	\N
214	315	directus_access	ce48a6d3-fe69-4727-8939-f00761679047	{"id":"ce48a6d3-fe69-4727-8939-f00761679047","role":null,"user":null,"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","sort":1}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
215	316	directus_permissions	22	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	\N	\N
216	319	directus_access	ce48a6d3-fe69-4727-8939-f00761679047	{"id":"ce48a6d3-fe69-4727-8939-f00761679047","role":null,"user":null,"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","sort":1}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
217	320	directus_settings	1	{"id":1,"project_name":"jypaper","project_url":"http://localhost:9003","project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"zh-TW","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":true,"public_registration_verify_email":true,"public_registration_role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","public_registration_email_filter":null,"visual_editor_urls":null}	{"project_url":"http://localhost:9003"}	\N	\N
218	321	directus_settings	1	{"id":1,"project_name":"jypaper","project_url":"http://localhost:8055","project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"zh-TW","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":true,"public_registration_verify_email":true,"public_registration_role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","public_registration_email_filter":null,"visual_editor_urls":null}	{"project_url":"http://localhost:8055"}	\N	\N
219	322	directus_files	96f4a43c-8e8c-45c5-b27a-c52a5efe7de9	{"title":"Cork Oak Mahogany Thumbnail","filename_download":"cork oak mahogany_thumbnail.png","type":"image/png","storage":"local"}	{"title":"Cork Oak Mahogany Thumbnail","filename_download":"cork oak mahogany_thumbnail.png","type":"image/png","storage":"local"}	\N	\N
220	323	colors	27b65559-1874-4610-8244-044a19e85e61	{"id":"27b65559-1874-4610-8244-044a19e85e61","status":"draft","sort":null,"product_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","name":"純白","image":"96f4a43c-8e8c-45c5-b27a-c52a5efe7de9","specs":["ac4217ad-bbfa-4b5a-b0b9-ad60eb0bc65b","7db304ef-eb30-4beb-abf9-8db5b96e1835"]}	{"image":"96f4a43c-8e8c-45c5-b27a-c52a5efe7de9"}	\N	\N
221	324	colors	0fd284cf-f18b-47a5-9386-ca0456e6dfcd	{"id":"0fd284cf-f18b-47a5-9386-ca0456e6dfcd","status":"draft","sort":null,"product_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","name":"灰色","image":null,"specs":["5a2e2e73-b987-4938-a019-30d1726a0e63","4aea6668-94c5-42c5-bbf9-b764dcd2c0fc"]}	{"image":null}	\N	\N
222	325	directus_files	dc31066a-d184-4012-af18-acc66968901f	{"title":"Striped Blush Thumbnail","filename_download":"striped blush_thumbnail.png","type":"image/png","storage":"local"}	{"title":"Striped Blush Thumbnail","filename_download":"striped blush_thumbnail.png","type":"image/png","storage":"local"}	\N	\N
223	326	colors	0fd284cf-f18b-47a5-9386-ca0456e6dfcd	{"id":"0fd284cf-f18b-47a5-9386-ca0456e6dfcd","status":"draft","sort":null,"product_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","name":"灰色","image":"dc31066a-d184-4012-af18-acc66968901f","specs":["5a2e2e73-b987-4938-a019-30d1726a0e63","4aea6668-94c5-42c5-bbf9-b764dcd2c0fc"]}	{"image":"dc31066a-d184-4012-af18-acc66968901f"}	\N	\N
224	327	directus_files	267f3111-6841-4b41-9c16-c75ea9cb499c	{"title":"截圖 2025 04 10 18.44.44","filename_download":"截圖 2025-04-10 18.44.44.png","type":"image/png","storage":"local"}	{"title":"截圖 2025 04 10 18.44.44","filename_download":"截圖 2025-04-10 18.44.44.png","type":"image/png","storage":"local"}	\N	\N
269	381	directus_collections	products_tags	{"hidden":true,"icon":"import_export","collection":"products_tags"}	{"hidden":true,"icon":"import_export","collection":"products_tags"}	\N	\N
231	334	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-20T12:11:46.045Z","name":"純粹紙","slug":"pure-paper","content":"<p>柔軟觸感，適合高階印刷應用。</p>","notices":"<ul>\\n<li>不適合用於平版印刷。</li>\\n<li>數位噴墨列印時，需自然乾燥。</li>\\n<li>適合燙金、凹凸壓印</li>\\n</ul>","covers":[3],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1]}	{"date_updated":"2025-04-20T12:11:46.045Z"}	\N	\N
229	332	products_files	3	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","directus_files_id":{"id":"27cd5d72-4ddb-4586-832b-eec6624def7f"}}	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","directus_files_id":{"id":"27cd5d72-4ddb-4586-832b-eec6624def7f"}}	231	\N
230	333	products_files	2	{"id":2,"products_id":null,"directus_files_id":"267f3111-6841-4b41-9c16-c75ea9cb499c"}	{"products_id":null}	231	\N
232	335	directus_files	908951a5-a38f-4fa3-8f8e-b8256c9cf5b2	{"title":"R0007550","filename_download":"R0007550.JPG","type":"image/jpeg","storage":"local"}	{"title":"R0007550","filename_download":"R0007550.JPG","type":"image/jpeg","storage":"local"}	\N	\N
234	337	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-20T12:12:02.926Z","name":"純粹紙","slug":"pure-paper","content":"<p>柔軟觸感，適合高階印刷應用。</p>","notices":"<ul>\\n<li>不適合用於平版印刷。</li>\\n<li>數位噴墨列印時，需自然乾燥。</li>\\n<li>適合燙金、凹凸壓印</li>\\n</ul>","covers":[3,4],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1]}	{"date_updated":"2025-04-20T12:12:02.926Z"}	\N	\N
233	336	products_files	4	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","directus_files_id":{"id":"908951a5-a38f-4fa3-8f8e-b8256c9cf5b2"}}	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","directus_files_id":{"id":"908951a5-a38f-4fa3-8f8e-b8256c9cf5b2"}}	234	\N
236	346	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-20T14:29:29.133Z","name":"純粹紙","slug":"pure-paper","content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">使用牛奶盒（紙杯）製成<span lang=\\"EN-US\\">PCW</span>紙漿，混合環保認證紙漿抄製</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">添加烘豆廢料<span lang=\\"EN-US\\">──</span>銀皮，為紙張增加更多層次</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">彩色印刷、軋型、燙金、打凹凸、局部光<span lang=\\"EN-US\\">&hellip;&hellip;</span>等各式印刷加工</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Suitable for color printing, die-cutting, hot stamping, embossing, spot UV coating, and other various printing processes.</span></p>","covers":[3,4],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1]}	{"content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">使用牛奶盒（紙杯）製成<span lang=\\"EN-US\\">PCW</span>紙漿，混合環保認證紙漿抄製</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">添加烘豆廢料<span lang=\\"EN-US\\">──</span>銀皮，為紙張增加更多層次</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">彩色印刷、軋型、燙金、打凹凸、局部光<span lang=\\"EN-US\\">&hellip;&hellip;</span>等各式印刷加工</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Suitable for color printing, die-cutting, hot stamping, embossing, spot UV coating, and other various printing processes.</span></p>","date_updated":"2025-04-20T14:29:29.133Z"}	\N	\N
235	345	products_certifications	1	{"id":1,"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","certifications_id":"6fe89fdc-f717-4c45-9307-9835fda97c38"}	{"certifications_id":"6fe89fdc-f717-4c45-9307-9835fda97c38"}	236	\N
237	347	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-20T15:08:25.534Z","name":"純粹紙","slug":"pure-paper","content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">添加烘豆廢料<span lang=\\"EN-US\\">──</span>銀皮，為紙張增加更多層次</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">彩色印刷、軋型、燙金、打凹凸、局部光<span lang=\\"EN-US\\">&hellip;&hellip;</span>等各式印刷加工</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Suitable for color printing, die-cutting, hot stamping, embossing, spot UV coating, and other various printing processes.</span></p>","covers":[3,4],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1]}	{"content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">添加烘豆廢料<span lang=\\"EN-US\\">──</span>銀皮，為紙張增加更多層次</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","date_updated":"2025-04-20T15:08:25.534Z"}	\N	\N
238	348	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-20T15:08:36.989Z","name":"純粹紙","slug":"pure-paper","content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">彩色印刷、軋型、燙金、打凹凸、局部光<span lang=\\"EN-US\\">&hellip;&hellip;</span>等各式印刷加工</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Suitable for color printing, die-cutting, hot stamping, embossing, spot UV coating, and other various printing processes.</span></p>","covers":[3,4],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1]}	{"content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","date_updated":"2025-04-20T15:08:36.989Z"}	\N	\N
270	382	directus_fields	130	{"sort":2,"hidden":true,"collection":"products_tags","field":"products_id"}	{"sort":2,"hidden":true,"collection":"products_tags","field":"products_id"}	\N	\N
271	383	directus_fields	131	{"sort":3,"hidden":true,"collection":"products_tags","field":"tags_id"}	{"sort":3,"hidden":true,"collection":"products_tags","field":"tags_id"}	\N	\N
324	461	directus_fields	85	{"id":85,"collection":"products","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"sort","sort":4,"group":null}	\N	\N
325	462	directus_fields	86	{"id":86,"collection":"products","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"date_created","sort":5,"group":null}	\N	\N
239	349	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-20T15:08:57.106Z","name":"純粹紙","slug":"pure-paper","content":"<p>123</p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">彩色印刷、軋型、燙金、打凹凸、局部光<span lang=\\"EN-US\\">&hellip;&hellip;</span>等各式印刷加工</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Suitable for color printing, die-cutting, hot stamping, embossing, spot UV coating, and other various printing processes.</span></p>","covers":[3,4],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1]}	{"content":"<p>123</p>","date_updated":"2025-04-20T15:08:57.106Z"}	\N	\N
240	350	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-20T15:09:51.759Z","name":"純粹紙","slug":"pure-paper","content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">使用牛奶盒（紙杯）製成<span lang=\\"EN-US\\">PCW</span>紙漿，混合環保認證紙漿抄製</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">添加烘豆廢料<span lang=\\"EN-US\\">──</span>銀皮，為紙張增加更多層次</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">彩色印刷、軋型、燙金、打凹凸、局部光<span lang=\\"EN-US\\">&hellip;&hellip;</span>等各式印刷加工</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Suitable for color printing, die-cutting, hot stamping, embossing, spot UV coating, and other various printing processes.</span></p>","covers":[3,4],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1]}	{"content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">使用牛奶盒（紙杯）製成<span lang=\\"EN-US\\">PCW</span>紙漿，混合環保認證紙漿抄製</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">添加烘豆廢料<span lang=\\"EN-US\\">──</span>銀皮，為紙張增加更多層次</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","date_updated":"2025-04-20T15:09:51.759Z"}	\N	\N
241	351	directus_collections	products	{"collection":"products","icon":null,"note":null,"display_template":"{{name}}","hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"display_template":"{{name}}"}	\N	\N
242	352	directus_collections	products	{"collection":"products","icon":null,"note":null,"display_template":"紙品","hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"display_template":"紙品"}	\N	\N
243	353	directus_collections	products	{"collection":"products","icon":"dual_screen","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":"#FFC23B","item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"icon":"dual_screen","display_template":null,"color":"#FFC23B"}	\N	\N
244	354	directus_collections	products	{"collection":"products","icon":"dual_screen","note":null,"display_template":"紙品","hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":"#FFC23B","item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"display_template":"紙品"}	\N	\N
245	355	directus_collections	products	{"collection":"products","icon":"dual_screen","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":"#FFC23B","item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"display_template":null}	\N	\N
246	356	directus_collections	products	{"collection":"products","icon":"dual_screen","note":null,"display_template":"{{name}}","hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":"#FFC23B","item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"display_template":"{{name}}"}	\N	\N
247	358	directus_fields	90	{"id":90,"collection":"products","field":"covers","special":["files"],"interface":"files","options":{"template":"{{products_id}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"covers","options":{"template":"{{products_id}}"}}	\N	\N
248	359	directus_settings	1	{"id":1,"project_name":"jypaper","project_url":"http://localhost:8055","project_color":"#D5E274","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"zh-TW","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":true,"public_registration_verify_email":true,"public_registration_role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","public_registration_email_filter":null,"visual_editor_urls":null}	{"project_color":"#D5E274"}	\N	\N
249	360	directus_settings	1	{"id":1,"project_name":"jypaper","project_url":"http://localhost:8055","project_color":"#FFDA1F","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"zh-TW","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":true,"public_registration_verify_email":true,"public_registration_role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","public_registration_email_filter":null,"visual_editor_urls":null}	{"project_color":"#FFDA1F"}	\N	\N
250	361	directus_settings	1	{"id":1,"project_name":"jypaper","project_url":"http://localhost:8055","project_color":"#BEDFF4","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"zh-TW","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":true,"public_registration_verify_email":true,"public_registration_role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","public_registration_email_filter":null,"visual_editor_urls":null}	{"project_color":"#BEDFF4"}	\N	\N
251	362	directus_fields	118	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"tags"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"tags"}	\N	\N
335	472	categories	11927347-43ef-4610-8cab-55ab5b98b9b3	{"name":"色紙","slug":"colored"}	{"name":"色紙","slug":"colored"}	\N	\N
252	363	directus_fields	119	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"tags"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"tags"}	\N	\N
253	364	directus_fields	120	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"tags"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"tags"}	\N	\N
254	365	directus_collections	tags	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"tags"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"tags"}	\N	\N
255	366	directus_fields	121	{"sort":4,"interface":"input","special":null,"collection":"tags","field":"name"}	{"sort":4,"interface":"input","special":null,"collection":"tags","field":"name"}	\N	\N
256	367	directus_fields	122	{"sort":5,"interface":"input","special":null,"collection":"tags","field":"slug"}	{"sort":5,"interface":"input","special":null,"collection":"tags","field":"slug"}	\N	\N
257	368	directus_fields	123	{"sort":6,"interface":"list-m2m","special":["m2m"],"collection":"tags","field":"product_id"}	{"sort":6,"interface":"list-m2m","special":["m2m"],"collection":"tags","field":"product_id"}	\N	\N
258	369	directus_fields	124	{"sort":1,"hidden":true,"field":"id","collection":"tags_products"}	{"sort":1,"hidden":true,"field":"id","collection":"tags_products"}	\N	\N
259	370	directus_collections	tags_products	{"hidden":true,"icon":"import_export","collection":"tags_products"}	{"hidden":true,"icon":"import_export","collection":"tags_products"}	\N	\N
260	371	directus_fields	125	{"sort":2,"hidden":true,"collection":"tags_products","field":"tags_id"}	{"sort":2,"hidden":true,"collection":"tags_products","field":"tags_id"}	\N	\N
261	372	directus_fields	126	{"sort":3,"hidden":true,"collection":"tags_products","field":"products_id"}	{"sort":3,"hidden":true,"collection":"tags_products","field":"products_id"}	\N	\N
262	373	directus_settings	1	{"id":1,"project_name":"jypaper","project_url":"http://localhost:8055","project_color":"#8C43E5","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"zh-TW","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":true,"public_registration_verify_email":true,"public_registration_role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","public_registration_email_filter":null,"visual_editor_urls":null}	{"project_color":"#8C43E5"}	\N	\N
263	374	directus_settings	1	{"id":1,"project_name":"jypaper","project_url":"http://localhost:8055","project_color":"#7300FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"zh-TW","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":true,"public_registration_verify_email":true,"public_registration_role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","public_registration_email_filter":null,"visual_editor_urls":null}	{"project_color":"#7300FF"}	\N	\N
264	375	directus_settings	1	{"id":1,"project_name":"jypaper","project_url":"http://localhost:8055","project_color":"#7214FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"zh-TW","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":true,"public_registration_verify_email":true,"public_registration_role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","public_registration_email_filter":null,"visual_editor_urls":null}	{"project_color":"#7214FF"}	\N	\N
265	376	directus_fields	127	{"sort":13,"interface":"list-o2m","special":["o2m"],"options":{"template":"{{name}}"},"collection":"products","field":"tags"}	{"sort":13,"interface":"list-o2m","special":["o2m"],"options":{"template":"{{name}}"},"collection":"products","field":"tags"}	\N	\N
266	377	directus_fields	127	{"id":127,"collection":"products","field":"tags","special":["o2m"],"interface":null,"options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"tags","interface":null}	\N	\N
267	379	directus_fields	128	{"sort":13,"interface":"list-m2m","special":["m2m"],"collection":"products","field":"tags"}	{"sort":13,"interface":"list-m2m","special":["m2m"],"collection":"products","field":"tags"}	\N	\N
268	380	directus_fields	129	{"sort":1,"hidden":true,"field":"id","collection":"products_tags"}	{"sort":1,"hidden":true,"field":"id","collection":"products_tags"}	\N	\N
272	384	directus_fields	128	{"id":128,"collection":"products","field":"tags","special":["m2m"],"interface":"list-m2m","options":{"template":"{{tags_id}}{{tags_id.name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"tags","options":{"template":"{{tags_id}}{{tags_id.name}}"}}	\N	\N
273	385	tags	91e69dda-7bd3-4b15-8aa0-ae8696967150	{"name":"美術紙","slug":"art-paper"}	{"name":"美術紙","slug":"art-paper"}	274	\N
275	387	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-24T07:37:05.224Z","name":"純粹紙","slug":"pure-paper","content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">使用牛奶盒（紙杯）製成<span lang=\\"EN-US\\">PCW</span>紙漿，混合環保認證紙漿抄製</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">添加烘豆廢料<span lang=\\"EN-US\\">──</span>銀皮，為紙張增加更多層次</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">彩色印刷、軋型、燙金、打凹凸、局部光<span lang=\\"EN-US\\">&hellip;&hellip;</span>等各式印刷加工</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Suitable for color printing, die-cutting, hot stamping, embossing, spot UV coating, and other various printing processes.</span></p>","colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1],"covers":[3,4],"tags":[1]}	{"date_updated":"2025-04-24T07:37:05.224Z"}	\N	\N
274	386	products_tags	1	{"tags_id":{"name":"美術紙","slug":"art-paper"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"tags_id":{"name":"美術紙","slug":"art-paper"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	275	\N
276	389	directus_fields	128	{"id":128,"collection":"products","field":"tags","special":["m2m"],"interface":"list-m2m","options":{"template":"{{tags_id.name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"tags","options":{"template":"{{tags_id.name}}"}}	\N	\N
277	390	tags	d1e8698b-2e24-47a1-8e51-3db6d58908d3	{"name":"色紙","slug":"colored"}	{"name":"色紙","slug":"colored"}	\N	\N
278	391	tags	d1b03a91-f851-4235-8473-5024da8ec845	{"name":"無塗布","slug":"Uncoated"}	{"name":"無塗布","slug":"Uncoated"}	\N	\N
281	394	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-24T07:39:34.322Z","name":"純粹紙","slug":"pure-paper","content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">使用牛奶盒（紙杯）製成<span lang=\\"EN-US\\">PCW</span>紙漿，混合環保認證紙漿抄製</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">添加烘豆廢料<span lang=\\"EN-US\\">──</span>銀皮，為紙張增加更多層次</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">彩色印刷、軋型、燙金、打凹凸、局部光<span lang=\\"EN-US\\">&hellip;&hellip;</span>等各式印刷加工</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Suitable for color printing, die-cutting, hot stamping, embossing, spot UV coating, and other various printing processes.</span></p>","colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1],"covers":[3,4],"tags":[1,2,3]}	{"date_updated":"2025-04-24T07:39:34.322Z"}	\N	\N
279	392	products_tags	2	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","tags_id":{"id":"d1e8698b-2e24-47a1-8e51-3db6d58908d3"}}	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","tags_id":{"id":"d1e8698b-2e24-47a1-8e51-3db6d58908d3"}}	281	\N
280	393	products_tags	3	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","tags_id":{"id":"d1b03a91-f851-4235-8473-5024da8ec845"}}	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","tags_id":{"id":"d1b03a91-f851-4235-8473-5024da8ec845"}}	281	\N
282	396	directus_fields	132	{"sort":13,"interface":"list-m2m","special":["m2m"],"collection":"products","field":"tags"}	{"sort":13,"interface":"list-m2m","special":["m2m"],"collection":"products","field":"tags"}	\N	\N
283	397	directus_fields	133	{"sort":1,"hidden":true,"field":"id","collection":"products_tags_1"}	{"sort":1,"hidden":true,"field":"id","collection":"products_tags_1"}	\N	\N
284	398	directus_collections	products_tags_1	{"hidden":true,"icon":"import_export","collection":"products_tags_1"}	{"hidden":true,"icon":"import_export","collection":"products_tags_1"}	\N	\N
285	399	directus_fields	134	{"sort":2,"hidden":true,"collection":"products_tags_1","field":"products_id"}	{"sort":2,"hidden":true,"collection":"products_tags_1","field":"products_id"}	\N	\N
286	400	directus_fields	135	{"sort":3,"hidden":true,"collection":"products_tags_1","field":"tags_id"}	{"sort":3,"hidden":true,"collection":"products_tags_1","field":"tags_id"}	\N	\N
287	401	products_tags_1	1	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","tags_id":{"id":"91e69dda-7bd3-4b15-8aa0-ae8696967150"}}	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","tags_id":{"id":"91e69dda-7bd3-4b15-8aa0-ae8696967150"}}	290	\N
288	402	products_tags_1	2	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","tags_id":{"id":"d1e8698b-2e24-47a1-8e51-3db6d58908d3"}}	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","tags_id":{"id":"d1e8698b-2e24-47a1-8e51-3db6d58908d3"}}	290	\N
289	403	products_tags_1	3	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","tags_id":{"id":"d1b03a91-f851-4235-8473-5024da8ec845"}}	{"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","tags_id":{"id":"d1b03a91-f851-4235-8473-5024da8ec845"}}	290	\N
305	442	directus_fields	85	{"id":85,"collection":"products","field":"sort","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":true,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"sort","sort":3,"group":null}	\N	\N
346	486	tags	afb18732-5f67-4d12-8122-95564e686c22	{"name":"肌理"}	{"name":"肌理"}	347	\N
348	488	tags	09c58be0-5596-453a-ab28-401cfc3eeefb	{"name":"再生紙"}	{"name":"再生紙"}	349	\N
290	404	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-24T19:37:19.403Z","name":"純粹紙","slug":"pure-paper","content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">使用牛奶盒（紙杯）製成<span lang=\\"EN-US\\">PCW</span>紙漿，混合環保認證紙漿抄製</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">添加烘豆廢料<span lang=\\"EN-US\\">──</span>銀皮，為紙張增加更多層次</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">彩色印刷、軋型、燙金、打凹凸、局部光<span lang=\\"EN-US\\">&hellip;&hellip;</span>等各式印刷加工</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Suitable for color printing, die-cutting, hot stamping, embossing, spot UV coating, and other various printing processes.</span></p>","colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"certifications":[1],"covers":[3,4],"tags":[1,2,3]}	{"date_updated":"2025-04-24T19:37:19.403Z"}	\N	\N
291	405	directus_fields	132	{"id":132,"collection":"products","field":"tags","special":["m2m"],"interface":"list-m2m","options":{"template":"{{tags_id.name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"tags","options":{"template":"{{tags_id.name}}"}}	\N	\N
292	406	directus_permissions	23	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"certifications","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"certifications","action":"read"}	\N	\N
293	407	directus_permissions	24	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"tags","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"tags","action":"read"}	\N	\N
294	408	directus_permissions	12	{"id":12,"collection":"specs","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"specs","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
295	409	directus_permissions	17	{"id":17,"collection":"products_files","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"products_files","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
296	410	directus_permissions	1	{"id":1,"collection":"products","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"products","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
297	411	directus_permissions	7	{"id":7,"collection":"colors","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	{"collection":"colors","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
298	431	directus_permissions	25	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"colors","action":"read"}	\N	\N
299	433	directus_permissions	26	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"tags_products","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"tags_products","action":"read"}	\N	\N
300	434	directus_permissions	27	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_certifications","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_certifications","action":"read"}	\N	\N
301	435	directus_permissions	28	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_tags","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_tags","action":"read"}	\N	\N
302	436	directus_permissions	29	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_tags_1","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"products_tags_1","action":"read"}	\N	\N
303	440	directus_fields	83	{"id":83,"collection":"products","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"id","sort":1,"group":null}	\N	\N
304	441	directus_fields	84	{"id":84,"collection":"products","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"status","sort":2,"group":null}	\N	\N
306	443	directus_fields	86	{"id":86,"collection":"products","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"date_created","sort":4,"group":null}	\N	\N
307	444	directus_fields	87	{"id":87,"collection":"products","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"date_updated","sort":5,"group":null}	\N	\N
308	445	directus_fields	88	{"id":88,"collection":"products","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"name","sort":6,"group":null}	\N	\N
309	446	directus_fields	89	{"id":89,"collection":"products","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"slug","sort":7,"group":null}	\N	\N
310	447	directus_fields	90	{"id":90,"collection":"products","field":"covers","special":["files"],"interface":"files","options":{"template":"{{products_id}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"covers","sort":8,"group":null}	\N	\N
311	448	directus_fields	94	{"id":94,"collection":"products","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"content","sort":9,"group":null}	\N	\N
312	449	directus_fields	95	{"id":95,"collection":"products","field":"notices","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"notices","sort":10,"group":null}	\N	\N
313	450	directus_fields	117	{"id":117,"collection":"products","field":"colors","special":["o2m"],"interface":"list-o2m","options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"colors","sort":11,"group":null}	\N	\N
314	451	directus_fields	99	{"id":99,"collection":"products","field":"certifications","special":["m2m"],"interface":"list-m2m","options":{"template":"{{certifications_id}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"certifications","sort":12,"group":null}	\N	\N
315	452	directus_fields	132	{"id":132,"collection":"products","field":"tags","special":["m2m"],"interface":"list-m2m","options":{"template":"{{tags_id.name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"tags","sort":13,"group":null}	\N	\N
316	453	directus_fields	136	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"categories"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"categories"}	\N	\N
317	454	directus_collections	categories	{"singleton":false,"collection":"categories"}	{"singleton":false,"collection":"categories"}	\N	\N
318	455	directus_fields	137	{"sort":2,"interface":"input","special":null,"collection":"categories","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"categories","field":"name"}	\N	\N
319	456	directus_fields	138	{"sort":3,"interface":"input","special":null,"collection":"categories","field":"slug"}	{"sort":3,"interface":"input","special":null,"collection":"categories","field":"slug"}	\N	\N
320	457	directus_fields	139	{"sort":14,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{name}}"},"collection":"products","field":"category"}	{"sort":14,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{name}}"},"collection":"products","field":"category"}	\N	\N
321	458	directus_fields	139	{"id":139,"collection":"products","field":"category","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"category","sort":1,"group":null}	\N	\N
322	459	directus_fields	83	{"id":83,"collection":"products","field":"id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"id","sort":2,"group":null}	\N	\N
323	460	directus_fields	84	{"id":84,"collection":"products","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"status","sort":3,"group":null}	\N	\N
326	463	directus_fields	87	{"id":87,"collection":"products","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"date_updated","sort":6,"group":null}	\N	\N
327	464	directus_fields	88	{"id":88,"collection":"products","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"name","sort":7,"group":null}	\N	\N
328	465	directus_fields	89	{"id":89,"collection":"products","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"slug","sort":8,"group":null}	\N	\N
329	466	directus_fields	90	{"id":90,"collection":"products","field":"covers","special":["files"],"interface":"files","options":{"template":"{{products_id}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"covers","sort":9,"group":null}	\N	\N
330	467	directus_fields	94	{"id":94,"collection":"products","field":"content","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"content","sort":10,"group":null}	\N	\N
331	468	directus_fields	95	{"id":95,"collection":"products","field":"notices","special":null,"interface":"input-rich-text-html","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"notices","sort":11,"group":null}	\N	\N
332	469	directus_fields	117	{"id":117,"collection":"products","field":"colors","special":["o2m"],"interface":"list-o2m","options":{"template":"{{name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"colors","sort":12,"group":null}	\N	\N
333	470	directus_fields	99	{"id":99,"collection":"products","field":"certifications","special":["m2m"],"interface":"list-m2m","options":{"template":"{{certifications_id}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"certifications","sort":13,"group":null}	\N	\N
334	471	directus_fields	132	{"id":132,"collection":"products","field":"tags","special":["m2m"],"interface":"list-m2m","options":{"template":"{{tags_id.name}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":14,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"products","field":"tags","sort":14,"group":null}	\N	\N
336	473	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-04-24T20:47:33.133Z","name":"純粹紙","slug":"pure-paper","content":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">使用牛奶盒（紙杯）製成<span lang=\\"EN-US\\">PCW</span>紙漿，混合環保認證紙漿抄製</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">添加烘豆廢料<span lang=\\"EN-US\\">──</span>銀皮，為紙張增加更多層次</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">通過<span lang=\\"EN-US\\">GRS</span>、<span lang=\\"EN-US\\">REACH</span>、<span lang=\\"EN-US\\">ROHS&hellip;&hellip;</span>等標準驗證</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">不含螢光劑與重金屬，可<span lang=\\"EN-US\\">100%</span>生物降解、堆肥</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Use milk cartons (paper cups) to make PCW pulp, mixed with environmentally certified pulp for papermaking.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Add roasted bean waste&mdash;silver skin&mdash;to add more layers to the paper.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Pass standards verification such as GRS, REACH, ROHS, etc.</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Free from fluorescent agents and heavy metals, can be 100% biodegradable and compostable.</span></p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">彩色印刷、軋型、燙金、打凹凸、局部光<span lang=\\"EN-US\\">&hellip;&hellip;</span>等各式印刷加工</span></p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><span lang=\\"EN-US\\" style=\\"font-family: 'GenWanMin2 JP M'; mso-fareast-font-family: 'GenWanMin2 JP M'; mso-bidi-font-family: 'GenWanMin2 JP M';\\">Suitable for color printing, die-cutting, hot stamping, embossing, spot UV coating, and other various printing processes.</span></p>","category":"11927347-43ef-4610-8cab-55ab5b98b9b3","certifications":[1],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"tags":[1,2,3],"covers":[3,4]}	{"category":"11927347-43ef-4610-8cab-55ab5b98b9b3","date_updated":"2025-04-24T20:47:33.133Z"}	\N	\N
337	474	directus_permissions	30	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"categories","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"categories","action":"read"}	\N	\N
341	481	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-09-09T17:02:34.530Z","name":"100%綠能輕塗紙","slug":"pure-paper","content":"<p dir=\\"ltr\\">使用100%經 FSC 認證回收再生紙漿，來源於不同比例的印前、印後回收紙材</p>\\n<p dir=\\"ltr\\">色澤自然，手感微粗，極具天然質感</p>\\n<p dir=\\"ltr\\">雙面表面輕塗層提供高遮蔽性、雙面不透印</p>\\n<p dir=\\"ltr\\">紙質堅挺，摺紙性佳，不易斷裂</p>\\n<p dir=\\"ltr\\">特殊鬆厚結構，高嵩厚度、輕量化，可取代高克重紙材</p>\\n<p dir=\\"ltr\\">擁有多重安全認證</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>\\n<p dir=\\"ltr\\">Made from 100% FSC-certified recycled pulp, with a blend of pre- and post-consumer waste.</p>\\n<p dir=\\"ltr\\">Features a natural tone and a slightly coarse feel, offering a highly authentic feel.</p>\\n<p dir=\\"ltr\\">A double-sided light coating provides high opacity to ensure excellent bleed-through resistance.</p>\\n<p dir=\\"ltr\\">The paper is sturdy and durable, with excellent foldability and high resistance to cracking.</p>\\n<p dir=\\"ltr\\">A special bulky structure gives it high thickness and a lightweight feel, making it a great alternative to papers with a higher basis weight.</p>\\n<p dir=\\"ltr\\">Holds multiple safety certifications.</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><strong id=\\"docs-internal-guid-fa898379-7fff-24b7-ed86-2e540c3a71fc\\">彩色印刷、軋型、燙金、打凹凸、局部光&hellip;...各式加工印刷，建議使用快乾結皮油墨，印後建議上保護性水光及少量噴粉可避免背印</strong></p>\\n<p dir=\\"ltr\\">For various finishing processes such as full-color printing, die-cutting, foil stamping, embossing/debossing, and spot UV coating, we recommend using quick-setting skinning inks.</p>\\n<p dir=\\"ltr\\">To prevent set-off (or back-to-back transfer) after printing, we suggest applying a protective aqueous coating and using minimal spray powder.</p>","category":"11927347-43ef-4610-8cab-55ab5b98b9b3","certifications":[],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"tags":[1,2,3],"covers":[]}	{"name":"100%綠能輕塗紙","content":"<p dir=\\"ltr\\">使用100%經 FSC 認證回收再生紙漿，來源於不同比例的印前、印後回收紙材</p>\\n<p dir=\\"ltr\\">色澤自然，手感微粗，極具天然質感</p>\\n<p dir=\\"ltr\\">雙面表面輕塗層提供高遮蔽性、雙面不透印</p>\\n<p dir=\\"ltr\\">紙質堅挺，摺紙性佳，不易斷裂</p>\\n<p dir=\\"ltr\\">特殊鬆厚結構，高嵩厚度、輕量化，可取代高克重紙材</p>\\n<p dir=\\"ltr\\">擁有多重安全認證</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>\\n<p dir=\\"ltr\\">Made from 100% FSC-certified recycled pulp, with a blend of pre- and post-consumer waste.</p>\\n<p dir=\\"ltr\\">Features a natural tone and a slightly coarse feel, offering a highly authentic feel.</p>\\n<p dir=\\"ltr\\">A double-sided light coating provides high opacity to ensure excellent bleed-through resistance.</p>\\n<p dir=\\"ltr\\">The paper is sturdy and durable, with excellent foldability and high resistance to cracking.</p>\\n<p dir=\\"ltr\\">A special bulky structure gives it high thickness and a lightweight feel, making it a great alternative to papers with a higher basis weight.</p>\\n<p dir=\\"ltr\\">Holds multiple safety certifications.</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><strong id=\\"docs-internal-guid-fa898379-7fff-24b7-ed86-2e540c3a71fc\\">彩色印刷、軋型、燙金、打凹凸、局部光&hellip;...各式加工印刷，建議使用快乾結皮油墨，印後建議上保護性水光及少量噴粉可避免背印</strong></p>\\n<p dir=\\"ltr\\">For various finishing processes such as full-color printing, die-cutting, foil stamping, embossing/debossing, and spot UV coating, we recommend using quick-setting skinning inks.</p>\\n<p dir=\\"ltr\\">To prevent set-off (or back-to-back transfer) after printing, we suggest applying a protective aqueous coating and using minimal spray powder.</p>","date_updated":"2025-09-09T17:02:34.530Z"}	\N	\N
338	478	products_certifications	1	{"id":1,"products_id":null,"certifications_id":"6fe89fdc-f717-4c45-9307-9835fda97c38"}	{"products_id":null}	341	\N
339	479	products_files	3	{"id":3,"products_id":null,"directus_files_id":"27cd5d72-4ddb-4586-832b-eec6624def7f"}	{"products_id":null}	341	\N
340	480	products_files	4	{"id":4,"products_id":null,"directus_files_id":"908951a5-a38f-4fa3-8f8e-b8256c9cf5b2"}	{"products_id":null}	341	\N
342	482	tags	0e2c59a4-cd60-4eaf-8b55-bc8160b09d0d	{"name":"塗佈"}	{"name":"塗佈"}	343	\N
344	484	tags	e18dddde-9c40-4168-9ba7-aaed1ef9b3f7	{"name":"輕塗佈"}	{"name":"輕塗佈"}	345	\N
350	490	tags	dab7f800-dd22-4b1f-9187-87112f6719ef	{"name":"白紙"}	{"name":"白紙"}	351	\N
355	495	certifications	0b729be2-c784-4524-b0cd-c31888d685a8	{"name":"鹼性儲備物含量>2% alkaline reserve>2%"}	{"name":"鹼性儲備物含量>2% alkaline reserve>2%"}	356	\N
357	497	certifications	df8e8f7e-2878-44d8-8a34-32d7471d73ff	{"name":"無重金屬 HEAVYMETAL ABSENCE 94/62/CE"}	{"name":"無重金屬 HEAVYMETAL ABSENCE 94/62/CE"}	358	\N
359	499	certifications	3ca813e7-a3f3-489d-9580-d1e5c047e225	{"name":"中性紙 NEUTRAL pH"}	{"name":"中性紙 NEUTRAL pH"}	360	\N
361	501	certifications	17916087-4de8-418e-bb77-87afbedc80cb	{"name":" 未印刷回收漿 pre-consumer secondary fibers"}	{"name":" 未印刷回收漿 pre-consumer secondary fibers"}	362	\N
363	503	certifications	35a64350-b167-40c2-ac1b-6ab20bfafb39	{"name":"已印刷回收漿 post-consumer secondary fibers"}	{"name":"已印刷回收漿 post-consumer secondary fibers"}	364	\N
365	505	certifications	479482d5-1371-4205-a879-566288fa89fc	{"name":"FSC RECYCLED CREDIT (FSC-C015523)"}	{"name":"FSC RECYCLED CREDIT (FSC-C015523)"}	366	\N
367	507	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-09-09T17:04:46.260Z","name":"100%綠能輕塗紙","slug":"pure-paper","content":"<p dir=\\"ltr\\">使用100%經 FSC 認證回收再生紙漿，來源於不同比例的印前、印後回收紙材</p>\\n<p dir=\\"ltr\\">色澤自然，手感微粗，極具天然質感</p>\\n<p dir=\\"ltr\\">雙面表面輕塗層提供高遮蔽性、雙面不透印</p>\\n<p dir=\\"ltr\\">紙質堅挺，摺紙性佳，不易斷裂</p>\\n<p dir=\\"ltr\\">特殊鬆厚結構，高嵩厚度、輕量化，可取代高克重紙材</p>\\n<p dir=\\"ltr\\">擁有多重安全認證</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>\\n<p dir=\\"ltr\\">Made from 100% FSC-certified recycled pulp, with a blend of pre- and post-consumer waste.</p>\\n<p dir=\\"ltr\\">Features a natural tone and a slightly coarse feel, offering a highly authentic feel.</p>\\n<p dir=\\"ltr\\">A double-sided light coating provides high opacity to ensure excellent bleed-through resistance.</p>\\n<p dir=\\"ltr\\">The paper is sturdy and durable, with excellent foldability and high resistance to cracking.</p>\\n<p dir=\\"ltr\\">A special bulky structure gives it high thickness and a lightweight feel, making it a great alternative to papers with a higher basis weight.</p>\\n<p dir=\\"ltr\\">Holds multiple safety certifications.</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><strong id=\\"docs-internal-guid-fa898379-7fff-24b7-ed86-2e540c3a71fc\\">彩色印刷、軋型、燙金、打凹凸、局部光&hellip;...各式加工印刷，建議使用快乾結皮油墨，印後建議上保護性水光及少量噴粉可避免背印</strong></p>\\n<p dir=\\"ltr\\">For various finishing processes such as full-color printing, die-cutting, foil stamping, embossing/debossing, and spot UV coating, we recommend using quick-setting skinning inks.</p>\\n<p dir=\\"ltr\\">To prevent set-off (or back-to-back transfer) after printing, we suggest applying a protective aqueous coating and using minimal spray powder.</p>","category":"11927347-43ef-4610-8cab-55ab5b98b9b3","certifications":[2,3,4,5,6,7],"colors":["27b65559-1874-4610-8244-044a19e85e61","0fd284cf-f18b-47a5-9386-ca0456e6dfcd"],"tags":[4,5,6,7,8],"covers":[]}	{"date_updated":"2025-09-09T17:04:46.260Z"}	\N	\N
343	483	products_tags_1	4	{"tags_id":{"name":"塗佈"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"tags_id":{"name":"塗佈"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	367	\N
345	485	products_tags_1	5	{"tags_id":{"name":"輕塗佈"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"tags_id":{"name":"輕塗佈"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	367	\N
347	487	products_tags_1	6	{"tags_id":{"name":"肌理"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"tags_id":{"name":"肌理"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	367	\N
349	489	products_tags_1	7	{"tags_id":{"name":"再生紙"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"tags_id":{"name":"再生紙"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	367	\N
351	491	products_tags_1	8	{"tags_id":{"name":"白紙"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"tags_id":{"name":"白紙"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	367	\N
352	492	products_tags_1	1	{"id":1,"products_id":null,"tags_id":"91e69dda-7bd3-4b15-8aa0-ae8696967150"}	{"products_id":null}	367	\N
353	493	products_tags_1	2	{"id":2,"products_id":null,"tags_id":"d1e8698b-2e24-47a1-8e51-3db6d58908d3"}	{"products_id":null}	367	\N
354	494	products_tags_1	3	{"id":3,"products_id":null,"tags_id":"d1b03a91-f851-4235-8473-5024da8ec845"}	{"products_id":null}	367	\N
356	496	products_certifications	2	{"certifications_id":{"name":"鹼性儲備物含量>2% alkaline reserve>2%"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"certifications_id":{"name":"鹼性儲備物含量>2% alkaline reserve>2%"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	367	\N
358	498	products_certifications	3	{"certifications_id":{"name":"無重金屬 HEAVYMETAL ABSENCE 94/62/CE"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"certifications_id":{"name":"無重金屬 HEAVYMETAL ABSENCE 94/62/CE"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	367	\N
360	500	products_certifications	4	{"certifications_id":{"name":"中性紙 NEUTRAL pH"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"certifications_id":{"name":"中性紙 NEUTRAL pH"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	367	\N
362	502	products_certifications	5	{"certifications_id":{"name":" 未印刷回收漿 pre-consumer secondary fibers"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"certifications_id":{"name":" 未印刷回收漿 pre-consumer secondary fibers"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	367	\N
364	504	products_certifications	6	{"certifications_id":{"name":"已印刷回收漿 post-consumer secondary fibers"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"certifications_id":{"name":"已印刷回收漿 post-consumer secondary fibers"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	367	\N
366	506	products_certifications	7	{"certifications_id":{"name":"FSC RECYCLED CREDIT (FSC-C015523)"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	{"certifications_id":{"name":"FSC RECYCLED CREDIT (FSC-C015523)"},"products_id":"96b04970-36f0-4a2a-b459-79a6335bd82a"}	367	\N
369	509	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-09-09T17:05:49.838Z","name":"100%綠能輕塗紙","slug":"pure-paper","content":"<p dir=\\"ltr\\">使用100%經 FSC 認證回收再生紙漿，來源於不同比例的印前、印後回收紙材</p>\\n<p dir=\\"ltr\\">色澤自然，手感微粗，極具天然質感</p>\\n<p dir=\\"ltr\\">雙面表面輕塗層提供高遮蔽性、雙面不透印</p>\\n<p dir=\\"ltr\\">紙質堅挺，摺紙性佳，不易斷裂</p>\\n<p dir=\\"ltr\\">特殊鬆厚結構，高嵩厚度、輕量化，可取代高克重紙材</p>\\n<p dir=\\"ltr\\">擁有多重安全認證</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>\\n<p dir=\\"ltr\\">Made from 100% FSC-certified recycled pulp, with a blend of pre- and post-consumer waste.</p>\\n<p dir=\\"ltr\\">Features a natural tone and a slightly coarse feel, offering a highly authentic feel.</p>\\n<p dir=\\"ltr\\">A double-sided light coating provides high opacity to ensure excellent bleed-through resistance.</p>\\n<p dir=\\"ltr\\">The paper is sturdy and durable, with excellent foldability and high resistance to cracking.</p>\\n<p dir=\\"ltr\\">A special bulky structure gives it high thickness and a lightweight feel, making it a great alternative to papers with a higher basis weight.</p>\\n<p dir=\\"ltr\\">Holds multiple safety certifications.</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><strong id=\\"docs-internal-guid-fa898379-7fff-24b7-ed86-2e540c3a71fc\\">彩色印刷、軋型、燙金、打凹凸、局部光&hellip;...各式加工印刷，建議使用快乾結皮油墨，印後建議上保護性水光及少量噴粉可避免背印</strong></p>\\n<p dir=\\"ltr\\">For various finishing processes such as full-color printing, die-cutting, foil stamping, embossing/debossing, and spot UV coating, we recommend using quick-setting skinning inks.</p>\\n<p dir=\\"ltr\\">To prevent set-off (or back-to-back transfer) after printing, we suggest applying a protective aqueous coating and using minimal spray powder.</p>","category":"11927347-43ef-4610-8cab-55ab5b98b9b3","certifications":[2,3,4,5,6,7],"colors":["27b65559-1874-4610-8244-044a19e85e61"],"tags":[4,5,6,7,8],"covers":[]}	{"date_updated":"2025-09-09T17:05:49.838Z"}	\N	\N
368	508	colors	0fd284cf-f18b-47a5-9386-ca0456e6dfcd	{"id":"0fd284cf-f18b-47a5-9386-ca0456e6dfcd","status":"draft","sort":null,"product_id":null,"name":"灰色","image":"dc31066a-d184-4012-af18-acc66968901f","specs":["5a2e2e73-b987-4938-a019-30d1726a0e63","4aea6668-94c5-42c5-bbf9-b764dcd2c0fc"]}	{"product_id":null}	369	\N
371	511	products	96b04970-36f0-4a2a-b459-79a6335bd82a	{"id":"96b04970-36f0-4a2a-b459-79a6335bd82a","status":"published","sort":1,"date_created":"2025-04-19T17:35:58.240Z","date_updated":"2025-09-09T17:06:28.390Z","name":"100%綠能輕塗紙","slug":"pure-paper","content":"<p dir=\\"ltr\\">使用100%經 FSC 認證回收再生紙漿，來源於不同比例的印前、印後回收紙材</p>\\n<p dir=\\"ltr\\">色澤自然，手感微粗，極具天然質感</p>\\n<p dir=\\"ltr\\">雙面表面輕塗層提供高遮蔽性、雙面不透印</p>\\n<p dir=\\"ltr\\">紙質堅挺，摺紙性佳，不易斷裂</p>\\n<p dir=\\"ltr\\">特殊鬆厚結構，高嵩厚度、輕量化，可取代高克重紙材</p>\\n<p dir=\\"ltr\\">擁有多重安全認證</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>\\n<p dir=\\"ltr\\">Made from 100% FSC-certified recycled pulp, with a blend of pre- and post-consumer waste.</p>\\n<p dir=\\"ltr\\">Features a natural tone and a slightly coarse feel, offering a highly authentic feel.</p>\\n<p dir=\\"ltr\\">A double-sided light coating provides high opacity to ensure excellent bleed-through resistance.</p>\\n<p dir=\\"ltr\\">The paper is sturdy and durable, with excellent foldability and high resistance to cracking.</p>\\n<p dir=\\"ltr\\">A special bulky structure gives it high thickness and a lightweight feel, making it a great alternative to papers with a higher basis weight.</p>\\n<p dir=\\"ltr\\">Holds multiple safety certifications.</p>\\n<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\">&nbsp;</p>","notices":"<p class=\\"MsoNormal\\" style=\\"line-height: 166%;\\"><strong id=\\"docs-internal-guid-fa898379-7fff-24b7-ed86-2e540c3a71fc\\">彩色印刷、軋型、燙金、打凹凸、局部光&hellip;...各式加工印刷，建議使用快乾結皮油墨，印後建議上保護性水光及少量噴粉可避免背印</strong></p>\\n<p dir=\\"ltr\\">For various finishing processes such as full-color printing, die-cutting, foil stamping, embossing/debossing, and spot UV coating, we recommend using quick-setting skinning inks.</p>\\n<p dir=\\"ltr\\">To prevent set-off (or back-to-back transfer) after printing, we suggest applying a protective aqueous coating and using minimal spray powder.</p>","category":"11927347-43ef-4610-8cab-55ab5b98b9b3","certifications":[2,3,4,5,6,7],"colors":["27b65559-1874-4610-8244-044a19e85e61"],"tags":[4,5,6,7,8],"covers":[]}	{"date_updated":"2025-09-09T17:06:28.390Z"}	\N	\N
370	510	colors	27b65559-1874-4610-8244-044a19e85e61	{"id":"27b65559-1874-4610-8244-044a19e85e61","status":"draft","sort":null,"product_id":"96b04970-36f0-4a2a-b459-79a6335bd82a","name":"灰","image":null,"specs":["ac4217ad-bbfa-4b5a-b0b9-ad60eb0bc65b","7db304ef-eb30-4beb-abf9-8db5b96e1835"]}	{"name":"灰","image":null}	371	\N
372	515	directus_fields	140	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"contact_messages"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"contact_messages"}	\N	\N
373	516	directus_fields	141	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"contact_messages"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"contact_messages"}	\N	\N
374	517	directus_fields	142	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"contact_messages"}	{"sort":3,"interface":"input","hidden":true,"field":"sort","collection":"contact_messages"}	\N	\N
375	518	directus_collections	contact_messages	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"contact_messages"}	{"sort_field":"sort","archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"contact_messages"}	\N	\N
376	521	directus_fields	143	{"sort":2,"interface":"input","special":null,"collection":"contact_messages","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"contact_messages","field":"name"}	\N	\N
377	522	directus_fields	144	{"sort":3,"interface":"input","special":null,"collection":"contact_messages","field":"email"}	{"sort":3,"interface":"input","special":null,"collection":"contact_messages","field":"email"}	\N	\N
378	523	directus_fields	145	{"sort":4,"interface":"input","special":null,"collection":"contact_messages","field":"subject"}	{"sort":4,"interface":"input","special":null,"collection":"contact_messages","field":"subject"}	\N	\N
379	524	directus_fields	146	{"sort":5,"interface":"input-multiline","special":null,"collection":"contact_messages","field":"messages"}	{"sort":5,"interface":"input-multiline","special":null,"collection":"contact_messages","field":"messages"}	\N	\N
380	525	directus_permissions	31	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}	\N	\N
381	527	directus_access	ce48a6d3-fe69-4727-8939-f00761679047	{"id":"ce48a6d3-fe69-4727-8939-f00761679047","role":null,"user":null,"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","sort":1}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
382	528	directus_roles	d1a0a382-8da1-495a-b503-25305608bfde	{"name":"contact-bot"}	{"name":"contact-bot"}	\N	\N
383	529	directus_permissions	32	{"policy":"871ba27f-82d4-4f41-804a-3574ba599884","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}	{"policy":"871ba27f-82d4-4f41-804a-3574ba599884","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}	384	\N
397	544	directus_fields	150	{"sort":9,"interface":"input-multiline","special":null,"collection":"contact_messages","field":"user_agent"}	{"sort":9,"interface":"input-multiline","special":null,"collection":"contact_messages","field":"user_agent"}	\N	\N
398	545	directus_fields	151	{"sort":10,"interface":"input","special":null,"collection":"contact_messages","field":"ip"}	{"sort":10,"interface":"input","special":null,"collection":"contact_messages","field":"ip"}	\N	\N
399	546	directus_fields	152	{"sort":11,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"new","value":"new"},{"text":"read","value":"read"}]},"collection":"contact_messages","field":"status"}	{"sort":11,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"new","value":"new"},{"text":"read","value":"read"}]},"collection":"contact_messages","field":"status"}	\N	\N
384	530	directus_policies	871ba27f-82d4-4f41-804a-3574ba599884	{"permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}],"update":[],"delete":[]},"name":"contact_form"}	{"permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}],"update":[],"delete":[]},"name":"contact_form"}	385	\N
386	532	directus_roles	d1a0a382-8da1-495a-b503-25305608bfde	{"id":"d1a0a382-8da1-495a-b503-25305608bfde","name":"contact-bot","icon":"supervised_user_circle","description":"contact-robot","parent":null,"children":[],"policies":["8008efad-23a6-404d-b350-a47c62b0a5c2"],"users":[]}	{"description":"contact-robot"}	\N	\N
385	531	directus_access	8008efad-23a6-404d-b350-a47c62b0a5c2	{"policy":{"permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}],"update":[],"delete":[]},"name":"contact_form"},"sort":1,"role":"d1a0a382-8da1-495a-b503-25305608bfde"}	{"policy":{"permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}],"update":[],"delete":[]},"name":"contact_form"},"sort":1,"role":"d1a0a382-8da1-495a-b503-25305608bfde"}	386	\N
387	533	contact_messages	1	{"name":"123123","phone":"12312312321","email":"123123@mail.com","message":"12312312321","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"123123","phone":"12312312321","email":"123123@mail.com","message":"12312312321","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
388	534	directus_access	ce48a6d3-fe69-4727-8939-f00761679047	{"id":"ce48a6d3-fe69-4727-8939-f00761679047","role":null,"user":null,"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","sort":1}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17"}	\N	\N
389	535	directus_users	c1801ab5-2a1e-4d3f-b64e-7503073aaced	{"role":"d1a0a382-8da1-495a-b503-25305608bfde","first_name":"info","email":"ann6226@gmail.com","password":"**********"}	{"role":"d1a0a382-8da1-495a-b503-25305608bfde","first_name":"info","email":"ann6226@gmail.com","password":"**********"}	\N	\N
390	536	directus_users	c1801ab5-2a1e-4d3f-b64e-7503073aaced	{"id":"c1801ab5-2a1e-4d3f-b64e-7503073aaced","first_name":"contact-form-writer","last_name":null,"email":"ann6226@gmail.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"d1a0a382-8da1-495a-b503-25305608bfde","token":null,"last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"policies":[]}	{"first_name":"contact-form-writer"}	\N	\N
391	537	directus_permissions	33	{"policy":"58ddf098-7368-4e81-a8ee-58eaca7838d5","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}	{"policy":"58ddf098-7368-4e81-a8ee-58eaca7838d5","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}	392	\N
393	539	directus_access	06c6b87a-6093-4d62-b6f7-8682c7c1255a	{"policy":{"permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}],"update":[],"delete":[]},"name":"contact"},"sort":1,"user":"c1801ab5-2a1e-4d3f-b64e-7503073aaced"}	{"policy":{"permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}],"update":[],"delete":[]},"name":"contact"},"sort":1,"user":"c1801ab5-2a1e-4d3f-b64e-7503073aaced"}	\N	\N
392	538	directus_policies	58ddf098-7368-4e81-a8ee-58eaca7838d5	{"permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}],"update":[],"delete":[]},"name":"contact"}	{"permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"contact_messages","action":"create"}],"update":[],"delete":[]},"name":"contact"}	393	\N
394	541	directus_fields	147	{"sort":6,"interface":"input","special":null,"collection":"contact_messages","field":"phone"}	{"sort":6,"interface":"input","special":null,"collection":"contact_messages","field":"phone"}	\N	\N
395	542	directus_fields	148	{"sort":7,"interface":"input","special":null,"collection":"contact_messages","field":"source"}	{"sort":7,"interface":"input","special":null,"collection":"contact_messages","field":"source"}	\N	\N
396	543	directus_fields	149	{"sort":8,"interface":"input","special":null,"collection":"contact_messages","field":"page_url"}	{"sort":8,"interface":"input","special":null,"collection":"contact_messages","field":"page_url"}	\N	\N
400	547	contact_messages	2	{"name":"123123","phone":"123131321","email":"123123@123.con","message":"123131313121","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"123123","phone":"123131321","email":"123123@123.con","message":"123131313121","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
401	548	directus_users	c1801ab5-2a1e-4d3f-b64e-7503073aaced	{"id":"c1801ab5-2a1e-4d3f-b64e-7503073aaced","first_name":"contact-form-writer","last_name":null,"email":"ann6226@gmail.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"d1a0a382-8da1-495a-b503-25305608bfde","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"policies":["06c6b87a-6093-4d62-b6f7-8682c7c1255a"]}	{"token":"**********"}	\N	\N
402	550	contact_messages	3	{"name":"123123","phone":"12312312312","email":"123123@123123.1231","message":"1231231123132","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"123123","phone":"12312312312","email":"123123@123123.1231","message":"1231231123132","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
403	551	directus_settings	1	{"id":1,"project_name":"jypaper","project_url":"http://localhost:8055","project_color":"#7214FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":true,"public_registration_verify_email":true,"public_registration_role":"c2e61469-bb36-41c7-8d5d-246e0ed96a60","public_registration_email_filter":null,"visual_editor_urls":null}	{"default_language":"en-US"}	\N	\N
404	552	contact_messages	4	{"name":"123123","phone":"12312311123","email":"12312@1231.com","message":"123123123111","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"123123","phone":"12312311123","email":"12312@1231.com","message":"123123123111","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
405	553	contact_messages	5	{"name":"12312","phone":"1231223","email":"12312@1223.123","message":"12312311111","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"12312","phone":"1231223","email":"12312@1223.123","message":"12312311111","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
406	554	contact_messages	6	{"name":"12312","phone":"1231223","email":"12312@1223.123","message":"12312311111","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"12312","phone":"1231223","email":"12312@1223.123","message":"12312311111","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
407	555	contact_messages	7	{"name":"12312","phone":"12312","email":"123123@1231.com","message":"12312312121232","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"12312","phone":"12312","email":"123123@1231.com","message":"12312312121232","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
408	556	contact_messages	8	{"name":"123123","phone":"123123","email":"12312@mail.com","message":"1231232131","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"123123","phone":"123123","email":"12312@mail.com","message":"1231232131","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
409	557	contact_messages	9	{"name":"123123","phone":"1231231213","email":"1321321@mail.com","message":"12312312213123","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"123123","phone":"1231231213","email":"1321321@mail.com","message":"12312312213123","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
410	558	contact_messages	10	{"name":"3333","phone":"33332323","email":"1231@mail.com","message":"12312390124","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"3333","phone":"33332323","email":"1231@mail.com","message":"12312390124","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
411	559	contact_messages	11	{"name":"32131","phone":"123131312","email":"12312@mail.com","message":"123123901232","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"32131","phone":"123131312","email":"12312@mail.com","message":"123123901232","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
412	560	contact_messages	12	{"name":"123123","phone":"123123","email":"1231232@mail.com","message":"1231232123123123","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"123123","phone":"123123","email":"1231232@mail.com","message":"1231232123123123","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
413	561	contact_messages	13	{"name":"12312123123","phone":"12123123123123","email":"12123123@mail.com","message":"123123121232123","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"12312123123","phone":"12123123123123","email":"12123123@mail.com","message":"123123121232123","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
414	562	contact_messages	14	{"name":"12312123","phone":"312213123123","email":"123123123@sad.csss","message":"12123132123123","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	{"name":"12312123","phone":"312213123123","email":"123123123@sad.csss","message":"12123132123123","source":"homepage_contact_section","page_url":"http://localhost:9003/","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","ip":"::1","status":"new"}	\N	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
c2e61469-bb36-41c7-8d5d-246e0ed96a60	Administrator	verified	$t:admin_description	\N
d1a0a382-8da1-495a-b503-25305608bfde	contact-bot	supervised_user_circle	contact-robot	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
uvSm2nVVprWa4YEy9u9kmjUYEPhhtQ2ApnfdVFpHBRrnS6MABDGRFT-vsRE0KQgT	79e05c01-2824-458a-8e28-4fa9f391d91f	2026-01-16 18:11:47.431+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, visual_editor_urls) FROM stdin;
1	jypaper	http://localhost:8055	#7214FF	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	\N	\N	en-US	\N	\N	auto	\N	\N	\N	\N	\N	\N	\N	t	t	c2e61469-bb36-41c7-8d5d-246e0ed96a60	\N	\N
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
c1801ab5-2a1e-4d3f-b64e-7503073aaced	contact-form-writer	\N	ann6226@gmail.com	$argon2id$v=19$m=65536,t=3,p=4$2L1rk4TgEucdJ1wUqR5gkw$FyLMR10hYUHX58tSjSok+fYXvnWir/NgQgNNTGTq4Cs	\N	\N	\N	\N	\N	\N	\N	active	d1a0a382-8da1-495a-b503-25305608bfde	XHCNioJNfmmkSsJzz9iG2PsWL3yxSmLz	\N	\N	default	\N	\N	t	\N	\N	\N	\N	\N
79e05c01-2824-458a-8e28-4fa9f391d91f	Admin	User	admin@example.com	$argon2id$v=19$m=65536,t=3,p=4$WJa2gqzu27rRU+6Zb4u41w$yYQeSrEa7BLPQT5E3iczy68I0MyfN1fpW8Jn0ckTF3Y	\N	\N	\N	\N	\N	\N	\N	active	c2e61469-bb36-41c7-8d5d-246e0ed96a60	iPfQsoiC6sAfsUvwmOPVevFdszfIuhyD	2026-01-09 18:11:47.449+00	/settings/data-model	default	\N	\N	t	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.products (id, status, sort, date_created, date_updated, name, slug, content, notices, category) FROM stdin;
96b04970-36f0-4a2a-b459-79a6335bd82a	published	1	2025-04-19 17:35:58.24+00	2025-09-09 17:06:28.39+00	100%綠能輕塗紙	pure-paper	<p dir="ltr">使用100%經 FSC 認證回收再生紙漿，來源於不同比例的印前、印後回收紙材</p>\n<p dir="ltr">色澤自然，手感微粗，極具天然質感</p>\n<p dir="ltr">雙面表面輕塗層提供高遮蔽性、雙面不透印</p>\n<p dir="ltr">紙質堅挺，摺紙性佳，不易斷裂</p>\n<p dir="ltr">特殊鬆厚結構，高嵩厚度、輕量化，可取代高克重紙材</p>\n<p dir="ltr">擁有多重安全認證</p>\n<p class="MsoNormal" style="line-height: 166%;">&nbsp;</p>\n<p dir="ltr">Made from 100% FSC-certified recycled pulp, with a blend of pre- and post-consumer waste.</p>\n<p dir="ltr">Features a natural tone and a slightly coarse feel, offering a highly authentic feel.</p>\n<p dir="ltr">A double-sided light coating provides high opacity to ensure excellent bleed-through resistance.</p>\n<p dir="ltr">The paper is sturdy and durable, with excellent foldability and high resistance to cracking.</p>\n<p dir="ltr">A special bulky structure gives it high thickness and a lightweight feel, making it a great alternative to papers with a higher basis weight.</p>\n<p dir="ltr">Holds multiple safety certifications.</p>\n<p class="MsoNormal" style="line-height: 166%;">&nbsp;</p>	<p class="MsoNormal" style="line-height: 166%;"><strong id="docs-internal-guid-fa898379-7fff-24b7-ed86-2e540c3a71fc">彩色印刷、軋型、燙金、打凹凸、局部光&hellip;...各式加工印刷，建議使用快乾結皮油墨，印後建議上保護性水光及少量噴粉可避免背印</strong></p>\n<p dir="ltr">For various finishing processes such as full-color printing, die-cutting, foil stamping, embossing/debossing, and spot UV coating, we recommend using quick-setting skinning inks.</p>\n<p dir="ltr">To prevent set-off (or back-to-back transfer) after printing, we suggest applying a protective aqueous coating and using minimal spray powder.</p>	11927347-43ef-4610-8cab-55ab5b98b9b3
\.


--
-- Data for Name: products_certifications; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.products_certifications (id, products_id, certifications_id) FROM stdin;
1	\N	6fe89fdc-f717-4c45-9307-9835fda97c38
2	96b04970-36f0-4a2a-b459-79a6335bd82a	0b729be2-c784-4524-b0cd-c31888d685a8
3	96b04970-36f0-4a2a-b459-79a6335bd82a	df8e8f7e-2878-44d8-8a34-32d7471d73ff
4	96b04970-36f0-4a2a-b459-79a6335bd82a	3ca813e7-a3f3-489d-9580-d1e5c047e225
5	96b04970-36f0-4a2a-b459-79a6335bd82a	17916087-4de8-418e-bb77-87afbedc80cb
6	96b04970-36f0-4a2a-b459-79a6335bd82a	35a64350-b167-40c2-ac1b-6ab20bfafb39
7	96b04970-36f0-4a2a-b459-79a6335bd82a	479482d5-1371-4205-a879-566288fa89fc
\.


--
-- Data for Name: products_files; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.products_files (id, products_id, directus_files_id) FROM stdin;
1	\N	\N
2	\N	\N
3	\N	27cd5d72-4ddb-4586-832b-eec6624def7f
4	\N	908951a5-a38f-4fa3-8f8e-b8256c9cf5b2
\.


--
-- Data for Name: products_tags; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.products_tags (id, products_id, tags_id) FROM stdin;
1	96b04970-36f0-4a2a-b459-79a6335bd82a	91e69dda-7bd3-4b15-8aa0-ae8696967150
2	96b04970-36f0-4a2a-b459-79a6335bd82a	d1e8698b-2e24-47a1-8e51-3db6d58908d3
3	96b04970-36f0-4a2a-b459-79a6335bd82a	d1b03a91-f851-4235-8473-5024da8ec845
\.


--
-- Data for Name: products_tags_1; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.products_tags_1 (id, products_id, tags_id) FROM stdin;
4	96b04970-36f0-4a2a-b459-79a6335bd82a	0e2c59a4-cd60-4eaf-8b55-bc8160b09d0d
5	96b04970-36f0-4a2a-b459-79a6335bd82a	e18dddde-9c40-4168-9ba7-aaed1ef9b3f7
6	96b04970-36f0-4a2a-b459-79a6335bd82a	afb18732-5f67-4d12-8122-95564e686c22
7	96b04970-36f0-4a2a-b459-79a6335bd82a	09c58be0-5596-453a-ab28-401cfc3eeefb
8	96b04970-36f0-4a2a-b459-79a6335bd82a	dab7f800-dd22-4b1f-9187-87112f6719ef
1	\N	91e69dda-7bd3-4b15-8aa0-ae8696967150
2	\N	d1e8698b-2e24-47a1-8e51-3db6d58908d3
3	\N	d1b03a91-f851-4235-8473-5024da8ec845
\.


--
-- Data for Name: specs; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.specs (id, status, sort, color_id, gsm, thickness, size) FROM stdin;
ac4217ad-bbfa-4b5a-b0b9-ad60eb0bc65b	draft	\N	27b65559-1874-4610-8244-044a19e85e61	100	120	35*31
7db304ef-eb30-4beb-abf9-8db5b96e1835	draft	\N	27b65559-1874-4610-8244-044a19e85e61	200	200	35*31
5a2e2e73-b987-4938-a019-30d1726a0e63	draft	\N	0fd284cf-f18b-47a5-9386-ca0456e6dfcd	120	200	35*32
4aea6668-94c5-42c5-bbf9-b764dcd2c0fc	draft	\N	0fd284cf-f18b-47a5-9386-ca0456e6dfcd	300	400	30*31
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.tags (id, name, slug) FROM stdin;
91e69dda-7bd3-4b15-8aa0-ae8696967150	美術紙	art-paper
d1e8698b-2e24-47a1-8e51-3db6d58908d3	色紙	colored
d1b03a91-f851-4235-8473-5024da8ec845	無塗布	Uncoated
0e2c59a4-cd60-4eaf-8b55-bc8160b09d0d	塗佈	\N
e18dddde-9c40-4168-9ba7-aaed1ef9b3f7	輕塗佈	\N
afb18732-5f67-4d12-8122-95564e686c22	肌理	\N
09c58be0-5596-453a-ab28-401cfc3eeefb	再生紙	\N
dab7f800-dd22-4b1f-9187-87112f6719ef	白紙	\N
\.


--
-- Data for Name: tags_products; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.tags_products (id, tags_id, products_id) FROM stdin;
\.


--
-- Name: contact_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.contact_messages_id_seq', 14, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 564, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 152, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 33, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 6, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 41, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 414, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: products_certifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.products_certifications_id_seq', 7, true);


--
-- Name: products_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.products_files_id_seq', 4, true);


--
-- Name: products_tags_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.products_tags_1_id_seq', 8, true);


--
-- Name: products_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.products_tags_id_seq', 3, true);


--
-- Name: tags_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.tags_products_id_seq', 1, false);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: certifications certifications_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.certifications
    ADD CONSTRAINT certifications_pkey PRIMARY KEY (id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: contact_messages contact_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.contact_messages
    ADD CONSTRAINT contact_messages_pkey PRIMARY KEY (id);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: products_certifications products_certifications_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_certifications
    ADD CONSTRAINT products_certifications_pkey PRIMARY KEY (id);


--
-- Name: products_files products_files_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_files
    ADD CONSTRAINT products_files_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_slug_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_unique UNIQUE (slug);


--
-- Name: products_tags_1 products_tags_1_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_tags_1
    ADD CONSTRAINT products_tags_1_pkey PRIMARY KEY (id);


--
-- Name: products_tags products_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_tags
    ADD CONSTRAINT products_tags_pkey PRIMARY KEY (id);


--
-- Name: specs specs_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.specs
    ADD CONSTRAINT specs_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tags_products tags_products_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.tags_products
    ADD CONSTRAINT tags_products_pkey PRIMARY KEY (id);


--
-- Name: certifications certifications_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.certifications
    ADD CONSTRAINT certifications_logo_foreign FOREIGN KEY (logo) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: colors colors_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: colors colors_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE SET NULL;


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_webhooks directus_webhooks_migrated_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;


--
-- Name: products products_category_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_foreign FOREIGN KEY (category) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- Name: products_certifications products_certifications_certifications_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_certifications
    ADD CONSTRAINT products_certifications_certifications_id_foreign FOREIGN KEY (certifications_id) REFERENCES public.certifications(id) ON DELETE SET NULL;


--
-- Name: products_certifications products_certifications_products_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_certifications
    ADD CONSTRAINT products_certifications_products_id_foreign FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE SET NULL;


--
-- Name: products_files products_files_directus_files_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_files
    ADD CONSTRAINT products_files_directus_files_id_foreign FOREIGN KEY (directus_files_id) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: products_files products_files_products_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_files
    ADD CONSTRAINT products_files_products_id_foreign FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE SET NULL;


--
-- Name: products_tags_1 products_tags_1_products_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_tags_1
    ADD CONSTRAINT products_tags_1_products_id_foreign FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE SET NULL;


--
-- Name: products_tags_1 products_tags_1_tags_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_tags_1
    ADD CONSTRAINT products_tags_1_tags_id_foreign FOREIGN KEY (tags_id) REFERENCES public.tags(id) ON DELETE SET NULL;


--
-- Name: products_tags products_tags_products_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_tags
    ADD CONSTRAINT products_tags_products_id_foreign FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE SET NULL;


--
-- Name: products_tags products_tags_tags_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.products_tags
    ADD CONSTRAINT products_tags_tags_id_foreign FOREIGN KEY (tags_id) REFERENCES public.tags(id) ON DELETE SET NULL;


--
-- Name: specs specs_color_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.specs
    ADD CONSTRAINT specs_color_id_foreign FOREIGN KEY (color_id) REFERENCES public.colors(id) ON DELETE SET NULL;


--
-- Name: tags_products tags_products_products_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.tags_products
    ADD CONSTRAINT tags_products_products_id_foreign FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE SET NULL;


--
-- Name: tags_products tags_products_tags_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.tags_products
    ADD CONSTRAINT tags_products_tags_id_foreign FOREIGN KEY (tags_id) REFERENCES public.tags(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict EYZMYoB5aBZsyDRqvc6Cj2LwUtUKeDaR6UWX0YYXh7sgTVMBCpdnTITOQgEVijB


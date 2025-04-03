--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: dongho; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dongho (
    id integer NOT NULL,
    ten_phuong_tien_do character varying(255),
    is_hieu_chuan boolean,
    index integer,
    group_id character varying(255),
    sensor character varying(255),
    transitor character varying(255),
    serial character varying(255),
    co_so_san_xuat character varying(255),
    nam_san_xuat date,
    dn character varying(255),
    d character varying(255),
    ccx character varying(255),
    q3 character varying(255),
    r character varying(255),
    qn character varying(255),
    k_factor character varying(255),
    so_qd_pdm character varying(255),
    so_tem character varying(255),
    so_giay_chung_nhan character varying(255),
    co_so_su_dung character varying(255),
    phuong_phap_thuc_hien character varying(255),
    chuan_thiet_bi_su_dung character varying(255),
    nguoi_thuc_hien character varying(255),
    ngay_thuc_hien date,
    dia_diem_thuc_hien character varying(255),
    ket_qua_check_vo_ngoai boolean,
    ket_qua_check_do_kin boolean,
    ket_qua_check_do_on_dinh_chi_so boolean,
    du_lieu_kiem_dinh text,
    nguoi_soat_lai character varying(255),
    hieu_luc_bien_ban date,
    last_updated text
);


ALTER TABLE public.dongho OWNER TO postgres;

--
-- Name: dongho_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dongho_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dongho_id_seq OWNER TO postgres;

--
-- Name: dongho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dongho_id_seq OWNED BY public.dongho.id;


--
-- Name: dongho_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dongho_permissions (
    id integer NOT NULL,
    dongho_id integer,
    username character varying(64),
    role_id integer,
    manager character varying(64)
);


ALTER TABLE public.dongho_permissions OWNER TO postgres;

--
-- Name: dongho_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dongho_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dongho_permissions_id_seq OWNER TO postgres;

--
-- Name: dongho_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dongho_permissions_id_seq OWNED BY public.dongho_permissions.id;


--
-- Name: nhomdongho_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nhomdongho_payment (
    id integer NOT NULL,
    group_id character varying(50) NOT NULL,
    is_paid boolean NOT NULL,
    paid_date timestamp without time zone,
    payment_collector character varying(50),
    last_updated text
);


ALTER TABLE public.nhomdongho_payment OWNER TO postgres;

--
-- Name: nhomdongho_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nhomdongho_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nhomdongho_payment_id_seq OWNER TO postgres;

--
-- Name: nhomdongho_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nhomdongho_payment_id_seq OWNED BY public.nhomdongho_payment.id;


--
-- Name: otp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otp (
    id integer NOT NULL,
    user_id integer,
    otp_code character varying(6),
    purpose character varying(64) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    expired_at timestamp without time zone NOT NULL
);


ALTER TABLE public.otp OWNER TO postgres;

--
-- Name: otp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.otp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.otp_id_seq OWNER TO postgres;

--
-- Name: otp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.otp_id_seq OWNED BY public.otp.id;


--
-- Name: pdm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pdm (
    id integer NOT NULL,
    ma_tim_dong_ho_pdm character varying(255),
    ten_dong_ho character varying(255) NOT NULL,
    noi_san_xuat character varying(255) NOT NULL,
    dn character varying(255),
    ccx character varying(255),
    kieu_sensor character varying(255) NOT NULL,
    transmitter character varying(255),
    qn character varying(255),
    q3 character varying(255),
    r character varying(255),
    don_vi_pdm character varying(255) NOT NULL,
    dia_chi character varying(255),
    so_qd_pdm character varying(255),
    ngay_qd_pdm timestamp without time zone,
    ngay_het_han timestamp without time zone,
    anh_pdm character varying(255)
);


ALTER TABLE public.pdm OWNER TO postgres;

--
-- Name: pdm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pdm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pdm_id_seq OWNER TO postgres;

--
-- Name: pdm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pdm_id_seq OWNED BY public.pdm.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(64),
    "default" boolean,
    permissions integer
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: token_blacklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token_blacklist (
    id integer NOT NULL,
    jti character varying(36) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    expires_at timestamp without time zone NOT NULL
);


ALTER TABLE public.token_blacklist OWNER TO postgres;

--
-- Name: token_blacklist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.token_blacklist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.token_blacklist_id_seq OWNER TO postgres;

--
-- Name: token_blacklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.token_blacklist_id_seq OWNED BY public.token_blacklist.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    fullname character varying(100) NOT NULL,
    email character varying(120) NOT NULL,
    password_hash character varying(256) NOT NULL,
    role_id integer,
    confirmed boolean
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: dongho id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dongho ALTER COLUMN id SET DEFAULT nextval('public.dongho_id_seq'::regclass);


--
-- Name: dongho_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dongho_permissions ALTER COLUMN id SET DEFAULT nextval('public.dongho_permissions_id_seq'::regclass);


--
-- Name: nhomdongho_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nhomdongho_payment ALTER COLUMN id SET DEFAULT nextval('public.nhomdongho_payment_id_seq'::regclass);


--
-- Name: otp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otp ALTER COLUMN id SET DEFAULT nextval('public.otp_id_seq'::regclass);


--
-- Name: pdm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pdm ALTER COLUMN id SET DEFAULT nextval('public.pdm_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: token_blacklist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
78471cbdc5f5
\.


--
-- Data for Name: dongho; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dongho (id, ten_phuong_tien_do, is_hieu_chuan, index, group_id, sensor, transitor, serial, co_so_san_xuat, nam_san_xuat, dn, d, ccx, q3, r, qn, k_factor, so_qd_pdm, so_tem, so_giay_chung_nhan, co_so_su_dung, phuong_phap_thuc_hien, chuan_thiet_bi_su_dung, nguoi_thuc_hien, ngay_thuc_hien, dia_diem_thuc_hien, ket_qua_check_vo_ngoai, ket_qua_check_do_kin, ket_qua_check_do_on_dinh_chi_so, du_lieu_kiem_dinh, nguoi_soat_lai, hieu_luc_bien_ban, last_updated) FROM stdin;
\.


--
-- Data for Name: dongho_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dongho_permissions (id, dongho_id, username, role_id, manager) FROM stdin;
\.


--
-- Data for Name: nhomdongho_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nhomdongho_payment (id, group_id, is_paid, paid_date, payment_collector, last_updated) FROM stdin;
\.


--
-- Data for Name: otp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.otp (id, user_id, otp_code, purpose, created_at, expired_at) FROM stdin;
\.


--
-- Data for Name: pdm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pdm (id, ma_tim_dong_ho_pdm, ten_dong_ho, noi_san_xuat, dn, ccx, kieu_sensor, transmitter, qn, q3, r, don_vi_pdm, dia_chi, so_qd_pdm, ngay_qd_pdm, ngay_het_han, anh_pdm) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, "default", permissions) FROM stdin;
2	Manager	f	2
3	Director	f	3
4	Administrator	f	4
5	SuperAdministrator	f	5
6	Viewer	t	1
\.


--
-- Data for Name: token_blacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_blacklist (id, jti, created_at, expires_at) FROM stdin;
1	4a9ce00c-0c11-4eba-b033-93f575698860	2025-03-26 15:58:38.586115	2025-03-26 16:28:34
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, fullname, email, password_hash, role_id, confirmed) FROM stdin;
4	user	User Nguyễn	user@gmail.com	scrypt:32768:8:1$AZUU0ewbjKBLLMEz$2affc41df7878cc0a4902779fd165bc5a13e2c4d7d1549eaab4e920697cf9ba2611405ef405e47ffc31c4f8c9b631c4b31756fd743828d04bcf2179968bdbb49	6	t
6	vuvuvuvvv	Nguyễn Thế Vũ	nguyenvu260502@gmail.com	scrypt:32768:8:1$28dSNknOpmSWMhFR$ec98fb8e5503a426cf64e888e560c29a48d15eb73b5cf6194501b2dc896dfda7a6be231f57f863a459668e4981c4401d0de38f9c7fe153bec04eb177c89b05a7	6	t
8	hoangtrithao	Hoàng Trí Thảo	hoangtrithao@gmail.com	scrypt:32768:8:1$Ar7ILhzAghsuk7fv$06fe915dc714938bf06b16ff5125e52efa1f32f4bf3b0295f3771040dbbaf381afc79de298d011c624e96b818c889d6cbf82a9126d2bbc8c658c69a267ec3668	6	t
7	dht_superadmin	Super Administrator	dht_superadmin@gmail.com	scrypt:32768:8:1$xC1JzqMRE6rVN8Kq$1c46c36934b609ef4158debafd9e21bd292f4f2bcb2fd02ca3d6d36303818777670609f5b1e27d34c187d566120c0cb8cafa125ff70660642a41c25f52e20025	5	t
1	admin	Admin Nguyễn	dht_admin@gmail.com	scrypt:32768:8:1$4R12Q5AvDtwBlgo9$b7e36d45fc107c0d85d05879c1d3dbbb536c202beef674f314831368e165fd6deae40194ad3c88719604b3e168ab8bb1e7582a2f67e48aeae2b8d7a6a77eafb8	4	t
\.


--
-- Name: dongho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dongho_id_seq', 1, false);


--
-- Name: dongho_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dongho_permissions_id_seq', 1, false);


--
-- Name: nhomdongho_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nhomdongho_payment_id_seq', 1, false);


--
-- Name: otp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.otp_id_seq', 1, false);


--
-- Name: pdm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pdm_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: token_blacklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_blacklist_id_seq', 1, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 8, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: dongho_permissions dongho_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dongho_permissions
    ADD CONSTRAINT dongho_permissions_pkey PRIMARY KEY (id);


--
-- Name: dongho dongho_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dongho
    ADD CONSTRAINT dongho_pkey PRIMARY KEY (id);


--
-- Name: nhomdongho_payment nhomdongho_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nhomdongho_payment
    ADD CONSTRAINT nhomdongho_payment_pkey PRIMARY KEY (id);


--
-- Name: otp otp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otp
    ADD CONSTRAINT otp_pkey PRIMARY KEY (id);


--
-- Name: pdm pdm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pdm
    ADD CONSTRAINT pdm_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: token_blacklist token_blacklist_jti_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist
    ADD CONSTRAINT token_blacklist_jti_key UNIQUE (jti);


--
-- Name: token_blacklist token_blacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist
    ADD CONSTRAINT token_blacklist_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: ix_dongho_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_dongho_group_id ON public.dongho USING btree (group_id);


--
-- Name: ix_dongho_permissions_dongho_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_dongho_permissions_dongho_id ON public.dongho_permissions USING btree (dongho_id);


--
-- Name: ix_dongho_permissions_manager; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_dongho_permissions_manager ON public.dongho_permissions USING btree (manager);


--
-- Name: ix_dongho_permissions_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_dongho_permissions_username ON public.dongho_permissions USING btree (username);


--
-- Name: ix_dongho_sensor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_dongho_sensor ON public.dongho USING btree (sensor);


--
-- Name: ix_dongho_serial; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_dongho_serial ON public.dongho USING btree (serial);


--
-- Name: ix_dongho_so_giay_chung_nhan; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_dongho_so_giay_chung_nhan ON public.dongho USING btree (so_giay_chung_nhan);


--
-- Name: ix_dongho_transitor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_dongho_transitor ON public.dongho USING btree (transitor);


--
-- Name: ix_pdm_ma_tim_dong_ho_pdm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_pdm_ma_tim_dong_ho_pdm ON public.pdm USING btree (ma_tim_dong_ho_pdm);


--
-- Name: ix_pdm_so_qd_pdm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_pdm_so_qd_pdm ON public.pdm USING btree (so_qd_pdm);


--
-- Name: ix_pdm_ten_dong_ho; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_pdm_ten_dong_ho ON public.pdm USING btree (ten_dong_ho);


--
-- Name: ix_roles_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_roles_default ON public.roles USING btree ("default");


--
-- Name: ix_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_user_email ON public."user" USING btree (email);


--
-- Name: ix_user_fullname; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_user_fullname ON public."user" USING btree (fullname);


--
-- Name: ix_user_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_user_username ON public."user" USING btree (username);


--
-- Name: dongho_permissions dongho_permissions_dongho_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dongho_permissions
    ADD CONSTRAINT dongho_permissions_dongho_id_fkey FOREIGN KEY (dongho_id) REFERENCES public.dongho(id);


--
-- Name: dongho_permissions dongho_permissions_manager_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dongho_permissions
    ADD CONSTRAINT dongho_permissions_manager_fkey FOREIGN KEY (manager) REFERENCES public."user"(username);


--
-- Name: dongho_permissions dongho_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dongho_permissions
    ADD CONSTRAINT dongho_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: dongho_permissions dongho_permissions_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dongho_permissions
    ADD CONSTRAINT dongho_permissions_username_fkey FOREIGN KEY (username) REFERENCES public."user"(username);


--
-- Name: otp otp_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otp
    ADD CONSTRAINT otp_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: user user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--


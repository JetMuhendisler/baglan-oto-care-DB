--
-- PostgreSQL database dump
--

\restrict CmEB2n6cNNzyfzuwoR9fhGeaAY7yfxPFZY0nYuovhsFpp0bwvWoiSbVC4lHAlye

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-22 22:47:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 232 (class 1259 OID 16708)
-- Name: aracislemleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aracislemleri (
    aracislemid integer NOT NULL,
    kayitid integer NOT NULL,
    aracid integer NOT NULL,
    islemturuid integer NOT NULL,
    aciklama character varying(200),
    baslangictarihi timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    bitistarihi timestamp without time zone,
    toplamtutar numeric(10,2),
    iskontoorani numeric(5,2) DEFAULT 0,
    odemeturu character varying(10)
);


ALTER TABLE public.aracislemleri OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16707)
-- Name: aracislemleri_aracislemid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aracislemleri_aracislemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aracislemleri_aracislemid_seq OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 231
-- Name: aracislemleri_aracislemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aracislemleri_aracislemid_seq OWNED BY public.aracislemleri.aracislemid;


--
-- TOC entry 234 (class 1259 OID 16732)
-- Name: aracislemparcalari; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aracislemparcalari (
    aracislemparcaid integer NOT NULL,
    aracislemid integer NOT NULL,
    parcaid integer NOT NULL,
    ppfmarka character varying(50),
    microndegeri integer
);


ALTER TABLE public.aracislemparcalari OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16731)
-- Name: aracislemparcalari_aracislemparcaid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aracislemparcalari_aracislemparcaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aracislemparcalari_aracislemparcaid_seq OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 233
-- Name: aracislemparcalari_aracislemparcaid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aracislemparcalari_aracislemparcaid_seq OWNED BY public.aracislemparcalari.aracislemparcaid;


--
-- TOC entry 236 (class 1259 OID 16749)
-- Name: aracislempersonelleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aracislempersonelleri (
    id integer NOT NULL,
    aracislemid integer NOT NULL,
    personelid integer NOT NULL
);


ALTER TABLE public.aracislempersonelleri OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16748)
-- Name: aracislempersonelleri_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aracislempersonelleri_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aracislempersonelleri_id_seq OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 235
-- Name: aracislempersonelleri_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aracislempersonelleri_id_seq OWNED BY public.aracislempersonelleri.id;


--
-- TOC entry 220 (class 1259 OID 16640)
-- Name: araclar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.araclar (
    aracid integer NOT NULL,
    musteriid integer NOT NULL,
    plaka character varying(15) NOT NULL,
    marka character varying(50) NOT NULL,
    model character varying(50),
    yil integer,
    renk character varying(30),
    sunroof boolean DEFAULT false,
    giristarihi timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    teslimtarihi timestamp without time zone
);


ALTER TABLE public.araclar OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16639)
-- Name: araclar_aracid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.araclar_aracid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.araclar_aracid_seq OWNER TO postgres;

--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 219
-- Name: araclar_aracid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.araclar_aracid_seq OWNED BY public.araclar.aracid;


--
-- TOC entry 226 (class 1259 OID 16676)
-- Name: islemturleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.islemturleri (
    islemturuid integer NOT NULL,
    islemadi character varying(100) NOT NULL,
    aciklama character varying(200),
    varsayilantutar numeric(10,2)
);


ALTER TABLE public.islemturleri OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16675)
-- Name: islemturleri_islemturuid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.islemturleri_islemturuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.islemturleri_islemturuid_seq OWNER TO postgres;

--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 225
-- Name: islemturleri_islemturuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.islemturleri_islemturuid_seq OWNED BY public.islemturleri.islemturuid;


--
-- TOC entry 230 (class 1259 OID 16690)
-- Name: kayitlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kayitlar (
    kayitid integer NOT NULL,
    musteriid integer NOT NULL,
    aracid integer NOT NULL,
    olusturmatarihi timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    aciklama character varying(200)
);


ALTER TABLE public.kayitlar OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16689)
-- Name: kayitlar_kayitid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kayitlar_kayitid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kayitlar_kayitid_seq OWNER TO postgres;

--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 229
-- Name: kayitlar_kayitid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kayitlar_kayitid_seq OWNED BY public.kayitlar.kayitid;


--
-- TOC entry 218 (class 1259 OID 16633)
-- Name: musteriler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musteriler (
    musteriid integer NOT NULL,
    adsoyad character varying(100) NOT NULL,
    telefon character varying(20) NOT NULL,
    email character varying(100),
    adres character varying(200)
);


ALTER TABLE public.musteriler OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16632)
-- Name: musteriler_musteriid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.musteriler_musteriid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.musteriler_musteriid_seq OWNER TO postgres;

--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 217
-- Name: musteriler_musteriid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musteriler_musteriid_seq OWNED BY public.musteriler.musteriid;


--
-- TOC entry 228 (class 1259 OID 16683)
-- Name: parcalar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parcalar (
    parcaid integer NOT NULL,
    parcaadi character varying(100) NOT NULL,
    aracbolumu character varying(50)
);


ALTER TABLE public.parcalar OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16682)
-- Name: parcalar_parcaid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parcalar_parcaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.parcalar_parcaid_seq OWNER TO postgres;

--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 227
-- Name: parcalar_parcaid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parcalar_parcaid_seq OWNED BY public.parcalar.parcaid;


--
-- TOC entry 224 (class 1259 OID 16663)
-- Name: personeller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personeller (
    personelid integer NOT NULL,
    adsoyad character varying(100) NOT NULL,
    telefon character varying(20),
    rolid integer NOT NULL,
    isegiristarihi timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    maas numeric(10,2)
);


ALTER TABLE public.personeller OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16662)
-- Name: personeller_personelid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personeller_personelid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personeller_personelid_seq OWNER TO postgres;

--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 223
-- Name: personeller_personelid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personeller_personelid_seq OWNED BY public.personeller.personelid;


--
-- TOC entry 238 (class 1259 OID 16766)
-- Name: rizaformlari; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rizaformlari (
    rizaid integer NOT NULL,
    aracislemid integer NOT NULL,
    onaydurumu boolean DEFAULT false,
    onaytarihi timestamp without time zone,
    aciklama character varying(200)
);


ALTER TABLE public.rizaformlari OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16765)
-- Name: rizaformlari_rizaid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rizaformlari_rizaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rizaformlari_rizaid_seq OWNER TO postgres;

--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 237
-- Name: rizaformlari_rizaid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rizaformlari_rizaid_seq OWNED BY public.rizaformlari.rizaid;


--
-- TOC entry 222 (class 1259 OID 16656)
-- Name: roller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roller (
    rolid integer NOT NULL,
    roladi character varying(50) NOT NULL
);


ALTER TABLE public.roller OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16655)
-- Name: roller_rolid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roller_rolid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roller_rolid_seq OWNER TO postgres;

--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 221
-- Name: roller_rolid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roller_rolid_seq OWNED BY public.roller.rolid;


--
-- TOC entry 4803 (class 2604 OID 16711)
-- Name: aracislemleri aracislemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemleri ALTER COLUMN aracislemid SET DEFAULT nextval('public.aracislemleri_aracislemid_seq'::regclass);


--
-- TOC entry 4806 (class 2604 OID 16735)
-- Name: aracislemparcalari aracislemparcaid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemparcalari ALTER COLUMN aracislemparcaid SET DEFAULT nextval('public.aracislemparcalari_aracislemparcaid_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 16752)
-- Name: aracislempersonelleri id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislempersonelleri ALTER COLUMN id SET DEFAULT nextval('public.aracislempersonelleri_id_seq'::regclass);


--
-- TOC entry 4793 (class 2604 OID 16643)
-- Name: araclar aracid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.araclar ALTER COLUMN aracid SET DEFAULT nextval('public.araclar_aracid_seq'::regclass);


--
-- TOC entry 4799 (class 2604 OID 16679)
-- Name: islemturleri islemturuid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.islemturleri ALTER COLUMN islemturuid SET DEFAULT nextval('public.islemturleri_islemturuid_seq'::regclass);


--
-- TOC entry 4801 (class 2604 OID 16693)
-- Name: kayitlar kayitid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kayitlar ALTER COLUMN kayitid SET DEFAULT nextval('public.kayitlar_kayitid_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 16636)
-- Name: musteriler musteriid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteriler ALTER COLUMN musteriid SET DEFAULT nextval('public.musteriler_musteriid_seq'::regclass);


--
-- TOC entry 4800 (class 2604 OID 16686)
-- Name: parcalar parcaid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcalar ALTER COLUMN parcaid SET DEFAULT nextval('public.parcalar_parcaid_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 16666)
-- Name: personeller personelid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personeller ALTER COLUMN personelid SET DEFAULT nextval('public.personeller_personelid_seq'::regclass);


--
-- TOC entry 4808 (class 2604 OID 16769)
-- Name: rizaformlari rizaid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rizaformlari ALTER COLUMN rizaid SET DEFAULT nextval('public.rizaformlari_rizaid_seq'::regclass);


--
-- TOC entry 4796 (class 2604 OID 16659)
-- Name: roller rolid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roller ALTER COLUMN rolid SET DEFAULT nextval('public.roller_rolid_seq'::regclass);


--
-- TOC entry 5006 (class 0 OID 16708)
-- Dependencies: 232
-- Data for Name: aracislemleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aracislemleri (aracislemid, kayitid, aracid, islemturuid, aciklama, baslangictarihi, bitistarihi, toplamtutar, iskontoorani, odemeturu) FROM stdin;
1	1	1	4	Ön 3 parça PPF	2025-10-22 22:42:35.630348	\N	3000.00	10.00	Nakit
\.


--
-- TOC entry 5008 (class 0 OID 16732)
-- Dependencies: 234
-- Data for Name: aracislemparcalari; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aracislemparcalari (aracislemparcaid, aracislemid, parcaid, ppfmarka, microndegeri) FROM stdin;
1	1	1	XPEL	200
2	1	2	XPEL	200
3	1	5	XPEL	200
\.


--
-- TOC entry 5010 (class 0 OID 16749)
-- Dependencies: 236
-- Data for Name: aracislempersonelleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aracislempersonelleri (id, aracislemid, personelid) FROM stdin;
1	1	1
2	1	2
\.


--
-- TOC entry 4994 (class 0 OID 16640)
-- Dependencies: 220
-- Data for Name: araclar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.araclar (aracid, musteriid, plaka, marka, model, yil, renk, sunroof, giristarihi, teslimtarihi) FROM stdin;
1	1	35ABC123	BMW	320i	2018	Siyah	t	2025-10-22 22:42:35.630348	\N
2	2	06XYZ456	Mercedes	C200	2020	Beyaz	f	2025-10-22 22:42:35.630348	\N
\.


--
-- TOC entry 5000 (class 0 OID 16676)
-- Dependencies: 226
-- Data for Name: islemturleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.islemturleri (islemturuid, islemadi, aciklama, varsayilantutar) FROM stdin;
1	Boya Koruma	Seramik boya koruma işlemi	1500.00
2	Pasta Cila	Yüzey parlatma işlemi	500.00
3	Motor Temizliği	Motor bölgesi detaylı temizlik	600.00
4	PPF Kaplama	Boyayı koruyucu film uygulama	3500.00
\.


--
-- TOC entry 5004 (class 0 OID 16690)
-- Dependencies: 230
-- Data for Name: kayitlar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kayitlar (kayitid, musteriid, aracid, olusturmatarihi, aciklama) FROM stdin;
1	1	1	2025-10-22 22:42:35.630348	PPF Kaplama işlemi
2	2	2	2025-10-22 22:42:35.630348	Pasta Cila işlemi
\.


--
-- TOC entry 4992 (class 0 OID 16633)
-- Dependencies: 218
-- Data for Name: musteriler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.musteriler (musteriid, adsoyad, telefon, email, adres) FROM stdin;
1	Ahmet Demir	05555555501	ahmet@oto.com	İzmir
2	Ayşe Yılmaz	05555555502	ayse@oto.com	Ankara
\.


--
-- TOC entry 5002 (class 0 OID 16683)
-- Dependencies: 228
-- Data for Name: parcalar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parcalar (parcaid, parcaadi, aracbolumu) FROM stdin;
1	Ön Kaput	Ön
2	Ön Tampon	Ön
3	Tavan	Üst
4	Sunroof	Üst
5	Kapılar	Yan
\.


--
-- TOC entry 4998 (class 0 OID 16663)
-- Dependencies: 224
-- Data for Name: personeller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personeller (personelid, adsoyad, telefon, rolid, isegiristarihi, maas) FROM stdin;
1	Ali Vural	05555555510	3	2025-10-22 22:42:35.630348	15000.00
2	Selin Demir	05555555511	2	2025-10-22 22:42:35.630348	17000.00
3	Murat Kaya	05555555512	3	2025-10-22 22:42:35.630348	14000.00
\.


--
-- TOC entry 5012 (class 0 OID 16766)
-- Dependencies: 238
-- Data for Name: rizaformlari; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rizaformlari (rizaid, aracislemid, onaydurumu, onaytarihi, aciklama) FROM stdin;
1	1	t	2025-10-22 22:42:35.630348	Motor temizliği için müşteri onayı alındı.
\.


--
-- TOC entry 4996 (class 0 OID 16656)
-- Dependencies: 222
-- Data for Name: roller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roller (rolid, roladi) FROM stdin;
1	SuperAdmin
2	Şef
3	Usta
4	Personel
\.


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 231
-- Name: aracislemleri_aracislemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aracislemleri_aracislemid_seq', 1, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 233
-- Name: aracislemparcalari_aracislemparcaid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aracislemparcalari_aracislemparcaid_seq', 3, true);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 235
-- Name: aracislempersonelleri_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aracislempersonelleri_id_seq', 2, true);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 219
-- Name: araclar_aracid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.araclar_aracid_seq', 2, true);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 225
-- Name: islemturleri_islemturuid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.islemturleri_islemturuid_seq', 4, true);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 229
-- Name: kayitlar_kayitid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kayitlar_kayitid_seq', 2, true);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 217
-- Name: musteriler_musteriid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.musteriler_musteriid_seq', 2, true);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 227
-- Name: parcalar_parcaid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parcalar_parcaid_seq', 5, true);


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 223
-- Name: personeller_personelid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personeller_personelid_seq', 3, true);


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 237
-- Name: rizaformlari_rizaid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rizaformlari_rizaid_seq', 1, true);


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 221
-- Name: roller_rolid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roller_rolid_seq', 4, true);


--
-- TOC entry 4827 (class 2606 OID 16715)
-- Name: aracislemleri aracislemleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemleri
    ADD CONSTRAINT aracislemleri_pkey PRIMARY KEY (aracislemid);


--
-- TOC entry 4829 (class 2606 OID 16737)
-- Name: aracislemparcalari aracislemparcalari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemparcalari
    ADD CONSTRAINT aracislemparcalari_pkey PRIMARY KEY (aracislemparcaid);


--
-- TOC entry 4831 (class 2606 OID 16754)
-- Name: aracislempersonelleri aracislempersonelleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislempersonelleri
    ADD CONSTRAINT aracislempersonelleri_pkey PRIMARY KEY (id);


--
-- TOC entry 4813 (class 2606 OID 16647)
-- Name: araclar araclar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.araclar
    ADD CONSTRAINT araclar_pkey PRIMARY KEY (aracid);


--
-- TOC entry 4815 (class 2606 OID 16649)
-- Name: araclar araclar_plaka_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.araclar
    ADD CONSTRAINT araclar_plaka_key UNIQUE (plaka);


--
-- TOC entry 4821 (class 2606 OID 16681)
-- Name: islemturleri islemturleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.islemturleri
    ADD CONSTRAINT islemturleri_pkey PRIMARY KEY (islemturuid);


--
-- TOC entry 4825 (class 2606 OID 16696)
-- Name: kayitlar kayitlar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kayitlar
    ADD CONSTRAINT kayitlar_pkey PRIMARY KEY (kayitid);


--
-- TOC entry 4811 (class 2606 OID 16638)
-- Name: musteriler musteriler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT musteriler_pkey PRIMARY KEY (musteriid);


--
-- TOC entry 4823 (class 2606 OID 16688)
-- Name: parcalar parcalar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcalar
    ADD CONSTRAINT parcalar_pkey PRIMARY KEY (parcaid);


--
-- TOC entry 4819 (class 2606 OID 16669)
-- Name: personeller personeller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personeller
    ADD CONSTRAINT personeller_pkey PRIMARY KEY (personelid);


--
-- TOC entry 4833 (class 2606 OID 16772)
-- Name: rizaformlari rizaformlari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rizaformlari
    ADD CONSTRAINT rizaformlari_pkey PRIMARY KEY (rizaid);


--
-- TOC entry 4817 (class 2606 OID 16661)
-- Name: roller roller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roller
    ADD CONSTRAINT roller_pkey PRIMARY KEY (rolid);


--
-- TOC entry 4838 (class 2606 OID 16721)
-- Name: aracislemleri aracislemleri_aracid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemleri
    ADD CONSTRAINT aracislemleri_aracid_fkey FOREIGN KEY (aracid) REFERENCES public.araclar(aracid);


--
-- TOC entry 4839 (class 2606 OID 16726)
-- Name: aracislemleri aracislemleri_islemturuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemleri
    ADD CONSTRAINT aracislemleri_islemturuid_fkey FOREIGN KEY (islemturuid) REFERENCES public.islemturleri(islemturuid);


--
-- TOC entry 4840 (class 2606 OID 16716)
-- Name: aracislemleri aracislemleri_kayitid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemleri
    ADD CONSTRAINT aracislemleri_kayitid_fkey FOREIGN KEY (kayitid) REFERENCES public.kayitlar(kayitid);


--
-- TOC entry 4841 (class 2606 OID 16738)
-- Name: aracislemparcalari aracislemparcalari_aracislemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemparcalari
    ADD CONSTRAINT aracislemparcalari_aracislemid_fkey FOREIGN KEY (aracislemid) REFERENCES public.aracislemleri(aracislemid);


--
-- TOC entry 4842 (class 2606 OID 16743)
-- Name: aracislemparcalari aracislemparcalari_parcaid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemparcalari
    ADD CONSTRAINT aracislemparcalari_parcaid_fkey FOREIGN KEY (parcaid) REFERENCES public.parcalar(parcaid);


--
-- TOC entry 4843 (class 2606 OID 16755)
-- Name: aracislempersonelleri aracislempersonelleri_aracislemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislempersonelleri
    ADD CONSTRAINT aracislempersonelleri_aracislemid_fkey FOREIGN KEY (aracislemid) REFERENCES public.aracislemleri(aracislemid);


--
-- TOC entry 4844 (class 2606 OID 16760)
-- Name: aracislempersonelleri aracislempersonelleri_personelid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislempersonelleri
    ADD CONSTRAINT aracislempersonelleri_personelid_fkey FOREIGN KEY (personelid) REFERENCES public.personeller(personelid);


--
-- TOC entry 4834 (class 2606 OID 16650)
-- Name: araclar araclar_musteriid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.araclar
    ADD CONSTRAINT araclar_musteriid_fkey FOREIGN KEY (musteriid) REFERENCES public.musteriler(musteriid) ON DELETE CASCADE;


--
-- TOC entry 4836 (class 2606 OID 16702)
-- Name: kayitlar kayitlar_aracid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kayitlar
    ADD CONSTRAINT kayitlar_aracid_fkey FOREIGN KEY (aracid) REFERENCES public.araclar(aracid);


--
-- TOC entry 4837 (class 2606 OID 16697)
-- Name: kayitlar kayitlar_musteriid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kayitlar
    ADD CONSTRAINT kayitlar_musteriid_fkey FOREIGN KEY (musteriid) REFERENCES public.musteriler(musteriid);


--
-- TOC entry 4835 (class 2606 OID 16670)
-- Name: personeller personeller_rolid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personeller
    ADD CONSTRAINT personeller_rolid_fkey FOREIGN KEY (rolid) REFERENCES public.roller(rolid);


--
-- TOC entry 4845 (class 2606 OID 16773)
-- Name: rizaformlari rizaformlari_aracislemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rizaformlari
    ADD CONSTRAINT rizaformlari_aracislemid_fkey FOREIGN KEY (aracislemid) REFERENCES public.aracislemleri(aracislemid);


-- Completed on 2025-10-22 22:47:54

--
-- PostgreSQL database dump complete
--

\unrestrict CmEB2n6cNNzyfzuwoR9fhGeaAY7yfxPFZY0nYuovhsFpp0bwvWoiSbVC4lHAlye


--
-- PostgreSQL database dump
--

\restrict Bo1pte4YK1W2FIj4kkDQfvSp70qrOcrkTUevG9GnbsT8dTTdgw8xR7bqmGyLHyu

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-21 13:53:01

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
-- TOC entry 230 (class 1259 OID 16566)
-- Name: aracislemleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aracislemleri (
    aracislemid integer NOT NULL,
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
-- TOC entry 229 (class 1259 OID 16565)
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
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 229
-- Name: aracislemleri_aracislemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aracislemleri_aracislemid_seq OWNED BY public.aracislemleri.aracislemid;


--
-- TOC entry 232 (class 1259 OID 16585)
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
-- TOC entry 231 (class 1259 OID 16584)
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
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 231
-- Name: aracislemparcalari_aracislemparcaid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aracislemparcalari_aracislemparcaid_seq OWNED BY public.aracislemparcalari.aracislemparcaid;


--
-- TOC entry 234 (class 1259 OID 16602)
-- Name: aracislempersonelleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aracislempersonelleri (
    id integer NOT NULL,
    aracislemid integer NOT NULL,
    personelid integer NOT NULL
);


ALTER TABLE public.aracislempersonelleri OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16601)
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
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 233
-- Name: aracislempersonelleri_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aracislempersonelleri_id_seq OWNED BY public.aracislempersonelleri.id;


--
-- TOC entry 220 (class 1259 OID 16518)
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
-- TOC entry 219 (class 1259 OID 16517)
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
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 219
-- Name: araclar_aracid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.araclar_aracid_seq OWNED BY public.araclar.aracid;


--
-- TOC entry 226 (class 1259 OID 16552)
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
-- TOC entry 225 (class 1259 OID 16551)
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
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 225
-- Name: islemturleri_islemturuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.islemturleri_islemturuid_seq OWNED BY public.islemturleri.islemturuid;


--
-- TOC entry 218 (class 1259 OID 16511)
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
-- TOC entry 217 (class 1259 OID 16510)
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
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 217
-- Name: musteriler_musteriid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musteriler_musteriid_seq OWNED BY public.musteriler.musteriid;


--
-- TOC entry 228 (class 1259 OID 16559)
-- Name: parcalar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parcalar (
    parcaid integer NOT NULL,
    parcaadi character varying(100) NOT NULL,
    aracbolumu character varying(50)
);


ALTER TABLE public.parcalar OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16558)
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
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 227
-- Name: parcalar_parcaid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parcalar_parcaid_seq OWNED BY public.parcalar.parcaid;


--
-- TOC entry 224 (class 1259 OID 16539)
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
-- TOC entry 223 (class 1259 OID 16538)
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
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 223
-- Name: personeller_personelid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personeller_personelid_seq OWNED BY public.personeller.personelid;


--
-- TOC entry 236 (class 1259 OID 16619)
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
-- TOC entry 235 (class 1259 OID 16618)
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
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 235
-- Name: rizaformlari_rizaid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rizaformlari_rizaid_seq OWNED BY public.rizaformlari.rizaid;


--
-- TOC entry 222 (class 1259 OID 16532)
-- Name: roller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roller (
    rolid integer NOT NULL,
    roladi character varying(50) NOT NULL
);


ALTER TABLE public.roller OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16531)
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
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 221
-- Name: roller_rolid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roller_rolid_seq OWNED BY public.roller.rolid;


--
-- TOC entry 4796 (class 2604 OID 16569)
-- Name: aracislemleri aracislemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemleri ALTER COLUMN aracislemid SET DEFAULT nextval('public.aracislemleri_aracislemid_seq'::regclass);


--
-- TOC entry 4799 (class 2604 OID 16588)
-- Name: aracislemparcalari aracislemparcaid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemparcalari ALTER COLUMN aracislemparcaid SET DEFAULT nextval('public.aracislemparcalari_aracislemparcaid_seq'::regclass);


--
-- TOC entry 4800 (class 2604 OID 16605)
-- Name: aracislempersonelleri id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislempersonelleri ALTER COLUMN id SET DEFAULT nextval('public.aracislempersonelleri_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 16521)
-- Name: araclar aracid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.araclar ALTER COLUMN aracid SET DEFAULT nextval('public.araclar_aracid_seq'::regclass);


--
-- TOC entry 4794 (class 2604 OID 16555)
-- Name: islemturleri islemturuid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.islemturleri ALTER COLUMN islemturuid SET DEFAULT nextval('public.islemturleri_islemturuid_seq'::regclass);


--
-- TOC entry 4787 (class 2604 OID 16514)
-- Name: musteriler musteriid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteriler ALTER COLUMN musteriid SET DEFAULT nextval('public.musteriler_musteriid_seq'::regclass);


--
-- TOC entry 4795 (class 2604 OID 16562)
-- Name: parcalar parcaid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcalar ALTER COLUMN parcaid SET DEFAULT nextval('public.parcalar_parcaid_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 16542)
-- Name: personeller personelid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personeller ALTER COLUMN personelid SET DEFAULT nextval('public.personeller_personelid_seq'::regclass);


--
-- TOC entry 4801 (class 2604 OID 16622)
-- Name: rizaformlari rizaid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rizaformlari ALTER COLUMN rizaid SET DEFAULT nextval('public.rizaformlari_rizaid_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 16535)
-- Name: roller rolid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roller ALTER COLUMN rolid SET DEFAULT nextval('public.roller_rolid_seq'::regclass);


--
-- TOC entry 4990 (class 0 OID 16566)
-- Dependencies: 230
-- Data for Name: aracislemleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aracislemleri (aracislemid, aracid, islemturuid, aciklama, baslangictarihi, bitistarihi, toplamtutar, iskontoorani, odemeturu) FROM stdin;
1	1	4	Ön 3 parça PPF	2025-10-21 13:44:33.983799	\N	3000.00	10.00	Nakit
\.


--
-- TOC entry 4992 (class 0 OID 16585)
-- Dependencies: 232
-- Data for Name: aracislemparcalari; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aracislemparcalari (aracislemparcaid, aracislemid, parcaid, ppfmarka, microndegeri) FROM stdin;
1	1	1	XPEL	200
2	1	2	XPEL	200
3	1	5	XPEL	200
\.


--
-- TOC entry 4994 (class 0 OID 16602)
-- Dependencies: 234
-- Data for Name: aracislempersonelleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aracislempersonelleri (id, aracislemid, personelid) FROM stdin;
1	1	1
2	1	2
\.


--
-- TOC entry 4980 (class 0 OID 16518)
-- Dependencies: 220
-- Data for Name: araclar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.araclar (aracid, musteriid, plaka, marka, model, yil, renk, sunroof, giristarihi, teslimtarihi) FROM stdin;
1	1	35ABC123	BMW	320i	2018	Siyah	t	2025-10-21 13:44:33.983799	\N
2	2	06XYZ456	Mercedes	C200	2020	Beyaz	f	2025-10-21 13:44:33.983799	\N
\.


--
-- TOC entry 4986 (class 0 OID 16552)
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
-- TOC entry 4978 (class 0 OID 16511)
-- Dependencies: 218
-- Data for Name: musteriler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.musteriler (musteriid, adsoyad, telefon, email, adres) FROM stdin;
1	Ahmet Demir	05555555501	ahmet@oto.com	İzmir
2	Ayşe Yılmaz	05555555502	ayse@oto.com	Ankara
\.


--
-- TOC entry 4988 (class 0 OID 16559)
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
-- TOC entry 4984 (class 0 OID 16539)
-- Dependencies: 224
-- Data for Name: personeller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personeller (personelid, adsoyad, telefon, rolid, isegiristarihi, maas) FROM stdin;
1	Ali Vural	05555555510	3	2025-10-21 13:44:33.983799	15000.00
2	Selin Demir	05555555511	2	2025-10-21 13:44:33.983799	17000.00
3	Murat Kaya	05555555512	3	2025-10-21 13:44:33.983799	14000.00
\.


--
-- TOC entry 4996 (class 0 OID 16619)
-- Dependencies: 236
-- Data for Name: rizaformlari; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rizaformlari (rizaid, aracislemid, onaydurumu, onaytarihi, aciklama) FROM stdin;
1	1	t	2025-10-21 13:44:33.983799	Motor temizliği için müşteri onayı alındı.
\.


--
-- TOC entry 4982 (class 0 OID 16532)
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
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 229
-- Name: aracislemleri_aracislemid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aracislemleri_aracislemid_seq', 1, true);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 231
-- Name: aracislemparcalari_aracislemparcaid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aracislemparcalari_aracislemparcaid_seq', 3, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 233
-- Name: aracislempersonelleri_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aracislempersonelleri_id_seq', 2, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 219
-- Name: araclar_aracid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.araclar_aracid_seq', 2, true);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 225
-- Name: islemturleri_islemturuid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.islemturleri_islemturuid_seq', 4, true);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 217
-- Name: musteriler_musteriid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.musteriler_musteriid_seq', 2, true);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 227
-- Name: parcalar_parcaid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parcalar_parcaid_seq', 5, true);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 223
-- Name: personeller_personelid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personeller_personelid_seq', 3, true);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 235
-- Name: rizaformlari_rizaid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rizaformlari_rizaid_seq', 1, true);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 221
-- Name: roller_rolid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roller_rolid_seq', 4, true);


--
-- TOC entry 4816 (class 2606 OID 16573)
-- Name: aracislemleri aracislemleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemleri
    ADD CONSTRAINT aracislemleri_pkey PRIMARY KEY (aracislemid);


--
-- TOC entry 4818 (class 2606 OID 16590)
-- Name: aracislemparcalari aracislemparcalari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemparcalari
    ADD CONSTRAINT aracislemparcalari_pkey PRIMARY KEY (aracislemparcaid);


--
-- TOC entry 4820 (class 2606 OID 16607)
-- Name: aracislempersonelleri aracislempersonelleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislempersonelleri
    ADD CONSTRAINT aracislempersonelleri_pkey PRIMARY KEY (id);


--
-- TOC entry 4806 (class 2606 OID 16525)
-- Name: araclar araclar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.araclar
    ADD CONSTRAINT araclar_pkey PRIMARY KEY (aracid);


--
-- TOC entry 4812 (class 2606 OID 16557)
-- Name: islemturleri islemturleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.islemturleri
    ADD CONSTRAINT islemturleri_pkey PRIMARY KEY (islemturuid);


--
-- TOC entry 4804 (class 2606 OID 16516)
-- Name: musteriler musteriler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT musteriler_pkey PRIMARY KEY (musteriid);


--
-- TOC entry 4814 (class 2606 OID 16564)
-- Name: parcalar parcalar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcalar
    ADD CONSTRAINT parcalar_pkey PRIMARY KEY (parcaid);


--
-- TOC entry 4810 (class 2606 OID 16545)
-- Name: personeller personeller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personeller
    ADD CONSTRAINT personeller_pkey PRIMARY KEY (personelid);


--
-- TOC entry 4822 (class 2606 OID 16625)
-- Name: rizaformlari rizaformlari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rizaformlari
    ADD CONSTRAINT rizaformlari_pkey PRIMARY KEY (rizaid);


--
-- TOC entry 4808 (class 2606 OID 16537)
-- Name: roller roller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roller
    ADD CONSTRAINT roller_pkey PRIMARY KEY (rolid);


--
-- TOC entry 4825 (class 2606 OID 16574)
-- Name: aracislemleri aracislemleri_aracid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemleri
    ADD CONSTRAINT aracislemleri_aracid_fkey FOREIGN KEY (aracid) REFERENCES public.araclar(aracid);


--
-- TOC entry 4826 (class 2606 OID 16579)
-- Name: aracislemleri aracislemleri_islemturuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemleri
    ADD CONSTRAINT aracislemleri_islemturuid_fkey FOREIGN KEY (islemturuid) REFERENCES public.islemturleri(islemturuid);


--
-- TOC entry 4827 (class 2606 OID 16591)
-- Name: aracislemparcalari aracislemparcalari_aracislemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemparcalari
    ADD CONSTRAINT aracislemparcalari_aracislemid_fkey FOREIGN KEY (aracislemid) REFERENCES public.aracislemleri(aracislemid);


--
-- TOC entry 4828 (class 2606 OID 16596)
-- Name: aracislemparcalari aracislemparcalari_parcaid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislemparcalari
    ADD CONSTRAINT aracislemparcalari_parcaid_fkey FOREIGN KEY (parcaid) REFERENCES public.parcalar(parcaid);


--
-- TOC entry 4829 (class 2606 OID 16608)
-- Name: aracislempersonelleri aracislempersonelleri_aracislemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislempersonelleri
    ADD CONSTRAINT aracislempersonelleri_aracislemid_fkey FOREIGN KEY (aracislemid) REFERENCES public.aracislemleri(aracislemid);


--
-- TOC entry 4830 (class 2606 OID 16613)
-- Name: aracislempersonelleri aracislempersonelleri_personelid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aracislempersonelleri
    ADD CONSTRAINT aracislempersonelleri_personelid_fkey FOREIGN KEY (personelid) REFERENCES public.personeller(personelid);


--
-- TOC entry 4823 (class 2606 OID 16526)
-- Name: araclar araclar_musteriid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.araclar
    ADD CONSTRAINT araclar_musteriid_fkey FOREIGN KEY (musteriid) REFERENCES public.musteriler(musteriid);


--
-- TOC entry 4824 (class 2606 OID 16546)
-- Name: personeller personeller_rolid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personeller
    ADD CONSTRAINT personeller_rolid_fkey FOREIGN KEY (rolid) REFERENCES public.roller(rolid);


--
-- TOC entry 4831 (class 2606 OID 16626)
-- Name: rizaformlari rizaformlari_aracislemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rizaformlari
    ADD CONSTRAINT rizaformlari_aracislemid_fkey FOREIGN KEY (aracislemid) REFERENCES public.aracislemleri(aracislemid);


-- Completed on 2025-10-21 13:53:01

--
-- PostgreSQL database dump complete
--

\unrestrict Bo1pte4YK1W2FIj4kkDQfvSp70qrOcrkTUevG9GnbsT8dTTdgw8xR7bqmGyLHyu


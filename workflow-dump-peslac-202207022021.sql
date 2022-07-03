--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Debian 12.11-1.pgdg110+1)
-- Dumped by pg_dump version 12.2

-- Started on 2022-07-02 20:21:59

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 41150)
-- Name: config_descuentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.config_descuentos (
    id integer NOT NULL,
    id_producto integer,
    cantidad_min integer,
    cantidad_max integer,
    descuento integer
);


ALTER TABLE public.config_descuentos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 41148)
-- Name: config_descuentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.config_descuentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.config_descuentos_id_seq OWNER TO postgres;

--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 219
-- Name: config_descuentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.config_descuentos_id_seq OWNED BY public.config_descuentos.id;


--
-- TOC entry 222 (class 1259 OID 41168)
-- Name: configuracion_paquetes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuracion_paquetes (
    id integer NOT NULL,
    cantidad integer,
    id_paquete integer,
    id_producto integer
);


ALTER TABLE public.configuracion_paquetes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41166)
-- Name: configuracion_paquetes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.configuracion_paquetes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuracion_paquetes_id_seq OWNER TO postgres;

--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 221
-- Name: configuracion_paquetes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuracion_paquetes_id_seq OWNED BY public.configuracion_paquetes.id;


--
-- TOC entry 208 (class 1259 OID 32944)
-- Name: grupos_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupos_productos (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.grupos_productos OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 32942)
-- Name: grupos_productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupos_productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupos_productos_id_seq OWNER TO postgres;

--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 207
-- Name: grupos_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupos_productos_id_seq OWNED BY public.grupos_productos.id;


--
-- TOC entry 218 (class 1259 OID 41137)
-- Name: lineas_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lineas_producto (
    id integer NOT NULL,
    nombre character varying(50),
    fecha_registro date DEFAULT CURRENT_DATE
);


ALTER TABLE public.lineas_producto OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41135)
-- Name: lineas_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lineas_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lineas_producto_id_seq OWNER TO postgres;

--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 217
-- Name: lineas_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lineas_producto_id_seq OWNED BY public.lineas_producto.id;


--
-- TOC entry 224 (class 1259 OID 41218)
-- Name: paquetes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paquetes (
    id integer NOT NULL,
    id_producto integer,
    fecha_registro date DEFAULT CURRENT_DATE
);


ALTER TABLE public.paquetes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 41216)
-- Name: paquetes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paquetes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paquetes_id_seq OWNER TO postgres;

--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 223
-- Name: paquetes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paquetes_id_seq OWNED BY public.paquetes.id;


--
-- TOC entry 212 (class 1259 OID 32962)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(60),
    cantidad integer,
    precio_costo numeric(20,2),
    id_tipo_impuesto integer,
    valor_inpuesto numeric(5,2),
    precio_venta numeric(20,2),
    id_proveedor integer,
    descripcion character varying(200),
    id_linea integer,
    imagen text,
    codigo_barras character varying(30) NOT NULL,
    inventario_min integer,
    habilitado integer,
    fecha_registro date DEFAULT CURRENT_DATE,
    id_usuario_registro integer,
    id_tipo_cantidad integer
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 32958)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_seq OWNER TO postgres;

--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 211
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 210 (class 1259 OID 32952)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    id integer NOT NULL,
    razon_social character varying(100),
    nombre character varying(50),
    nit character varying(20),
    celular character varying(15),
    cuenta character varying(25),
    direccion character varying(50),
    correo character varying(60),
    telefono character varying(15)
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 32950)
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proveedores_id_seq OWNER TO postgres;

--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 209
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_id_seq OWNED BY public.proveedores.id;


--
-- TOC entry 214 (class 1259 OID 32971)
-- Name: tipos_cantidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_cantidad (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.tipos_cantidad OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 32969)
-- Name: tipos_cantidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipos_cantidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_cantidad_id_seq OWNER TO postgres;

--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipos_cantidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_cantidad_id_seq OWNED BY public.tipos_cantidad.id;


--
-- TOC entry 216 (class 1259 OID 41114)
-- Name: tipos_impuesto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_impuesto (
    id integer NOT NULL,
    nombre character varying(30)
);


ALTER TABLE public.tipos_impuesto OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 41112)
-- Name: tipos_impuesto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipos_impuesto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_impuesto_id_seq OWNER TO postgres;

--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 215
-- Name: tipos_impuesto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_impuesto_id_seq OWNED BY public.tipos_impuesto.id;


--
-- TOC entry 203 (class 1259 OID 32914)
-- Name: tipos_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_usuarios (
    id bigint NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.tipos_usuarios OWNER TO postgres;

--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN tipos_usuarios.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tipos_usuarios.id IS 'Identificador';


--
-- TOC entry 202 (class 1259 OID 32912)
-- Name: tipos_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipos_usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 202
-- Name: tipos_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_usuarios_id_seq OWNED BY public.tipos_usuarios.id;


--
-- TOC entry 205 (class 1259 OID 32922)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombres character varying(50),
    apellidos character varying(50),
    ciudad character varying(50),
    correo character varying(50),
    direccion character varying(50),
    telefono character varying(15),
    usuario character varying(10) NOT NULL,
    clave character varying(50),
    id_tipo_usuario bigint,
    nit character varying(20),
    estacion character varying(100),
    fecha_registro date DEFAULT CURRENT_DATE
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 32920)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 204
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 206 (class 1259 OID 32928)
-- Name: usuarios_id_tipo_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_tipo_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_tipo_usuario_seq OWNER TO postgres;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 206
-- Name: usuarios_id_tipo_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_tipo_usuario_seq OWNED BY public.usuarios.id_tipo_usuario;


--
-- TOC entry 2902 (class 2604 OID 41153)
-- Name: config_descuentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config_descuentos ALTER COLUMN id SET DEFAULT nextval('public.config_descuentos_id_seq'::regclass);


--
-- TOC entry 2903 (class 2604 OID 41171)
-- Name: configuracion_paquetes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_paquetes ALTER COLUMN id SET DEFAULT nextval('public.configuracion_paquetes_id_seq'::regclass);


--
-- TOC entry 2894 (class 2604 OID 32947)
-- Name: grupos_productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos_productos ALTER COLUMN id SET DEFAULT nextval('public.grupos_productos_id_seq'::regclass);


--
-- TOC entry 2900 (class 2604 OID 41140)
-- Name: lineas_producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineas_producto ALTER COLUMN id SET DEFAULT nextval('public.lineas_producto_id_seq'::regclass);


--
-- TOC entry 2904 (class 2604 OID 41221)
-- Name: paquetes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes ALTER COLUMN id SET DEFAULT nextval('public.paquetes_id_seq'::regclass);


--
-- TOC entry 2896 (class 2604 OID 32965)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 2895 (class 2604 OID 32955)
-- Name: proveedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id SET DEFAULT nextval('public.proveedores_id_seq'::regclass);


--
-- TOC entry 2898 (class 2604 OID 32974)
-- Name: tipos_cantidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_cantidad ALTER COLUMN id SET DEFAULT nextval('public.tipos_cantidad_id_seq'::regclass);


--
-- TOC entry 2899 (class 2604 OID 41117)
-- Name: tipos_impuesto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_impuesto ALTER COLUMN id SET DEFAULT nextval('public.tipos_impuesto_id_seq'::regclass);


--
-- TOC entry 2891 (class 2604 OID 33042)
-- Name: tipos_usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_usuarios ALTER COLUMN id SET DEFAULT nextval('public.tipos_usuarios_id_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 32925)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 3082 (class 0 OID 41150)
-- Dependencies: 220
-- Data for Name: config_descuentos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3084 (class 0 OID 41168)
-- Dependencies: 222
-- Data for Name: configuracion_paquetes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.configuracion_paquetes VALUES (9, 1, 2, 4);
INSERT INTO public.configuracion_paquetes VALUES (12, 1, 2, 5);
INSERT INTO public.configuracion_paquetes VALUES (13, 2, 3, 8);


--
-- TOC entry 3070 (class 0 OID 32944)
-- Dependencies: 208
-- Data for Name: grupos_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3080 (class 0 OID 41137)
-- Dependencies: 218
-- Data for Name: lineas_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lineas_producto VALUES (1, 'Mantequilla', '2022-07-02');
INSERT INTO public.lineas_producto VALUES (3, 'Kumis', '2022-07-02');
INSERT INTO public.lineas_producto VALUES (2, 'Avena', '2022-07-02');


--
-- TOC entry 3086 (class 0 OID 41218)
-- Dependencies: 224
-- Data for Name: paquetes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.paquetes VALUES (2, 2, '2022-07-02');
INSERT INTO public.paquetes VALUES (3, 6, '2022-07-02');


--
-- TOC entry 3074 (class 0 OID 32962)
-- Dependencies: 212
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos VALUES (8, 'Queso 2', 90, 80000.00, 1, 0.00, NULL, 1, 'producto prueba', 1, NULL, '159753', 10, 1, '2022-07-02', NULL, 2);
INSERT INTO public.productos VALUES (6, 'Prodcuto 2', 76, 51500.00, 1, 0.00, NULL, 1, 'producto prueba', 1, NULL, '123456', 10, 1, '2022-07-02', NULL, 2);
INSERT INTO public.productos VALUES (5, 'Prodcuto 3', 8, 51500.00, 1, 0.00, NULL, 1, 'producto prueba', 1, NULL, '321654', 10, 1, '2022-07-02', NULL, 1);
INSERT INTO public.productos VALUES (4, 'Prodcuto 4', 50, 51500.00, 1, 0.00, NULL, 1, 'producto prueba', 1, NULL, '987321', 10, 1, '2022-07-02', NULL, 1);
INSERT INTO public.productos VALUES (2, 'Prodcuto 5', 12, 51500.00, 1, 0.00, NULL, 1, 'producto prueba', 1, NULL, '963578', 10, 1, '2022-07-02', NULL, NULL);


--
-- TOC entry 3072 (class 0 OID 32952)
-- Dependencies: 210
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.proveedores VALUES (1, 'proveedor 1', 'proveedor 1', '80045687', '3007987675', '2121212', 'calle 5', 'abc@gmail.com', '3007987675');


--
-- TOC entry 3076 (class 0 OID 32971)
-- Dependencies: 214
-- Data for Name: tipos_cantidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipos_cantidad VALUES (1, 'Kg');
INSERT INTO public.tipos_cantidad VALUES (2, 'Unidad');


--
-- TOC entry 3078 (class 0 OID 41114)
-- Dependencies: 216
-- Data for Name: tipos_impuesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipos_impuesto VALUES (1, 'Excluido');
INSERT INTO public.tipos_impuesto VALUES (2, 'Exento');
INSERT INTO public.tipos_impuesto VALUES (3, 'Sin Impuesto');
INSERT INTO public.tipos_impuesto VALUES (4, 'Impoconsumo');
INSERT INTO public.tipos_impuesto VALUES (5, 'IVA');


--
-- TOC entry 3065 (class 0 OID 32914)
-- Dependencies: 203
-- Data for Name: tipos_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipos_usuarios VALUES (1, 'Vendedor');


--
-- TOC entry 3067 (class 0 OID 32922)
-- Dependencies: 205
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios VALUES (37, 'Andrés Prueba 11', 'Beltrán', '44sdaf', 'sdfgsdf@asd', 'sdf', 'asd', 'qweqwe', '99asdf', 1, '3557891', 'Sogamoso 2', '2022-07-02');
INSERT INTO public.usuarios VALUES (55, 'qqNUEVO', 'qq', 'qq', 'qq', 'qq', 'qq', 'qq', 'qq', 1, 'qq', 'qq', '2022-07-02');
INSERT INTO public.usuarios VALUES (56, 'AA', 'AA', 'AA', 'AA', 'AA', 'AA', 'AAA', 'AA', 1, 'AA', 'AAA', '2022-07-03');
INSERT INTO public.usuarios VALUES (43, 'Camilo11', 'Beltrán', 'sdaf', 'sdfgsdf@asd', 'sdf', 'asd', 'qweqwe', 'asdf', 1, '15687511', 'Sogamoso 1', '2022-07-02');
INSERT INTO public.usuarios VALUES (57, 'ww', 'ww', 'ww', 'ww', 'ww', 'ww', 'ww', 'ww', 1, 'ww', 'www', '2022-07-03');
INSERT INTO public.usuarios VALUES (45, 'Nombres prueba', 'Apellidos prueba', 'bogota', 'crick120@hotmail', 'calle 67', '300796', 'sdfg', 'asdfewrq', 1, '789456', 'Sogamoso 4', '2022-07-02');
INSERT INTO public.usuarios VALUES (46, 'Nombres prueba', 'Apellidos prueba', 'bogota', 'crick120@hotmail', 'calle 67', '300796', 'sdfg', 'asdfewrq', 1, '943168', 'Sogamoso 5', '2022-07-02');
INSERT INTO public.usuarios VALUES (47, 'Nombres prueba', 'Apellidos prueba', 'bogota', 'crick120@hotmail', 'calle 67', '300796', 'sdfg', 'asdfewrq', 1, '716941', 'Sogamoso 6', '2022-07-02');
INSERT INTO public.usuarios VALUES (44, 'Nombres prueba 1', 'Apellidos prueba', 'bogota', 'crick120@hotmail', 'calle 67', '300796', 'sdfg 1', 'asdfewrq', 1, '123456', 'Sogamoso 3', '2022-07-02');
INSERT INTO public.usuarios VALUES (48, 'Nombres prueba 2', 'Apellidos prueba', 'bogota', 'crick120@hotmail', 'calle 67', '300796', 'sdfg', 'asdfewrq', 1, '376824', 'Sogamoso 7', '2022-07-02');
INSERT INTO public.usuarios VALUES (53, 'Andrés', 'Beltrán', '44sdaf', 'sdfgsdf@asd', 'sdf', 'asd', 'qweqwe', '99asdf', 1, '3557891', 'Sogamoso 2', '2022-07-02');
INSERT INTO public.usuarios VALUES (54, 'Andrés Ricardo', 'Beltrán', '44sdaf', 'sdfgsdf@asd', 'sdf', 'asd', 'qweqwe', '99asdf', 1, '3557891', 'Sogamoso 2', '2022-07-02');


--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 219
-- Name: config_descuentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.config_descuentos_id_seq', 1, false);


--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 221
-- Name: configuracion_paquetes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configuracion_paquetes_id_seq', 13, true);


--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 207
-- Name: grupos_productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupos_productos_id_seq', 1, false);


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 217
-- Name: lineas_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lineas_producto_id_seq', 3, true);


--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 223
-- Name: paquetes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paquetes_id_seq', 3, true);


--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 211
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 8, true);


--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 209
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 1, false);


--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipos_cantidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_cantidad_id_seq', 1, false);


--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 215
-- Name: tipos_impuesto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_impuesto_id_seq', 1, false);


--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 202
-- Name: tipos_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_usuarios_id_seq', 4, true);


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 204
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 57, true);


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 206
-- Name: usuarios_id_tipo_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_tipo_usuario_seq', 5, true);


--
-- TOC entry 2923 (class 2606 OID 41155)
-- Name: config_descuentos pk_config_descuentos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config_descuentos
    ADD CONSTRAINT pk_config_descuentos PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 41173)
-- Name: configuracion_paquetes pk_configuracion_paquetes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_paquetes
    ADD CONSTRAINT pk_configuracion_paquetes PRIMARY KEY (id);


--
-- TOC entry 2911 (class 2606 OID 32949)
-- Name: grupos_productos pk_grupos_productos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos_productos
    ADD CONSTRAINT pk_grupos_productos PRIMARY KEY (id);


--
-- TOC entry 2921 (class 2606 OID 41142)
-- Name: lineas_producto pk_lineas_producto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineas_producto
    ADD CONSTRAINT pk_lineas_producto PRIMARY KEY (id);


--
-- TOC entry 2927 (class 2606 OID 41224)
-- Name: paquetes pk_paquetes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT pk_paquetes PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 32968)
-- Name: productos pk_productos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT pk_productos PRIMARY KEY (id);


--
-- TOC entry 2913 (class 2606 OID 32957)
-- Name: proveedores pk_proveedores; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT pk_proveedores PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 41119)
-- Name: tipos_impuesto pk_tipos_c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_impuesto
    ADD CONSTRAINT pk_tipos_c PRIMARY KEY (id);


--
-- TOC entry 2917 (class 2606 OID 32976)
-- Name: tipos_cantidad pk_tipos_cantidad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_cantidad
    ADD CONSTRAINT pk_tipos_cantidad PRIMARY KEY (id);


--
-- TOC entry 2907 (class 2606 OID 33044)
-- Name: tipos_usuarios pk_tipos_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_usuarios
    ADD CONSTRAINT pk_tipos_usuarios PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 32927)
-- Name: usuarios pk_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);


--
-- TOC entry 2934 (class 2606 OID 41156)
-- Name: config_descuentos fk_config_descuentos_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config_descuentos
    ADD CONSTRAINT fk_config_descuentos_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id);


--
-- TOC entry 2936 (class 2606 OID 41242)
-- Name: configuracion_paquetes fk_configuracion_paquetes_paquetes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_paquetes
    ADD CONSTRAINT fk_configuracion_paquetes_paquetes FOREIGN KEY (id_paquete) REFERENCES public.paquetes(id);


--
-- TOC entry 2935 (class 2606 OID 41237)
-- Name: configuracion_paquetes fk_configuracion_paquetes_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_paquetes
    ADD CONSTRAINT fk_configuracion_paquetes_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id);


--
-- TOC entry 2937 (class 2606 OID 41225)
-- Name: paquetes fk_paquetes_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT fk_paquetes_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id);


--
-- TOC entry 2931 (class 2606 OID 41143)
-- Name: productos fk_productos_lineas_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_lineas_producto FOREIGN KEY (id_linea) REFERENCES public.lineas_producto(id);


--
-- TOC entry 2930 (class 2606 OID 41130)
-- Name: productos fk_productos_proveedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id);


--
-- TOC entry 2933 (class 2606 OID 41211)
-- Name: productos fk_productos_tipos_cantidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_tipos_cantidad FOREIGN KEY (id_tipo_cantidad) REFERENCES public.tipos_cantidad(id);


--
-- TOC entry 2929 (class 2606 OID 41120)
-- Name: productos fk_productos_tipos_impuesto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_tipos_impuesto FOREIGN KEY (id_tipo_impuesto) REFERENCES public.tipos_impuesto(id);


--
-- TOC entry 2932 (class 2606 OID 41188)
-- Name: productos fk_productos_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_usuarios FOREIGN KEY (id_usuario_registro) REFERENCES public.usuarios(id);


--
-- TOC entry 2928 (class 2606 OID 33066)
-- Name: usuarios fk_usuarios_tipos_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuarios_tipos_usuarios FOREIGN KEY (id_tipo_usuario) REFERENCES public.tipos_usuarios(id);


-- Completed on 2022-07-02 20:22:01

--
-- PostgreSQL database dump complete
--


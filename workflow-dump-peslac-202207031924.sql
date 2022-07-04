--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Debian 12.11-1.pgdg110+1)
-- Dumped by pg_dump version 12.2

-- Started on 2022-07-03 19:24:57

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
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 49298)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombres character varying(50),
    apellidos character varying(50),
    cedula character varying(15),
    celular character varying(15),
    ciudad character varying(50),
    direccion character varying(100),
    id_lista_precios integer,
    fecha_registro date DEFAULT CURRENT_DATE
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 49296)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 223
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 242 (class 1259 OID 57527)
-- Name: compras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras (
    id integer NOT NULL,
    id_orden integer,
    fecha_registro date DEFAULT CURRENT_DATE,
    id_estado_compra integer,
    id_proveedor integer
);


ALTER TABLE public.compras OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 57525)
-- Name: compras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compras_id_seq OWNER TO postgres;

--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 241
-- Name: compras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compras_id_seq OWNED BY public.compras.id;


--
-- TOC entry 234 (class 1259 OID 49370)
-- Name: condiciones_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.condiciones_pago (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.condiciones_pago OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 49368)
-- Name: condiciones_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.condiciones_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.condiciones_pago_id_seq OWNER TO postgres;

--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 233
-- Name: condiciones_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.condiciones_pago_id_seq OWNED BY public.condiciones_pago.id;


--
-- TOC entry 218 (class 1259 OID 41150)
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
-- TOC entry 217 (class 1259 OID 41148)
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
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 217
-- Name: config_descuentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.config_descuentos_id_seq OWNED BY public.config_descuentos.id;


--
-- TOC entry 220 (class 1259 OID 41168)
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
-- TOC entry 219 (class 1259 OID 41166)
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
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 219
-- Name: configuracion_paquetes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuracion_paquetes_id_seq OWNED BY public.configuracion_paquetes.id;


--
-- TOC entry 236 (class 1259 OID 49388)
-- Name: detalle_ordenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_ordenes (
    id integer NOT NULL,
    id_venta integer,
    id_producto integer,
    cantidad integer,
    fecha_registro date DEFAULT CURRENT_DATE,
    total numeric(20,2)
);


ALTER TABLE public.detalle_ordenes OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 49386)
-- Name: detalle_ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_ventas_id_seq OWNER TO postgres;

--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 235
-- Name: detalle_ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_ventas_id_seq OWNED BY public.detalle_ordenes.id;


--
-- TOC entry 246 (class 1259 OID 57567)
-- Name: estados_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estados_compra (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.estados_compra OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 57565)
-- Name: estados_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estados_compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estados_compra_id_seq OWNER TO postgres;

--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 245
-- Name: estados_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estados_compra_id_seq OWNED BY public.estados_compra.id;


--
-- TOC entry 226 (class 1259 OID 49307)
-- Name: historial_devoluciones_salidas_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historial_devoluciones_salidas_productos (
    id integer NOT NULL,
    id_producto integer,
    cantidad integer,
    id_tipo_operacion integer,
    fecha_registro date DEFAULT CURRENT_DATE,
    comentario character varying(200)
);


ALTER TABLE public.historial_devoluciones_salidas_productos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 49305)
-- Name: historial_devoluciones_salidas_productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historial_devoluciones_salidas_productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historial_devoluciones_salidas_productos_id_seq OWNER TO postgres;

--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 225
-- Name: historial_devoluciones_salidas_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historial_devoluciones_salidas_productos_id_seq OWNED BY public.historial_devoluciones_salidas_productos.id;


--
-- TOC entry 216 (class 1259 OID 41137)
-- Name: lineas_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lineas_producto (
    id integer NOT NULL,
    nombre character varying(50),
    fecha_registro date DEFAULT CURRENT_DATE
);


ALTER TABLE public.lineas_producto OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 41135)
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
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 215
-- Name: lineas_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lineas_producto_id_seq OWNED BY public.lineas_producto.id;


--
-- TOC entry 232 (class 1259 OID 49357)
-- Name: metodos_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metodos_pago (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.metodos_pago OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 49355)
-- Name: metodos_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metodos_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metodos_pago_id_seq OWNER TO postgres;

--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 231
-- Name: metodos_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metodos_pago_id_seq OWNED BY public.metodos_pago.id;


--
-- TOC entry 230 (class 1259 OID 49339)
-- Name: ordenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordenes (
    id integer NOT NULL,
    id_usuario integer,
    consecutivo integer NOT NULL,
    id_cliente integer,
    id_metodo_pago integer,
    id_condicion_pago integer,
    id_tipo_venta integer,
    fecha_registro date DEFAULT CURRENT_DATE
);


ALTER TABLE public.ordenes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 41218)
-- Name: paquetes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paquetes (
    id integer NOT NULL,
    id_producto integer,
    fecha_registro date DEFAULT CURRENT_DATE
);


ALTER TABLE public.paquetes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41216)
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
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 221
-- Name: paquetes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paquetes_id_seq OWNED BY public.paquetes.id;


--
-- TOC entry 210 (class 1259 OID 32962)
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
-- TOC entry 209 (class 1259 OID 32958)
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
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 209
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 208 (class 1259 OID 32952)
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
    telefono character varying(15),
    banco character varying(100),
    tipo_cuenta character varying(50)
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 32950)
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
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 207
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_id_seq OWNED BY public.proveedores.id;


--
-- TOC entry 228 (class 1259 OID 49326)
-- Name: tipo_operacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_operacion (
    id integer NOT NULL,
    nombre character varying(50),
    accion character varying(1)
);


ALTER TABLE public.tipo_operacion OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 49324)
-- Name: tipo_operacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_operacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_operacion_id_seq OWNER TO postgres;

--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 227
-- Name: tipo_operacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_operacion_id_seq OWNED BY public.tipo_operacion.id;


--
-- TOC entry 238 (class 1259 OID 57490)
-- Name: tipo_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_venta (
    id integer NOT NULL,
    nombre character varying(20)
);


ALTER TABLE public.tipo_venta OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 57488)
-- Name: tipo_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_venta_id_seq OWNER TO postgres;

--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipo_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_venta_id_seq OWNED BY public.tipo_venta.id;


--
-- TOC entry 212 (class 1259 OID 32971)
-- Name: tipos_cantidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_cantidad (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.tipos_cantidad OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 32969)
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
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipos_cantidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_cantidad_id_seq OWNED BY public.tipos_cantidad.id;


--
-- TOC entry 214 (class 1259 OID 41114)
-- Name: tipos_impuesto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_impuesto (
    id integer NOT NULL,
    nombre character varying(30),
    cobra_iva boolean
);


ALTER TABLE public.tipos_impuesto OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 41112)
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
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 213
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
-- TOC entry 3254 (class 0 OID 0)
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
-- TOC entry 3255 (class 0 OID 0)
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
-- TOC entry 3256 (class 0 OID 0)
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
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 206
-- Name: usuarios_id_tipo_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_tipo_usuario_seq OWNED BY public.usuarios.id_tipo_usuario;


--
-- TOC entry 244 (class 1259 OID 57536)
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    id integer NOT NULL,
    id_orden integer,
    fecha_registro date DEFAULT CURRENT_DATE,
    anulado boolean
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 57513)
-- Name: ventas_anuladas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas_anuladas (
    id integer NOT NULL,
    id_venta integer,
    comentario character varying(200),
    fecha_registro date DEFAULT CURRENT_DATE
);


ALTER TABLE public.ventas_anuladas OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 57511)
-- Name: ventas_anuladas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_anuladas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ventas_anuladas_id_seq OWNER TO postgres;

--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 239
-- Name: ventas_anuladas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_anuladas_id_seq OWNED BY public.ventas_anuladas.id;


--
-- TOC entry 229 (class 1259 OID 49337)
-- Name: ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ventas_id_seq OWNER TO postgres;

--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 229
-- Name: ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_id_seq OWNED BY public.ordenes.id;


--
-- TOC entry 243 (class 1259 OID 57534)
-- Name: ventas_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ventas_id_seq1 OWNER TO postgres;

--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 243
-- Name: ventas_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_id_seq1 OWNED BY public.ventas.id;


--
-- TOC entry 2971 (class 2604 OID 49301)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 2985 (class 2604 OID 57530)
-- Name: compras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras ALTER COLUMN id SET DEFAULT nextval('public.compras_id_seq'::regclass);


--
-- TOC entry 2979 (class 2604 OID 49373)
-- Name: condiciones_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condiciones_pago ALTER COLUMN id SET DEFAULT nextval('public.condiciones_pago_id_seq'::regclass);


--
-- TOC entry 2967 (class 2604 OID 41153)
-- Name: config_descuentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config_descuentos ALTER COLUMN id SET DEFAULT nextval('public.config_descuentos_id_seq'::regclass);


--
-- TOC entry 2968 (class 2604 OID 41171)
-- Name: configuracion_paquetes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_paquetes ALTER COLUMN id SET DEFAULT nextval('public.configuracion_paquetes_id_seq'::regclass);


--
-- TOC entry 2980 (class 2604 OID 49391)
-- Name: detalle_ordenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_ordenes ALTER COLUMN id SET DEFAULT nextval('public.detalle_ventas_id_seq'::regclass);


--
-- TOC entry 2989 (class 2604 OID 57570)
-- Name: estados_compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_compra ALTER COLUMN id SET DEFAULT nextval('public.estados_compra_id_seq'::regclass);


--
-- TOC entry 2973 (class 2604 OID 49310)
-- Name: historial_devoluciones_salidas_productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_devoluciones_salidas_productos ALTER COLUMN id SET DEFAULT nextval('public.historial_devoluciones_salidas_productos_id_seq'::regclass);


--
-- TOC entry 2965 (class 2604 OID 41140)
-- Name: lineas_producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineas_producto ALTER COLUMN id SET DEFAULT nextval('public.lineas_producto_id_seq'::regclass);


--
-- TOC entry 2978 (class 2604 OID 49360)
-- Name: metodos_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodos_pago ALTER COLUMN id SET DEFAULT nextval('public.metodos_pago_id_seq'::regclass);


--
-- TOC entry 2976 (class 2604 OID 49342)
-- Name: ordenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes ALTER COLUMN id SET DEFAULT nextval('public.ventas_id_seq'::regclass);


--
-- TOC entry 2969 (class 2604 OID 41221)
-- Name: paquetes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes ALTER COLUMN id SET DEFAULT nextval('public.paquetes_id_seq'::regclass);


--
-- TOC entry 2961 (class 2604 OID 32965)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 2960 (class 2604 OID 32955)
-- Name: proveedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id SET DEFAULT nextval('public.proveedores_id_seq'::regclass);


--
-- TOC entry 2975 (class 2604 OID 49329)
-- Name: tipo_operacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_operacion ALTER COLUMN id SET DEFAULT nextval('public.tipo_operacion_id_seq'::regclass);


--
-- TOC entry 2982 (class 2604 OID 57493)
-- Name: tipo_venta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_venta ALTER COLUMN id SET DEFAULT nextval('public.tipo_venta_id_seq'::regclass);


--
-- TOC entry 2963 (class 2604 OID 32974)
-- Name: tipos_cantidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_cantidad ALTER COLUMN id SET DEFAULT nextval('public.tipos_cantidad_id_seq'::regclass);


--
-- TOC entry 2964 (class 2604 OID 41117)
-- Name: tipos_impuesto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_impuesto ALTER COLUMN id SET DEFAULT nextval('public.tipos_impuesto_id_seq'::regclass);


--
-- TOC entry 2957 (class 2604 OID 33042)
-- Name: tipos_usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_usuarios ALTER COLUMN id SET DEFAULT nextval('public.tipos_usuarios_id_seq'::regclass);


--
-- TOC entry 2958 (class 2604 OID 32925)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 2987 (class 2604 OID 57539)
-- Name: ventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas ALTER COLUMN id SET DEFAULT nextval('public.ventas_id_seq1'::regclass);


--
-- TOC entry 2983 (class 2604 OID 57516)
-- Name: ventas_anuladas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_anuladas ALTER COLUMN id SET DEFAULT nextval('public.ventas_anuladas_id_seq'::regclass);


--
-- TOC entry 3208 (class 0 OID 49298)
-- Dependencies: 224
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes VALUES (1, 'Camilo', 'Beltrán', '102635', '300456', 'Bogotá', 'Calle 67', 1, '2022-07-03');
INSERT INTO public.clientes VALUES (2, 'Andrés', 'Sarta', '1009293', '313840', 'Bogotá', 'Calle 76', 1, '2022-07-03');


--
-- TOC entry 3226 (class 0 OID 57527)
-- Dependencies: 242
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3218 (class 0 OID 49370)
-- Dependencies: 234
-- Data for Name: condiciones_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.condiciones_pago VALUES (1, 'Contado');
INSERT INTO public.condiciones_pago VALUES (2, 'Crédito');


--
-- TOC entry 3202 (class 0 OID 41150)
-- Dependencies: 218
-- Data for Name: config_descuentos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3204 (class 0 OID 41168)
-- Dependencies: 220
-- Data for Name: configuracion_paquetes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.configuracion_paquetes VALUES (9, 1, 2, 4);
INSERT INTO public.configuracion_paquetes VALUES (12, 1, 2, 5);
INSERT INTO public.configuracion_paquetes VALUES (13, 2, 3, 8);


--
-- TOC entry 3220 (class 0 OID 49388)
-- Dependencies: 236
-- Data for Name: detalle_ordenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.detalle_ordenes VALUES (1, 4, 8, 5, '2022-07-03', 50000.00);
INSERT INTO public.detalle_ordenes VALUES (2, 4, 6, 5, '2022-07-03', 50000.00);


--
-- TOC entry 3230 (class 0 OID 57567)
-- Dependencies: 246
-- Data for Name: estados_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estados_compra VALUES (1, 'Pendiente');


--
-- TOC entry 3210 (class 0 OID 49307)
-- Dependencies: 226
-- Data for Name: historial_devoluciones_salidas_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historial_devoluciones_salidas_productos VALUES (1, 2, 5, 1, '2022-07-03', NULL);
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (2, 2, 5, 1, '2022-07-03', NULL);
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (4, NULL, NULL, NULL, '2022-07-03', NULL);
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (5, NULL, NULL, NULL, '2022-07-03', NULL);
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (6, 2, -1, 2, '2022-07-03', NULL);
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (7, 2, -1, 2, '2022-07-03', NULL);
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (8, 2, 1, 2, '2022-07-03', NULL);
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (9, 2, 1, 2, '2022-07-03', '');
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (10, 2, 1, 2, '2022-07-03', '');
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (11, 2, 1, 2, '2022-07-03', '');
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (12, 2, 1, 2, '2022-07-03', '');
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (13, 2, 1, 2, '2022-07-03', '');
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (14, 2, 1, 2, '2022-07-03', '');
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (15, 2, 1, 2, '2022-07-03', '');
INSERT INTO public.historial_devoluciones_salidas_productos VALUES (16, 2, 1, 2, '2022-07-03', '');


--
-- TOC entry 3200 (class 0 OID 41137)
-- Dependencies: 216
-- Data for Name: lineas_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lineas_producto VALUES (1, 'Mantequilla', '2022-07-02');
INSERT INTO public.lineas_producto VALUES (3, 'Kumis', '2022-07-02');
INSERT INTO public.lineas_producto VALUES (2, 'Avena', '2022-07-02');


--
-- TOC entry 3216 (class 0 OID 49357)
-- Dependencies: 232
-- Data for Name: metodos_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.metodos_pago VALUES (1, 'Efectivo');
INSERT INTO public.metodos_pago VALUES (2, 'Tarjeta Débito');
INSERT INTO public.metodos_pago VALUES (3, 'Tarjeta Crédito');
INSERT INTO public.metodos_pago VALUES (4, 'Bancos');
INSERT INTO public.metodos_pago VALUES (5, 'Otros');


--
-- TOC entry 3214 (class 0 OID 49339)
-- Dependencies: 230
-- Data for Name: ordenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ordenes VALUES (4, 37, 115, 1, 1, 1, 1, '2022-07-03');
INSERT INTO public.ordenes VALUES (5, 37, 115, 1, 1, 1, 1, '2022-07-03');


--
-- TOC entry 3206 (class 0 OID 41218)
-- Dependencies: 222
-- Data for Name: paquetes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.paquetes VALUES (2, 2, '2022-07-02');
INSERT INTO public.paquetes VALUES (3, 6, '2022-07-02');


--
-- TOC entry 3194 (class 0 OID 32962)
-- Dependencies: 210
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos VALUES (8, 'Queso 2', 90, 80000.00, 1, 0.00, NULL, 1, 'producto prueba', 1, NULL, '159753', 10, 1, '2022-07-02', NULL, 2);
INSERT INTO public.productos VALUES (6, 'Prodcuto 2', 76, 51500.00, 1, 0.00, NULL, 1, 'producto prueba', 1, NULL, '123456', 10, 1, '2022-07-02', NULL, 2);
INSERT INTO public.productos VALUES (5, 'Prodcuto 3', 8, 51500.00, 1, 0.00, NULL, 1, 'producto prueba', 1, NULL, '321654', 10, 1, '2022-07-02', NULL, 1);
INSERT INTO public.productos VALUES (4, 'Prodcuto 4', 50, 51500.00, 1, 0.00, NULL, 1, 'producto prueba', 1, NULL, '987321', 10, 1, '2022-07-02', NULL, 1);
INSERT INTO public.productos VALUES (2, 'Prodcuto 5', 19, 51500.00, 1, 0.00, NULL, 1, 'producto prueba', 1, NULL, '963578', 10, 1, '2022-07-02', NULL, NULL);


--
-- TOC entry 3192 (class 0 OID 32952)
-- Dependencies: 208
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.proveedores VALUES (1, 'proveedor 1', 'proveedor 1', '80045687', '3007987675', '2121212', 'calle 5', 'abc@gmail.com', '3007987675', NULL, NULL);


--
-- TOC entry 3212 (class 0 OID 49326)
-- Dependencies: 228
-- Data for Name: tipo_operacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_operacion VALUES (1, 'Salida', '-');
INSERT INTO public.tipo_operacion VALUES (2, 'Devolucion', '+');


--
-- TOC entry 3222 (class 0 OID 57490)
-- Dependencies: 238
-- Data for Name: tipo_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_venta VALUES (1, 'Salida');
INSERT INTO public.tipo_venta VALUES (2, 'Remisión');


--
-- TOC entry 3196 (class 0 OID 32971)
-- Dependencies: 212
-- Data for Name: tipos_cantidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipos_cantidad VALUES (1, 'Kg');
INSERT INTO public.tipos_cantidad VALUES (2, 'Unidad');


--
-- TOC entry 3198 (class 0 OID 41114)
-- Dependencies: 214
-- Data for Name: tipos_impuesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipos_impuesto VALUES (1, 'Excluido', false);
INSERT INTO public.tipos_impuesto VALUES (2, 'Exento', false);
INSERT INTO public.tipos_impuesto VALUES (3, 'Sin Impuesto', false);
INSERT INTO public.tipos_impuesto VALUES (4, 'Impoconsumo', true);
INSERT INTO public.tipos_impuesto VALUES (5, 'IVA', true);


--
-- TOC entry 3187 (class 0 OID 32914)
-- Dependencies: 203
-- Data for Name: tipos_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipos_usuarios VALUES (1, 'Vendedor');


--
-- TOC entry 3189 (class 0 OID 32922)
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
-- TOC entry 3228 (class 0 OID 57536)
-- Dependencies: 244
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ventas VALUES (2, 4, '2022-07-03', false);
INSERT INTO public.ventas VALUES (4, 5, '2022-07-03', false);


--
-- TOC entry 3224 (class 0 OID 57513)
-- Dependencies: 240
-- Data for Name: ventas_anuladas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 223
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 2, true);


--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 241
-- Name: compras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compras_id_seq', 1, false);


--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 233
-- Name: condiciones_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.condiciones_pago_id_seq', 2, true);


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 217
-- Name: config_descuentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.config_descuentos_id_seq', 1, false);


--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 219
-- Name: configuracion_paquetes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configuracion_paquetes_id_seq', 13, true);


--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 235
-- Name: detalle_ventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_ventas_id_seq', 2, true);


--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 245
-- Name: estados_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_compra_id_seq', 1, true);


--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 225
-- Name: historial_devoluciones_salidas_productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historial_devoluciones_salidas_productos_id_seq', 16, true);


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 215
-- Name: lineas_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lineas_producto_id_seq', 3, true);


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 231
-- Name: metodos_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metodos_pago_id_seq', 5, true);


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 221
-- Name: paquetes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paquetes_id_seq', 3, true);


--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 209
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 8, true);


--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 207
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 1, false);


--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 227
-- Name: tipo_operacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_operacion_id_seq', 2, true);


--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipo_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_venta_id_seq', 2, true);


--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipos_cantidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_cantidad_id_seq', 1, false);


--
-- TOC entry 3277 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipos_impuesto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_impuesto_id_seq', 1, false);


--
-- TOC entry 3278 (class 0 OID 0)
-- Dependencies: 202
-- Name: tipos_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_usuarios_id_seq', 4, true);


--
-- TOC entry 3279 (class 0 OID 0)
-- Dependencies: 204
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 57, true);


--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 206
-- Name: usuarios_id_tipo_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_tipo_usuario_seq', 5, true);


--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 239
-- Name: ventas_anuladas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_anuladas_id_seq', 1, false);


--
-- TOC entry 3282 (class 0 OID 0)
-- Dependencies: 229
-- Name: ventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_id_seq', 5, true);


--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 243
-- Name: ventas_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_id_seq1', 4, true);


--
-- TOC entry 3011 (class 2606 OID 49304)
-- Name: clientes pk_clientes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT pk_clientes PRIMARY KEY (id);


--
-- TOC entry 3031 (class 2606 OID 57533)
-- Name: compras pk_compras; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT pk_compras PRIMARY KEY (id);


--
-- TOC entry 3021 (class 2606 OID 49375)
-- Name: condiciones_pago pk_condiciones_pago; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condiciones_pago
    ADD CONSTRAINT pk_condiciones_pago PRIMARY KEY (id);


--
-- TOC entry 3005 (class 2606 OID 41155)
-- Name: config_descuentos pk_config_descuentos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config_descuentos
    ADD CONSTRAINT pk_config_descuentos PRIMARY KEY (id);


--
-- TOC entry 3007 (class 2606 OID 41173)
-- Name: configuracion_paquetes pk_configuracion_paquetes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_paquetes
    ADD CONSTRAINT pk_configuracion_paquetes PRIMARY KEY (id);


--
-- TOC entry 3023 (class 2606 OID 49394)
-- Name: detalle_ordenes pk_detalle_ventas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_ordenes
    ADD CONSTRAINT pk_detalle_ventas PRIMARY KEY (id);


--
-- TOC entry 3035 (class 2606 OID 57572)
-- Name: estados_compra pk_estados_compra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_compra
    ADD CONSTRAINT pk_estados_compra PRIMARY KEY (id);


--
-- TOC entry 3013 (class 2606 OID 49313)
-- Name: historial_devoluciones_salidas_productos pk_historial_devoluciones_salidas_productos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_devoluciones_salidas_productos
    ADD CONSTRAINT pk_historial_devoluciones_salidas_productos PRIMARY KEY (id);


--
-- TOC entry 3003 (class 2606 OID 41142)
-- Name: lineas_producto pk_lineas_producto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lineas_producto
    ADD CONSTRAINT pk_lineas_producto PRIMARY KEY (id);


--
-- TOC entry 3019 (class 2606 OID 49362)
-- Name: metodos_pago pk_metodos_pago; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodos_pago
    ADD CONSTRAINT pk_metodos_pago PRIMARY KEY (id);


--
-- TOC entry 3009 (class 2606 OID 41224)
-- Name: paquetes pk_paquetes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT pk_paquetes PRIMARY KEY (id);


--
-- TOC entry 2997 (class 2606 OID 32968)
-- Name: productos pk_productos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT pk_productos PRIMARY KEY (id);


--
-- TOC entry 2995 (class 2606 OID 32957)
-- Name: proveedores pk_proveedores; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT pk_proveedores PRIMARY KEY (id);


--
-- TOC entry 3015 (class 2606 OID 49331)
-- Name: tipo_operacion pk_tipo_operacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_operacion
    ADD CONSTRAINT pk_tipo_operacion PRIMARY KEY (id);


--
-- TOC entry 3025 (class 2606 OID 57495)
-- Name: tipo_venta pk_tipo_venta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_venta
    ADD CONSTRAINT pk_tipo_venta PRIMARY KEY (id);


--
-- TOC entry 3001 (class 2606 OID 41119)
-- Name: tipos_impuesto pk_tipos_c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_impuesto
    ADD CONSTRAINT pk_tipos_c PRIMARY KEY (id);


--
-- TOC entry 2999 (class 2606 OID 32976)
-- Name: tipos_cantidad pk_tipos_cantidad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_cantidad
    ADD CONSTRAINT pk_tipos_cantidad PRIMARY KEY (id);


--
-- TOC entry 2991 (class 2606 OID 33044)
-- Name: tipos_usuarios pk_tipos_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_usuarios
    ADD CONSTRAINT pk_tipos_usuarios PRIMARY KEY (id);


--
-- TOC entry 2993 (class 2606 OID 32927)
-- Name: usuarios pk_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);


--
-- TOC entry 3017 (class 2606 OID 49344)
-- Name: ordenes pk_ventas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT pk_ventas PRIMARY KEY (id);


--
-- TOC entry 3033 (class 2606 OID 57542)
-- Name: ventas pk_ventas_0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT pk_ventas_0 PRIMARY KEY (id);


--
-- TOC entry 3027 (class 2606 OID 57518)
-- Name: ventas_anuladas pk_ventas_anuladas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_anuladas
    ADD CONSTRAINT pk_ventas_anuladas PRIMARY KEY (id);


--
-- TOC entry 3029 (class 2606 OID 57554)
-- Name: ventas_anuladas unq_ventas_anuladas_id_venta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_anuladas
    ADD CONSTRAINT unq_ventas_anuladas_id_venta UNIQUE (id_venta);


--
-- TOC entry 3057 (class 2606 OID 57573)
-- Name: compras fk_compras_estados_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT fk_compras_estados_compra FOREIGN KEY (id_estado_compra) REFERENCES public.estados_compra(id);


--
-- TOC entry 3056 (class 2606 OID 57543)
-- Name: compras fk_compras_ordenes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT fk_compras_ordenes FOREIGN KEY (id_orden) REFERENCES public.ordenes(id);


--
-- TOC entry 3058 (class 2606 OID 57578)
-- Name: compras fk_compras_proveedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT fk_compras_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id);


--
-- TOC entry 3042 (class 2606 OID 41156)
-- Name: config_descuentos fk_config_descuentos_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config_descuentos
    ADD CONSTRAINT fk_config_descuentos_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id);


--
-- TOC entry 3044 (class 2606 OID 41242)
-- Name: configuracion_paquetes fk_configuracion_paquetes_paquetes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_paquetes
    ADD CONSTRAINT fk_configuracion_paquetes_paquetes FOREIGN KEY (id_paquete) REFERENCES public.paquetes(id);


--
-- TOC entry 3043 (class 2606 OID 41237)
-- Name: configuracion_paquetes fk_configuracion_paquetes_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_paquetes
    ADD CONSTRAINT fk_configuracion_paquetes_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id);


--
-- TOC entry 3054 (class 2606 OID 49400)
-- Name: detalle_ordenes fk_detalle_ventas_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_ordenes
    ADD CONSTRAINT fk_detalle_ventas_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id);


--
-- TOC entry 3053 (class 2606 OID 49395)
-- Name: detalle_ordenes fk_detalle_ventas_ventas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_ordenes
    ADD CONSTRAINT fk_detalle_ventas_ventas FOREIGN KEY (id_venta) REFERENCES public.ordenes(id);


--
-- TOC entry 3046 (class 2606 OID 49319)
-- Name: historial_devoluciones_salidas_productos fk_historial_devoluciones_salidas_productos_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_devoluciones_salidas_productos
    ADD CONSTRAINT fk_historial_devoluciones_salidas_productos_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id);


--
-- TOC entry 3047 (class 2606 OID 49332)
-- Name: historial_devoluciones_salidas_productos fk_historial_devoluciones_salidas_productos_tipo_operacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_devoluciones_salidas_productos
    ADD CONSTRAINT fk_historial_devoluciones_salidas_productos_tipo_operacion FOREIGN KEY (id_tipo_operacion) REFERENCES public.tipo_operacion(id);


--
-- TOC entry 3045 (class 2606 OID 41225)
-- Name: paquetes fk_paquetes_productos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paquetes
    ADD CONSTRAINT fk_paquetes_productos FOREIGN KEY (id_producto) REFERENCES public.productos(id);


--
-- TOC entry 3039 (class 2606 OID 41143)
-- Name: productos fk_productos_lineas_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_lineas_producto FOREIGN KEY (id_linea) REFERENCES public.lineas_producto(id);


--
-- TOC entry 3038 (class 2606 OID 41130)
-- Name: productos fk_productos_proveedores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_proveedores FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id);


--
-- TOC entry 3041 (class 2606 OID 41211)
-- Name: productos fk_productos_tipos_cantidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_tipos_cantidad FOREIGN KEY (id_tipo_cantidad) REFERENCES public.tipos_cantidad(id);


--
-- TOC entry 3037 (class 2606 OID 41120)
-- Name: productos fk_productos_tipos_impuesto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_tipos_impuesto FOREIGN KEY (id_tipo_impuesto) REFERENCES public.tipos_impuesto(id);


--
-- TOC entry 3040 (class 2606 OID 41188)
-- Name: productos fk_productos_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_productos_usuarios FOREIGN KEY (id_usuario_registro) REFERENCES public.usuarios(id);


--
-- TOC entry 3036 (class 2606 OID 33066)
-- Name: usuarios fk_usuarios_tipos_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuarios_tipos_usuarios FOREIGN KEY (id_tipo_usuario) REFERENCES public.tipos_usuarios(id);


--
-- TOC entry 3055 (class 2606 OID 57560)
-- Name: ventas_anuladas fk_ventas_anuladas_ventas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_anuladas
    ADD CONSTRAINT fk_ventas_anuladas_ventas FOREIGN KEY (id_venta) REFERENCES public.ventas(id);


--
-- TOC entry 3048 (class 2606 OID 49345)
-- Name: ordenes fk_ventas_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_ventas_clientes FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


--
-- TOC entry 3051 (class 2606 OID 49376)
-- Name: ordenes fk_ventas_condiciones_pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_ventas_condiciones_pago FOREIGN KEY (id_condicion_pago) REFERENCES public.condiciones_pago(id);


--
-- TOC entry 3050 (class 2606 OID 49363)
-- Name: ordenes fk_ventas_metodos_pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_ventas_metodos_pago FOREIGN KEY (id_metodo_pago) REFERENCES public.metodos_pago(id);


--
-- TOC entry 3059 (class 2606 OID 57548)
-- Name: ventas fk_ventas_ordenes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_ventas_ordenes FOREIGN KEY (id_orden) REFERENCES public.ordenes(id);


--
-- TOC entry 3052 (class 2606 OID 57505)
-- Name: ordenes fk_ventas_tipo_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_ventas_tipo_venta FOREIGN KEY (id_tipo_venta) REFERENCES public.tipo_venta(id);


--
-- TOC entry 3049 (class 2606 OID 49350)
-- Name: ordenes fk_ventas_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes
    ADD CONSTRAINT fk_ventas_usuarios FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id);


-- Completed on 2022-07-03 19:24:59

--
-- PostgreSQL database dump complete
--


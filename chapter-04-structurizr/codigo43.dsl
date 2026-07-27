1	@startuml
2	title PEBE – Módulo de Postulaciones (Diagrama de Clases)

3	skinparam classAttributeIconSize 0
4	hide circle
5	hide stereotypes

6	package "Dominio PEBE :: Postulaciones" {

7	'=================== Entidades ===================
8	class Egresado {
9	+id: UUID
10	+nombre: String
11	+email: String
12	+telefono: String
13	--
14	+actualizarContacto(email: String, tel: String)
15	}

16	class "OfertaTrabajo" {
17	+id: UUID
18	+titulo: String
19	+descripcion: String
20	+estado: EstadoOferta
21	+fechaPublicacion: LocalDate
22	+fechaCierre: LocalDate
23	--
24	+abrir()
25	+cerrar()
26	+estaVigente(): boolean
27	}

28	class "AplicaciónOferta" as AplicacionOferta {
29	+id: UUID
30	+fechaPostulacion: Instant
31	+estado: EstadoAplicacion
32	+cvUrl: String
33	--
34	+cancelar()
35	+marcarEnRevision()
36	+aceptar()
37	+rechazar(motivo: String)
38	}

39	enum EstadoOferta {
40	BORRADOR
41	ABIERTA
42	CERRADA
43	}

44	enum EstadoAplicacion {
45	ENVIADA
46	EN_REVISION
47	ACEPTADA
48	RECHAZADA
49	CANCELADA
50	}

'=================== Servicios ===================
51	class "ServicioAplicación" as ServicioAplicacion {
52	+aplicar(egresadoId: UUID, ofertaId: UUID, cvUrl: String): UUID
53	+cancelar(aplicacionId: UUID)
54	+revisar(aplicacionId: UUID)
55	+decidir(aplicacionId: UUID, aprobada: boolean, motivo: String="")
56	}

57	interface EgresadoRepositorio {
58	+findById(id: UUID): Egresado
59	+save(e: Egresado)
60	}

61	interface OfertaTrabajoRepositorio {
62	+findById(id: UUID): OfertaTrabajo
63	+save(o: OfertaTrabajo)
64	}

65	interface AplicacionRepositorio {
66	+findById(id: UUID): AplicacionOferta
67	+findByEgresado(egresadoId: UUID): List<AplicacionOferta>
68	+save(a: AplicacionOferta)
69	}

70	interface ServicioNotificaciones {
71	+enviar(to: String, asunto: String, cuerpo: String)
72	}

73	interface AdaptadorIdentidad {
74	+autenticado(token: String): boolean
75	+obtenerEmail(egresadoId: UUID): String
76	}

'=================== Relaciones ===================
77	Egresado "1" o-- "*" AplicacionOferta : realiza >
78	OfertaTrabajo "1" o-- "*" AplicacionOferta : < publicada en

79	ServicioAplicacion --> EgresadoRepositorio
80	ServicioAplicacion --> OfertaTrabajoRepositorio
81	ServicioAplicacion --> AplicacionRepositorio
82	ServicioAplicacion --> ServicioNotificaciones : notifica cambios
83	ServicioAplicacion --> AdaptadorIdentidad : valida identidad

84	AplicacionRepositorio ..> AplicacionOferta
85	OfertaTrabajoRepositorio ..> OfertaTrabajo
86	EgresadoRepositorio ..> Egresado
87	}

88	@enduml

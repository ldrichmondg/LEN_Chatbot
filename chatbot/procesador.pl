:- encoding(utf8).

% =========================================================
% Procesamiento de entradas e intenciones
% =========================================================

% Procesa palabras normalizadas y devuelve una respuesta.
procesar_entrada(Palabras, Respuesta) :-
    detectar_intencion(Palabras, Intencion),
    responder_intencion(Intencion, Respuesta).

% Detecta la intencion del usuario segun las palabras ingresadas.
detectar_intencion(Palabras, salida) :-
    es_salida(Palabras), !.
detectar_intencion(Palabras, ayuda) :-
    es_ayuda(Palabras), !.
detectar_intencion(Palabras, aprendizaje_sinonimo(Sinonimo, Concepto)) :-
    es_aprendizaje_sinonimo(Palabras, Sinonimo, Concepto), !.
detectar_intencion(Palabras, aprendizaje_concepto(Tema, Definicion)) :-
    es_aprendizaje_concepto(Palabras, Tema, Definicion), !.
detectar_intencion(Palabras, definicion(Tema)) :-
    es_pregunta_definicion(Palabras, Tema), !.
detectar_intencion(Palabras, relacion(Relacion)) :-
    es_consulta_relacion(Palabras, Relacion), !.
detectar_intencion(Palabras, concepto(Tema)) :-
    es_consulta_directa(Palabras, Tema), !.
detectar_intencion(Palabras, desconocido(Tema)) :-
    unir_palabras(Palabras, Tema).

% =========================================================
% Frases para cerrar el chatbot.
% =========================================================

es_salida([salir]).
es_salida([adios]).
es_salida([hasta, luego]).
es_salida([terminar]).
es_salida([fin]).
es_salida([chao]).
es_salida([bye]).
es_salida([cerrar]).
es_salida([exit]).

% =========================================================
% Solicitud de ayuda.
% =========================================================

es_ayuda([ayuda]).
es_ayuda([help]).
es_ayuda([comandos]).
es_ayuda([que, puedo, preguntar]).
es_ayuda([como, te, uso]).
es_ayuda([como, funciona]).

% =========================================================
% Preguntas de definición y conceptuales.
% =========================================================

es_pregunta_definicion([que, es | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([define | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([defina | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([explique | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([explica | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([describe | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([describir | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([definicion, de | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([para, que, sirve | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([para, que, es | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([que, sabes, de | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([que, sabes, sobre | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([quien, es | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([conoces, a | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([conoce, a | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([sabes, que, es | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([me, explica | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([me, explicas | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([cuales, son | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([cuantos | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([cuantas | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([como, funciona | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([como, se, usa | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([como, se, utiliza | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([como, es | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([donde, se, usa | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([donde, se, aplica | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([cuando, se, usa | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([cuando, se, utiliza | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([cuentame, sobre | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([cuentame, de | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([habla, de | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([informacion, sobre | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([dime, sobre | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_pregunta_definicion([que, tiene | TemaPalabras], Tema) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).

% =========================================================
% Aprendizaje de conceptos y definiciones.
% =========================================================

es_aprendizaje_concepto([aprender, que | Resto], Tema, Definicion) :-
    separar_aprendizaje_es(Resto, Tema, Definicion).
es_aprendizaje_concepto([aprende, que | Resto], Tema, Definicion) :-
    separar_aprendizaje_es(Resto, Tema, Definicion).
es_aprendizaje_concepto([ensenar, que | Resto], Tema, Definicion) :-
    separar_aprendizaje_es(Resto, Tema, Definicion).
es_aprendizaje_concepto([ensena, que | Resto], Tema, Definicion) :-
    separar_aprendizaje_es(Resto, Tema, Definicion).
es_aprendizaje_concepto([aprender, definicion, de, Tema | DefinicionPalabras], Tema, Definicion) :-
    DefinicionPalabras \= [],
    unir_texto(DefinicionPalabras, Definicion).

separar_aprendizaje_es(Palabras, Tema, Definicion) :-
    append(TemaPalabras, [es | DefinicionPalabras], Palabras),
    TemaPalabras \= [],
    DefinicionPalabras \= [],
    quitar_articulo(TemaPalabras, TemaSinArticulo),
    TemaSinArticulo \= [],
    unir_palabras(TemaSinArticulo, Tema),
    unir_texto(DefinicionPalabras, Definicion).

quitar_articulo([un | Resto], Resto) :- Resto \= [], !.
quitar_articulo([una | Resto], Resto) :- Resto \= [], !.
quitar_articulo([el | Resto], Resto) :- Resto \= [], !.
quitar_articulo([la | Resto], Resto) :- Resto \= [], !.
quitar_articulo(Palabras, Palabras).

% =========================================================
% Aprendizaje de sinónimos.
% =========================================================

es_aprendizaje_sinonimo([aprender, sinonimo, Sinonimo | ConceptoPalabras], Sinonimo, Concepto) :-
    ConceptoPalabras \= [],
    unir_palabras(ConceptoPalabras, Concepto).
es_aprendizaje_sinonimo([aprende, sinonimo, Sinonimo | ConceptoPalabras], Sinonimo, Concepto) :-
    ConceptoPalabras \= [],
    unir_palabras(ConceptoPalabras, Concepto).
es_aprendizaje_sinonimo([aprender, que, Sinonimo, significa | ConceptoPalabras], Sinonimo, Concepto) :-
    ConceptoPalabras \= [],
    unir_palabras(ConceptoPalabras, Concepto).
es_aprendizaje_sinonimo([aprende, que, Sinonimo, significa | ConceptoPalabras], Sinonimo, Concepto) :-
    ConceptoPalabras \= [],
    unir_palabras(ConceptoPalabras, Concepto).
% Patron: "IA significa inteligencia artificial"
es_aprendizaje_sinonimo([Sinonimo, significa | ConceptoPalabras], Sinonimo, Concepto) :-
    ConceptoPalabras \= [],
    \+ es_comando_reservado(Sinonimo),
    unir_palabras(ConceptoPalabras, Concepto).
% Patron: "X es lo mismo que Y"
es_aprendizaje_sinonimo(Palabras, Sinonimo, Concepto) :-
    append(SinonimoPalabras, [es, lo, mismo, que | ConceptoPalabras], Palabras),
    SinonimoPalabras \= [],
    ConceptoPalabras \= [],
    unir_palabras(SinonimoPalabras, Sinonimo),
    unir_palabras(ConceptoPalabras, Concepto).
% Patron: "X es sinonimo de Y" (con el prefijo aprender que)
es_aprendizaje_sinonimo([aprender, que | Resto], Sinonimo, Concepto) :-
    separar_sinonimo(Resto, Sinonimo, Concepto).
es_aprendizaje_sinonimo([aprende, que | Resto], Sinonimo, Concepto) :-
    separar_sinonimo(Resto, Sinonimo, Concepto).

separar_sinonimo(Palabras, Sinonimo, Concepto) :-
    append(SinonimoPalabras, [es, sinonimo, de | ConceptoPalabras], Palabras),
    SinonimoPalabras \= [],
    ConceptoPalabras \= [],
    unir_palabras(SinonimoPalabras, Sinonimo),
    unir_palabras(ConceptoPalabras, Concepto).

% Palabras reservadas que no pueden ser sinonimos.
es_comando_reservado(salir).
es_comando_reservado(adios).
es_comando_reservado(ayuda).
es_comando_reservado(omitir).
es_comando_reservado(si).
es_comando_reservado(no).

% =========================================================
% Consultas de relaciones académicas.
% =========================================================

es_consulta_relacion([requisitos, de | TemaPalabras], requisitos(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([que, requisitos, tiene | TemaPalabras], requisitos(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([cuales, son, los, requisitos, de | TemaPalabras], requisitos(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([correquisitos, de | TemaPalabras], correquisitos(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([que, correquisitos, tiene | TemaPalabras], correquisitos(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([cuales, son, los, correquisitos, de | TemaPalabras], correquisitos(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([relaciones, de | TemaPalabras], relaciones(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([consultar | TemaPalabras], relaciones(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([que, necesita | TemaPalabras], requisitos(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([que, ocupa | TemaPalabras], requisitos(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([es, requisito | Resto], requisito_de(Requisito, Curso)) :-
    separar_relacion_de(Resto, Requisito, Curso).
es_consulta_relacion([es, correquisito | Resto], correquisito_de(Correquisito, Curso)) :-
    separar_relacion_de(Resto, Correquisito, Curso).
es_consulta_relacion([de, que, es, requisito | TemaPalabras], cursos_que_requieren(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([que, cursos, dependen, de | TemaPalabras], cursos_dependen_de(Tema)) :-
    TemaPalabras \= [], unir_palabras(TemaPalabras, Tema).
es_consulta_relacion([cursos, sin, requisitos], cursos_sin_requisitos).
es_consulta_relacion([cursos, sin, correquisitos], cursos_sin_correquisitos).
es_consulta_relacion([puedo, matricular | Resto], puede_matricular(Curso, Aprobados)) :-
    separar_matricula(Resto, Curso, Aprobados).
es_consulta_relacion([puede, matricular | Resto], puede_matricular(Curso, Aprobados)) :-
    separar_matricula(Resto, Curso, Aprobados).

separar_relacion_de(Palabras, Elemento, Curso) :-
    append(ElementoPalabras, [de | CursoPalabras], Palabras),
    ElementoPalabras \= [],
    CursoPalabras \= [],
    unir_palabras(ElementoPalabras, Elemento),
    unir_palabras(CursoPalabras, Curso).

separar_matricula(Palabras, Curso, Aprobados) :-
    append(CursoPalabras, [si, aprobe | AprobadosPalabras], Palabras),
    CursoPalabras \= [],
    palabras_a_lista_cursos(AprobadosPalabras, Aprobados),
    unir_palabras(CursoPalabras, Curso).
separar_matricula(Palabras, Curso, []) :-
    unir_palabras(Palabras, Curso).

palabras_a_lista_cursos([], []).
palabras_a_lista_cursos(Palabras, Cursos) :-
    separar_por_conectores(Palabras, Partes),
    maplist(unir_palabras, Partes, Cursos).

separar_por_conectores(Palabras, Partes) :-
    separar_por_conectores(Palabras, [], [], Partes).

separar_por_conectores([], Actual, Acumulado, Partes) :-
    reverse(Actual, Parte),
    agregar_parte(Parte, Acumulado, PartesInvertidas),
    reverse(PartesInvertidas, Partes).
separar_por_conectores([Palabra | Resto], Actual, Acumulado, Partes) :-
    conector_lista(Palabra), !,
    reverse(Actual, Parte),
    agregar_parte(Parte, Acumulado, NuevoAcumulado),
    separar_por_conectores(Resto, [], NuevoAcumulado, Partes).
separar_por_conectores([Palabra | Resto], Actual, Acumulado, Partes) :-
    separar_por_conectores(Resto, [Palabra | Actual], Acumulado, Partes).

agregar_parte([], Acumulado, Acumulado) :- !.
agregar_parte(Parte, Acumulado, [Parte | Acumulado]).

conector_lista(y).
conector_lista(e).
conector_lista(con).

% =========================================================
% Consulta directa por nombre de tema.
% =========================================================

es_consulta_directa(Palabras, Tema) :-
    Palabras \= [],
    unir_palabras(Palabras, Tema).

% =========================================================
% Ejecuta la intencion detectada y produce una respuesta.
% =========================================================

responder_intencion(salida, 'Hasta luego.') :- !.
responder_intencion(ayuda, mostrar_ayuda) :- !.
responder_intencion(aprendizaje_sinonimo(Sinonimo, Concepto), Respuesta) :-
    aprender_sinonimo(Sinonimo, Concepto, Respuesta).
responder_intencion(aprendizaje_concepto(Tema, Definicion), Respuesta) :-
    aprender_concepto(Tema, Definicion, Respuesta).
responder_intencion(definicion(Tema), Respuesta) :-
    responder_definicion(Tema, Respuesta).
responder_intencion(relacion(Relacion), Respuesta) :-
    responder_relacion(Relacion, Respuesta).
responder_intencion(concepto(Tema), Respuesta) :-
    responder_concepto(Tema, Respuesta).
responder_intencion(desconocido(Tema), desconocido(Tema, Respuesta)) :-
    responder_desconocido(Tema, Respuesta).

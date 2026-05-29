:- encoding(utf8).

% =========================================================
% Generación de respuestas desde la base de conocimiento
% =========================================================

% Responde preguntas de definición.
responder_definicion(Tema, Respuesta) :-
    buscar_conocimiento(Tema, Respuesta), !.
responder_definicion(Tema, desconocido(Tema, Respuesta)) :-
    responder_desconocido(Tema, Respuesta).

% Responde cuando el usuario escribe directamente un tema.
responder_concepto(Tema, Respuesta) :-
    buscar_conocimiento(Tema, Respuesta), !.
responder_concepto(Tema, desconocido(Tema, Respuesta)) :-
    responder_desconocido(Tema, Respuesta).

% =========================================================
% Consulta relaciones académicas y generales.
% =========================================================

responder_relacion(requisitos(Tema), Respuesta) :-
    resolver_alias(Tema, TemaReal),
    findall(Requisito, hecho_seguro(requisito(TemaReal, Requisito)), Requisitos),
    respuesta_lista('Los requisitos son', Requisitos, Respuesta), !.
responder_relacion(correquisitos(Tema), Respuesta) :-
    resolver_alias(Tema, TemaReal),
    findall(Correquisito, hecho_seguro(correquisito(TemaReal, Correquisito)), Correquisitos),
    respuesta_lista('Los correquisitos son', Correquisitos, Respuesta), !.
responder_relacion(requisito_de(Requisito, Curso), Respuesta) :-
    resolver_alias(Requisito, RequisitoReal),
    resolver_alias(Curso, CursoReal),
    responder_requisito_de(RequisitoReal, CursoReal, Respuesta), !.
responder_relacion(correquisito_de(Correquisito, Curso), Respuesta) :-
    resolver_alias(Correquisito, CorrequisitoReal),
    resolver_alias(Curso, CursoReal),
    responder_correquisito_de(CorrequisitoReal, CursoReal, Respuesta), !.
responder_relacion(cursos_que_requieren(Tema), Respuesta) :-
    resolver_alias(Tema, TemaReal),
    findall(Curso, hecho_seguro(requisito(Curso, TemaReal)), Cursos),
    respuesta_lista('Es requisito de', Cursos, Respuesta), !.
responder_relacion(cursos_dependen_de(Tema), Respuesta) :-
    resolver_alias(Tema, TemaReal),
    cursos_dependientes(TemaReal, Cursos),
    respuesta_lista('Dependen de ese curso', Cursos, Respuesta), !.
responder_relacion(cursos_sin_requisitos, Respuesta) :-
    cursos_sin_requisitos_respuesta(Respuesta), !.
responder_relacion(cursos_sin_correquisitos, Respuesta) :-
    cursos_sin_correquisitos_respuesta(Respuesta), !.
responder_relacion(puede_matricular(Curso, Aprobados), Respuesta) :-
    resolver_alias(Curso, CursoReal),
    maplist(resolver_alias, Aprobados, AprobadosReales),
    responder_puede_matricular(CursoReal, AprobadosReales, Respuesta), !.
responder_relacion(relaciones(Tema), Respuesta) :-
    buscar_relacion_general(Tema, Respuesta), !.
responder_relacion(Tema, Respuesta) :-
    responder_desconocido(Tema, Respuesta).

% =========================================================
% Busca conocimiento en el orden de prioridad.
% =========================================================

buscar_conocimiento(Tema, Respuesta) :-
    resolver_alias(Tema, TemaReal),
    buscar_conocimiento_directo(TemaReal, Respuesta), !.
buscar_conocimiento(Tema, Respuesta) :-
    buscar_por_sinonimo(Tema, Respuesta), !.

% Orden de búsqueda directa:
% 1. Definición explícita
% 2. Concepto
% 3. es_un con inferencia de tiene
% 4. Propiedades directas de tiene
% 5. relacionado_con
% 6. asociado_con
% 7. requisito directo
% 8. correquisito directo
% 9. Inferencia de dependencia de cursos
% 10. Datos de curso registrado
% 11. Datos de profesor registrado

buscar_conocimiento_directo(Tema, Respuesta) :-
    hecho_seguro(definicion(Tema, Respuesta)), !.

buscar_conocimiento_directo(Tema, Respuesta) :-
    hecho_seguro(concepto(Tema, Respuesta)), !.

% Inferencia: si X es_un Y y Y tiene propiedades, X las hereda.
buscar_conocimiento_directo(Tema, Respuesta) :-
    hecho_seguro(es_un(Tema, Clase)),
    findall(P, hecho_seguro(tiene(Clase, P)), Props),
    (
        Props \= []
    ->
        nombre_mostrable(Tema, TemaTexto),
        nombre_mostrable(Clase, ClaseTexto),
        maplist(nombre_mostrable, Props, PropsTexto),
        atomic_list_concat(PropsTexto, ', ', PropsUnidos),
        format(string(Respuesta),
            '~w es un ~w, y por inferencia lógica tiene: ~w.',
            [TemaTexto, ClaseTexto, PropsUnidos])
    ;
        respuesta_es_un(Tema, Clase, Respuesta)
    ), !.

% Propiedades directas de tiene.
buscar_conocimiento_directo(Tema, Respuesta) :-
    findall(P, hecho_seguro(tiene(Tema, P)), Props),
    Props \= [],
    nombre_mostrable(Tema, TemaTexto),
    maplist(nombre_mostrable, Props, PropsTexto),
    atomic_list_concat(PropsTexto, ', ', PropsUnidos),
    format(string(Respuesta), '~w tiene: ~w.', [TemaTexto, PropsUnidos]), !.

buscar_conocimiento_directo(Tema, Respuesta) :-
    hecho_seguro(relacionado_con(Tema, Relacionado)),
    nombre_mostrable(Tema, TemaTexto),
    nombre_mostrable(Relacionado, RelacionadoTexto),
    format(string(Respuesta), '~w está relacionado con ~w.', [TemaTexto, RelacionadoTexto]), !.

buscar_conocimiento_directo(Tema, Respuesta) :-
    hecho_seguro(asociado_con(Tema, Asociado)),
    nombre_mostrable(Tema, TemaTexto),
    nombre_mostrable(Asociado, AsociadoTexto),
    format(string(Respuesta), '~w está asociado con ~w.', [TemaTexto, AsociadoTexto]), !.

buscar_conocimiento_directo(Tema, Respuesta) :-
    hecho_seguro(requisito(Tema, Requisito)),
    nombre_mostrable(Tema, TemaTexto),
    nombre_mostrable(Requisito, RequisitoTexto),
    format(string(Respuesta), '~w tiene como requisito a ~w.', [TemaTexto, RequisitoTexto]), !.

buscar_conocimiento_directo(Tema, Respuesta) :-
    hecho_seguro(correquisito(Tema, Correquisito)),
    nombre_mostrable(Tema, TemaTexto),
    nombre_mostrable(Correquisito, CorrequisitoTexto),
    format(string(Respuesta), '~w tiene como correquisito a ~w.', [TemaTexto, CorrequisitoTexto]), !.

buscar_conocimiento_directo(Tema, Respuesta) :-
    inferir_dependencia(Tema, Respuesta), !.

buscar_conocimiento_directo(Tema, Respuesta) :-
    datos_curso_seguro(Tema, Respuesta), !.

buscar_conocimiento_directo(Tema, Respuesta) :-
    datos_profesor_seguro(Tema, Respuesta), !.

% =========================================================
% Busca usando sinónimos con detección de ciclos.
% =========================================================

buscar_por_sinonimo(Tema, Respuesta) :-
    buscar_por_sinonimo(Tema, Respuesta, []).

buscar_por_sinonimo(Tema, Respuesta, Visitados) :-
    \+ member(Tema, Visitados),
    alias_seguro(Tema, OtroTema),
    buscar_conocimiento_directo(OtroTema, Respuesta), !.
buscar_por_sinonimo(Tema, Respuesta, Visitados) :-
    \+ member(Tema, Visitados),
    alias_seguro(Tema, OtroTema),
    buscar_por_sinonimo(OtroTema, Respuesta, [Tema | Visitados]), !.

% =========================================================
% Mensaje para conocimiento no encontrado.
% =========================================================

responder_desconocido(Tema, Respuesta) :-
    nombre_mostrable(Tema, TemaTexto),
    format(
        string(Respuesta),
        'No tengo conocimiento suficiente sobre "~w".',
        [TemaTexto]
    ).

% =========================================================
% Relación general: busca cualquier hecho conocido.
% =========================================================

buscar_relacion_general(Tema, Respuesta) :-
    resolver_alias(Tema, TemaReal),
    buscar_conocimiento_directo(TemaReal, Respuesta).

% =========================================================
% Convierte listas de relaciones en una respuesta legible.
% =========================================================

respuesta_lista(_, [], 'No encontré datos registrados para esa consulta.') :- !.
respuesta_lista(Prefijo, Lista, Respuesta) :-
    sort(Lista, ListaUnica),
    ListaUnica \= [],
    maplist(nombre_mostrable, ListaUnica, ListaTexto),
    atomic_list_concat(ListaTexto, ', ', Texto),
    format(string(Respuesta), '~w: ~w.', [Prefijo, Texto]).

% =========================================================
% Inferencias lógicas de requisitos y correquisitos.
% =========================================================

responder_requisito_de(Requisito, Curso, Respuesta) :-
    hecho_seguro(requisito(Curso, Requisito)),
    nombre_mostrable(Requisito, RequisitoTexto),
    nombre_mostrable(Curso, CursoTexto),
    format(string(Respuesta), 'Sí, ~w es requisito de ~w.', [RequisitoTexto, CursoTexto]).
responder_requisito_de(Requisito, Curso, Respuesta) :-
    nombre_mostrable(Requisito, RequisitoTexto),
    nombre_mostrable(Curso, CursoTexto),
    format(string(Respuesta), 'No encontré que ~w sea requisito de ~w.', [RequisitoTexto, CursoTexto]).

responder_correquisito_de(Correquisito, Curso, Respuesta) :-
    hecho_seguro(correquisito(Curso, Correquisito)),
    nombre_mostrable(Correquisito, CorrequisitoTexto),
    nombre_mostrable(Curso, CursoTexto),
    format(string(Respuesta), 'Sí, ~w es correquisito de ~w.', [CorrequisitoTexto, CursoTexto]).
responder_correquisito_de(Correquisito, Curso, Respuesta) :-
    nombre_mostrable(Correquisito, CorrequisitoTexto),
    nombre_mostrable(Curso, CursoTexto),
    format(string(Respuesta), 'No encontré que ~w sea correquisito de ~w.', [CorrequisitoTexto, CursoTexto]).

cursos_dependientes(Tema, Cursos) :-
    findall(Curso, hecho_seguro(requisito(Curso, Tema)), CursosRequisito),
    findall(Curso, hecho_seguro(correquisito(Curso, Tema)), CursosCorrequisito),
    append(CursosRequisito, CursosCorrequisito, Cursos).

inferir_dependencia(Tema, Respuesta) :-
    cursos_dependientes(Tema, Cursos),
    Cursos \= [],
    respuesta_lista('Por inferencia, ese tema es necesario para', Cursos, Respuesta).

cursos_sin_requisitos_respuesta(Respuesta) :-
    existe_predicado(cursos_sin_requisitos/1),
    cursos_sin_requisitos(Cursos),
    respuesta_lista('Cursos sin requisitos', Cursos, Respuesta), !.
cursos_sin_requisitos_respuesta(Respuesta) :-
    findall(Curso, (hecho_seguro(curso(Curso)), \+ hecho_seguro(requisito(Curso, _))), Cursos),
    respuesta_lista('Cursos sin requisitos', Cursos, Respuesta).

cursos_sin_correquisitos_respuesta(Respuesta) :-
    findall(Curso, (hecho_seguro(curso(Curso)), \+ hecho_seguro(correquisito(Curso, _))), Cursos),
    respuesta_lista('Cursos sin correquisitos', Cursos, Respuesta).

responder_puede_matricular(Curso, Aprobados, Respuesta) :-
    findall(Requisito, hecho_seguro(requisito(Curso, Requisito)), Requisitos),
    restar_lista(Requisitos, Aprobados, Faltantes),
    nombre_mostrable(Curso, CursoTexto),
    (
        Faltantes = []
    ->
        format(string(Respuesta), 'Sí, puedes matricular ~w porque cumples sus requisitos registrados.', [CursoTexto])
    ;
        maplist(nombre_mostrable, Faltantes, FaltantesTexto),
        atomic_list_concat(FaltantesTexto, ', ', Texto),
        format(string(Respuesta), 'No todavía. Para matricular ~w te falta: ~w.', [CursoTexto, Texto])
    ).

restar_lista([], _, []).
restar_lista([Elemento | Resto], Lista, Faltantes) :-
    member(Elemento, Lista), !,
    restar_lista(Resto, Lista, Faltantes).
restar_lista([Elemento | Resto], Lista, [Elemento | Faltantes]) :-
    restar_lista(Resto, Lista, Faltantes).

% =========================================================
% Resolución de alias y verificación de temas registrados.
% =========================================================

resolver_alias(Tema, Tema) :-
    tema_registrado(Tema), !.
resolver_alias(Tema, TemaReal) :-
    alias_seguro(Tema, TemaReal), !.
resolver_alias(Tema, Tema).

tema_registrado(Tema) :-
    hecho_seguro(concepto(Tema, _)), !.
tema_registrado(Tema) :-
    hecho_seguro(definicion(Tema, _)), !.
tema_registrado(Tema) :-
    hecho_seguro(curso(Tema)), !.
tema_registrado(Tema) :-
    hecho_seguro(profesor(Tema)), !.
tema_registrado(Tema) :-
    hecho_seguro(es_un(Tema, _)), !.
tema_registrado(Tema) :-
    hecho_seguro(tiene(Tema, _)), !.
tema_registrado(Tema) :-
    hecho_seguro(relacionado_con(Tema, _)), !.
tema_registrado(Tema) :-
    hecho_seguro(asociado_con(Tema, _)), !.
tema_registrado(Tema) :-
    hecho_seguro(requisito(Tema, _)), !.
tema_registrado(Tema) :-
    hecho_seguro(correquisito(Tema, _)), !.

alias_seguro(Tema, Alias) :-
    hecho_seguro(sinonimo(Tema, Alias)).
alias_seguro(Tema, Alias) :-
    hecho_seguro(sinonimo(Alias, Tema)).
alias_seguro(Tema, Alias) :-
    hecho_seguro(sinonimo_curso(Tema, Alias)).
alias_seguro(Tema, Alias) :-
    hecho_seguro(sinonimo_profesor(Tema, Alias)).

% =========================================================
% Datos especiales para cursos y profesores.
% =========================================================

datos_curso_seguro(Tema, Respuesta) :-
    existe_predicado(curso/1),
    curso(Tema),
    (
        existe_predicado(nombre_curso/2),
        nombre_curso(Tema, Nombre)
    ->
        format(string(Respuesta), '~w es un curso registrado en la base de conocimiento.', [Nombre])
    ;
        nombre_mostrable(Tema, NombreTexto),
        format(string(Respuesta), '~w es un curso registrado en la base de conocimiento.', [NombreTexto])
    ).

datos_profesor_seguro(Tema, Respuesta) :-
    existe_predicado(profesor/1),
    profesor(Tema),
    (
        existe_predicado(nombre_profesor/2),
        nombre_profesor(Tema, Nombre),
        existe_predicado(correo_profesor/2),
        correo_profesor(Tema, Correo)
    ->
        format(string(Respuesta), '~w es profesor de Computación. Su correo es ~w.', [Nombre, Correo])
    ;
        nombre_mostrable(Tema, NombreTexto),
        format(string(Respuesta), '~w es profesor de Computación.', [NombreTexto])
    ).

% Respuesta especial para hechos es_un/2 sin tiene/2 asociado.
respuesta_es_un(Tema, profesor, Respuesta) :-
    datos_profesor_seguro(Tema, Respuesta), !.
respuesta_es_un(Tema, curso, Respuesta) :-
    datos_curso_seguro(Tema, Respuesta), !.
respuesta_es_un(Tema, Clase, Respuesta) :-
    nombre_mostrable(Tema, TemaTexto),
    nombre_mostrable(Clase, ClaseTexto),
    format(string(Respuesta), '~w es un ~w.', [TemaTexto, ClaseTexto]).

% =========================================================
% Llama un hecho solo si su predicado existe.
% =========================================================

hecho_seguro(Hecho) :-
    functor(Hecho, Nombre, Aridad),
    current_predicate(Nombre/Aridad),
    call(Hecho).

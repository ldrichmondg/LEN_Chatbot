% =========================================================
% Aprendizaje dinamico del chatbot
% =========================================================

:- dynamic concepto/2.
:- dynamic definicion/2.
:- dynamic sinonimo/2.
:- dynamic conocimiento_aprendido/1.

% =========================================================
% Aprender un concepto nuevo.
% Valida duplicados y longitud minima antes de guardar.
% =========================================================

% La definicion es demasiado corta para ser valida.
aprender_concepto(_, Descripcion, 'La definicion es demasiado corta. Por favor escribe una definicion mas completa.') :-
    atom_length(Descripcion, Len),
    Len < 4, !.

% Ya existe conocimiento sobre ese tema.
aprender_concepto(Tema, _, Respuesta) :-
    (hecho_seguro(concepto(Tema, _)) ; hecho_seguro(definicion(Tema, _))),
    !,
    nombre_mostrable(Tema, TemaTexto),
    format(string(Respuesta),
        'Ya tengo informacion sobre "~w". Si deseas actualizarla, usa: actualizar que ~w es <nueva definicion>.',
        [TemaTexto, TemaTexto]).

% Guarda el nuevo concepto.
aprender_concepto(Tema, Descripcion, Respuesta) :-
    guardar_conocimiento_dinamico(concepto(Tema, Descripcion)),
    guardar_conocimiento_dinamico(definicion(Tema, Descripcion)),
    nombre_mostrable(Tema, TemaTexto),
    format(string(Respuesta), 'He aprendido que ~w es ~w.', [TemaTexto, Descripcion]).

% =========================================================
% Actualizar un concepto existente.
% =========================================================

actualizar_concepto(Tema, Descripcion, Respuesta) :-
    (retract(concepto(Tema, _)) -> true ; true),
    (retract(definicion(Tema, _)) -> true ; true),
    guardar_conocimiento_dinamico(concepto(Tema, Descripcion)),
    guardar_conocimiento_dinamico(definicion(Tema, Descripcion)),
    nombre_mostrable(Tema, TemaTexto),
    format(string(Respuesta), 'He actualizado el conocimiento sobre ~w.', [TemaTexto]).

% =========================================================
% Aprender una definicion directa.
% =========================================================

aprender_definicion(Tema, Definicion, Respuesta) :-
    guardar_conocimiento_dinamico(definicion(Tema, Definicion)),
    nombre_mostrable(Tema, TemaTexto),
    format(string(Respuesta), 'He aprendido la definicion de ~w.', [TemaTexto]).

% =========================================================
% Aprender un sinonimo nuevo.
% Valida que no exista ya antes de guardar.
% =========================================================

aprender_sinonimo(Sinonimo, Concepto, Respuesta) :-
    hecho_seguro(sinonimo(Sinonimo, Concepto)),
    !,
    nombre_mostrable(Sinonimo, SinonimoTexto),
    nombre_mostrable(Concepto, ConceptoTexto),
    format(string(Respuesta), 'Ya sabia que ~w es sinonimo de ~w.', [SinonimoTexto, ConceptoTexto]).

aprender_sinonimo(Sinonimo, Concepto, Respuesta) :-
    hecho_seguro(sinonimo(Concepto, Sinonimo)),
    !,
    nombre_mostrable(Sinonimo, SinonimoTexto),
    nombre_mostrable(Concepto, ConceptoTexto),
    format(string(Respuesta), 'Ya sabia que ~w y ~w son equivalentes.', [SinonimoTexto, ConceptoTexto]).

aprender_sinonimo(Sinonimo, Concepto, Respuesta) :-
    guardar_conocimiento_dinamico(sinonimo(Sinonimo, Concepto)),
    nombre_mostrable(Sinonimo, SinonimoTexto),
    nombre_mostrable(Concepto, ConceptoTexto),
    format(string(Respuesta), 'He aprendido que ~w es sinonimo de ~w.', [SinonimoTexto, ConceptoTexto]).

% =========================================================
% Guarda un hecho dinamicamente y registra que fue aprendido.
% =========================================================

guardar_conocimiento_dinamico(Hecho) :-
    assertz(Hecho),
    assertz(conocimiento_aprendido(Hecho)).

% =========================================================
% Persiste el conocimiento aprendido en esta sesion a disco.
% Se agrega al archivo existente (modo append) para no perder
% lo aprendido en sesiones previas.
% =========================================================

guardar_sesion_a_archivo :-
    findall(H, conocimiento_aprendido(H), Hechos),
    (
        Hechos = []
    ->
        writeln('Chatbot: No hay conocimiento nuevo para guardar.')
    ;
        catch(
            guardar_hechos_a_archivo(Hechos),
            Error,
            (format('Chatbot: Error al guardar: ~w~n', [Error]))
        )
    ).

guardar_hechos_a_archivo(Hechos) :-
    open('conocimiento/conocimiento_aprendido.pl', append, Stream),
    write(Stream, '\n% --- Conocimiento aprendido en sesion ---\n'),
    forall(
        member(H, Hechos),
        (write_term(Stream, H, [quoted(true)]), write(Stream, '.\n'))
    ),
    close(Stream),
    length(Hechos, N),
    format('Chatbot: ~w conocimientos guardados en conocimiento/conocimiento_aprendido.pl~n', [N]).

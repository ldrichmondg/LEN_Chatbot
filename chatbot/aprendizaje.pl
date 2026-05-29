% =========================================================
% Aprendizaje dinamico del chatbot
% =========================================================

:- dynamic concepto/2.
:- dynamic definicion/2.
:- dynamic sinonimo/2.

% Aprende un concepto y lo guarda tambien como definicion.
aprender_concepto(Tema, Descripcion, Respuesta) :-
    guardar_conocimiento_dinamico(concepto(Tema, Descripcion)),
    guardar_conocimiento_dinamico(definicion(Tema, Descripcion)),
    nombre_mostrable(Tema, TemaTexto),
    format(string(Respuesta), 'He aprendido que ~w es ~w.', [TemaTexto, Descripcion]).

% Aprende una definicion.
aprender_definicion(Tema, Definicion, Respuesta) :-
    guardar_conocimiento_dinamico(definicion(Tema, Definicion)),
    nombre_mostrable(Tema, TemaTexto),
    format(string(Respuesta), 'He aprendido la definicion de ~w.', [TemaTexto]).

% Aprende un sinonimo nuevo.
aprender_sinonimo(Sinonimo, Concepto, Respuesta) :-
    guardar_conocimiento_dinamico(sinonimo(Sinonimo, Concepto)),
    nombre_mostrable(Sinonimo, SinonimoTexto),
    nombre_mostrable(Concepto, ConceptoTexto),
    format(string(Respuesta), 'He aprendido que ~w es sinonimo de ~w.', [SinonimoTexto, ConceptoTexto]).

% Guarda conocimiento temporal durante la ejecucion.
guardar_conocimiento_dinamico(Hecho) :-
    assertz(Hecho).

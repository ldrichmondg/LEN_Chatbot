% =========================================================
% Utilidades generales del chatbot
% =========================================================

% Convierte la entrada a minusculas, limpia signos y separa palabras.
normalizar_entrada(Entrada, Palabras) :-
    string_lower(Entrada, Minusculas),
    limpiar_signos(Minusculas, Limpia),
    dividir_palabras(Limpia, Palabras).

% Divide un texto en atomos, eliminando cadenas vacias.
dividir_palabras(Texto, Palabras) :-
    split_string(Texto, " \t\n", " \t\n", Strings),
    include([S]>>(S \= ""), Strings, StringsLimpios),
    maplist(atom_string, Palabras, StringsLimpios).

% Quita signos comunes y normaliza tildes basicas.
limpiar_signos(Texto, Limpio) :-
    string_codes(Texto, Codigos),
    maplist(normalizar_codigo, Codigos, CodigosLimpios),
    string_codes(Limpio, CodigosLimpios).

normalizar_codigo(225, 97) :- !.   % a con tilde
normalizar_codigo(233, 101) :- !.  % e con tilde
normalizar_codigo(237, 105) :- !.  % i con tilde
normalizar_codigo(243, 111) :- !.  % o con tilde
normalizar_codigo(250, 117) :- !.  % u con tilde
normalizar_codigo(252, 117) :- !.  % u con dieresis
normalizar_codigo(241, 110) :- !.  % ene
normalizar_codigo(191, 32) :- !.   % signo inicial de pregunta
normalizar_codigo(63, 32) :- !.    % ?
normalizar_codigo(33, 32) :- !.    % !
normalizar_codigo(161, 32) :- !.   % signo inicial de admiracion
normalizar_codigo(44, 32) :- !.    % ,
normalizar_codigo(46, 32) :- !.    % .
normalizar_codigo(58, 32) :- !.    % :
normalizar_codigo(59, 32) :- !.    % ;
normalizar_codigo(Codigo, Codigo).

% Convierte un string en atomo.
string_a_atomo(String, Atomo) :-
    atom_string(Atomo, String).

% Une palabras con guion bajo para formar atomos de la base de conocimiento.
unir_palabras(Palabras, Atomo) :-
    atomic_list_concat(Palabras, '_', Atomo).

% Verifica si una palabra aparece dentro de una lista.
contiene_palabra(Palabras, Palabra) :-
    member(Palabra, Palabras).

% Une palabras con espacios para mostrar texto al usuario.
unir_texto(Palabras, Texto) :-
    atomic_list_concat(Palabras, ' ', Texto).

% Convierte un atomo con guiones bajos en texto legible.
nombre_mostrable(Atomo, Nombre) :-
    atom(Atomo),
    atomic_list_concat(Partes, '_', Atomo),
    atomic_list_concat(Partes, ' ', Nombre).

% Predicado seguro para llamar hechos que podrian no existir.
existe_predicado(Predicado/Aridad) :-
    current_predicate(Predicado/Aridad).

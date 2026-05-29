:- encoding(utf8).

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
normalizar_codigo(252, 117) :- !.  % u con diéresis
normalizar_codigo(241, 110) :- !.  % eñe
normalizar_codigo(191, 32) :- !.   % signo inicial de pregunta
normalizar_codigo(63, 32) :- !.    % ?
normalizar_codigo(33, 32) :- !.    % !
normalizar_codigo(161, 32) :- !.   % signo inicial de admiración
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
    current_predicate(nombre_curso/2),
    nombre_curso(Atomo, Nombre), !.
nombre_mostrable(Atomo, Nombre) :-
    atom(Atomo),
    current_predicate(nombre_profesor/2),
    nombre_profesor(Atomo, Nombre), !.
nombre_mostrable(Atomo, Nombre) :-
    atom(Atomo),
    atomic_list_concat(Partes, '_', Atomo),
    maplist(palabra_mostrable, Partes, PartesMostrables),
    atomic_list_concat(PartesMostrables, ' ', Nombre).

palabra_mostrable(programacion, programación) :- !.
palabra_mostrable(computacion, computación) :- !.
palabra_mostrable(logico, lógico) :- !.
palabra_mostrable(logica, lógica) :- !.
palabra_mostrable(semantica, semántica) :- !.
palabra_mostrable(unificacion, unificación) :- !.
palabra_mostrable(evaluacion, evaluación) :- !.
palabra_mostrable(gestion, gestión) :- !.
palabra_mostrable(indices, índices) :- !.
palabra_mostrable(aplicacion, aplicación) :- !.
palabra_mostrable(practica, práctica) :- !.
palabra_mostrable(algoritmica, algorítmica) :- !.
palabra_mostrable(abstraccion, abstracción) :- !.
palabra_mostrable(notacion, notación) :- !.
palabra_mostrable(arbol, árbol) :- !.
palabra_mostrable(raiz, raíz) :- !.
palabra_mostrable(subarboles, subárboles) :- !.
palabra_mostrable(criptografia, criptografía) :- !.
palabra_mostrable(informacion, información) :- !.
palabra_mostrable(comunicacion, comunicación) :- !.
palabra_mostrable(ensenanza, enseñanza) :- !.
palabra_mostrable(sinonimo, sinónimo) :- !.
palabra_mostrable(diagnostico, diagnóstico) :- !.
palabra_mostrable(ingles, inglés) :- !.
palabra_mostrable(matematica, matemática) :- !.
palabra_mostrable(calculo, cálculo) :- !.
palabra_mostrable(algebra, álgebra) :- !.
palabra_mostrable(analisis, análisis) :- !.
palabra_mostrable(diseno, diseño) :- !.
palabra_mostrable(estadistica, estadística) :- !.
palabra_mostrable(administracion, administración) :- !.
palabra_mostrable(investigacion, investigación) :- !.
palabra_mostrable(ingenieria, ingeniería) :- !.
palabra_mostrable(moviles, móviles) :- !.
palabra_mostrable(numerico, numérico) :- !.
palabra_mostrable(graficos, gráficos) :- !.
palabra_mostrable(termino, término) :- !.
palabra_mostrable(terminos, términos) :- !.
palabra_mostrable(Atomo, Atomo).

% Predicado seguro para llamar hechos que podrian no existir.
existe_predicado(Predicado/Aridad) :-
    current_predicate(Predicado/Aridad).

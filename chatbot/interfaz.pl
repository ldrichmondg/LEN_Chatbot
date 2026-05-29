% =========================================================
% Interfaz de consola del chatbot
% =========================================================

% Muestra el mensaje inicial.
mostrar_bienvenida :-
    writeln('Chatbot: Hola, soy el chatbot de Ingenieria en Computacion.'),
    writeln('Chatbot: Escribe una pregunta o escribe salir para terminar.').

% Inicia la interfaz por consola.
iniciar_interfaz :-
    mostrar_bienvenida,
    ciclo_chatbot.

% Mantiene la conversacion activa con recursividad.
ciclo_chatbot :-
    leer_entrada(Palabras),
    (
        es_salida(Palabras)
    ->
        mostrar_respuesta('Hasta luego.')
    ;
        procesar_entrada(Palabras, Respuesta),
        manejar_respuesta(Respuesta),
        ciclo_chatbot
    ).

% Lee una linea desde consola y la normaliza.
leer_entrada(Palabras) :-
    writeln('Usuario:'),
    flush_output,
    read_line_to_string(user_input, Entrada),
    normalizar_entrada(Entrada, Palabras).

% Muestra una respuesta del chatbot.
mostrar_respuesta(Respuesta) :-
    format('Chatbot: ~w~n', [Respuesta]).

% Maneja respuestas normales y desconocidas.
manejar_respuesta(desconocido(Tema, Mensaje)) :-
    mostrar_respuesta(Mensaje),
    preguntar_aprendizaje(Tema), !.
manejar_respuesta(Respuesta) :-
    mostrar_respuesta(Respuesta).

% Si el chatbot no sabe algo, solicita una posible definicion.
preguntar_aprendizaje(Tema) :-
    nombre_mostrable(Tema, TemaTexto),
    format('Chatbot: Si quieres, escribe una definicion para ~w o escribe omitir.~n', [TemaTexto]),
    writeln('Usuario:'),
    flush_output,
    read_line_to_string(user_input, Entrada),
    normalizar_entrada(Entrada, Palabras),
    (
        Palabras = [omitir]
    ->
        mostrar_respuesta('Entendido, continuemos.')
    ;
        Palabras = []
    ->
        mostrar_respuesta('No aprendi informacion nueva.')
    ;
        unir_texto(Palabras, Definicion),
        aprender_concepto(Tema, Definicion, Respuesta),
        mostrar_respuesta(Respuesta)
    ).

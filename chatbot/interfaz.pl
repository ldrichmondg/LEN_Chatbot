:- encoding(utf8).

% =========================================================
% Interfaz de consola del chatbot
% =========================================================

% Muestra el menú completo de ayuda.
mostrar_ayuda :-
    nl,
    writeln('========================================================'),
    writeln('        COMANDOS DISPONIBLES DEL CHATBOT                '),
    writeln('========================================================'),
    writeln('PREGUNTAS SOBRE CONCEPTOS:'),
    writeln('  qué es [tema]           '),
    writeln('  quién es [nombre]       '),
    writeln('  cuáles son [tema]       '),
    writeln('  cuántos [tema]          '),
    writeln('  cómo funciona [tema]    '),
    writeln('  dónde se usa [tema]     '),
    writeln('  cuándo se usa [tema]    '),
    writeln('  para qué sirve [tema]   '),
    writeln('  explique [tema]         '),
    writeln('  defina [tema]           '),
    writeln('  describe [tema]         '),
    writeln('  cuéntame sobre [tema]   '),
    writeln('  habla de [tema]         '),
    nl,
    writeln('CONSULTAS ACADÉMICAS:'),
    writeln('  requisitos de [curso]                         '),
    writeln('  correquisitos de [curso]                      '),
    writeln('  cursos sin requisitos                         '),
    writeln('  puedo matricular [curso] si aprobé [c1] y [c2]'),
    nl,
    writeln('APRENDIZAJE DINÁMICO:'),
    writeln('  aprender que [tema] es [definición]'),
    writeln('  aprender que [término] es sinónimo de [concepto]'),
    writeln('  [término] significa [concepto]'),
    writeln('  aprender sinónimo [término] [concepto]'),
    nl,
    writeln('OTROS:'),
    writeln('  ayuda    - Muestra este menú'),
    writeln('  conocimientos - Muestra cuántos conocimientos aprendió en esta sesión'),
    writeln('  salir    - Cierra el chatbot'),
    writeln('========================================================'),
    nl.

% Muestra el mensaje de bienvenida al iniciar.
mostrar_bienvenida :-
    nl,
    writeln('========================================================='),
    writeln('    Chatbot - Ingeniería en Computación del TEC           '),
    writeln('          Desarrollado con Paradigma Lógico               '),
    writeln('========================================================='),
    writeln('Chatbot: Hola! Soy el asistente virtual de la carrera de'),
    writeln('         Ingeniería en Computación del TEC.'),
    writeln('Chatbot: Puedo responder preguntas sobre cursos, profesores,'),
    writeln('         conceptos de computación y mucho más.'),
    writeln('Chatbot: Escribe "ayuda" para ver los comandos disponibles.'),
    nl.

% Carga conocimiento guardado en sesiones previas si existe.
cargar_conocimiento_persistente :-
    (   exists_file('conocimiento/conocimiento_aprendido.pl')
    ->  catch(
            consult('conocimiento/conocimiento_aprendido.pl'),
            _,
            writeln('Chatbot: No se pudo cargar el conocimiento previo.')
        )
    ;   true
    ).

% Inicia la interfaz por consola.
iniciar_interfaz :-
    cargar_conocimiento_persistente,
    mostrar_bienvenida,
    ciclo_chatbot.

% Mantiene la conversación activa mediante recursividad.
ciclo_chatbot :-
    leer_entrada(Palabras),
    (
        es_salida(Palabras)
    ->
        preguntar_guardar,
        mostrar_respuesta('Hasta luego. Que tengas un excelente día!')
    ;
        catch(
            (procesar_entrada(Palabras, Respuesta),
             manejar_respuesta(Respuesta)),
            _,
            mostrar_respuesta('Ocurrió un error inesperado. Intenta con otra pregunta.')
        ),
        ciclo_chatbot
    ).

% Lee una línea desde consola y la normaliza.
leer_entrada(Palabras) :-
    writeln('Usuario:'),
    flush_output,
    read_line_to_string(user_input, Entrada),
    normalizar_entrada(Entrada, Palabras).

% Muestra una respuesta del chatbot.
mostrar_respuesta(Respuesta) :-
    format('Chatbot: ~w~n', [Respuesta]).

% Maneja el tipo especial mostrar_ayuda.
manejar_respuesta(mostrar_ayuda) :-
    mostrar_ayuda, !.
% Muestra el conteo de conocimiento aprendido en esta sesión.
manejar_respuesta(conteo_conocimientos) :-
    mostrar_conteo_conocimientos, !.
% Maneja respuestas desconocidas e inicia flujo de aprendizaje.
manejar_respuesta(desconocido(Tema, Mensaje)) :-
    mostrar_respuesta(Mensaje),
    preguntar_aprendizaje(Tema), !.
% Pide confirmación antes de aprender una definición enviada como comando.
manejar_respuesta(confirmar_aprendizaje_concepto(Tema, Definicion)) :-
    confirmar_aprendizaje_concepto(Tema, Definicion), !.
% Pide confirmación antes de aprender un sinónimo enviado como comando.
manejar_respuesta(confirmar_aprendizaje_sinonimo(Sinonimo, Concepto)) :-
    confirmar_aprendizaje_sinonimo(Sinonimo, Concepto), !.
% Maneja respuestas normales.
manejar_respuesta(Respuesta) :-
    mostrar_respuesta(Respuesta).

confirmar_aprendizaje_concepto(Tema, Definicion) :-
    nombre_mostrable(Tema, TemaTexto),
    format('Chatbot: Aprendo que "~w" es "~w". ¿Confirmas? (sí/no)~n', [TemaTexto, Definicion]),
    leer_confirmacion(Confirmado),
    (
        Confirmado = si
    ->
        aprender_concepto(Tema, Definicion, Respuesta),
        mostrar_respuesta(Respuesta)
    ;
        mostrar_respuesta('Entendido, no guardé esa información.')
    ).

confirmar_aprendizaje_sinonimo(Sinonimo, Concepto) :-
    nombre_mostrable(Sinonimo, SinonimoTexto),
    nombre_mostrable(Concepto, ConceptoTexto),
    format('Chatbot: Aprendo que "~w" es sinónimo de "~w". ¿Confirmas? (sí/no)~n', [SinonimoTexto, ConceptoTexto]),
    leer_confirmacion(Confirmado),
    (
        Confirmado = si
    ->
        aprender_sinonimo(Sinonimo, Concepto, Respuesta),
        mostrar_respuesta(Respuesta)
    ;
        mostrar_respuesta('Entendido, no guardé esa información.')
    ).

leer_confirmacion(Confirmado) :-
    writeln('Usuario:'),
    flush_output,
    read_line_to_string(user_input, Entrada),
    normalizar_entrada(Entrada, Palabras),
    (
        (Palabras = [si] ; Palabras = [s])
    ->
        Confirmado = si
    ;
        Confirmado = no
    ).

mostrar_conteo_conocimientos :-
    findall(H, conocimiento_aprendido(H), Hechos),
    length(Hechos, N),
    format('Chatbot: He aprendido ~w conocimientos en esta sesión.~n', [N]).

% Solicita al usuario una definición para un tema desconocido.
preguntar_aprendizaje(Tema) :-
    nombre_mostrable(Tema, TemaTexto),
    format('Chatbot: ¿Deseas enseñarme sobre "~w"? Escribe una definición u "omitir".~n', [TemaTexto]),
    writeln('Usuario:'),
    flush_output,
    read_line_to_string(user_input, Entrada),
    normalizar_entrada(Entrada, Palabras),
    procesar_respuesta_aprendizaje(Tema, Palabras).

% El usuario elige omitir el aprendizaje.
procesar_respuesta_aprendizaje(_, [omitir]) :-
    mostrar_respuesta('Entendido, continuemos.'), !.
procesar_respuesta_aprendizaje(_, [no]) :-
    mostrar_respuesta('Entendido, continuemos.'), !.
procesar_respuesta_aprendizaje(_, [n]) :-
    mostrar_respuesta('Entendido, continuemos.'), !.
% El usuario no escribió nada.
procesar_respuesta_aprendizaje(_, []) :-
    mostrar_respuesta('No se recibió ninguna definición.'), !.
% La definición es demasiado larga.
procesar_respuesta_aprendizaje(_, Palabras) :-
    length(Palabras, Len),
    Len > 60,
    mostrar_respuesta('La definición es demasiado larga. Intenta con una más concisa.'), !.
% Valida y pide confirmación antes de aprender.
procesar_respuesta_aprendizaje(Tema, Palabras) :-
    unir_texto(Palabras, Definicion),
    nombre_mostrable(Tema, TemaTexto),
    format('Chatbot: Aprendo que "~w" es "~w". ¿Confirmas? (sí/no)~n', [TemaTexto, Definicion]),
    writeln('Usuario:'),
    flush_output,
    read_line_to_string(user_input, Confirmacion),
    normalizar_entrada(Confirmacion, ConfPalabras),
    (
        (ConfPalabras = [si] ; ConfPalabras = [s])
    ->
        aprender_concepto(Tema, Definicion, Respuesta),
        mostrar_respuesta(Respuesta)
    ;
        mostrar_respuesta('Entendido, no guardé esa información.')
    ).

% Pregunta si guardar el conocimiento aprendido en esta sesión.
preguntar_guardar :-
    findall(H, conocimiento_aprendido(H), Hechos),
    (
        Hechos = []
    ->
        true
    ;
        length(Hechos, N),
        format('Chatbot: He aprendido ~w conocimientos en esta sesión. ¿Deseas guardarlos para futuras sesiones? (sí/no)~n', [N]),
        leer_confirmacion(Confirmado),
        (
            Confirmado = si
        ->
            guardar_sesion_a_archivo
        ;
            mostrar_respuesta('Entendido, no guardaré el conocimiento aprendido.')
        )
    ).


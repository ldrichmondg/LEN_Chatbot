% =========================================================
% Interfaz de consola del chatbot
% =========================================================

% Muestra el menu completo de ayuda.
mostrar_ayuda :-
    nl,
    writeln('========================================================'),
    writeln('        COMANDOS DISPONIBLES DEL CHATBOT                '),
    writeln('========================================================'),
    writeln('PREGUNTAS SOBRE CONCEPTOS:'),
    writeln('  que es [tema]              - Definicion de un tema'),
    writeln('  quien es [nombre]          - Informacion sobre una persona'),
    writeln('  cuales son [tema]          - Lista elementos relacionados'),
    writeln('  cuantos [tema]             - Cuenta elementos de un tipo'),
    writeln('  como funciona [tema]       - Explica como funciona algo'),
    writeln('  donde se usa [tema]        - Contexto de uso'),
    writeln('  cuando se usa [tema]       - Temporalidad de uso'),
    writeln('  para que sirve [tema]      - Utilidad de algo'),
    writeln('  explique [tema]            - Solicita una explicacion'),
    writeln('  defina [tema]              - Solicita una definicion'),
    writeln('  describe [tema]            - Descripcion de un tema'),
    writeln('  cuentame sobre [tema]      - Informacion general'),
    writeln('  habla de [tema]            - Informacion general'),
    nl,
    writeln('CONSULTAS ACADEMICAS:'),
    writeln('  requisitos de [curso]      - Requisitos de un curso'),
    writeln('  correquisitos de [curso]   - Correquisitos de un curso'),
    writeln('  cursos sin requisitos      - Cursos de primer ingreso'),
    writeln('  puedo matricular [curso] si aprobe [c1] y [c2]'),
    nl,
    writeln('APRENDIZAJE DINAMICO:'),
    writeln('  aprender que [tema] es [definicion]'),
    writeln('  aprender que [termino] es sinonimo de [concepto]'),
    writeln('  [termino] significa [concepto]'),
    writeln('  aprender sinonimo [termino] [concepto]'),
    nl,
    writeln('OTROS:'),
    writeln('  ayuda    - Muestra este menu'),
    writeln('  salir    - Cierra el chatbot'),
    writeln('========================================================'),
    nl.

% Muestra el mensaje de bienvenida al iniciar.
mostrar_bienvenida :-
    nl,
    writeln('========================================================='),
    writeln('    Chatbot - Ingenieria en Computacion del TEC           '),
    writeln('          Desarrollado con Paradigma Logico               '),
    writeln('========================================================='),
    writeln('Chatbot: Hola! Soy el asistente virtual de la carrera de'),
    writeln('         Ingenieria en Computacion del TEC.'),
    writeln('Chatbot: Puedo responder preguntas sobre cursos, profesores,'),
    writeln('         conceptos de computacion y mucho mas.'),
    writeln('Chatbot: Escribe "ayuda" para ver los comandos disponibles.'),
    nl.

% Carga conocimiento guardado en sesiones previas si existe.
cargar_conocimiento_persistente :-
    (   exists_file('conocimiento/conocimiento_aprendido.pl')
    ->  catch(
            (consult('conocimiento/conocimiento_aprendido.pl'),
             writeln('Chatbot: Conocimiento previo cargado correctamente.')),
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

% Mantiene la conversacion activa mediante recursividad.
ciclo_chatbot :-
    leer_entrada(Palabras),
    (
        es_salida(Palabras)
    ->
        preguntar_guardar,
        mostrar_respuesta('Hasta luego. Que tengas un excelente dia!')
    ;
        catch(
            (procesar_entrada(Palabras, Respuesta),
             manejar_respuesta(Respuesta)),
            _,
            mostrar_respuesta('Ocurrio un error inesperado. Intenta con otra pregunta.')
        ),
        ciclo_chatbot
    ).

% Lee una linea desde consola y la normaliza.
leer_entrada(Palabras) :-
    write('Usuario: '),
    flush_output,
    read_line_to_string(user_input, Entrada),
    normalizar_entrada(Entrada, Palabras).

% Muestra una respuesta del chatbot.
mostrar_respuesta(Respuesta) :-
    format('Chatbot: ~w~n', [Respuesta]).

% Maneja el tipo especial mostrar_ayuda.
manejar_respuesta(mostrar_ayuda) :-
    mostrar_ayuda, !.
% Maneja respuestas desconocidas e inicia flujo de aprendizaje.
manejar_respuesta(desconocido(Tema, Mensaje)) :-
    mostrar_respuesta(Mensaje),
    preguntar_aprendizaje(Tema), !.
% Maneja respuestas normales.
manejar_respuesta(Respuesta) :-
    mostrar_respuesta(Respuesta).

% Solicita al usuario una definicion para un tema desconocido.
preguntar_aprendizaje(Tema) :-
    nombre_mostrable(Tema, TemaTexto),
    format('Chatbot: Deseas ensenharme sobre "~w"? Escribe una definicion o "omitir".~n', [TemaTexto]),
    write('Usuario: '),
    flush_output,
    read_line_to_string(user_input, Entrada),
    normalizar_entrada(Entrada, Palabras),
    procesar_respuesta_aprendizaje(Tema, Palabras).

% El usuario elige omitir el aprendizaje.
procesar_respuesta_aprendizaje(_, [omitir]) :-
    mostrar_respuesta('Entendido, continuemos.'), !.
% El usuario no escribio nada.
procesar_respuesta_aprendizaje(_, []) :-
    mostrar_respuesta('No se recibio ninguna definicion.'), !.
% La definicion es demasiado larga.
procesar_respuesta_aprendizaje(_, Palabras) :-
    length(Palabras, Len),
    Len > 60,
    mostrar_respuesta('La definicion es demasiado larga. Intenta con una mas concisa.'), !.
% Valida y pide confirmacion antes de aprender.
procesar_respuesta_aprendizaje(Tema, Palabras) :-
    unir_texto(Palabras, Definicion),
    nombre_mostrable(Tema, TemaTexto),
    format('Chatbot: Aprendo que "~w" es "~w". Confirmas? (si/no)~n', [TemaTexto, Definicion]),
    write('Usuario: '),
    flush_output,
    read_line_to_string(user_input, Confirmacion),
    normalizar_entrada(Confirmacion, ConfPalabras),
    (
        (ConfPalabras = [si] ; ConfPalabras = [s])
    ->
        aprender_concepto(Tema, Definicion, Respuesta),
        mostrar_respuesta(Respuesta)
    ;
        mostrar_respuesta('Entendido, no guarde esa informacion.')
    ).

% Pregunta si guardar el conocimiento aprendido en esta sesion.
preguntar_guardar :-
    findall(H, conocimiento_aprendido(H), Hechos),
    (
        Hechos = []
    ->
        true
    ;
        length(Hechos, N),
        format('Chatbot: Aprendi ~w nuevos conocimientos en esta sesion.~n', [N]),
        writeln('Chatbot: Deseas guardar el conocimiento aprendido para futuras sesiones? (si/no)'),
        write('Usuario: '),
        flush_output,
        read_line_to_string(user_input, Entrada),
        normalizar_entrada(Entrada, Palabras),
        (
            (Palabras = [si] ; Palabras = [s])
        ->
            guardar_sesion_a_archivo
        ;
            writeln('Chatbot: Entendido, el conocimiento de esta sesion no se guardara.')
        )
    ).

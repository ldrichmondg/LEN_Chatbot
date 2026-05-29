Optimized tool selectionEl archivo profesores.pl está organizado como una base de conocimiento Prolog sobre profesores de Computación. Cada sección cumple una función distinta:

1. Encabezado y declaración dinámica  
Aquí se indica que el archivo es una base lógica y se declaran los predicados que pueden cambiar durante la ejecución, como profesor/1, nombre_profesor/2, correo_profesor/2, es_un/2 y las relaciones semánticas. Eso le dice a Prolog que esos hechos pueden consultarse o incluso modificarse en tiempo de ejecución.

2. Conceptos y definiciones generales  
Esta parte guarda definiciones de términos abstractos, por ejemplo profesor, correo_institucional, carrera_computacion y base_conocimiento. Sirve para que el sistema pueda responder preguntas conceptuales, no solo datos concretos.

3. Sinónimos generales  
Aquí se asocian palabras equivalentes, como profe, docente y maestro con profesor, o correo y email con correo_institucional. Esto permite que el chatbot entienda distintas formas de referirse a lo mismo.

4. Relaciones generales  
Predicados como asociado_con/2 conectan conceptos con otros conceptos, por ejemplo profesor con enseñanza, estudiante, curso y carrera_computacion. Esto ayuda a dar contexto semántico y a ampliar consultas relacionadas.

5. Hechos: profesores registrados  
Esta sección lista todos los profesores como hechos individuales con profesor/1. Cada átomo representa un identificador interno del profesor, por ejemplo alicia_salazar_hernandez o jose_helo_guzman.

6. Nombres completos  
Usa nombre_profesor/2 para relacionar cada identificador interno con el nombre completo visible para el usuario. Esta es la capa que convierte un alias técnico en una presentación legible.

7. Correos de profesores  
Con correo_profesor/2 se guarda el correo institucional o personal de cada profesor. Esto permite responder consultas como “¿cuál es el correo de X?”.

8. Relaciones es_un  
Esta parte afirma que cada profesor es un profesor mediante es_un(Profesor, profesor). Es una forma de clasificar entidades dentro de la base de conocimiento y puede servir para consultas más generales o jerárquicas.

9. Relaciones generales por profesor  
relacionado_con/2 conecta a cada profesor con carrera_computacion. En esta base, la idea es marcar que todos pertenecen al contexto de Computación.

10. Sinónimos de profesores  
Esta es una de las secciones más importantes para el chatbot. sinonimo_profesor/2 relaciona alias, nombres, apellidos o apodos con un profesor específico. Así, el sistema puede reconocer búsquedas como “Alicia”, “Salazar”, “profe” o “Jean Carlo” y resolverlas hacia la persona correcta.

11. Reglas lógicas  
Estas reglas son la capa inteligente del banco de conocimiento. No guardan datos nuevos, sino que derivan respuestas a partir de los hechos.

- profesor_registrado/1 verifica si existe un profesor declarado.
- es_profesor/1 comprueba si algo está clasificado explícitamente como profesor.
- obtener_nombre_profesor/2 y obtener_correo_profesor/2 recuperan datos directos.
- buscar_profesor/2 usa sinónimos para encontrar el profesor correcto.
- buscar_nombre_por_alias/2 y buscar_correo_por_alias/2 permiten consultar por apodo o apellido.
- datos_profesor/3 devuelve nombre y correo al mismo tiempo.
- datos_profesor_por_alias/3 hace lo mismo pero usando un alias.
- profesor_de_computacion/1 confirma que el profesor pertenece al área de Computación.

En resumen, el archivo combina tres niveles: datos concretos, sinónimos para interpretar lenguaje natural y reglas para responder preguntas de forma más flexible. Si quieres, también puedo explicártelo sección por sección con ejemplos de consultas Prolog reales para cada una.
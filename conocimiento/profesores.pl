% =========================================================
% Base de conocimiento - Profesores de Computación
% Proyecto 3 - Paradigma Lógico
% =========================================================

%Eso le dice a Prolog que esos hechos pueden consultarse o incluso modificarse en tiempo de ejecución.

:- dynamic profesor/1.
:- dynamic nombre_profesor/2.
:- dynamic correo_profesor/2.
:- dynamic es_un/2.
:- dynamic concepto/2.
:- dynamic definicion/2.
:- dynamic sinonimo/2.
:- dynamic sinonimo_profesor/2.
:- dynamic sinonimo_profesores/2.
:- dynamic relacionado_con/2.
:- dynamic asociado_con/2.

% =========================================================
% 1. Conceptos y definiciones generales
%
% Esta parte guarda definiciones de términos abstractos, por ejemplo profesor,
% correo_institucional, carrera_computacion y base_conocimiento.
% Sirve para que el sistema pueda responder preguntas conceptuales,
% no solo datos concretos.
%
% =========================================================

concepto(profesor, 'Persona encargada de impartir clases, orientar estudiantes y evaluar aprendizajes.').
concepto(correo_institucional, 'Correo utilizado por una persona dentro de una institución educativa.').
concepto(carrera_computacion, 'Área académica relacionada con programación, software, datos, sistemas y tecnología.').
concepto(base_conocimiento, 'Conjunto de hechos, reglas y relaciones que un sistema lógico puede consultar.').

definicion(profesor, 'Un profesor es una persona que enseña y guía procesos de aprendizaje.').
definicion(correo_institucional, 'El correo institucional es una dirección de correo electrónico proporcionada por una institución educativa para uso académico y profesional.').
definicion(carrera_computacion, 'La carrera de computación abarca el estudio de algoritmos, estructuras de datos, programación, sistemas operativos, bases de datos, inteligencia artificial y otras áreas relacionadas con la informática.').
definicion(base_conocimiento, 'Una base de conocimiento es un sistema organizado de información que permite a un programa lógico realizar inferencias y responder preguntas basadas en hechos y reglas almacenados.').

sinonimo(profe, profesor).
sinonimo(docente, profesor).
sinonimo(maestro, profesor).
sinonimo(correo, correo_institucional).
sinonimo(email, correo_institucional).

asociado_con(profesor, ensenanza).
asociado_con(profesor, estudiante).
asociado_con(profesor, curso).
asociado_con(profesor, carrera_computacion).
asociado_con(correo_institucional, profesor).

% =========================================================
% 2. Hechos: profesores registrados
% =========================================================

profesor(alicia_salazar_hernandez).
profesor(aurelio_sanabria_rodriguez).
profesor(carlos_benavides_cespedes).
profesor(diego_mora).
profesor(ericka_solano).
profesor(erika_marin).
profesor(esteban_arias_mendez).
profesor(franco_quiros).
profesor(gerardo_nereo_campos).
profesor(herson_esquivel_vargas).
profesor(ivan_campos).
profesor(ivannia_cerdas).
profesor(jaime_solano).
profesor(jean_carlo_miranda).
profesor(jorge_vargas).
profesor(jose_navas).
profesor(rodrigo_nunez).
profesor(kenneth_obando).
profesor(kirstein_gatjens).
profesor(laura_coto).
profesor(luis_roberto_villalobos_arias).
profesor(mario_chacon).
profesor(mauricio_arroyo_herrera).
profesor(roberto_cortes).
profesor(victor_garro).
profesor(william_mata_rodriguez).
profesor(rodrigo_bogarin_navarro).
profesor(yuen_law).
profesor(jose_helo).
profesor(steven_pacheco_portuguez).
profesor(martin_flores).
profesor(juan_carlos_ortega).
profesor(mauricio_aviles_cisneros).
profesor(adriana_alvarez_figueroa).
profesor(bryan_tomas_hernandez_sibaja).
profesor(jose_helo_guzman).

% =========================================================
% 3. Hechos: nombres completos
% =========================================================

nombre_profesor(alicia_salazar_hernandez, 'Alicia Salazar Hernández').
nombre_profesor(aurelio_sanabria_rodriguez, 'Aurelio Sanabria Rodríguez').
nombre_profesor(carlos_benavides_cespedes, 'Carlos Benavides Céspedes').
nombre_profesor(diego_mora, 'Diego Mora').
nombre_profesor(ericka_solano, 'Ericka Solano').
nombre_profesor(erika_marin, 'Erika Marin').
nombre_profesor(esteban_arias_mendez, 'Esteban Arias-Méndez').
nombre_profesor(franco_quiros, 'Franco Quiros').
nombre_profesor(gerardo_nereo_campos, 'Gerardo Nereo Campos').
nombre_profesor(herson_esquivel_vargas, 'Herson Esquivel Vargas').
nombre_profesor(ivan_campos, 'Ivan Campos').
nombre_profesor(ivannia_cerdas, 'Ivannia Cerdas').
nombre_profesor(jaime_solano, 'Jaime Solano').
nombre_profesor(jean_carlo_miranda, 'Jean Carlo Miranda').
nombre_profesor(jorge_vargas, 'Jorge Vargas').
nombre_profesor(jose_navas, 'Jose Navas').
nombre_profesor(rodrigo_nunez, 'Rodrigo Núñez').
nombre_profesor(kenneth_obando, 'Kenneth Obando').
nombre_profesor(kirstein_gatjens, 'Kirstein Gatjens').
nombre_profesor(laura_coto, 'Laura Coto').
nombre_profesor(luis_roberto_villalobos_arias, 'Luis Roberto Villalobos Arias').
nombre_profesor(mario_chacon, 'Mario Chacon').
nombre_profesor(mauricio_arroyo_herrera, 'Mauricio Arroyo Herrera').
nombre_profesor(roberto_cortes, 'Roberto Cortes').
nombre_profesor(victor_garro, 'Victor Garro').
nombre_profesor(william_mata_rodriguez, 'William Mata Rodríguez').
nombre_profesor(rodrigo_bogarin_navarro, 'Rodrigo Bogarin Navarro').
nombre_profesor(yuen_law, 'Yuen Law').
nombre_profesor(jose_helo, 'José Helo').
nombre_profesor(steven_pacheco_portuguez, 'Steven Pacheco Portuguez').
nombre_profesor(martin_flores, 'Martin Flores').
nombre_profesor(juan_carlos_ortega, 'Juan Carlos Ortega').
nombre_profesor(mauricio_aviles_cisneros, 'Mauricio Aviles Cisneros').
nombre_profesor(adriana_alvarez_figueroa, 'Adriana Alvarez Figueroa').
nombre_profesor(bryan_tomas_hernandez_sibaja, 'Bryan Tomas Hernández Sibaja').
nombre_profesor(jose_helo_guzman, 'José Helo Guzmán').

% =========================================================
% 4. Hechos: correos de profesores
% =========================================================

correo_profesor(alicia_salazar_hernandez, 'asalazar@itcr.ac.cr').
correo_profesor(aurelio_sanabria_rodriguez, 'ausanabria@itcr.ac.cr').
correo_profesor(carlos_benavides_cespedes, 'prof_cbc@estudiantec.cr').
correo_profesor(diego_mora, 'dimora@itcr.ac.cr').
correo_profesor(ericka_solano, 'ersolano@itcr.ac.cr').
correo_profesor(erika_marin, 'eshuman@itcr.ac.cr').
correo_profesor(esteban_arias_mendez, 'earias@ic-itcr.ac.cr').
correo_profesor(franco_quiros, 'fquiros@itcr.ac.cr').
correo_profesor(gerardo_nereo_campos, 'gecampos@itcr.ac.cr').
correo_profesor(herson_esquivel_vargas, 'h.esquivelvargas@itcr.ac.cr').
correo_profesor(ivan_campos, 'icampos@itcr.ac.cr').
correo_profesor(ivannia_cerdas, 'ivcerdas@itcr.ac.cr').
correo_profesor(jaime_solano, 'jaimess@itcr.ac.cr').
correo_profesor(jean_carlo_miranda, 'jcmiranda@itcr.ac.cr').
correo_profesor(jorge_vargas, 'avargas@itcr.ac.cr').
correo_profesor(jose_navas, 'jnavas05@gmail.com').
correo_profesor(rodrigo_nunez, 'rodrigo.nunez@itcr.ac.cr').
correo_profesor(kenneth_obando, 'kobando@itcr.ac.cr').
correo_profesor(kirstein_gatjens, 'kgatjens@itcr.ac.cr').
correo_profesor(laura_coto, 'lsarmiento@itcr.ac.cr').
correo_profesor(luis_roberto_villalobos_arias, 'luvillalobos@itcr.ac.cr').
correo_profesor(mario_chacon, 'machacon@itcr.ac.cr').
correo_profesor(mauricio_arroyo_herrera, 'marroyo@tec.ac.cr').
correo_profesor(roberto_cortes, 'rcoter@itcr.ac.cr').
correo_profesor(victor_garro, 'algoritmos.vg3@gmail.com').
correo_profesor(william_mata_rodriguez, 'wmata@itcr.ac.cr').
correo_profesor(rodrigo_bogarin_navarro, 'rbogarin@itcr.ac.cr').
correo_profesor(yuen_law, 'ylaw@itcr.ac.cr').
correo_profesor(jose_helo, 'josehelocr@gmail.com').
correo_profesor(steven_pacheco_portuguez, 'stevenpach10@gmail.com').
correo_profesor(martin_flores, 'cflores@itcr.ac.cr').
correo_profesor(juan_carlos_ortega, 'jortega@itcr.ac.cr').
correo_profesor(mauricio_aviles_cisneros, 'maviles@itcr.ac.cr').
correo_profesor(adriana_alvarez_figueroa, 'aalvarez@itcr.ac.cr').
correo_profesor(bryan_tomas_hernandez_sibaja, 'brhernandez@itcr.ac.cr').
correo_profesor(jose_helo_guzman, 'jhelo@itcr.ac.cr').

% =========================================================
% 5. Relaciones es_un
% =========================================================

es_un(alicia_salazar_hernandez, profesor).
es_un(aurelio_sanabria_rodriguez, profesor).
es_un(carlos_benavides_cespedes, profesor).
es_un(diego_mora, profesor).
es_un(ericka_solano, profesor).
es_un(erika_marin, profesor).
es_un(esteban_arias_mendez, profesor).
es_un(franco_quiros, profesor).
es_un(gerardo_nereo_campos, profesor).
es_un(herson_esquivel_vargas, profesor).
es_un(ivan_campos, profesor).
es_un(ivannia_cerdas, profesor).
es_un(jaime_solano, profesor).
es_un(jean_carlo_miranda, profesor).
es_un(jorge_vargas, profesor).
es_un(jose_navas, profesor).
es_un(rodrigo_nunez, profesor).
es_un(kenneth_obando, profesor).
es_un(kirstein_gatjens, profesor).
es_un(laura_coto, profesor).
es_un(luis_roberto_villalobos_arias, profesor).
es_un(mario_chacon, profesor).
es_un(mauricio_arroyo_herrera, profesor).
es_un(roberto_cortes, profesor).
es_un(victor_garro, profesor).
es_un(william_mata_rodriguez, profesor).
es_un(rodrigo_bogarin_navarro, profesor).
es_un(yuen_law, profesor).
es_un(jose_helo, profesor).
es_un(steven_pacheco_portuguez, profesor).
es_un(martin_flores, profesor).
es_un(juan_carlos_ortega, profesor).
es_un(mauricio_aviles_cisneros, profesor).
es_un(adriana_alvarez_figueroa, profesor).
es_un(bryan_tomas_hernandez_sibaja, profesor).
es_un(jose_helo_guzman, profesor).

% =========================================================
% 6. Relaciones generales
% =========================================================

% esta no se si meterla o si es  muy obvia ya que solo es de computacion, pero la pongo por si acaso

relacionado_con(alicia_salazar_hernandez, carrera_computacion).
relacionado_con(aurelio_sanabria_rodriguez, carrera_computacion).
relacionado_con(carlos_benavides_cespedes, carrera_computacion).
relacionado_con(diego_mora, carrera_computacion).
relacionado_con(ericka_solano, carrera_computacion).
relacionado_con(erika_marin, carrera_computacion).
relacionado_con(esteban_arias_mendez, carrera_computacion).
relacionado_con(franco_quiros, carrera_computacion).
relacionado_con(gerardo_nereo_campos, carrera_computacion).
relacionado_con(herson_esquivel_vargas, carrera_computacion).
relacionado_con(ivan_campos, carrera_computacion).
relacionado_con(ivannia_cerdas, carrera_computacion).
relacionado_con(jaime_solano, carrera_computacion).
relacionado_con(jean_carlo_miranda, carrera_computacion).
relacionado_con(jorge_vargas, carrera_computacion).
relacionado_con(jose_navas, carrera_computacion).
relacionado_con(rodrigo_nunez, carrera_computacion).
relacionado_con(kenneth_obando, carrera_computacion).
relacionado_con(kirstein_gatjens, carrera_computacion).
relacionado_con(laura_coto, carrera_computacion).
relacionado_con(luis_roberto_villalobos_arias, carrera_computacion).
relacionado_con(mario_chacon, carrera_computacion).
relacionado_con(mauricio_arroyo_herrera, carrera_computacion).
relacionado_con(roberto_cortes, carrera_computacion).
relacionado_con(victor_garro, carrera_computacion).
relacionado_con(william_mata_rodriguez, carrera_computacion).
relacionado_con(rodrigo_bogarin_navarro, carrera_computacion).
relacionado_con(yuen_law, carrera_computacion).
relacionado_con(jose_helo, carrera_computacion).
relacionado_con(steven_pacheco_portuguez, carrera_computacion).
relacionado_con(martin_flores, carrera_computacion).
relacionado_con(juan_carlos_ortega, carrera_computacion).
relacionado_con(mauricio_aviles_cisneros, carrera_computacion).
relacionado_con(adriana_alvarez_figueroa, carrera_computacion).
relacionado_con(bryan_tomas_hernandez_sibaja, carrera_computacion).
relacionado_con(jose_helo_guzman, carrera_computacion).

% =========================================================
% 7. Sinónimos de profesores
% Incluye primer nombre, segundo nombre si aplica,
% primer apellido, segundo apellido si aplica y profe.
% =========================================================

sinonimo_profesor(alicia, alicia_salazar_hernandez).
sinonimo_profesor(salazar, alicia_salazar_hernandez).
sinonimo_profesor(hernandez, alicia_salazar_hernandez).

sinonimo_profesor(aurelio, aurelio_sanabria_rodriguez).
sinonimo_profesor(sanabria, aurelio_sanabria_rodriguez).
sinonimo_profesor(rodriguez, aurelio_sanabria_rodriguez).

sinonimo_profesor(carlos, carlos_benavides_cespedes).
sinonimo_profesor(benavides, carlos_benavides_cespedes).
sinonimo_profesor(cespedes, carlos_benavides_cespedes).

sinonimo_profesor(diego, diego_mora).
sinonimo_profesor(mora, diego_mora).

sinonimo_profesor(ericka, ericka_solano).
sinonimo_profesor(solano, ericka_solano).

sinonimo_profesor(erika, erika_marin).
sinonimo_profesor(marin, erika_marin).

sinonimo_profesor(esteban, esteban_arias_mendez).
sinonimo_profesor(arias, esteban_arias_mendez).
sinonimo_profesor(mendez, esteban_arias_mendez).

sinonimo_profesor(franco, franco_quiros).
sinonimo_profesor(quiros, franco_quiros).

sinonimo_profesor(gerardo, gerardo_nereo_campos).
sinonimo_profesor(nereo, gerardo_nereo_campos).
sinonimo_profesor(campos, gerardo_nereo_campos).

sinonimo_profesor(herson, herson_esquivel_vargas).
sinonimo_profesor(esquivel, herson_esquivel_vargas).
sinonimo_profesor(vargas, herson_esquivel_vargas).

sinonimo_profesor(ivan, ivan_campos).
sinonimo_profesor(campos, ivan_campos).

sinonimo_profesor(ivannia, ivannia_cerdas).
sinonimo_profesor(cerdas, ivannia_cerdas).

sinonimo_profesor(jaime, jaime_solano).
sinonimo_profesor(solano, jaime_solano).

sinonimo_profesor(jean, jean_carlo_miranda).
sinonimo_profesor(carlo, jean_carlo_miranda).
sinonimo_profesor(miranda, jean_carlo_miranda).
sinonimo_profesor(jean_carlo, jean_carlo_miranda).

sinonimo_profesor(jorge, jorge_vargas).
sinonimo_profesor(vargas, jorge_vargas).

sinonimo_profesor(jose, jose_navas).
sinonimo_profesor(navas, jose_navas).

sinonimo_profesor(rodrigo, rodrigo_nunez).
sinonimo_profesor(nunez, rodrigo_nunez).

sinonimo_profesor(kenneth, kenneth_obando).
sinonimo_profesor(obando, kenneth_obando).

sinonimo_profesor(kirstein, kirstein_gatjens).
sinonimo_profesor(gatjens, kirstein_gatjens).

sinonimo_profesor(laura, laura_coto).
sinonimo_profesor(coto, laura_coto).

sinonimo_profesor(luis, luis_roberto_villalobos_arias).
sinonimo_profesor(roberto, luis_roberto_villalobos_arias).
sinonimo_profesor(villalobos, luis_roberto_villalobos_arias).
sinonimo_profesor(arias, luis_roberto_villalobos_arias).
sinonimo_profesor(luis_roberto, luis_roberto_villalobos_arias).

sinonimo_profesor(mario, mario_chacon).
sinonimo_profesor(chacon, mario_chacon).

sinonimo_profesor(mauricio, mauricio_arroyo_herrera).
sinonimo_profesor(arroyo, mauricio_arroyo_herrera).
sinonimo_profesor(herrera, mauricio_arroyo_herrera).

sinonimo_profesor(roberto, roberto_cortes).
sinonimo_profesor(cortes, roberto_cortes).

sinonimo_profesor(victor, victor_garro).
sinonimo_profesor(garro, victor_garro).

sinonimo_profesor(william, william_mata_rodriguez).
sinonimo_profesor(mata, william_mata_rodriguez).
sinonimo_profesor(rodriguez, william_mata_rodriguez).

sinonimo_profesor(rodrigo, rodrigo_bogarin_navarro).
sinonimo_profesor(bogarin, rodrigo_bogarin_navarro).
sinonimo_profesor(navarro, rodrigo_bogarin_navarro).

sinonimo_profesor(yuen, yuen_law).
sinonimo_profesor(law, yuen_law).

sinonimo_profesor(jose, jose_helo).
sinonimo_profesor(helo, jose_helo).

sinonimo_profesor(steven, steven_pacheco_portuguez).
sinonimo_profesor(pacheco, steven_pacheco_portuguez).
sinonimo_profesor(portuguez, steven_pacheco_portuguez).

sinonimo_profesor(martin, martin_flores).
sinonimo_profesor(flores, martin_flores).

sinonimo_profesor(juan, juan_carlos_ortega).
sinonimo_profesor(carlos, juan_carlos_ortega).
sinonimo_profesor(ortega, juan_carlos_ortega).
sinonimo_profesor(juan_carlos, juan_carlos_ortega).

sinonimo_profesor(mauricio, mauricio_aviles_cisneros).
sinonimo_profesor(aviles, mauricio_aviles_cisneros).
sinonimo_profesor(cisneros, mauricio_aviles_cisneros).

sinonimo_profesor(adriana, adriana_alvarez_figueroa).
sinonimo_profesor(alvarez, adriana_alvarez_figueroa).
sinonimo_profesor(figueroa, adriana_alvarez_figueroa).

sinonimo_profesor(bryan, bryan_tomas_hernandez_sibaja).
sinonimo_profesor(tomas, bryan_tomas_hernandez_sibaja).
sinonimo_profesor(hernandez, bryan_tomas_hernandez_sibaja).
sinonimo_profesor(sibaja, bryan_tomas_hernandez_sibaja).
sinonimo_profesor(bryan_tomas, bryan_tomas_hernandez_sibaja).

sinonimo_profesor(jose, jose_helo_guzman).
sinonimo_profesor(helo, jose_helo_guzman).
sinonimo_profesor(guzman, jose_helo_guzman).
sinonimo_profesor(jose_helo, jose_helo_guzman).

% Agrupar alias genérico profe en una sola lista para devolver multiples resultados
sinonimo_profesores(profe, [alicia_salazar_hernandez, aurelio_sanabria_rodriguez, carlos_benavides_cespedes, diego_mora, ericka_solano, erika_marin, esteban_arias_mendez, franco_quiros, gerardo_nereo_campos, herson_esquivel_vargas, ivan_campos, ivannia_cerdas, jaime_solano, jean_carlo_miranda, jorge_vargas, jose_navas, rodrigo_nunez, kenneth_obando, kirstein_gatjens, laura_coto, luis_roberto_villalobos_arias, mario_chacon, mauricio_arroyo_herrera, roberto_cortes, victor_garro, william_mata_rodriguez, rodrigo_bogarin_navarro, yuen_law, jose_helo, steven_pacheco_portuguez, martin_flores, juan_carlos_ortega, mauricio_aviles_cisneros, adriana_alvarez_figueroa, bryan_tomas_hernandez_sibaja, jose_helo_guzman]).

% Agrupar alias genérico jose para devolver multiples resultados cuando se busque jose
sinonimo_profesores(jose, [jose_navas, jose_helo, jose_helo_guzman]).

% =========================================================
% 8. Reglas lógicas
% =========================================================

% Regla 1:
% Un profesor está registrado si existe como hecho profesor/1.
profesor_registrado(Profesor) :-
    profesor(Profesor).

% Regla 2:
% Un elemento es profesor si tiene la relación es_un con profesor.
es_profesor(Profesor) :-
    es_un(Profesor, profesor).

% Regla 3:
% Permite obtener el nombre completo de un profesor.
obtener_nombre_profesor(Profesor, Nombre) :-
    nombre_profesor(Profesor, Nombre).

% Regla 4:
% Permite obtener el correo de un profesor.
obtener_correo_profesor(Profesor, Correo) :-
    correo_profesor(Profesor, Correo).

% Regla 5:
% Permite buscar un profesor usando un sinónimo (soporta alias individuales y alias que mapean a listas).
buscar_profesor(Alias, Profesor) :-
    sinonimo_profesor(Alias, Profesor).
buscar_profesor(Alias, Profesor) :-
    sinonimo_profesores(Alias, Lista),
    member(Profesor, Lista).

% Regla 6:
% Permite buscar el nombre completo usando un alias (utiliza buscar_profesor para soportar ambos tipos de alias).
buscar_nombre_por_alias(Alias, Nombre) :-
    buscar_profesor(Alias, Profesor),
    nombre_profesor(Profesor, Nombre).

% Regla 7:
% Permite buscar el correo usando un alias (utiliza buscar_profesor para soportar alias en lista).
buscar_correo_por_alias(Alias, Correo) :-
    buscar_profesor(Alias, Profesor),
    correo_profesor(Profesor, Correo).

% Regla X:
% Devuelve una lista única de profesores que coinciden con un alias.
% Combina: sinonimos individuales, sinonimo_profesores (listas explícitas) y
% coincidencias por subcadena en el identificador (ej. 'jose' -> jose_helo).
buscar_profesores_por_alias(Alias, ListaUnica) :-
    findall(P, (
        sinonimo_profesor(Alias, P)
    ;   (sinonimo_profesores(Alias, L), member(P, L))
    ;   (profesor(P), sub_atom(P, _, _, _, Alias))
    ), Results),
    sort(Results, ListaUnica),
    ListaUnica \= [].

% Regla 8:
% Permite consultar el nombre y correo de un profesor usando su identificador.
datos_profesor(Profesor, Nombre, Correo) :-
    profesor(Profesor),
    nombre_profesor(Profesor, Nombre),
    correo_profesor(Profesor, Correo).

% Regla 9:
% Permite consultar el nombre y correo usando un alias.
datos_profesor_por_alias(Alias, Nombre, Correo) :-
    sinonimo_profesor(Alias, Profesor),
    nombre_profesor(Profesor, Nombre),
    correo_profesor(Profesor, Correo).

% Regla 10:
% Indica que un profesor pertenece al contexto de Computación si está relacionado con carrera_computacion.
profesor_de_computacion(Profesor) :-
    profesor(Profesor),
    relacionado_con(Profesor, carrera_computacion).


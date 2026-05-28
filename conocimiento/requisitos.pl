% =========================================================
% Base de conocimiento - Requisitos de cursos
% Proyecto 3 - Paradigma Lógico
% =========================================================

:- dynamic curso/1.
:- dynamic requisito/2.

% =========================================================
% 1. Conceptos y definiciones generales
% =========================================================
concepto(requisito, 'Condición necesaria para poder matricular otro curso.').
definicion(requisito, 'Un requisito es una condición que debe cumplirse para poder matricularse en un curso específico.').
sinonimo(prerequisito, requisito).

% =========================================================
% 2. Hechos: requisitos por curso
% requisito(Curso, Requisito)
% =========================================================

% ===== SEMESTRE 2 =====

requisito(comunicacion_oral, comunicacion_escrita).
requisito(ingles_1, examen_diagnostico).
requisito(ingles_1, ingles_basico).
requisito(programacion_orientada_objetos, taller_programacion).
requisito(programacion_orientada_objetos, introduccion_programacion).
requisito(estructuras_datos, fundamentos_organizacion_computadoras).
requisito(estructuras_datos, taller_programacion).
requisito(arquitectura_computadores, comunicacion_escrita).
requisito(calculo_diferencial_integral, matematica_general).
requisito(calculo_diferencial_integral, matematica_discreta).

% ===== SEMESTRE 3 =====

requisito(ingles_2, ingles_1).
requisito(analisis_algoritmos, estructuras_datos).
requisito(analisis_algoritmos, calculo_diferencial_integral).
requisito(bases_datos_1, estructuras_datos).
requisito(calculo_algebra_lineal, calculo_diferencial_integral).

% ===== SEMESTRE 4 =====

requisito(ambiente_humano, comunicacion_oral).
requisito(bases_datos_2, bases_datos_1).
requisito(lenguajes_programacion, analisis_algoritmos).
requisito(lenguajes_programacion, arquitectura_computadores).
requisito(diseno_software, requerimientos_software).
requisito(probabilidades, calculo_algebra_lineal).

% ===== SEMESTRE 5 =====

requisito(seminario_estudios_filosoficos_historicos, ambiente_humano).
requisito(administracion_proyectos, requerimientos_software).
requisito(compiladores_interpretes, lenguajes_programacion).
requisito(aseguramiento_calidad, diseno_software).
requisito(estadistica, probabilidades).

% ===== SEMESTRE 6 =====

requisito(seminario_estudios_costarricenses, seminario_estudios_filosoficos_historicos).
requisito(investigacion_operaciones, estadistica).
requisito(principios_sistemas_operativos, compiladores_interpretes).
requisito(computacion_sociedad, administracion_proyectos).
requisito(seguridad_software, administracion_proyectos).
requisito(seguridad_software, aseguramiento_calidad).

% ===== SEMESTRE 7 =====

requisito(inteligencia_artificial, compiladores_interpretes).
requisito(inteligencia_artificial, investigacion_operaciones).
requisito(redes, principios_sistemas_operativos).
requisito(proyecto_ingenieria_software, bases_datos_2).
requisito(proyecto_ingenieria_software, aseguramiento_calidad).
requisito(proyecto_ingenieria_software, seguridad_software).

% ===== SEMESTRE 8 =====

requisito(practica_profesional, desarrollo_emprendedores).
requisito(practica_profesional, centros_formacion_humanistica).
requisito(practica_profesional, electiva_1).
requisito(practica_profesional, electiva_2).
requisito(practica_profesional, inteligencia_artificial).
requisito(practica_profesional, redes).
requisito(practica_profesional, proyecto_ingenieria_software).
requisito(practica_profesional, actividad_cultural_1).
requisito(practica_profesional, actividad_deportiva_1).
requisito(practica_profesional, actividad_cultural_deportiva).

% =========================================================
% Reglas de requisitos
% =========================================================
% Obtiene todos los requisitos directos de un curso
requisitos_de(Curso, Requisitos) :-
    curso(Curso),
    findall(R, requisito(Curso, R), Requisitos).

% Verifica si un curso específico es requisito de otro
es_requisito_de(Requisito, Curso) :-
    requisito(Curso, Requisito).

% Obtiene todos los cursos para los que un curso es requisito
es_requisito_para(Requisito, Cursos) :-
    curso(Requisito),
    findall(C, requisito(C, Requisito), Cursos).

% Requisito transitivo: un curso es prerequisito indirecto de otro
% (cadena de requisitos)
requisito_transitivo(Curso, Prerequisito) :-
    requisito(Curso, Prerequisito).
requisito_transitivo(Curso, Prerequisito) :-
    requisito(Curso, Intermedio),
    requisito_transitivo(Intermedio, Prerequisito).

% Verifica si un estudiante puede matricular un curso
% dado que ya aprobó ciertos cursos
puede_matricular(Estudiante, Curso, CursosAprobados) :-
    curso(Curso),
    findall(R, requisito(Curso, R), Requisitos),
    forall(member(R, Requisitos), member(R, CursosAprobados)),
    write(Estudiante), write(' puede matricular '), write(Curso), nl.

% Obtiene los requisitos faltantes para matricular un curso
requisitos_faltantes(Curso, CursosAprobados, Faltantes) :-
    curso(Curso),
    findall(R, requisito(Curso, R), Requisitos),
    findall(R, (member(R, Requisitos), \+ member(R, CursosAprobados)), Faltantes).

% Verifica si un curso no tiene requisitos (curso de primer semestre)
sin_requisitos(Curso) :-
    curso(Curso),
    \+ requisito(Curso, _).

% Obtiene todos los cursos sin requisitos
cursos_sin_requisitos(Cursos) :-
    findall(C, sin_requisitos(C), Cursos).

% Cuenta cuántos requisitos tiene un curso
cantidad_requisitos(Curso, Cantidad) :-
    curso(Curso),
    findall(R, requisito(Curso, R), Requisitos),
    length(Requisitos, Cantidad).


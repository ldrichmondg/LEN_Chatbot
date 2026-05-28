% =========================================================
% Base de conocimiento - Correquisitos de cursos
% Proyecto 3 - Paradigma Lógico
% =========================================================
:- dynamic curso/1.
:- dynamic correquisito/2.
:- dynamic requisito/2.
:- dynamic requisitos_faltantes/3.
:- dynamic correquisitos_faltantes/3.

% =========================================================
% 1. Conceptos y definiciones generales
% =========================================================

concepto(correquisito, 'Curso que debe llevarse de forma simultánea junto a otro curso.').

definicion(correquisito, 'Un correquisito es una materia que debe matricularse en el mismo semestre que el curso al que está asociado.').

sinonimo(corequisito, correquisito).
sinonimo(curso_simultaneo, correquisito).
sinonimo(materia_paralela, correquisito).

% =========================================================
% 2. Hechos: correquisitos por curso
% correquisito(Curso, Correquisito)
% =========================================================

% ===== SEMESTRE 1 =====

correquisito(fundamentos_organizacion_computadoras, matematica_discreta).

% ===== SEMESTRE 2 =====

correquisito(estructuras_datos, programacion_orientada_objetos).

% ===== SEMESTRE 3 =====

correquisito(bases_datos_1, estructuras_datos).
correquisito(requerimientos_software, bases_datos_1).

% ===== SEMESTRE 5 =====

correquisito(aseguramiento_calidad, administracion_proyectos).

% ===== SEMESTRE 6 =====

correquisito(computacion_sociedad, seminario_estudios_costarricenses).

% ===== SEMESTRE 7 =====

correquisito(desarrollo_emprendedores, proyecto_ingenieria_software).

% =========================================================
% 2. Reglas de correquisitos
% =========================================================
% Obtiene todos los correquisitos de un curso
correquisitos_de(Curso, Correquisitos) :-
    curso(Curso),
    findall(C, correquisito(Curso, C), Correquisitos).

% Verifica si un curso específico es correquisito de otro
es_correquisito_de(Correq, Curso) :-
    correquisito(Curso, Correq).

% Obtiene todos los cursos para los que un curso es correquisito
es_correquisito_para(Correq, Cursos) :-
    curso(Correq),
    findall(C, correquisito(C, Correq), Cursos).

% Verifica si dos cursos son correquisitos mutuos
son_correquisitos_mutuos(Curso1, Curso2) :-
    correquisito(Curso1, Curso2),
    correquisito(Curso2, Curso1).

% Verifica si un estudiante cumple los correquisitos de un curso
% (debe estar matriculando el correquisito en el mismo semestre)
cumple_correquisitos(Curso, CursosMatriculados) :-
    curso(Curso),
    findall(C, correquisito(Curso, C), Correquisitos),
    forall(member(C, Correquisitos), member(C, CursosMatriculados)).

% Obtiene los correquisitos faltantes en la matrícula actual
correquisitos_faltantes(Curso, CursosMatriculados, Faltantes) :-
    curso(Curso),
    findall(C, correquisito(Curso, C), Correquisitos),
    findall(C, (member(C, Correquisitos), \+ member(C, CursosMatriculados)), Faltantes).

% Verifica si un curso no tiene correquisitos
sin_correquisitos(Curso) :-
    curso(Curso),
    \+ correquisito(Curso, _).

% Cuenta cuántos correquisitos tiene un curso
cantidad_correquisitos(Curso, Cantidad) :-
    curso(Curso),
    findall(C, correquisito(Curso, C), Correquisitos),
    length(Correquisitos, Cantidad).

% =========================================================
% 3. Reglas combinadas (requisitos + correquisitos)
% =========================================================

% Verifica si un estudiante cumple AMBAS condiciones para matricular
% un curso: tiene los requisitos aprobados y lleva los correquisitos
puede_matricular_completo(Curso, CursosAprobados, CursosMatriculados) :-
    curso(Curso),
    requisitos_faltantes(Curso, CursosAprobados, []),
    correquisitos_faltantes(Curso, CursosMatriculados, []).

% Obtiene todo lo que falta (requisitos y correquisitos) para un curso
todo_lo_faltante(Curso, CursosAprobados, CursosMatriculados, ReqFaltantes, CoreqFaltantes) :-
    curso(Curso),
    requisitos_faltantes(Curso, CursosAprobados, ReqFaltantes),
    correquisitos_faltantes(Curso, CursosMatriculados, CoreqFaltantes).

% Obtiene todos los cursos que dependen de uno dado
% (ya sea como requisito o correquisito)
cursos_que_dependen_de(Curso, Dependientes) :-
    curso(Curso),
    findall(C, (requisito(C, Curso) ; correquisito(C, Curso)), Dependientes).

% Verifica si un curso es relevante para otro
% (lo necesita como requisito O como correquisito)
es_relevante_para(Curso, OtroCurso) :-
    requisito(OtroCurso, Curso).
es_relevante_para(Curso, OtroCurso) :-
    correquisito(OtroCurso, Curso).
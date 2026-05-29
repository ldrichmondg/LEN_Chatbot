:- encoding(utf8).

% =========================================================
% Base de conocimiento - Cursos de Computación
% Proyecto 3 - Paradigma Lógico
% =========================================================

:- dynamic curso/1.
:- dynamic nombre_curso/2.
:- dynamic semestre/2.
:- dynamic es_un/2.
:- dynamic concepto/2.
:- dynamic definicion/2.
:- dynamic sinonimo/2.
:- dynamic sinonimo_curso/2.
:- dynamic relacionado_con/2.
:- dynamic asociado_con/2.

% =========================================================
% 1. Conceptos y definiciones generales
% =========================================================

concepto(curso, 'Unidad académica impartida dentro de un plan de estudios.').
concepto(semestre, 'Periodo académico en el que se agrupan cursos.').
concepto(carrera_computacion, 'Carrera relacionada con programación, software, datos y sistemas computacionales.').
concepto(programacion, 'Proceso de desarrollar soluciones mediante código.').
concepto(base_datos, 'Conjunto organizado de datos almacenados electrónicamente.').

definicion(curso, 'Un curso es una materia académica impartida durante un periodo lectivo.').
definicion(semestre, 'Un semestre representa una división temporal del plan académico.').
definicion(requisito, 'Condición necesaria para poder matricular otro curso.').
definicion(programacion_orientada_objetos, 'Paradigma de programación basado en objetos y clases.').

asociado_con(curso, carrera_computacion).
asociado_con(programacion_orientada_objetos, programacion).
asociado_con(bases_datos_1, base_datos).
asociado_con(inteligencia_artificial, programacion).

% =========================================================
% 1b. Hechos es_un: relaciones de clasificación
% =========================================================

es_un(prolog, lenguaje_programacion).
es_un(python, lenguaje_programacion).
es_un(java, lenguaje_programacion).
es_un(haskell, lenguaje_programacion).
es_un(c, lenguaje_programacion).
es_un(cpp, lenguaje_programacion).
es_un(sql, lenguaje_consulta).
es_un(html, lenguaje_marcado).
es_un(javascript, lenguaje_programacion).
es_un(ruby, lenguaje_programacion).

es_un(algoritmo, concepto_computacion).
es_un(estructura_datos, concepto_computacion).
es_un(compilador, herramienta_software).
es_un(interprete, herramienta_software).
es_un(sistema_operativo, software_base).
es_un(red_computadoras, infraestructura).
es_un(base_datos, sistema_almacenamiento).
es_un(inteligencia_artificial, area_computacion).
es_un(machine_learning, area_computacion).
es_un(ciberseguridad, area_computacion).

% =========================================================
% 1c. Hechos tiene: propiedades de categorías (para inferencia)
% =========================================================

tiene(lenguaje_programacion, sintaxis).
tiene(lenguaje_programacion, semantica).
tiene(lenguaje_programacion, compilador_o_interprete).

tiene(algoritmo, complejidad_temporal).
tiene(algoritmo, complejidad_espacial).
tiene(algoritmo, pasos_definidos).

tiene(sistema_operativo, gestion_procesos).
tiene(sistema_operativo, gestion_memoria).
tiene(sistema_operativo, sistema_archivos).

tiene(base_datos, tablas).
tiene(base_datos, indices).
tiene(base_datos, transacciones).

tiene(red_computadoras, protocolos).
tiene(red_computadoras, topologia).
tiene(red_computadoras, ancho_banda).

tiene(area_computacion, fundamentos_matematicos).
tiene(area_computacion, aplicacion_practica).

% =========================================================
% 1d. Conceptos y definiciones adicionales de CS
% =========================================================

concepto(algoritmo, 'Conjunto finito de pasos definidos para resolver un problema.').
concepto(recursividad, 'Técnica en la que una función se llama a sí misma para resolver subproblemas.').
concepto(estructura_datos, 'Forma de organizar y almacenar datos para acceso y modificación eficiente.').
concepto(compilador, 'Programa que traduce código fuente a código ejecutable.').
concepto(interprete, 'Programa que ejecuta instrucciones directamente sin compilación previa.').
concepto(paradigma_programacion, 'Estilo o enfoque fundamental de programación de computadoras.').
concepto(programacion_logica, 'Paradigma basado en lógica formal donde se declaran hechos y reglas.').
concepto(programacion_funcional, 'Paradigma que trata la computación como evaluación de funciones matemáticas.').
concepto(programacion_imperativa, 'Paradigma que describe computación como secuencia de sentencias que modifican el estado.').
concepto(inteligencia_artificial, 'Campo de la computación que desarrolla sistemas capaces de realizar tareas que requieren inteligencia humana.').
concepto(machine_learning, 'Rama de la IA que permite a los sistemas aprender de datos sin ser explícitamente programados.').
concepto(backtracking, 'Técnica algorítmica que prueba posibles soluciones y retrocede al encontrar un camino sin solución.').
concepto(unificacion, 'Proceso en lógica que encuentra sustituciones que hacen dos términos idénticos.').
concepto(polimorfismo, 'Capacidad de un objeto de tomar diferentes formas según el contexto de uso.').
concepto(herencia, 'Mecanismo de POO que permite que una clase adquiera propiedades y métodos de otra.').
concepto(encapsulamiento, 'Principio de POO que oculta los detalles internos de un objeto.').
concepto(abstraccion, 'Proceso de simplificar sistemas complejos enfocándose en aspectos esenciales.').
concepto(modularidad, 'Principio de diseño que divide un sistema en componentes independientes.').
concepto(complejidad_algoritmica, 'Medida de los recursos (tiempo o espacio) requeridos por un algoritmo.').
concepto(big_o, 'Notación que describe el comportamiento del tiempo de ejecución en el peor caso.').
concepto(grafo, 'Estructura de datos compuesta por nodos y aristas que los conectan.').
concepto(arbol, 'Estructura de datos jerárquica con un nodo raíz y subárboles de hijos.').
concepto(pila, 'Estructura de datos LIFO: el último en entrar es el primero en salir.').
concepto(cola, 'Estructura de datos FIFO: el primero en entrar es el primero en salir.').
concepto(lista_enlazada, 'Estructura de datos donde cada elemento apunta al siguiente.').
concepto(hash_table, 'Estructura de datos que mapea claves a valores mediante una función hash.').
concepto(criptografia, 'Disciplina que estudia técnicas para proteger información mediante cifrado.').
concepto(protocolo, 'Conjunto de reglas que regulan la comunicación entre sistemas.').
concepto(api, 'Interfaz de programación de aplicaciones que permite comunicación entre sistemas.').
concepto(http, 'Protocolo de transferencia de hipertexto usado en la web.').
concepto(tcp_ip, 'Conjunto de protocolos fundamentales de comunicación en Internet.').

definicion(algoritmo, 'Un algoritmo es una secuencia finita, ordenada y no ambigua de pasos para resolver un problema.').
definicion(recursividad, 'La recursividad es una técnica donde una función se invoca a sí misma, reduciendo el problema hasta un caso base.').
definicion(compilador, 'Un compilador es un programa que transforma código fuente escrito en un lenguaje de alto nivel a código de máquina o código intermedio.').
definicion(interprete, 'Un intérprete ejecuta el código fuente directamente, instrucción por instrucción, sin producir un ejecutable previo.').
definicion(inteligencia_artificial, 'La IA es la rama de la computación que estudia cómo crear sistemas capaces de realizar tareas que normalmente requieren inteligencia humana, como aprendizaje, razonamiento y percepción.').
definicion(machine_learning, 'El aprendizaje automático es un subcampo de la IA donde los sistemas mejoran su rendimiento a través de la experiencia, sin ser programados explícitamente para cada tarea.').
definicion(backtracking, 'El backtracking es una estrategia algorítmica que explora todas las posibles soluciones retrocediendo cuando se llega a un estado que no puede conducir a una solución válida.').
definicion(prolog, 'Prolog es un lenguaje de programación lógica basado en la lógica de predicados de primer orden, donde se definen hechos y reglas, y el sistema responde preguntas mediante resolución y backtracking.').

% =========================================================
% 2. Hechos: cursos registrados
% =========================================================

% ===== SEMESTRE 0 =====

curso(examen_diagnostico).
curso(ingles_basico).
curso(matematica_general).

% ===== SEMESTRE 1 =====

curso(comunicacion_escrita).
curso(fundamentos_organizacion_computadoras).
curso(introduccion_programacion).
curso(taller_programacion).
curso(matematica_discreta).
curso(actividad_cultural_1).

% ===== SEMESTRE 2 =====

curso(comunicacion_oral).
curso(ingles_1).
curso(centros_formacion_humanistica).
curso(estructuras_datos).
curso(programacion_orientada_objetos).
curso(arquitectura_computadores).
curso(calculo_diferencial_integral).
curso(actividad_deportiva_1).

% ===== SEMESTRE 3 =====

curso(ingles_2).
curso(analisis_algoritmos).
curso(bases_datos_1).
curso(requerimientos_software).
curso(calculo_algebra_lineal).
curso(actividad_cultural_deportiva).

% ===== SEMESTRE 4 =====

curso(ambiente_humano).
curso(bases_datos_2).
curso(lenguajes_programacion).
curso(diseno_software).
curso(probabilidades).

% ===== SEMESTRE 5 =====

curso(seminario_estudios_filosoficos_historicos).
curso(administracion_proyectos).
curso(compiladores_interpretes).
curso(aseguramiento_calidad).
curso(estadistica).

% ===== SEMESTRE 6 =====

curso(seminario_estudios_costarricenses).
curso(electiva_1).
curso(investigacion_operaciones).
curso(principios_sistemas_operativos).
curso(computacion_sociedad).
curso(seguridad_software).

% ===== SEMESTRE 7 =====

curso(desarrollo_emprendedores).
curso(electiva_2).
curso(inteligencia_artificial).
curso(redes).
curso(proyecto_ingenieria_software).

% ===== SEMESTRE 8 =====
curso(practica_profesional).

% ===== ELECTIVAS =====

curso(criptografia).
curso(almacenes_datos_procesamiento_olap).
curso(introduccion_analisis_datos).
curso(introduccion_desarrollo_paginas_web).
curso(desarrollo_videojuegos).
curso(sistemas_informacion_geografica).
curso(visualizacion_informacion).
curso(introduccion_reconocimiento_patrones).
curso(programacion_logica).
curso(componentes_comunicaciones).
curso(proteccion_seguridad_computacion).
curso(desarrollo_aplicaciones_dispositivos_moviles).
curso(analisis_numerico).
curso(introduccion_computacion_paralela).
curso(innovacion_creatividad).
curso(simulacion_sistemas_naturales).
curso(introduccion_biologia_molecular_computacional).
curso(introduccion_graficos_computador).
curso(recuperacion_informacion_textual).

% =========================================================
% 3. Hechos: nombres de cursos
% =========================================================

nombre_curso(examen_diagnostico, 'Examen Diagnóstico').
nombre_curso(ingles_basico, 'Inglés Básico').
nombre_curso(matematica_general, 'Matemática General').

nombre_curso(comunicacion_escrita, 'Comunicación Escrita').
nombre_curso(fundamentos_organizacion_computadoras, 'Fundamentos de Organización de Computadoras').
nombre_curso(introduccion_programacion, 'Introducción a la Programación').
nombre_curso(taller_programacion, 'Taller de Programación').
nombre_curso(matematica_discreta, 'Matemática Discreta').
nombre_curso(actividad_cultural_1, 'Actividad Cultural I').

nombre_curso(comunicacion_oral, 'Comunicación Oral').
nombre_curso(ingles_1, 'Inglés I').
nombre_curso(centros_formacion_humanistica, 'Centros de Formación Humanística').
nombre_curso(estructuras_datos, 'Estructuras de Datos').
nombre_curso(programacion_orientada_objetos, 'Programación Orientada a Objetos').
nombre_curso(arquitectura_computadores, 'Arquitectura de Computadores').
nombre_curso(calculo_diferencial_integral, 'Cálculo Diferencial e Integral').
nombre_curso(actividad_deportiva_1, 'Actividad Deportiva I').

nombre_curso(ingles_2, 'Inglés II').
nombre_curso(analisis_algoritmos, 'Análisis de Algoritmos').
nombre_curso(bases_datos_1, 'Bases de Datos I').
nombre_curso(requerimientos_software, 'Requerimientos de Software').
nombre_curso(calculo_algebra_lineal, 'Cálculo y Álgebra Lineal').
nombre_curso(actividad_cultural_deportiva, 'Actividad Cultural-Deportiva').

nombre_curso(ambiente_humano, 'Ambiente Humano').
nombre_curso(bases_datos_2, 'Bases de Datos II').
nombre_curso(lenguajes_programacion, 'Lenguajes de Programación').
nombre_curso(diseno_software, 'Diseño de Software').
nombre_curso(probabilidades, 'Probabilidades').

nombre_curso(seminario_estudios_filosoficos_historicos, 'Seminario de Estudios Filosóficos Históricos').
nombre_curso(administracion_proyectos, 'Administración de Proyectos').
nombre_curso(compiladores_interpretes, 'Compiladores e Intérpretes').
nombre_curso(aseguramiento_calidad, 'Aseguramiento de la Calidad del Software').
nombre_curso(estadistica, 'Estadística').

nombre_curso(seminario_estudios_costarricenses, 'Seminario de Estudios Costarricenses').
nombre_curso(electiva_1, 'Electiva I').
nombre_curso(investigacion_operaciones, 'Investigación de Operaciones').
nombre_curso(principios_sistemas_operativos, 'Principios de Sistemas Operativos').
nombre_curso(computacion_sociedad, 'Computación y Sociedad').
nombre_curso(seguridad_software, 'Seguridad del Software').

nombre_curso(desarrollo_emprendedores, 'Desarrollo de Emprendedores').
nombre_curso(electiva_2, 'Electiva II').
nombre_curso(inteligencia_artificial, 'Inteligencia Artificial').
nombre_curso(redes, 'Redes').
nombre_curso(proyecto_ingenieria_software, 'Proyecto de Ingeniería de Software').

nombre_curso(practica_profesional, 'Práctica Profesional').

nombre_curso(criptografia, 'Criptografía').
nombre_curso(almacenes_datos_procesamiento_olap, 'Almacenes de Datos y Procesamiento OLAP').
nombre_curso(introduccion_analisis_datos, 'Introducción al Análisis de Datos').
nombre_curso(introduccion_desarrollo_paginas_web, 'Introducción al Desarrollo de Páginas Web').
nombre_curso(desarrollo_videojuegos, 'Desarrollo de Videojuegos').
nombre_curso(sistemas_informacion_geografica, 'Sistemas de Información Geográfica').
nombre_curso(visualizacion_informacion, 'Visualización de Información').
nombre_curso(introduccion_reconocimiento_patrones, 'Introducción al Reconocimiento de Patrones').
nombre_curso(programacion_logica, 'Programación Lógica').
nombre_curso(componentes_comunicaciones, 'Componentes de Comunicaciones').
nombre_curso(proteccion_seguridad_computacion, 'Protección y Seguridad en Computación').
nombre_curso(desarrollo_aplicaciones_dispositivos_moviles, 'Desarrollo de Aplicaciones de Dispositivos Móviles').
nombre_curso(analisis_numerico, 'Análisis Numérico').
nombre_curso(introduccion_computacion_paralela, 'Introducción a la Computación Paralela').
nombre_curso(innovacion_creatividad, 'Innovación y Creatividad').
nombre_curso(simulacion_sistemas_naturales, 'Simulación de Sistemas Naturales').
nombre_curso(introduccion_biologia_molecular_computacional, 'Introducción a la Biología Molecular Computacional').
nombre_curso(introduccion_graficos_computador, 'Introducción a los Gráficos por Computadora').
nombre_curso(recuperacion_informacion_textual, 'Recuperación de Información Textual').

sinonimo(materia, curso).
sinonimo(asignatura, curso).
sinonimo(clase, curso).
sinonimo(poo, programacion_orientada_objetos).
sinonimo(ia, inteligencia_artificial).
sinonimo(ai, inteligencia_artificial).
sinonimo(ap, administracion_proyectos).
sinonimo(arqui, arquitectura_computadores).
sinonimo(foc, fundamentos_organizacion_computadoras).
sinonimo(funda, fundamentos_organizacion_computadoras).
sinonimo(cdi, calculo_diferencial_integral).
sinonimo(cal, calculo_algebra_lineal).
sinonimo(lenguajes, lenguajes_programacion).
sinonimo(io, investigacion_operaciones).
sinonimo(compi, compiladores_interpretes).
sinonimo(so, principios_sistemas_operativos).
sinonimo(bd, base_datos).
sinonimo(db, base_datos).
sinonimo(bd1, bases_datos_1).
sinonimo(bd2, bases_datos_2).
sinonimo(ed, estructuras_datos).
sinonimo(practica, practica_profesional).
sinonimo(proyecto, proyecto_ingenieria_software).
sinonimo(segu, seguridad_software).
sinonimo(ciber, seguridad_software).
sinonimo(discreta, matematica_discreta).
sinonimo(general, matematica_general).
sinonimo(comu_oral, comunicacion_oral).
sinonimo(comu_escrita, comunicacion_escrita).
sinonimo(seminario, seminario_estudios_filosoficos_historicos).
sinonimo(seminario, seminario_estudios_costarricenses).
sinonimo(humanistica, centros_formacion_humanistica).
sinonimo(cripto, criptografia).

% =========================================================
% 4. Reglas lógicas (simétricas a `profesores.pl`)
% =========================================================

% Un curso está registrado si existe como hecho curso/1.
curso_registrado(Curso) :-
	curso(Curso).

% Un elemento es curso si tiene la relación es_un con curso.
es_curso(Curso) :-
	es_un(Curso, curso).

% Permite obtener el nombre legible de un curso.
obtener_nombre_curso(Curso, Nombre) :-
	nombre_curso(Curso, Nombre).

% Permite buscar un curso usando un sinónimo específico.
buscar_curso(Alias, Curso) :-
	sinonimo_curso(Alias, Curso).

% Permite buscar el nombre del curso usando un alias.
buscar_nombre_curso_por_alias(Alias, Nombre) :-
	buscar_curso(Alias, Curso),
	nombre_curso(Curso, Nombre).

% Permite consultar datos del curso (nombre y semestre) si existe `semestre/2`.
datos_curso(Curso, Nombre, Semestre) :-
	curso(Curso),
	nombre_curso(Curso, Nombre),
	semestre(Curso, Semestre).

% Permite consultar nombre y semestre usando un alias.
datos_curso_por_alias(Alias, Nombre, Semestre) :-
	buscar_curso(Alias, Curso),
	nombre_curso(Curso, Nombre),
	semestre(Curso, Semestre).
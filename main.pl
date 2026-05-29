% =========================================================
% Archivo principal del chatbot
% Proyecto 3 - Paradigma Logico
% =========================================================

% Predicados compartidos por varios archivos de conocimiento.
:- dynamic concepto/2.
:- dynamic definicion/2.
:- dynamic sinonimo/2.
:- dynamic es_un/2.
:- dynamic tiene/2.
:- dynamic relacionado_con/2.
:- dynamic asociado_con/2.
:- dynamic requisito/2.
:- dynamic correquisito/2.
:- dynamic curso/1.
:- dynamic profesor/1.

:- multifile concepto/2.
:- multifile definicion/2.
:- multifile sinonimo/2.
:- multifile es_un/2.
:- multifile tiene/2.
:- multifile relacionado_con/2.
:- multifile asociado_con/2.
:- multifile requisito/2.
:- multifile correquisito/2.
:- multifile curso/1.
:- multifile profesor/1.

% Base de conocimiento.
:- consult('conocimiento/cursos.pl').
:- consult('conocimiento/requisitos.pl').
:- consult('conocimiento/correquisitos.pl').
:- consult('conocimiento/profesores.pl').

% Logica del chatbot.
:- consult('chatbot/utilidades.pl').
:- consult('chatbot/aprendizaje.pl').
:- consult('chatbot/respuestas.pl').
:- consult('chatbot/procesador.pl').
:- consult('chatbot/interfaz.pl').

% Predicado principal expuesto al usuario.
iniciar_chatbot :-
    iniciar_interfaz.

% Para ejecutar:
% swipl -s main.pl
% ?- iniciar_chatbot.

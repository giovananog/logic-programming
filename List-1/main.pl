% ------------------------------------------------------------------------------------
% ex 1
analisa_lista([]) :- write('A lista esta vazia').
analisa_lista([A|B]) :- write('A cabeca da lista eh: '), write(A), nl,
                        write('A cauda da lista eh: '), write(B), nl.



% ------------------------------------------------------------------------------------
% ex 2

pertence(X,[X|_]). 
pertence(X,[_|B]) :- pertence(X,B). 

remove_duplicados([], []).
remove_duplicados([A|B], L) :- pertence(A, B), remove_duplicados(B, L).
remove_duplicados([A|B], [A|L]) :- not(pertence(A, B)), remove_duplicados(B, L).




% ------------------------------------------------------------------------------------
% ex 3

troca([], _, _, []).
troca([A|B], A, Y, [Y|L]) :- troca(B, A, Y, L).
troca([A|B], X, Y, [A|L]) :- troca(B, X, Y, L).


% ------------------------------------------------------------------------------------
%ex 4



oc(_,[],0).
oc(A,[A|B],R) :- R1 is R + 1, oc(A,B,R1).
oc(A,[_|B],R) :- oc(A,B,R).



% ------------------------------------------------------------------------------------
% ex 5
mais_longa([],_).
mais_longa([_|B],[_|C]) :- mais_longa(B,C).





% ------------------------------------------------------------------------------------
% ex 6
distancia((X,Y),(X1,Y1),R) :- R is sqrt(((X1-X)*(X1-X))+((Y1-Y)*(Y1-Y))).




% ------------------------------------------------------------------------------------
% ex 7

escreve(0,_) :- nl. 
escreve(X,Y) :- write(Y), X1 is X-1, escreve(X1,Y).

quadrado(X,Y) :- quadrado(X,X,Y).
quadrado(_,0,_) :- nl.
quadrado(X,X1,Y) :- escreve(X,Y), X2 is X1-1, quadrado(X,X2,Y).



% ------------------------------------------------------------------------------------
% ex 8
n([A|_],1,A).
n([_|R],N,X) :- N1 is N-1, n(R,N1,X).



% ------------------------------------------------------------------------------------
% ex 9
soma([],0).
soma([A|B],X) :- soma(B,X1), X is X1 + A.

num([_],1).
num([_|B],X) :- num(B,X1), X is X1+1.

media(X,V) :- soma(X,S), num(X,T), V is S/T.





% ------------------------------------------------------------------------------------
% ex 10 
minimo([X],X).
minimo([A|T],A) :- minimo(T,B), B >= A.
minimo([A|T],B) :- minimo(T,B), B < A.




% ------------------------------------------------------------------------------------
% ex 11
intervalo(X,X,[X]).
intervalo(X,Y,[]) :- X > Y.
intervalo(X,Y,[X|R]) :- X1 is X+1, intervalo(X1,Y,R).





% ------------------------------------------------------------------------------------
% ex 12




% ------------------------------------------------------------------------------------
% ex 13

ocorrencia(_,[],0).
ocorrencia(X,[X|R],A) :- ocorrencia(X,R,A1), A is A1+1.
ocorrencia(X,[_|R],A) :- ocorrencia(X,R,A).




% ------------------------------------------------------------------------------------
% ex 14


div(X,Y) :- div(X,X,Y).
div(_,1,[1]).
div(X,X1,Y) :- (X mod X1) =\= 0, X2 is X1-1, div(X,X2,Y).
div(X,X1,[X1|Y]) :- (X mod X1) =:= 0, X2 is X1-1, div(X,X2,Y).



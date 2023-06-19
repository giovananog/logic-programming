sudoku(S) :- resolve(S), mostraSolucao(S).

resolve(S) :- 
    resolveLinhas(S),
    resolveColunas(S),
    resolveQuadros(S).

resolveLinhas([]) :- !.
resolveLinhas([A|B]) :- diferente(A), resolveLinhas(B).

resolveColunas([[],[],[],[]]) :- !.
resolveColunas([[A|B], [C|D], [E|F], [G|H]]) :- diferente([A,C,E,G]), resolveColunas([B,D,F,H]).

resolveQuadros([[],[],[],[]]) :- !.
resolveQuadros([[],[], A, B]) :- resolveQuadros([A,B,[],[]]).
resolveQuadros([[A,B|C], [D,E|F], G, H]) :- diferente([A,B,D,E]), resolveQuadros([C,F,G,H]).

diferente([A, B, C, D]) :- 
   num(A), num(B), num(C), num(D), 
   A\=B, A\=C, A\=D, B\=C, B\=D, C\=D.

num(1).
num(2).
num(3).
num(4).

mostraSolucao([]):- !.
mostraSolucao([A|B]) :- 
    mostraLinha(A), nl, mostraSolucao(B).

mostraLinha([]) :- !.
mostraLinha([A|B]) :- 
    write(A), write(' '), mostraLinha(B).

%   Exemplo de consulta:
%   -------------------
%?- sudoku([[4,_,_,_],[_,3,_,_],[_,_,1,_],[_,1,_,2]]).

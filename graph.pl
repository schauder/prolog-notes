section(X) :-
  integer(X),
  X < 400,
  X > 0.

con(1, 2).
con(1, 3).
con(3, 4).
con(4, 5).

is_path([X, Y]) :-
  con(X, Y).

is_path([X|[Y|YS]]) :-
  con(X, Y),
  is_path([Y|YS]).

path(A, B, [A, B]) :-
  con(A, B).
  
path(A, B, [A | [X | XS]]) :-
  not(A = X),
  not(member(X, XS)),
  con(A, X),
  path(X, B, [X|XS]).

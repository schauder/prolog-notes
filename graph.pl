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

path(A, B, [X]) :-
  con(A, B),
  X = con(A, B).

path(A, B, [X | XS]) :-
  X = con(A, M),
  not(member(X, XS)),
  path(M, B, XS).

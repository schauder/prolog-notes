
con(1, 2).
con(1, 3).
con(3, 4).
con(4, 5).

is_path([X, Y]) :-
  con(X, Y).

is_path([X|[Y|YS]]) :-
  con(X, Y),
  is_path([Y|YS]).

path(A, B, []) :-
  con(A, B).

path(A, C, [X | XS]) :-
  X = con(A, B),
  con(A, B),
  path(B, C, XS),
  not(member(X, XS)).

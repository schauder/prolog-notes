my_last(X, [X]).

my_last(X, [Y|YS]) :-
  my_last(X, YS).

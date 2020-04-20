% The last element of a list with a single element is that element.
% The last element of a longer list is the same as the last element of an empty list.

my_last(X, [X]).

my_last(X, [_|YS]) :-
  my_last(X, YS).


:- begin_tests(problems_99_1_last_element_of_a_list).

test(empty_list, fail) :-
  my_last(_, []).

test(full_list, true(X = e), nodet) :-
  my_last(X, [b, c, d, e]).

test(finds_lists_with_trailing_constant, true(L = [_, _, _, a]), nodet) :-
  length(L, 4),
  my_last(a, L).

:- end_tests(problems_99_1_last_element_of_a_list).

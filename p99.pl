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

% The second to last element of a two element list is the head element.
% The second to last element of a longer list is the second to last element of the list without the head

second_to_last(X, [X,_]).

second_to_last(X, [_|YS]) :-
  second_to_last(X, YS).

:- begin_tests(problems_99_2_second_to_last).

test(empty_list, fail) :-
  second_to_last(_, []).

test(single_element_list, fail) :-
  second_to_last(_, [a]).

test(two_element_list, true(X = a), nodet) :-
  second_to_last(X, [a, b]).

test(finds_lists_with_second_to_last_constant, true(L = [_, _, a, b]), nodet) :-
  length(L, 4),
  second_to_last(a, L).

:- end_tests(problems_99_2_second_to_last).

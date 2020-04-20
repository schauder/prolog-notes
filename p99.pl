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

% The first element of a one element list is the element.
% The n-th element of a longer list is the n-1 element of a list without the head.
% Easy.

element_at(X, [X], 1).

:- begin_tests(problems_99_3_element_at).

test(empty_list, fail) :-
  element_at(_, [], _).

test(single_element_list, X = a) :-
  element_at(X, [a], 1).

test(single_element_list_multi_modal, Y = [X,X], nodet) :-
    element_at(X, Y, _).

:- end_tests(problems_99_3_element_at).

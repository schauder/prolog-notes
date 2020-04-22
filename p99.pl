% The last element of a list with a single element is that element.
% The last element of a longer list is the same as the last element of an empty list.

my_last(X, [X]).

my_last(X, [_|YS]) :-
  my_last(X, YS).


:- begin_tests(problems_99_1_last_element_of_a_list).

test(empty_list, fail) :-
  my_last(_, []).

test(full_list, true(X = e)) :-
  my_last(X, [b, c, d, e]).

test(finds_lists_with_trailing_constant, true(L = [_, _, _, a])) :-
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

test(two_element_list, true(X = a)) :-
  second_to_last(X, [a, b]).

test(finds_lists_with_second_to_last_constant, true(L = [_, _, a, b])) :-
  length(L, 4),
  second_to_last(a, L).

:- end_tests(problems_99_2_second_to_last).

% The first element of a one element list is the element.
% The n-th element of a longer list is the n-1 element of a list without the head if n > 0.

element_at(X, [X|_], 1).
element_at(X, [_|T], N) :-
  N > 0,
  M is N-1,
  element_at(X, T, M).

:- begin_tests(problems_99_3_element_at).

test(empty_list, fail) :-
  element_at(_, [], _).

test(single_element_list, true(X = a)) :-
  element_at(X, [a], 1).

test(single_element_list_multi_modal, true(Y = [X])) :-
  element_at(X, Y, _).

test(single_element_list, true(X = b)) :-
  element_at(X, [a, b, c], 2).

:- end_tests(problems_99_3_element_at).

% the number of elements of an empty list is 0.
% the number of elements of a longer list is 1 + number of elements of the list without its head.

number_of_elements([], 0).

number_of_elements([_|T], N) :-
  number_of_elements(T, M),
  N is M + 1.


:- begin_tests(problems_99_4_number_of_elements).

test(empty_list, true(X=0)) :-
  number_of_elements([], X).

test(empty_list_modal, true(X = [])) :-
  number_of_elements(X, 0).

test(long_list, true(X = 3)) :-
  number_of_elements([a, b, c], X).

:- end_tests(problems_99_4_number_of_elements).

% the reverse of a list is the with 1 element or less is the list itself.
% two longer lists are the reverse of each other if
% the reverse of the tail of the first list prepended with the Head of the first list.


my_reverse(L, R) :-
    my_reverse_(L, [], R).

my_reverse_([], R, R) :- !.
my_reverse_([H|T], Acc, R) :-
    my_reverse_(T, [H|Acc], R).



:- begin_tests('99 problems no 5 revers').

test('empty list', true(X=[])) :-
  my_reverse([], X).

test('single element list', true(X = [a])) :-
  my_reverse([a], X).

test('long list', true(X = [c, b, a])) :-
  my_reverse([a, b, c], X).

test('long list', true(X = [c, b, a])) :-
  my_reverse(X, [a, b, c]).

:- end_tests('99 problems no 5 revers').

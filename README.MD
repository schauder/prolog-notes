### Simple values.

Simple values start with a lower case letter. 

```
a
alpha
```

_Note: They must NOT start with an `_`._

### Lists.

Lists get denoted by their elements enclosed in `[]`.

```
[a, b, c]
```

You can also denote lists by combining head and tail separated by `|`. These must still be enclosed in `[]`

```
[X|XS]
```

### The order of things matters.

Example, consider this path finding algorithm:

```
con(1, 2).
con(1, 3).
con(3, 4).
con(4, 5).

path(A, B, []) :-
  con(A, B).

path(A, C, [X | XS]) :-
  X = con(A, B),
  not(member(X, XS)),
  path(B, C, XS).
```
Everything works as expected as long as I don’t specify a variable for the third argument. E.g.:

```
?- path(Y, X, [con(1,3), con(3, 4)]).
Y = 1,
X = 5 .
```
But
```
path(1, 5, X) 
```
Doesn't find a solution.

changing the order of things in the last rule to:

```
path(A, C, [X | XS]) :-
  X = con(A, B),
  path(B, C, XS),
  not(member(X, XS)).
```

Works better.
Explanation: In the first version `XS` isn't bound yet.
So `member(X, XS)` is basically: does there exist a list which contains `X`? With `X`. The answer to this is yes: The lists with `X` as it's first element, the lists with `X` as second element, and so on.
But this makes `not(member(X, XS))` `false`. Therefore this rule does not match any arguments where the last argument is not bound.

With the inverted order `X` and `XS` get bound to something before the test for `member(X, XS)` gets evaluated. Therefore at this point it might actually fail and the negation therefore succeed.

### Deconstructors don't bind variables

From the example above still doesn't work as intended. 
```
path(A, C, [X | XS]) :-
  X = con(A, B),
  path(B, C, XS),
  not(member(X, XS)).
```
See this query:
```
?- path(1, 5, X).
X = [con(1, 4)] ;
```
It looks good at first sight. 
Until you realize `con(1, 4)` is not `true`

```
  X = con(A, B),
```

Does not bind the newly introduced variable to anything, nor does it check if it can be bound to anything.
For this one needs an extra `con(A, B)`.
The `con` in `X = con(A, B),` has nothing to do with the facts stated as `con(1, 2)` and so on.
We can replace the line with `X = go(A, B),`

The complete program now looks like this:

```
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
```

### TODO.
 * get a better understanding of the terms "unification" and "matching". I'm not using them correctly.
 

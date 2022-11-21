
# permutation
Demonstrates forming permuations for list of items.

## Running main function
Main function takes one argument (N) that is used as upper limit for list of numbers (list of integeres from 1 to N).
Output is list containing list of all permutations and number permutations.

Example:

```
funla -args="2" permutate.fnl
```

Output:

```
list('
list(
        list(
                1
                2
        )
        list(
                2
                1
        )
)', 2)
```

## Running tests
Implementation (**permutation/permutate.fnl**) contains also built-in tests for permutations.
Tests are executed by calling **test** procedure in **permutation/permutate.fnl**.

Executing tests:

```
funla -name=test permutate.fnl
```

Output:

```
'PASSED'
```


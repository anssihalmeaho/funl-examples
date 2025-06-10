
# Composed function pipe example
This example shows how implement function which composes pipe of functions.
One composed function is returned which contain nested function calls.
Nested calls are composed by **compose** function which recursively constructs
this call chain from given list of functions.

**Note.** same could be done by using standard library function **stdfu.pipe**
but this example is just for demonstrating how to compose function pipe recursively.

## Run example
Example code shows how composite function chains following functions for
processing input list:

1. filtering out values which are not type of __int__
2. choosing only even values to list
2. calculating sum of values

Run example:

```
funla composed.fnl
```

Output is like:

```
'
list(
        10
        18
        0
)'
```


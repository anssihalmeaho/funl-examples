
# Partial application
This example demonstrates how to make **partial function application**.

# What is partial application ?
Partial application refers to the process of fixing a number of arguments of a function, producing another function of smaller arity.
Intuitively, partial function application says "if you fix the first arguments of the function, you get a function of the remaining arguments".

# Example
In this example there's **sum** function which gives sum of two numbers (given as arguments).
Then **increment** function is implemented as partial application of **sum** function.
That is made by creating closure in which one argument is bound to value 1.

## Running an example

```
funla partial.fnl
```

Output:

```
10
```


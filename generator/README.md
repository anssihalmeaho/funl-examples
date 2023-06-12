
# Generator
This example demonstrates concept of **generator**.
Generator is object that generates sequence of values on-need basis.
When creating generator (**new-generator** function) generating function
is given as argument. That function receives last generated value as argument
and returns next value based on that.
Also initial value is given to **new-generator** function as argument.

Generator object is **map** which consists following named functions (methods):

* 'take'
* 'take-while'

Generator support inductive way of defining sequence of values (giving
initial value and concluding next value based on previous value).
It's possible to kind of define "infinite sequences" that way.
It's also demonstrating kind of **lazy evaluation** as values are
generated only when needed.

## 'take' method
'take' method generates given amount of values from sequence
(amount is given as argument).
It returns list of two things:

1. sequence of values as **list**
2. next generator (object/map) value

## 'take-while' method
'take-while' method generates sequence of values as long as
condition function (given as argument) returns **true** for next value.

## Running an example
Example generator generates int values by incrementing previous with 5.
Three lists are generated from it.

Run example:

```
funla generator.fnl
```

Output:

```
list(list(5, 10, 15, 20), list(25, 30, 35, 40, 45), list(50, 55, 60, 65, 70, 75, 80, 85, 90, 95))
```


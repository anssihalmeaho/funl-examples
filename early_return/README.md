
# Early return demontration
This example demonstrates how "early return" -model of programming can be used with **FunL** language.

## What is "early return" model ?
Early return -model is the way of writing functions or procedures so that the expected positive result is returned
at the end of the function/procedures and the rest of the code terminates the execution (returns) when conditions are not met.

In some cases for example checking validity of arguments can be considered as sequence of validation steps
after which the actual function logic is applied.
Sometimes deeply nested if -conditions would not be very readable.

In procedures similar approach could be achieved by using **try**/**tryl** operators so that early return
would be made by using **error** operator. Anyway, this would be more inefficient way and also using try/tryl is meant
to be mainly for such error handling in which execution flow cannot be continued.
Also it cannot be used for functions (only for procedures).

## Using cond -operator
Early return -kind of behaviour can be simulated by using **cond** operator.
Several conditions are checked and if any of those is met (in order) then related
value is returned. If none of conditions was met then evaluation continues in default branch of cond -operator.
Typically default branch would be call to anonymous function/procedure value.

## Running an example
Example (**early_return/early_ret.fnl**) demonstrates function which calculates sum of two arguments.
First there are validations which check that arguments are of int -type and
if not then early return is made with error list (_list(false 'error text' 'no value')_).
If validations were ok then result is list of _list(true '' sum-value:int)_

Run example:

```
funla early_return/early_ret.fnl
```

Output:

```
'
Results from sum-of with early return validations:

list(
        list(
                false
                '1st arg not int (string)'
                'no value'
        )
        list(
                false
                '2nd arg not int (string)'
                'no value'
        )
        list(
                true
                ''
                100
        )
)'
```


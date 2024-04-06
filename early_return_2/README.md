# Early return demonstration
These examples demonstrate how "early return" -model of programming can be used with **FunL** language.
There's earlier example for same: [early_return](https://github.com/anssihalmeaho/funl-examples/tree/main/early_return).

## First example: early_ret_2.fnl
First example (**early_ret_2.fnl**) shows further how to define some symbols inside **cond** -operator call by using **let** -operator.
This is useful as sometimes there are several conditions which need to see shared symbols.

Idea is to have such expression as part of multiway condition (cond) so that it always evaluates to **false**
(doesn't trigger condition) but also calls **let** -operator to set value for symbol in current scope.

## Second example: early_ret_3.fnl
Second example is similar to first one but with difference that it shows how let -definitons
can be used only inside existing conditions.
That way there's no need have separate conditions for setting symbols, that is sometimes
more simple but sometimes it might be more clear to have symbols setting separately.

## Running an example: early_ret_2.fnl
Example (**early_return_2/early_ret_2.fnl**) demonstrates function which calculates sum of two arguments
(sum of two integers or concatenating two strings).

Function has cond -operator call which has several pre-conditions to check before calling actual adding function.

Run example:

```
funla early_return_2/early_ret_2.fnl
```

Output:

```
'
Results from sum-of with early return validations:

list(
        list(
                false
                'arguments are not same type of (string)(int)'
                'no value'
        )
        list(
                false
                'requires two arguments (had 3)'
                'no value'
        )
        list(
                false
                'wrong type of arguments (list)'
                'no value'
        )
        list(
                true
                ''
                100
        )
        list(
                true
                ''
                'ok'
        )
)'
```

## Running an example: early_ret_3.fnl
Example **early_return_2/early_ret_3.fnl** is similar to previous one.

Run example:

```
funla early_return_2/early_ret_3.fnl
```

Output is same as in previous example.


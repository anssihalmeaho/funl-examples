# Design-By-Contract Example
**Design By Contract** is approach where function (or procedure) calls go through
certain validity checks:

1. **Preconditions**: conditions which must be true for given arguments
2. **Postconditions**: conditions that must be true for return value

**FunL** supports design by contract usage already by offering **stddbc.assert**
function which provides way to assure assumptions in code.
That can be utilized when implementing pre-conditions and post-conditions
for function/procedure.

Those conditions can be thought also as alternative for **function prototype**
(or **type signature**) which is used in static programming languages to ensure
certain kind of input and output data to/from function.

Pre-conditions can also act as **guards** so that certain validations are checked
first before continuing to actual function logic (kind of **early return** model).

Basic idea is to wrap given function with pre-condition checker (function) and
post-condition checker (function).

## Run example
To limit amount of backtrace printed in stddbc.assert you can give following
environment variable value (you don't have to):

```
export FUNL_DBC_CC=prev
```

Run example:

```
funla dbc-example.fnl
```

Output is like:

```
First normal OK call to sum function, result = 3

'
RTE:number of arguments assumed to be 2 (3):
from:   file: dbc-example.fnl line: 8 args: list(1, 2, 3)
RTE:2nd argument is not number: wrong kind of argument:
from:   file: dbc-example.fnl line: 8 args: list(1, 'wrong kind of argument')
RTE:1st argument is not number: wrong:
from:   file: dbc-example.fnl line: 8 args: list('wrong', 2)
RTE:return value is not number: total garbage:
from:   file: dbc-example.fnl line: 19 args: list('total garbage')
'
```


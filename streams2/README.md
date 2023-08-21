
# Streams (lazy sequences) with FunL operators defer/force

Check previous [previous Streams Example](https://github.com/anssihalmeaho/funl-examples/tree/main/streams),
this is continuation for that one.

That utilized lazy evaluation as function/procedure values (closures).
Using functions for lazy evaluation has drawback that it doesn't implement **memoization** so
that only first evaluation is really executed and consequent attempts to evaluate it use
already evaluated value.

For this purpose **thunk** -type was added to **FunL** language as well as new operators
**defer** and **force**.

**Thunk** value stores **expression** and related **scope** and when evaluation for it
is required explicitly it's done. Result value of evaluation is stored to thunk so that
consequent inquiries for its value only read already evaluated value.
So **thunk** is kind of promise to compute something when forced to do that
(that's why it's called lazy evaluation).

Operator **defer** creates thunk -value from given expression and **force** operator
evaluates given thunk -value.

## Example: Only once read I/O

**example_once_reader.fnl** demonstrates how to read external I/O only once.
**console-reader** is called many times but only first call actually reads
something from console.
This shows how thunk only once evaluates expression and consequent attempts
just return cached value.

Run example:

```
funla example_once_reader.fnl
```

It asks input from console, here "Hello There" was given:

```
cmd> Hello There
'
Input from console only once:

list(
        'Hello There'
        'Hello There'
        'Hello There'
)'
```

## Example: generating prime numbers

**example_primes.fnl** demonstrates how prime numbers can be generated lazily.

Check [previous example: infinite stream of prime numbers](https://github.com/anssihalmeaho/funl-examples/tree/main/streams)
for comparison.

Run example:

```
funla example_primes.fnl
```

Output is:

```
next prime number: 3
next prime number: 5
next prime number: 7

Several prime numbers generated on-demand:
list(3, 5, 5, 7, 11, 7)

filter passed: 3
next prime number: 3
filter passed: 5
next prime number: 5
next prime number: 7
filter passed: 11
next prime number: 11
filter passed: 13
next prime number: 13
next prime number: 17
filter passed: 19
next prime number: 19
filter passed: 23
next prime number: 23
filter passed: 29
next prime number: 29
filter passed: 31
next prime number: 31
next prime number: 37
filter passed: 41
next prime number: 41
filter passed: 43
next prime number: 43
next prime number: 47
filter passed: 53
next prime number: 53
filter passed: 59
next prime number: 59

Prime values but ones with digit 7 are filtered away:
list(3, 5, 11, 13, 19, 23, 29, 31, 41, 43, 53, 59, 61)

true
```

Here "next prime number" printing shows that each prime number
is generated only once although same stream is called more than once.

**take-prime_numbers-but-no-sevens** shows how **stream-filter** is used
also lazily to filter out numbers with digit 7.


## Example: lazy file reader

Check [previous example: lazy file reader example](https://github.com/anssihalmeaho/funl-examples/tree/main/streams)
for comparison.

Difference to previous file reader example is that thunk -value remembers once evaluated
value and uses it as cache (memoization).

It's demonstrated here so that even after file is closed the stream can be read
(as it uses previously read value).

This example assumes that **testfile.txt** file exists in same directory.

Run example:

```
funla example_file_reader.fnl
```

Output is:

```
-> reading from offset: 0
-> reading from offset: 16
-> reading from offset: 32
'
File in chunks:

list(
        list(
                false
                opaque(bytearray(a 54 68 69 73 20 69 73 20 74 65 73 74 66 69 6c))
        )
        list(
                false
                opaque(bytearray(65 2e a 54 68 69 73 20 69 73 20 32 6e 64 20 6c))
        )
        list(
                true
                opaque(bytearray(69 6e 65 2e a a))
        )
        list(
                true
                opaque(bytearray())
        )
        list(
                true
                opaque(bytearray(69 6e 65 2e a a))
        )
)'
```

It can be seen that "reading from offset" printing occurs only once for each chunk.
Also last chunk is returned eventhough the file is already closed.


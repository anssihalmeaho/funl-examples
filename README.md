# funl-examples
This repository contains example codes for [FunL programming language](https://github.com/anssihalmeaho/funl).

## permutation
Demonstrates forming permutations for list of items.

## early_return
Demonstrates "early return" -pattern in FunL by using **cond** operator.

## early_return_2
Extends "early return" -pattern by showing how to define shared let -definitions
(symbols) inside **cond** operator call.

## bytearray_conversions
Demonstrates how to handle bytearrays as list of hexadecimal values.

## composing_with_error_handling
Demonstrates how error handling can be separated to its own wrapper
when using chain of functions type of composition.

## flatten
Shows how flatten nested lists into one flat list.

## generator
This example demonstrates concept of **generator**.

## streams
This example demonstrates lazy evaluation and concept of **streams**.

## streams2
This example is continuation for **streams**, it further demonstrates
how to achieve lazy evaluation by using thunks (and defer/force operators).

## callcount
This example shows how to wrap function (or procedure) with another procedure.
In this case procedure counts amount of calls made in addition to calling wrapped function.

## public_private
This example demonstrates how to implement public and private parts for module.

## partial_app
This example demonstrates **partial function application**.

## design_by_contract
This example shows how to use **Design By Contract** approach.

## composed_pipe
This example shows how to create composed function (from list of function)
recursively so that there's nested call chain.

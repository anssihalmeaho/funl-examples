
# Wrapping function with procedure
This example shows how to wrap function (or procedure) with another procedure.
In this case procedure counts amount of calls made in addition to calling wrapped function.

Procedure **wrap-with-cc** returns pair (list of 2 items):

1. procedure for asking call count
2. function wrapped with counting procedure

Wrapped function in this case is just adding up two arguments that it gets.

## Running an example

Run example:

```
funla callcount/callcount.fnl
```

Output:

```
added = 3
added = 7
added = 30
'function f called 3 times'
```

## Also demonstrates how several (operator call) expressions are used in same procedure
In code it can be seen how several operator calls can be made instead of writing tedious
"_ = " parts of let-definition for those:

```
	print('added = ' call(adder 1 2))
	print('added = ' call(adder 3 4))
	print('added = ' call(adder 10 20))
```

instead of:

```
	_ = print('added = ' call(adder 1 2))
	_ = print('added = ' call(adder 3 4))
	_ = print('added = ' call(adder 10 20))
```

**Note:** This improvement was made lately to FunL parser.


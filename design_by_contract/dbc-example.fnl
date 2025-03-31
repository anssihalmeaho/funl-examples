
ns main

import dbc

checkers = list(
	# pre-checker for argument validity
	func()
		import stddbc

		argslen = len(argslist())
		call(stddbc.assert eq(argslen 2) sprintf('number of arguments assumed to be 2 (%d)' argslen))
		num1 num2 = argslist():
		call(stddbc.assert eq(type(num1) 'int') sprintf('1st argument is not number: %v' num1))
		call(stddbc.assert eq(type(num2) 'int') sprintf('2nd argument is not number: %v' num2))
	end

	# post-checker for return value validity
	func(retvalue)
		import stddbc
		call(stddbc.assert eq(type(retvalue) 'int') sprintf('return value is not number: %v' retvalue))
	end
)

sum = call(dbc.fchecker
	# actual function implementation
	func(num1 num2)
		plus(num1 num2)
	end

	checkers:
)

buggy-sum = call(dbc.fchecker
	# buggy implementation, which returns some string
	func(num1 num2)
		'total garbage'
	end

	checkers:
)

main = proc()
	print('First normal OK call to sum function, result = ' call(sum 1 2) '\n')

	import stdfu
	failure-cases = list(
		try(call(sum 1 2 3))
		try(call(sum 1 'wrong kind of argument'))
		try(call(sum 'wrong' 2))
		try(call(buggy-sum 1 2))
	)
	call(stdfu.foreach
		failure-cases
		func(result all)
			plus(all result)
		end
		'\n'
	)
end

endns


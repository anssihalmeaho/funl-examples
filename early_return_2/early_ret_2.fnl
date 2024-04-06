
ns main

sum-of = func(a b)
	cond(
		# just setting value to number-of-args
		head(list(false
			let(number-of-args len(argslist()))
		))
		'none'

		# check that number of arguments (needs to be two)
		not(eq(number-of-args 2))
		list(false sprintf('requires two arguments (had %d)' number-of-args) 'no value')

		# setting values to type-of-a and type-of-b
		head(list(false
			let(type-of-a type(a))
			let(type-of-b type(b))
		))
		'none'

		# check that arguments are same type
		not(eq(type-of-a type-of-b))
		list(false sprintf('arguments are not same type of (%s)(%s)' type-of-a type-of-b) 'no value')

		# check that arguments are either strings or integers
		not(in(list('int' 'string') type-of-a))
		list(false sprintf('wrong type of arguments (%s)' type-of-a) 'no value')

		# checks are ok, do the stuff (sum up arguments)
		call(func()
			sumvalue = plus(a b)
			list(true '' sumvalue)
		end)
	)
end

main = proc()
	import stdpp

	sprintf('\nResults from sum-of with early return validations: \n%s'
		call(stdpp.form list(
			call(sum-of 'not valid input' 10)
			call(sum-of 20 80 10)
			call(sum-of list() list('list' 'not' 'supported'))
			call(sum-of 20 80)
			call(sum-of 'o' 'k')
		))
	)
end

endns


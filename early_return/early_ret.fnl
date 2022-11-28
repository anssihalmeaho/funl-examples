
ns main

sum-of = func(a b)
	cond(
		# check 1st argument type
		not(eq(type(a) 'int'))
		list(false sprintf('1st arg not int (%s)' type(a)) 'no value')

		# check 2nd argument type
		not(eq(type(b) 'int'))
		list(false sprintf('2nd arg not int (%s)' type(b)) 'no value')

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
			call(sum-of 10 'invalid input')
			call(sum-of 20 80)
		))
	)
end

endns


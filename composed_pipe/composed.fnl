
ns main

# composes one function from given list of functions
# each function calls next one until last one returns
# value which is returned from composed function.
compose = func(fn-list)
	if(empty(fn-list) error('empty function list') 'ok')
	if(eq(len(fn-list) 1)
		func(v) call(head(fn-list) v) end

		call(func()
			next-fn = call(compose rest(fn-list))
			func(v)
				call(
					next-fn
					call(head(fn-list) v)
				)
			end
		end)
	)
end

main = proc()
	import stdpp
	import stdfu

	sum-of-even-numbers = call(compose list(
		# leave only int values to list
		func(v)
			call(stdfu.filter v func(x) eq(type(x) 'int') end)
		end
		# leave only even values to list
		func(v)
			call(stdfu.filter v func(x) eq(mod(x 2) 0) end)
		end
		# calculate sum
		func(v)
			call(stdfu.foreach v func(x sum) plus(x sum) end 0)
		end
	))

	call(stdpp.form list(
		call(sum-of-even-numbers list(1 'not number' 4 5 list('not' 'number') 6 7))
		call(sum-of-even-numbers list(8 map('not' 'number') 9 10))
		call(sum-of-even-numbers list())
	))
end

endns


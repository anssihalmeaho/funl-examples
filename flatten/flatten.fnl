
ns main

# This function flattens recursively all sublists
# in given list to one list
flatten = func(input-list)
	flat-list = func(inlist result)
		if(empty(inlist)
			result # we're done, return result

			call(func()
				first = head(inlist)
				next-result = case(type(first)
					# if first item is list then flatten that
					'list' call(flat-list first result)

					# otherwise just append to result list
					append(result first)
				)
				# and then handle rest of the input-list
				call(flat-list rest(inlist) next-result)
			end)
		)
	end

	if(eq(type(input-list) 'list')
		call(flat-list input-list list())
		input-list # if input is not list just return it
	)
end

# Here's just example of nested lists being flattened
main = proc()
	nested-list = list(
		list(
			list(1 2 3)
			4
		)
		list(
			list(5 list(list()) list(6))
			list(7 8)
		)
		9
		list(10 map(11 12) 13 list(list() 14))
	)

	call(flatten nested-list)
end

endns


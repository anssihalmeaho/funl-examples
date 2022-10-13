
ns main

# helper function for returning list of:
#   1) item from input list in given index position
#   2) rest of the list from position (not including the item)
take-by-index = func(inlist pos)
	case(pos
		0 list(head(inlist) rest(inlist))

		list(
			ind(inlist pos)
			extend(
				slice(inlist 0 minus(pos 1))
				slice(inlist plus(pos 1) len(inlist))
			)
		)
	)
end

# tester function for take-by-index
test-take-by-index = proc()
	import stdfu

	tc = list(
		list(
			list('a' 'b' 'c' 'd')
			2
			list('c' list('a' 'b' 'd'))
		)
		list(
			list('a' 'b' 'c' 'd')
			0
			list('a' list('b' 'c' 'd'))
		)
		list(
			list('a' 'b' 'c' 'd')
			3
			list('d' list('a' 'b' 'c'))
		)
		list(
			list('a')
			0
			list('a' list())
		)
		list(
			list('a' 'b')
			0
			list('a' list('b'))
		)
	)
	tester = func(testcase is-passing)
		input idx output = testcase:
		result = call(take-by-index input idx)
		is-same = eq(output result)
		_ = if(is-same '' print('unexpected: ' result))
		and(is-passing is-same)
	end
	call(stdfu.foreach tc tester true)
end

# permute function: input is list of items
#                   output is list of permutations
permute = func(inlist)
	forloopy = func(this-list new-list i result)
		if(ge(i len(this-list))
			result

			call(func()
				item left-list = call(take-by-index this-list i):
				new-result = call(nextlevel left-list append(new-list item) result)
				call(forloopy this-list new-list plus(i 1) new-result)
			end)
		)
	end

	nextlevel = func(left-list result-list result)
		if(empty(left-list)
			append(result result-list)
			call(forloopy left-list result-list 0 result)
		)
	end

	call(forloopy inlist list() 0 list())
end

# tester function for permute
test-permutations = func()
	import stdfu

	tc = list(
		list(
			# input
			list('a' 'b' 'c')
			# expected output (order may vary)
			list(
				list('a' 'b' 'c')
				list('a' 'c' 'b')
				list('b' 'a' 'c')
				list('b' 'c' 'a')
				list('c' 'a' 'b')
				list('c' 'b' 'a')
			)
		)
		list(
			# input
			list('a' 'b')
			# expected output (order may vary)
			list(
				list('a' 'b')
				list('b' 'a')
			)
		)
		list(
			# input
			list('a')
			# expected output
			list(list('a'))
		)
		list(
			# input
			list()
			# expected output
			list()
		)
	)

	# verify results so that lists order doesn't matter
	# (by using sets)
	verify = func(lst1 lst2)
		import stdset

		set1 = call(stdset.list-to-set call(stdset.newset) lst1)
		set2 = call(stdset.list-to-set call(stdset.newset) lst2)
		and(
			eq(len(lst1) len(lst2))
			call(stdset.equal set1 set2)
		)
	end

	tester = func(testcase is-passing)
		input output = testcase:
		result = call(permute input)
		is-same = call(verify output result)
		_ = if(is-same '' print('unexpected: ' result))
		and(is-passing is-same)
	end
	call(stdfu.foreach tc tester true)
end

# overall test function
# test can be executed by giving:
#   funla -name=test permutate.fnl
#   ->
#   PASSED'
test = proc()
	tests-passed = and(
		call(test-take-by-index)
		call(test-permutations)
	)
	if(tests-passed 'PASSED' 'FAILED')
end

# main function
# makes list of integers from 1 to N (given as argument)
# and calls permute function for that list
#
# For example:
#   funla -args="2" permutate.fnl
#   ->
#	list('
#	list(
#		list(
#			1
#			2
#		)
#		list(
#			2
#			1
#		)
#	)', 2)

main = func(N)
	import stdpp
	import stdfu

	l = call(stdfu.generate 1 N func(n) n end)
	result = call(permute l)
	list(
		call(stdpp.form result) # list of permutations
		len(result) # amount of permutations
	)
end

endns


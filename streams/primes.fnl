
ns main

# returns true if n is prime number, false otherwise
is-prime = func(n)
	cond(
		le(n 1) false
		eq(n 2) true
		eq(mod(n 2) 0) false

		call(func()
			loopy = func(i)
				cond(
					gt(mul(i i) n) true
					eq(mod(n i) 0) false
					call(loopy plus(i 2))
				)
			end

			call(loopy 3)
		end)
	)
end

# finds next prime proceeding previous
next-prime = func(previous)
	find-prime = func(i)
		if(call(is-prime i)
			i
			call(find-prime plus(i 1))
		)
	end

	call(find-prime plus(previous 1))
end

# creates generator (stream) for prime generating
# - previous is starting prime number value for stream
# - returns list of:
#   1) next prime number value
#   2) next generator function
prime-generator = func(previous)
	list(
		previous
		func() call(prime-generator call(next-prime previous)) end
	)
end

# Creates stream which filters values from
# given stream (2nd argument) according to
# filter function (1st argument)
stream-filter = func(filter-func stream)
	val next-stream = stream:
	if(call(filter-func val)
		list(
			val
			func() call(stream-filter filter-func call(next-stream)) end
		)

		call(stream-filter filter-func call(next-stream))
	)
end

# returns list of:
# 1) n next values from stream as list
# 2) next generator function
take-n = func(generator n)
	loopy = func(gen cnt result)
		if(ge(cnt n)
			list(result gen)

			call(func()
				next-val next-gen = call(gen):
				call(loopy
					next-gen
					plus(cnt 1)
					append(result next-val)
				)
			end)
		)
	end

	call(loopy generator 0 list())
end

main = proc()
	plus(
		'\nSeveral prime numbers generated on-demand:\n'
		str(call(take-some-prime-numbers))
		'\n'

		'\nPrime values but ones with digit 7 are filtered away:\n'
		str(call(take-prime_numbers-but-no-sevens))
		'\n'
	)
end

take-some-prime-numbers = func()
	# create prime number generator (stream)
	number-1 stream-1 = call(prime-generator 3):

	# take values from stream (one by one)
	number-2 stream-2 = call(stream-1):
	number-3 stream-3 = call(stream-2):
	number-4 stream-4 = call(stream-3):

	# take multiple (8) values once from stream
	numbers-1 stream-5 = call(take-n stream-4 8):

	# take some more (3)
	numbers-2 stream-6 = call(take-n stream-5 3):

	list(number-1 number-2 number-3 number-4 numbers-1 numbers-2)
end

take-prime_numbers-but-no-sevens = func()

	# no-seven returns true if there is no
	# seven in given number, false otherwise.
	# It's used for filtering numbers with seven away.
	no-seven = func(num)
		not(in(split(str(num) '') '7'))
	end

	first-value stream = call(stream-filter no-seven call(prime-generator 3)):
	next-prime-values _ = call(take-n stream 12):
	list(first-value next-prime-values:)
end

endns


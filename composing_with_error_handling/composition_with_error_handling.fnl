
ns main

# input: string
# output: string, removed other characters than whitespace characters
#         or alphabetical/decimal characters
remove-non-alnum-characters = func(text)
	if(eq(type(text) 'string')
		call(func()
			import stdfu
			import stdstr

			filter = func(char)
				or(
					call(stdstr.is-space char)
					call(stdstr.is-alnum char)
				)
			end

			newlist = call(stdfu.filter split(text '') filter)
			list(true '' call(stdstr.join newlist ''))
		end)

		list(false 'assuming string as input' '')
	)
end

# input: string
# output: list of words (strings), all separate words from text in list
get-words = func(text)
	if(eq(type(text) 'string')
		list(true '' split(text))
		list(false 'assuming string as input' '')
	)
end

# input: list of words (strings)
# output: list of words converted to lowercase
put-all-words-to-lowercase = func(words)
	if(eq(type(words) 'list')
		call(func()
			import stdfu
			import stdstr

			lowercase-words = call(stdfu.apply words func(word) call(stdstr.lowercase word) end)
			list(true '' lowercase-words)
		end)

		list(false 'assuming list as input' '')
	)
end

# input: list of words (strings)
# output: map of unique words as key and frequencies in input-list as values
map-to-word-counts = func(words)
	if(eq(type(words) 'list')
		call(func()
			import stdfu

			helper-map = call(stdfu.group-by words func(word) list(word 1) end)
			new-keyvalues = call(stdfu.apply
				keyvals(helper-map)
				func(item)
					key val = item:
					list(key len(val))
				end
			)
			result-map = call(stdfu.pairs-to-map new-keyvalues)
			list(true '' result-map)
		end)

		list(false 'assuming list as input' '')
	)
end

# Returns wrapped function which calls actual function
# only if no errors have occurred.
# Also wrapper gives only actual output value as input
# to function call (stripping ok & err away).
bind = func(f)
	func(input-list)
		ok err val = input-list:
		if(ok call(f val) list(false err ''))
	end
end

# Main procedure
main = proc()
	import stdfu
	import stdpp

	# chain of funtions to process result as pipeline
	# each function takes one argument to process and
	# returns list:
	#   1) bool: true if successful, false otherwise
	#   2) string: in case of error description of failure
	#   3) actual value feed to next function
	chain = list(
		remove-non-alnum-characters
		get-words
		put-all-words-to-lowercase
		map-to-word-counts
	)

	wrapped-chain = call(stdfu.apply chain func(f) call(bind f) end)
	composite = call(stdfu.pipe wrapped-chain)

	call(stdpp.form
		list(
			# successful case, map is returned which contains frequencies of words is given text
			call(composite list(true '' 'This is some text. There is some duplicate words there.'))

			# error case as input value is not string
			call(composite list(true '' 123))
		)
	)
end

endns


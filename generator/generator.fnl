
ns main

new-generator = func(next-f init-val)
	create-gen = func(prev-val)
		# take method (generates n next values)
		take = func(n)
			take-n = func(count nextval resultlist)
				if(ge(count n)
					list(resultlist nextval)
					call(take-n
						plus(count 1)
						call(next-f nextval)
						append(resultlist nextval)
					)
				)
			end

			retlist new-val = call(take-n 0 prev-val list()):
			list(retlist call(create-gen new-val))
		end

		# take-while method (generates list of values until
		# condition function returns false)
		take-while = func(cond-f)
			take-w = func(count nextval resultlist)
				if(not(call(cond-f nextval))
					list(resultlist nextval)
					call(take-w
						plus(count 1)
						call(next-f nextval)
						append(resultlist nextval)
					)
				)
			end

			retlist new-val = call(take-w 0 prev-val list()):
			list(retlist call(create-gen new-val))
		end

		# object
		map(
			'take'       take
			'take-while' take-while
		)
	end

	call(create-gen init-val)
end

main = proc()
	# create generator
	gen1 = call(new-generator func(x) plus(x 5) end 5)

	# take 4 first ones
	list-1 gen2 = call(get(gen1 'take') 4):

	# take as long as values are less than 50
	list-2 gen3 = call(get(gen2 'take-while') func(x) lt(x 50) end):

	# take 10 next ones
	list-3 gen4 = call(get(gen3 'take') 10):

	# result lists
	list(list-1 list-2 list-3)
end

endns


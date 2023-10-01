
ns main

# returns pair (list of two items):
#   1) procedure for asking call count
#   2) function wrapped with counting procedure
wrap-with-cc = proc(p)
	import stdvar
	call-counter = call(stdvar.new 0)

	list(
		proc() call(stdvar.value call-counter) end

		proc()
			call(stdvar.change call-counter func(prev) plus(prev 1) end)
			call(p argslist():)
		end
	)
end

main = proc()
	# f is function which adds up two arguments
	f = func(a b) plus(a b) end

	# get count query and wrapper procedures
	get-cc adder = call(wrap-with-cc f):

	# let's use adding proc couple of times
	print('added = ' call(adder 1 2))
	print('added = ' call(adder 3 4))
	print('added = ' call(adder 10 20))

	# return call count
	sprintf('function f called %d times' call(get-cc))
end

endns


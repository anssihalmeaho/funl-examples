
ns main

reader = proc()
	import stdio
	_ = call(stdio.printout 'cmd> ')
	call(stdio.readinput)
end

console-reader = proc(thunk)
	force(thunk)
end

main = proc()
	import stdpp

	thunk = defer(call(reader))
	plus('\nInput from console only once:\n' call(stdpp.pform
		list(
			call(console-reader thunk)
			call(console-reader thunk)
			call(console-reader thunk)
		)
	))
end

endns


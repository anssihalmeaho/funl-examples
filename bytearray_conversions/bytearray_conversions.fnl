
ns main

# converts list of hex-strings to bytearray
make-bytearray = func(inlist)
	import stdbytes
	import stdfu

	intlist = call(stdfu.apply inlist func(x) conv(x 'hexint') end)
	call(stdbytes.new intlist)
end

# converts bytearray to list of hex-strings
to-hexlist = func(bytearray)
	import stdbytes
	import stdfu

	intlist = call(stdbytes.as-list bytearray)
	call(stdfu.apply intlist func(x) conv(x 'inthex') end)
end

# example of transforming:
#  list of hex-values as strings
#  -> to bytearray
#  -> back to list of hex-values as strings
main = proc()
	import stdbytes
	import stdpp

	# list of hexadecimal strings as starting point
	sourcelist = list('f0' 'ff' 'a0' '10' '0')

	# converted to bytearray
	bar = call(make-bytearray sourcelist)

	# show bytearray and back-converted hex string list
	call(stdpp.pform list(
		bar
		call(to-hexlist bar)
	))
end

endns



ns main

# sum adds up two arguments (x, y)
sum = func(x y)
	plus(x y)
end

# increment is partial application of sum function.
# It's implemented by closure which binds 2nd argument
# of sum to be 1 (y).
increment = call(func(y)
	func(x)
		call(sum x y)
	end
end
1)

main = proc()
	# example of incrementing 9 -> 10
	call(increment 9)
end

endns

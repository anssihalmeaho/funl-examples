
ns dbc

fchecker = func(f pre-checker post-checker)
	func()
		args = argslist()
		call(pre-checker args:)
		retvalue = call(f args:)
		call(post-checker retvalue)
		retvalue
	end
end

endns


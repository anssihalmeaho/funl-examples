
ns words

word-count
word-list
word-frequencies
=
call(func()
	import stdfu
	import stdstr

	# Here are private functions:
	# ===========================

	# private
	remove-special-chars = func(source)
		chain = list(
			func(s) call(stdstr.replace s '.' ' ') end
			func(s) call(stdstr.replace s ')' ' ') end
			func(s) call(stdstr.replace s '(' ' ') end
		)
		call(stdfu.chain source chain)
	end

	# private
	pre-process-input-string = func(source)
		next-s = call(stdstr.lowercase source)
		call(remove-special-chars next-s)
	end

	# private
	make-word-list = func(text)
		new-text = call(pre-process-input-string text)
		parts = split(new-text ' ')
		call(stdfu.filter parts func(item) not(eq(item '')) end)
	end

	# Here are public functions:
	# ==========================

	# public
	public-word-count = func(text)
		len(call(make-word-list text))
	end

	# public
	public-word-list = func(text)
		call(make-word-list text)
	end

	# public
	public-word-frequencies = func(text)
		wordlist = call(make-word-list text)
		grouped = call(stdfu.group-by
			wordlist
			func(item) list(item item) end
		)
		pairs = call(stdfu.apply
			keyvals(grouped)
			func(pair)
				key val = pair:
				list(key len(val))
			end
		)
		call(stdfu.pairs-to-map pairs)
	end

	# list of public functions
	list(
		public-word-count
		public-word-list
		public-word-frequencies
	)
end):

endns


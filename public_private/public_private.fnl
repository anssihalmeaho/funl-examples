
ns main

import words

main = proc()
	text = 'This is just some example text... (It is just for example)'
	sprintf('\n%v\n%v\n%v\n'
		call(words.word-count text)
		call(words.word-list text)
		call(words.word-frequencies text)
	)
end

endns


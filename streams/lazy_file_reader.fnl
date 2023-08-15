
ns main

import stdfiles
import stdpp

# creates stream for reading file content in 16 bytes chunks
chunk-reader = proc(file offset)
	list(
		call(stdfiles.read-at file 16 offset)
		proc() call(chunk-reader file plus(offset 16)) end
	)
end

# in example testfile.txt content is read
# in (max) 16 bytes chunks.
# One chunk is pair (list of two items) of:
#   1) bool value: true if there's no more data to read (EOF),
#                  false if there's more data to read
#   2) data from file as bytearray (opaque value)
#      (maximum 16 bytes)
main = proc()
	file = call(stdfiles.open 'testfile.txt' stdfiles.r)

	chunk-1 stream-1 = call(chunk-reader file 0):
	chunk-2 stream-2 = call(stream-1):
	chunk-3 stream-3 = call(stream-2):
	chunk-4 stream-4 = call(stream-3):

	_ = call(stdfiles.close file)

	plus('\nFile in chunks:\n' call(stdpp.pform
		list(
			chunk-1
			chunk-2
			chunk-3
			chunk-4
		)
	))
end

endns


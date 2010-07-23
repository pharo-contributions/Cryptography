private
copy: x into: w count: n
	"copy n unsigned integers from x to w and change their endianness if the platform is little endian"

	<static: false>
	<inline: true>
	<var: #x type: 'char *'>
	<var: #w type: 'char *'>
	<var: #n type: 'unsigned int'>
	<var: #i type: 'unsigned int'>

	0 to: (4 * n) - 1 by: 4 do: [ :i |
		w at: i put: (x at: i + (swap at: 0)).
		w at: i + 1 put: (x at: i + (swap at: 1)).
		w at: i + 2 put: (x at: i + (swap at: 2)).
		w at: i + 3 put: (x at: i + (swap at: 3)) ]
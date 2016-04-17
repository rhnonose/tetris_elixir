defmodule BasecaseTetris do
	import TetrisBoard

	def main([]) do
		loop(get_new_map(20,20), 20, 20)
	end

	def loop(board, height, width) do
		IO.puts render_map(board, width, height)
		IO.gets "Choose a command [a,s,d,w] and press enter:\n"
		loop(board, height, width)
	end

end

defmodule BasecaseTetris do

	def main(args) do
		raise "No args are allowed."
	end

	def main([]) do
		loop(TetrisBoard.get_new_board(20,20))
	end

	def loop(board) do
		
		loop(board)
	end

end

defmodule BasecaseTetris do
	import TetrisBoard
	import TetrisPiece

	def main([]) do
		loop({:new_piece, get_new_map(20,20)})
	end

	def loop({:new_piece, board}) do
		loop({:play, new_piece(:random), board})
	end

	def loop({:play, piece = {_piece_type, current_piece}, board}) do
		board |> render_map(current_piece) |> IO.puts
		result = get_user_input |>
		execute_command(piece) |>
		check_validity(board)
		case result do
			{:valid, transformed_piece} -> loop(go_down(transformed_piece, board))
			{:invalid, old_piece} -> loop({:play, old_piece, board})
		end
	end

	def get_user_input do
		command = IO.gets "Choose a command [a,s,d or w] and press enter:\n"
		String.at(command, 0)
	end

	def go_down(piece, board) do
		new_piece = shift(piece, :down)
		case check_validity({:valid, new_piece, piece}, board) do
			{:valid, transformed_piece} -> {:play, transformed_piece, board}
			{:invalid, {_, old_piece}} -> {:new_piece, board ++ old_piece}
		end
	end

	def execute_command(command, {piece_type, current_piece}) do
		case command do
			"a" -> {:valid, shift({piece_type, current_piece}, :left), current_piece}
			"d" -> {:valid, shift({piece_type, current_piece}, :right), current_piece}
			"s" -> {:valid, rotate({piece_type, current_piece}, :clockwise), current_piece}
			"w" -> {:valid, rotate({piece_type, current_piece}, :counter_clock), current_piece}
			 _  -> {:invalid, current_piece}
		end
	end

	def check_validity({:invalid, current_piece}, _board) do
		IO.puts "Invalid command"
		{:invalid, current_piece}
	end

	def check_validity({:valid, piece = {_, transformed_piece}, old_piece}, board) do
		boardMapSet = MapSet.new(board)
		pieceMapSet = MapSet.new(transformed_piece)
		case MapSet.intersection(boardMapSet, pieceMapSet) |> MapSet.size do
			0 -> {:valid, piece}
			_ -> {:invalid, old_piece}
		end
	end

end

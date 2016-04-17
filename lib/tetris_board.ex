defmodule TetrisBoard do

	def get_new_map(height, width) do
		bottom_row = 
			0..width+1 |> Enum.map(fn x -> {0, x} end)
		left_column =
			1..height |> Enum.map(fn x -> {x, 0} end)
		right_column = 
			1..height |> Enum.map(fn x -> {x, width+1} end)
		Enum.concat([bottom_row, left_column, right_column])
	end

end
defmodule TetrisBoard do

	def get_new_map(height, width) do
		bottom_row = 
			0..width+1 |> Enum.map(fn x -> {width, x} end)
		left_column =
			0..height-1 |> Enum.map(fn x -> {x, 0} end)
		right_column = 
			0..height-1 |> Enum.map(fn x -> {x, width+1} end)
		Enum.concat([bottom_row, left_column, right_column])
	end

	def render_map(map) do
		[{height, wid}] = map |> Enum.sort |> Enum.take(-1)
		width = wid - 1
		0..height |>
		Enum.map(fn line -> render_line(map, line, width) <> "\n" end) |>
		Enum.join("")
	end

	def render_map(map, current_piece) do
		render_map(map ++ current_piece)
	end

	def render_line(map, line, width) do
		0..width+1 |>
		Enum.map(fn col -> 
			if Enum.find(map,
				fn {x,y} -> col == y && x == line end) != nil
				do"*" else " "
			end
		end) |>
		Enum.join("")
	end

end
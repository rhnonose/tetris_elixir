defmodule TetrisPiece do

	def new_piece(:random) do
		new_piece(:box)
	end

	def new_piece(:box) do
		{:box, [{0,2}, {0,3}, {1,2}, {1,3}]}
	end

	def rotate({:box, piece}, _) do
		{:box, piece}
	end

	def shift({:box, piece}, :right) do
		[{x1,y1}, {x2,y2}, {x3,y3}, {x4,y4}] = piece |> Enum.sort
		{:box, [{x1,y1+1},{x2,y2+1},{x3,y3+1},{x4,y4+1}]}
	end

	def shift({:box, piece}, :left) do
		[{x1,y1}, {x2,y2}, {x3,y3}, {x4,y4}] = piece |> Enum.sort
		{:box, [{x1,y1-1},{x2,y2-1},{x3,y3-1},{x4,y4-1}]}
	end

	def shift({:box, piece}, :down) do
		[{x1,y1}, {x2,y2}, {x3,y3}, {x4,y4}] = piece |> Enum.sort
		{:box, [{x1+1,y1},{x2+1,y2},{x3+1,y3},{x4+1,y4}]}
	end






	def new_piece(:straight) do
		{:straight, [{0,2}, {1,2}, {2,2}, {3,2}]}
	end

	def rotate({:straight, piece}, :clockwise) do
		[{x1,y1}, {x2,y2}, {x3,y3}, {x4,y4}] = piece |> Enum.sort
		{:straight, [{x1+1,y1+1},{x2,y2},{x3+1,y3-1},{x4-2,y4-2}]}
	end

	def rotate({:straight, piece}, :counter_clock) do
		[{x1,y1}, {x2,y2}, {x3,y3}, {x4,y4}] = piece |> Enum.sort
		{:straight, [{x1-1,y1-1},{x2,y2},{x3-1,y3+1},{x4+2,y4+2}]}
	end	

	def shift({:straight, piece}, :right) do
		[{x1,y1}, {x2,y2}, {x3,y3}, {x4,y4}] = piece |> Enum.sort
		{:straight, [{x1,y1+1},{x2,y2+1},{x3,y3+1},{x4,y4+1}]}
	end

	def shift({:straight, piece}, :left) do
		[{x1,y1}, {x2,y2}, {x3,y3}, {x4,y4}] = piece |> Enum.sort
		{:straight, [{x1,y1-1},{x2,y2-1},{x3,y3-1},{x4,y4-1}]}
	end

	def shift({:straight, piece}, :down) do
		[{x1,y1}, {x2,y2}, {x3,y3}, {x4,y4}] = piece |> Enum.sort
		{:straight, [{x1+1,y1},{x2+1,y2},{x3+1,y3},{x4+1,y4}]}
	end
end
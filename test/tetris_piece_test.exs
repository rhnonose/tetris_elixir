defmodule TetrisPieceTest do
	use ExUnit.Case
	doctest TetrisPiece

	test "straight piece" do
		{:straight, piece} = TetrisPiece.new_piece(:straight)
		assert(
			Enum.sort(piece) ==
			[{0,2}, {1,2}, {2,2}, {3,2}]
		)
	end

	test "rotate straight piece clockwise" do
		{:straight, piece} = TetrisPiece.new_piece(:straight) |> TetrisPiece.rotate(:clockwise)
		assert(
			Enum.sort(piece),
			[{1,0}, {1,1}, {1,2}, {1,3}]
		)
	end

	test "rotate straight piece counter clockwise" do
		{:straight, piece} = {:straight, [{1,0}, {1,1}, {1,2}, {1,3}]} |> TetrisPiece.rotate(:counter_clock)
		assert(
			Enum.sort(piece),
			[{0,2}, {1,2}, {2,2}, {3,2}]
		)
	end

	test "move straight piece right" do
		{:straight, piece} = TetrisPiece.new_piece(:straight) |> TetrisPiece.shift(:right)
		assert(
			Enum.sort(piece),
			[{0,3}, {1,3}, {2,3}, {3,3}]
		)
	end

	test "move straight piece left" do
		{:straight, piece} = {:straight, [{0,3}, {1,3}, {2,3}, {3,3}]} |> TetrisPiece.shift(:left)
		assert(
			Enum.sort(piece),
			[{0,2}, {1,2}, {2,2}, {3,2}]
		)
	end

	test "move straight piece down" do
		{:straight, piece} = {:straight, [{0,3}, {1,3}, {2,3}, {3,3}]} |> TetrisPiece.shift(:down)
		assert(
			Enum.sort(piece),
			[{1,3}, {2,3}, {3,3}, {4,3}]
		)
	end
end
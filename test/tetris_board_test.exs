defmodule TetrisBoardTest do
	use ExUnit.Case
	doctest TetrisBoard

	test "Get small empty board" do
		assert(
			Enum.sort(TetrisBoard.get_new_map(2,2)) ==
			Enum.sort(
			[
				#bottom row
				{0, 0}, {0, 1}, {0, 2}, {0, 3},
				#left column
				{1, 0}, {2, 0},
 				#right column
 				{1,3}, {2,3}
			]))
	end

	test "Get empty board" do
		assert(
			Enum.sort(TetrisBoard.get_new_map(20,20)) ==
			Enum.sort(
			[
				#bottom row
				{0, 0}, {0, 1}, {0, 2}, {0, 3}, {0, 4},
				{0, 5}, {0, 6}, {0, 7}, {0, 8}, {0, 9},
				{0, 10}, {0, 11}, {0, 12},
				{0, 13}, {0, 14}, {0, 15},
				{0, 16}, {0, 17}, {0, 18},
				{0, 19}, {0, 20}, {0, 21},
				#left column
				{1, 0}, {2, 0}, {3, 0}, {4, 0}, {5, 0},
				{6, 0}, {7, 0}, {8, 0}, {9, 0},
 				{10, 0}, {11, 0}, {12, 0}, {13, 0},
 				{14, 0}, {15, 0}, {16, 0}, {17, 0},
 				{18, 0}, {19, 0}, {20, 0},
 				#right column
 				{1, 21}, {2, 21}, {3, 21}, {4, 21},
 				{5, 21}, {6, 21}, {7, 21}, {8, 21},
 				{9, 21}, {10, 21}, {11, 21}, {12, 21},
 				{13, 21}, {14, 21}, {15, 21}, {16, 21},
 				{17, 21}, {18, 21}, {19, 21}, {20, 21}
			]))
	end

end
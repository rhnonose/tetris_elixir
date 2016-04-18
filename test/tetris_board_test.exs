defmodule TetrisBoardTest do
	use ExUnit.Case
	doctest TetrisBoard

	test "Get small empty board" do
		assert(
			Enum.sort(TetrisBoard.get_new_map(3,3)) ==
			Enum.sort(
			[
				#bottom row
				{3, 0}, {3, 1}, {3, 2}, {3, 3}, {3, 4},
				#left column
				{0, 0}, {1, 0}, {2, 0},
 				#right column
 				{0, 4}, {1, 4}, {2, 4}
			]))
	end

	test "Get empty board" do
		assert(
			Enum.sort(TetrisBoard.get_new_map(20,20)) ==
			Enum.sort(
			[
				#bottom row
				{20, 0}, {20, 1}, {20, 2}, {20, 3}, {20, 4},
				{20, 5}, {20, 6}, {20, 7}, {20, 8}, {20, 9},
				{20, 10}, {20, 11}, {20, 12},
				{20, 13}, {20, 14}, {20, 15},
				{20, 16}, {20, 17}, {20, 18},
				{20, 19}, {20, 20}, {20, 21},
				#left column
				{0, 0}, {1, 0}, {2, 0}, {3, 0}, {4, 0},
				{5, 0}, {6, 0}, {7, 0}, {8, 0}, {9, 0},
 				{10, 0}, {11, 0}, {12, 0}, {13, 0},
 				{14, 0}, {15, 0}, {16, 0}, {17, 0},
 				{18, 0}, {19, 0},
 				#right column
 				{0, 21}, {1, 21}, {2, 21}, {3, 21},
 				{4, 21}, {5, 21}, {6, 21}, {7, 21},
 				{8, 21}, {9, 21}, {10, 21}, {11, 21},
 				{12, 21}, {13, 21}, {14, 21}, {15, 21},
 				{16, 21}, {17, 21}, {18, 21}, {19, 21}
			]))
	end

	test "render first line" do
		assert(
			TetrisBoard.render_line([{0,0}, {0,4}], 0, 3) ==
			"*   *"
			)
	end

	test "render last line" do
		assert(
			TetrisBoard.render_line([{3,0},{3,1},{3,2},{3,3},{3,4}], 3, 3) ==
			"*****"
			)
	end

	test "render in the middle" do
		assert(
			TetrisBoard.render_line([{1,0},{1,2},{1,4}], 1, 3) ==
			"* * *"
			)
	end

	test "render whole map" do
		assert(
			TetrisBoard.render_map([
				{3, 0}, {3, 1}, {3, 2}, {3, 3}, {3, 4},
				{0, 0}, {1, 0}, {2, 0},
 				{0, 4}, {1, 4}, {2, 4}
			]) ==
			"*   *\n*   *\n*   *\n*****\n"
			)
	end
end
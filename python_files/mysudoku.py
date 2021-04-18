#My Sudoku

from sudoku import Sudoku

#Initializes a Sudoku puzzle with 3x3 sub-grid and
#Generates a puzzle ith half of the cells empty

puzzle = Sudoku(3).difficulty(0.6)
#puzzle.show()
puzzle1 = str(puzzle)

solution = puzzle.solve()
#solution.show()
solution = str(solution)
#Initializes a 3x5 puzzle
#puzzle = Sudoku(3, 5)

puzzle_file = open("sudoku_question.txt", "w")
puzzle_file.write(puzzle1)
puzzle_file.close()

solution_file = open("sudoku_solve.txt", "w")
solution_file.write(solution)
solution_file.close()


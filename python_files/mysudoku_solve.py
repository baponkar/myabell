#My Sudoku

from sudoku import Sudoku

#Initializes a Sudoku puzzle with 3x3 sub-grid and
#Generates a puzzle ith half of the cells empty

puzzle = Sudoku(3).difficulty(0.6)
#puzzle.show()

solution = puzzle.solve()
solution.show()
#result = str(solution)
#file_object = open( "sudoku_solve.txt", "w" )
#file_object.write(result)
#file_object.close()
#Initializes a 3x5 puzzle
#puzzle = Sudoku(3, 5)


class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        
        i = 0
        board_len = len(board)

        while i < board_len:

            # check a square
            square = set()
            r = (i // 3) * 3
            c = (i % 3) * 3

            for _ in range(3):
                for x in range(3):
                    e = board[r][c+x]
                    
                    if e == ".":
                        pass
                    else:
                        if e in square:
                            return False
                        square.add(e)

                r += 1


            col = set()
            row = set()
            for x in range(board_len):
                print(f"{board[i][x]}  {board[x][i]}")
                if board[i][x] == ".":
                    pass
                else:
                    if board[i][x] in row:
                        return False
                    row.add(board[i][x])

                if board[x][i] == ".":
                    pass
                else:
                    if board[x][i] in col:
                        return False
                    col.add(board[x][i])
               
            i += 1

        return True
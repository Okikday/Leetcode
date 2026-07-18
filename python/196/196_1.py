class Solution:
    def rotateString(self, s: str, goal: str) -> bool:
        if len(s) != len(goal): 
            return False
        joined = s * 2
        return goal in joined
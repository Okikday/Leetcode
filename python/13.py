class Solution:
    def romanToInt(self, s: str) -> int:
        roman_map = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}

        total = 0
        len_s = len(s)

        i = 0
        while i < len_s:
            curr = s[i]
            ne = s[i+1] if i+1 < len_s else None
            if (ne
            and 
            ((curr == 'I' and (ne == 'V' or ne == 'X')) 
            or (curr == 'X' and (ne == 'L' or ne == 'C')) 
            or (curr == 'C' and (ne == 'D' or ne == 'M')))):
                total += (roman_map[ne] - roman_map[curr])
                i += 2
            else:
                total += roman_map[curr]
                i+=1
            
        return total
class Solution:

    def encode(self, strs: list[str]) -> str:
        encoded = ""
        for val in strs:
            encoded += str(len(val)) + "#" + val
        return encoded

    def decode(self, s: str) -> list[str]:
        s_bound = len(s) - 1
        decoded = []
        pos = 0

        while pos < s_bound:
            c = ""
            while s[pos] != "#":
                c += s[pos]
                pos += 1
            
            pos += 1

            count = int(c)
            decoded.append(s[pos:(pos + count)])
            pos += count
            
        return decoded



        
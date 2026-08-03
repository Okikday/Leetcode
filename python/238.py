class Solution:
    def productExceptSelf(self, nums: list[int]) -> list[int]:
        num_len = len(nums)
        prefix_arr = [1]
        suffix_arr = [1]

        # We are multiplying the prefixes of the current number in an aggregating way
        # Doing same with the suffixes, but it's flipped; so we are multiplying for suffixes from the back.
        for i in range(1, num_len):
            diff = i - 1
            prefix_arr.append(prefix_arr[diff] * nums[diff])
            suffix_arr.append(suffix_arr[diff] * nums[num_len - i])
            
        len_diff = num_len - 1
        
        # Finally, we multiply the prefix and suffix at each positions(remember the suffix is flipped!)
        return [prefix_arr[i] * suffix_arr[len_diff - i] for i in range(num_len)]


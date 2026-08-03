class Solution:
    def pivotIndex(self, nums: list[int]) -> int:
        total = sum(nums)
        stale_left = 0

        for i in range(len(nums)):
            if stale_left == total - stale_left - nums[i]:
                return i
            stale_left += nums[i]
        return -1
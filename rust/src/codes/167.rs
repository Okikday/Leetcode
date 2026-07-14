impl Solution {
    pub fn two_sum(numbers: Vec<i32>, target: i32) -> Vec<i32> {
        let mut left = 0;
        let mut right = numbers.len() - 1;

        while left < right {
            let sum = *numbers.get(left).unwrap() + *numbers.get(right).unwrap();
            if sum == target {
                let first = left as i32 + 1;
                let second = right as i32 + 1;
                return vec![first, second];
            }
            if sum < target {
                left += 1;
            } else {
                right -= 1;
            }
        }
        vec![]
    }
}

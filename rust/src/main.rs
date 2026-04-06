use std::collections::HashMap;
fn main() {
    let val = Solution::two_sum(vec![2, 7, 11, 15], 9);
}

struct Solution {}

impl Solution {
    pub fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
        let mut cm_map: HashMap<i32, i32> = HashMap::new();

        for (index, value) in nums.iter().enumerate() {
            let cm = &target - value;
            let i = cm_map.get(&cm);
            if i != Option::None {
                let i = *i.unwrap();
                let j = index as i32;
                return vec![i, j];
            }
            cm_map.insert(*value, index as i32);
        }
        vec![]
    }
}

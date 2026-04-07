use std::cmp::min;
fn main() {
    let val = Solution::max_area(vec![1, 8, 6, 2, 5, 4, 8, 3, 7]);
    println!("val: {val:?}");
}

struct Solution {}

impl Solution {
    pub fn max_area(height: Vec<i32>) -> i32 {
        let mut maximum_area = 0;
        let mut left = 0 as usize;
        let mut right = height.len() as usize - 1;
        if right <= 0 {
            return 0;
        }

        while right > left {
            let left_h = height.get(left).unwrap();
            let right_h = height.get(right).unwrap();
            let curr_area =
                Solution::compute_area(&(left as i32), &(right as i32), left_h, right_h);

            if curr_area > maximum_area {
                maximum_area = *(&curr_area);
            }

            if left_h > right_h {
                right -= 1;
            } else {
                left += 1;
            }
        }

        return maximum_area;
    }

    fn compute_area(x1: &i32, x2: &i32, y1: &i32, y2: &i32) -> i32 {
        min(*y1, *y2) * (*x2 - *x1).abs()
    }
}

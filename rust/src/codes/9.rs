struct Solution {}
impl Solution {
    pub fn is_palindrome(x: i32) -> bool {
        let x_str = x.to_string();
        let bytes = x_str.as_bytes();
        let len = bytes.len();

        if len <= 1 {
            return true;
        }

        for i in 0..len / 2 {
            if bytes[i] != bytes[len - i - 1] {
                return false;
            }
        }
        true
    }
}

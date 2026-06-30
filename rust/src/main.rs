impl Solution {
    pub fn is_palindrome(s: String) -> bool {
        let iter = s
            .chars()
            .filter(|x| x.is_ascii_alphanumeric())
            .map(|f| f.to_ascii_lowercase());

        iter.clone().eq(iter.rev())
    }
}

struct Solution {}

pub fn main() {
    Solution::is_palindrome(String::from("Was it a car or a cat I saw?"));
}

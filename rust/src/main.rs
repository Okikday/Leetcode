use std::{array, cmp, collections::HashMap};

struct Solution {}
impl Solution {
    const ROMAN_NUMERALS: [(i32, char); 7] = [
        (1, 'I'),
        (5, 'V'),
        (10, 'X'),
        (50, 'L'),
        (100, 'C'),
        (500, 'D'),
        (1000, 'M'),
    ];
    fn get_char(value: i32) -> Option<char> {
        Self::ROMAN_NUMERALS
            .iter()
            .find(|&&(val, _)| val == value)
            .map(|&(_, ch)| ch)
    }
    pub fn int_to_roman(num: i32) -> String {
        let mut digit = num;
        if digit.is_negative() == true {
            return String::new();
        }

        let digits_to_check: Vec<usize> = vec![9, 4];

        let mut pos_index: i32 = (Self::ROMAN_NUMERALS.len() - 1) as i32;

        let mut result: String = String::new();
        let digits_to_check = vec![9, 4];

        while (pos_index >= 0) {
            let resolve_4_or_9 = Self::resolve_4_or_9(&digit, &digits_to_check);
            if !resolve_4_or_9.0.is_empty() && resolve_4_or_9.1 != 0 {
                result.push_str((resolve_4_or_9.0).as_str());
                digit = resolve_4_or_9.1;
                pos_index -= 1;
                continue;
            }
            let factor = Self::ROMAN_NUMERALS.iter().enumerate()[pos_index];
        }

        result
    }

    fn digit_length(digit: i32) -> i32 {
        if digit == 0 {
            1
        } else {
            ((digit.abs() as f64).log10() as i32) + 1
        }
    }

    fn first_digit(digit: i32, times: i32) -> i32 {
        digit / times
    }

    pub fn resolve_4_or_9(digit: &i32, digits_to_check: &Vec<i32>) -> (String, i32) {
        let digit_len = Self::digit_length(*digit) - 1;
        let factor: i32 = (10_i32).pow(digit_len.try_into().unwrap());
        let copy_factor = &factor;
        let first_digit: i32 = Self::first_digit(*digit, factor);

        for check in digits_to_check {
            if *(&first_digit) == *check {
                let round_digit = first_digit * (*copy_factor);
                let mut string = String::new();
                let first = Self::get_char(*copy_factor).unwrap();
                let second = Self::get_char(*copy_factor + *(&round_digit)).unwrap();
                string.push(first);
                string.push(second);
                let rem = *digit - round_digit;
                return (string, rem);
            }
        }
        (String::new(), 0_i32)
    }
}

pub fn main() {
    Solution::int_to_roman(3749);
}

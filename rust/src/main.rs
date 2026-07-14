// use std::collections::HashMap;

// impl Solution {
//     pub fn group_anagrams(strs: Vec<String>) -> Vec<Vec<String>> {
//         let mut groups: HashMap<String, Vec<String>> = HashMap::new();

//         for s in strs {
//             let mut chars: Vec<char> = s.chars().collect();
//             chars.sort_unstable();
//             let sorted_char = chars.into_iter().collect();

//             groups.entry(sorted_char).or_insert(Vec::new()).push(s);
//         }
//         groups.into_values().collect()
//     }
// }

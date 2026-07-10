// TODO: translate to dart/rust and try fix


// i’m missing something, it’s in cpp though.

// ```
// // Idea: store a hashmap of keys -> pairs of timestamp and values.
// // Since timestamps are in strictly increasing order each time 'set' is called,
// // this property will be useful for finding the largest `time_prev` not larger than `time`
// // whenever 'get' is called. We can do this efficiently using binary search.
// class TimeMap {
// private:
//     unordered_map<string, vector<pair<int, string>>> time_map;

// public:
//     TimeMap() {}
    
//     void set(string key, string value, int timestamp) {
//         time_map[key].push_back({ timestamp, value });
//     }
    
//     string get(string key, int timestamp) {
//         if (time_map.count(key) == 0) {
//             return "";
//         }

//         auto& search_space = time_map[key];
//         int left = 0, right = search_space.size() - 1;

//         while (left < right) {
//             int mid = left + (right - left) / 2;
//             if (search_space[mid].first == timestamp) {
//                 return search_space[mid].second;
//             } else if (search_space[mid].first < timestamp) {
//                 left = mid + 1;
//             } else {
//                 right = mid;
//             }
//         }

//         cout << "[DEBUG]: " << search_space[left].first << "\n";
//         if (search_space[left].first < timestamp) {
//             return "";
//         }

//         return search_space[left].second;
//     }
// };

// /**
//  * Your TimeMap object will be instantiated and called as such:
//  * TimeMap* obj = new TimeMap();
//  * obj->set(key,value,timestamp);
//  * string param_2 = obj->get(key,timestamp);
//  */
// ```
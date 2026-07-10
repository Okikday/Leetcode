// TODO:  to fix

class TimeMap {
  final storeMap = <String, List<int>>{};
  final accessMap = <String, String>{};

  TimeMap() {}

  void set(String key, String value, int timestamp) {
    _set(key, value, timestamp);
    print(storeMap);
    print(accessMap);
  }

  String get(String key, int timestamp) {
    return _get(key, timestamp);
  }

  String concat(String key, int timestamp) => "$key$timestamp";

  void _set(String k, String v, int t) {
    if (storeMap[k] == null) storeMap[k] = []; // init new list
    final list = storeMap[k]!;
    int highestPos = -1;

    // search needs to improve
    for (int i = 0; i < list.length; i++) {
      if (list[i] > t) {
        highestPos = i;
        break;
      }
    }

    highestPos == -1 ? list.add(t) : list.insert(highestPos, t);

    final accessKey = concat(k, t);
    accessMap[accessKey] = v;
  }

  String _get(String k, int t) {
    if (storeMap[k] == null) return "";

    final list = storeMap[k]!;
    int validAccessPos = -1;

    // search needs to improve
    for (int i = 0; i < list.length; i++) {
      validAccessPos = list[i];
      if (validAccessPos > t) break;
    }
    if (validAccessPos == -1) return "";
    final accessKey = concat(k, validAccessPos);
    return accessMap[accessKey]!;
  }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * TimeMap obj = TimeMap();
 * obj.set(key,value,timestamp);
 * String param2 = obj.get(key,timestamp);
 */

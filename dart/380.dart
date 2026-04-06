import 'dart:math' as math;

class RandomizedSet {
  late final Set<int> set;
  RandomizedSet() {
    set = <int>{};
  }

  bool insert(int val) {
    return set.add(val);
  }

  bool remove(int val) {
    return set.remove(val);
  }

  int getRandom() {
    final index = math.Random().nextInt(set.length);
    return set.elementAt(index);
  }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * RandomizedSet obj = RandomizedSet();
 * bool param1 = obj.insert(val);
 * bool param2 = obj.remove(val);
 * int param3 = obj.getRandom();
 */

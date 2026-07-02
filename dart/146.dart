import 'dart:collection';

class LRUCache {
  final cache = <int, int>{};
  final lruList = DoubleLinkedQueue<int>();
  final int capacity;

  LRUCache(this.capacity);

  int get(int key) {
    if (!cache.containsKey(key)) return -1;

    lruList
      ..remove(key)
      ..addFirst(key);
    return cache[key]!;
  }

  void put(int key, int value) {
    final exists = cache[key] != null;
    if (lruList.length == capacity) {
      final last = exists ? lruList.remove(key) : lruList.removeLast();
      cache.remove(last);
    } else if (exists) {
      lruList.remove(key);
    }
    lruList.addFirst(key);

    cache[key] = value;
  }
}

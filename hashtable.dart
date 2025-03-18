void main() {}

class Hashtable {
  int size;
  late List<List<MapEntry<String, dynamic>>> buckets = [];
  Hashtable(this.size) {
    buckets = List.generate(size > 0 ? size : 1, (_) => []);
  }
  int _hashFunction(String key) {
    return key.hashCode % size;
  }

  void insert(String key, int value) {
    int index = _hashFunction(key);
    buckets[index].add(MapEntry(key, value));
    }
}

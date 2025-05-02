void main() {
  List<int> array = [
    1,
    2,
    2,
    3,
    5,
    5,
    6,
    5,
    5,
    6,
    7,
    7,
    5,
    3,
    4,
    8,
    98,
    76,
    44,
    34,
    24,
    54,
    345
  ];
  Hashtable table = Hashtable(array.length);
  table.deleteDuplicates(array);
  table.display();
}

class Node {
  String key;
  dynamic value;
  Node? next;
  Node(this.key, this.value);
}

class Hashtable {
  late int size;
  List<Node?> buckets = [];
  Hashtable(this.size) {
    buckets = List.filled(size, null);
  }
  int hash(String key) {
    int total = 0;
    for (int i = 0; i < key.length; i++) {
      total += key.codeUnitAt(i);
    }
    return total % size;
  }

  void set(String key, dynamic value) {
    int index = hash(key);
    Node? head = buckets[index];
    Node newNode = Node(key, value);
    newNode.next = head;
    buckets[index] = newNode;
  }

  void deleteDuplicates(List<int> array) {
    List<int> results = [];
    for (int i in array) {
      String key = i.toString();
      if (get(key).isEmpty) {
        set(key, i);
        results.add(i);
      }
    }
    print(results);
  }

  dynamic get(String key) {
    int index = hash(key);
    List<dynamic> results = [];
    Node? head = buckets[index];
    Node? current = head;
    while (current != null) {
      if (current.key == key) {
        results.add(current.value);
      }
      current = current.next;
    }
    return results;
  }

  void display() {
    for (var node in buckets) {
      Node? current = node;
      while (current != null) {
        print('${current.key}-> ${current.value}');
        current = current.next;
      }
    }
  }
}

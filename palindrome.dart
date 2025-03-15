void main() {
  LinkedList list = LinkedList();
  List<int> array = [1, 2, 3, 4, 54, 56, 6, 7];
  list.arrayToLinkedList(array);
  list.printList();
}

class Node {
  int value;
  Node? next;
  Node(this.value);
}

class LinkedList {
  Node? head;

  arrayToLinkedList(List<int> array) {
    for (int value in array) {
      append(value);
    }
  }

  void append(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node? current = head;
      while (current != null) {
        current = current.next;
      }
      current!.value;
    }
  }

  printList() {
    Node? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}

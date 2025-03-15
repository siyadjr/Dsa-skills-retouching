main() {
  Doublelinkedlist list = Doublelinkedlist();
  list.append(6);
  list.append(23);
  list.append(32);
  list.printList();
  print('-----------------');
  list.printReverse();
}

class Node {
  int value;
  Node? next;
  Node? prev;
  Node(this.value);
}

class Doublelinkedlist {
  Node? head;
  Node? tail;
  void append(int value) {
    if (head == null) {
      head = Node(value);
      tail = Node(value);
      return;
    } else {
      Node newNode = Node(value);
      //   Node? current = head;
      //   while (current!.next != null) {
      //     current = current.next;
      //   }
      //   current.next = newNode;
      //   newNode.prev = current;
      // }
      newNode.prev = tail;
      tail = newNode;
    }
  }

  void printList() {
    if (head == null) {
      print('No data available');
      return;
    } else {
      Node? current = head;
      while (current != null) {
        print(current.value);
        current = current.next;
      }
    }
  }

  void printReverse() {
    if (head == null) {
      print('No data available');
      return;
    } else {
      Node? current = head;

      while (current!.next != null) {
        current = current.next;
      }
      while (current != null) {
        print(current.value);
        current = current.prev;
      }
    }
  }
}

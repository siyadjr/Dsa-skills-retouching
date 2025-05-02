import 'stack.dart';

void main() {
  LinkedList list = LinkedList();
  list.append(4);
  list.append(5);
  list.append(96);
  list.prepend(7);
  list.printList();
  list.deleteNode(7);
  print('');
  list.printList();
  print('');
  list.printReverse();


}

class Node {
  int value;
  Node(this.value);
  Node? next;
}

class LinkedList {
  Node? head;
  void append(int value) {
    if (head == null) {
      head = Node(value);
      return;
    } else {
      Node? current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = Node(value);
    }
  }

  void prepend(int value) {
    if (head == null) {
      head = Node(value);
    } else {
      Node newNode = Node(value);
      newNode.next = head;
      head = newNode;
    }
  }

  void printList() {
    if (head == null) {
      return;
    } else {
      Node? current = head;
      while (current != null) {
        print(current.value);
        current = current.next;
      }
    }
  }

  void deleteNode(int value) {
    Node? prev;
    Node? next;
    if (head == null) {
      return;
    } else if (head!.value == value) {
      head = head?.next;
    } else {
      Node? current = head;
      while (current != null) {
        if (current.next?.value == value) {
          prev = current;
          next = current.next?.next;
          current.next = next;
          break;
        }
        current = current.next;
      }
    }
  }

  printReverse() {
    if (head == null) {
      print('No data available');
      return;
    } else {
      Node? current = head;
      List<int> stack = [];
      while (current != null) {
        stack.add(current.value);
        current = current.next;
      }
      for (int i = stack.length - 1; i >= 0; i--) {
        print(stack[i]);
      }
    }
  }
}

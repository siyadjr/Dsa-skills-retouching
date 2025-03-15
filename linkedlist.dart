void main() {
  LinkedList linkedList = LinkedList();
  List<int> array = [2, 3, 4, 5, 3, 54, 243];

  linkedList.append(5);
  linkedList.append(65);
  linkedList.append(42);
  linkedList.prepend(4);
  linkedList.arrayToLinkedList(array);
  linkedList.insertAtSpecificPosition(3, 100);
  linkedList.deleteNodeByValue(42);
  linkedList.printList();
}

class Node {
  int value;
  Node? next;

  Node(this.value);
}

class LinkedList {
  Node? head;

  // Append to end
  void append(int value) {
    if (head == null) {
      head = Node(value);
    } else {
      Node? current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = Node(value);
    }
  }

  // Prepend to beginning (Fixed Typo)
  void prepend(int value) {
    Node newNode = Node(value);
    newNode.next = head;
    head = newNode;
  }

  // Insert at a specific position (Fixed logic)
  void insertAtSpecificPosition(int position, int value) {
    if (position == 0) {
      prepend(value);
      return;
    }

    Node? current = head;
    int count = 0;

    while (current != null && count < position - 1) {
      current = current.next;
      count++;
    }

    if (current == null) {
      print('Position out of bounds');
      return;
    }

    Node newNode = Node(value);
    newNode.next = current.next;
    current.next = newNode;
  }

  // Convert an array to a linked list
  void arrayToLinkedList(List<int> array) {
    for (int value in array) {
      append(value);
    }
  }

  // Print the linked list
  void printList() {
    if (head == null) {
      print('The head is null, so no data');
    } else {
      Node? current = head;
      while (current != null) {
        print(current.value);
        current = current.next;
      }
    }
  }

  void deleteNodeByValue(int value) {
    if (head == null) {
      print('no data');
      return;
    } else if (head!.value == value) {
      head = head!.next;
      return;
    }
    Node? current = head;
    while (current!.next != null && current.next!.value != value) {
      current = current.next;
    }
    if (current.next != null) {
      current.next = current.next!.next;
    } else {
      print('No ellementws');
    }
  }
}

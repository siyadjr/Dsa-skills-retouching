
void main() {
  Queue queue = Queue();
  queue.enqueue(4);
  queue.enqueue(5);
  queue.enqueue(53);
  queue.printQueue();
  queue.dequeue();
  queue.printQueue();
}

class Node {
  int value;
  Node(this.value);
  Node? next;
}

class Queue {
  Node? front;
  Node? rear;
  void enqueue(int value) {
    Node newNode = Node(value);
    if (rear == null) {
      front = rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  int? dequeue() {
    if (front == null) {
      return null;
    } else {
      final value = front!.value;
      front = front!.next;
      return value;
    }
  }

  void printQueue() async {
    if (front == null) {
      print('no elements');
    } else {
      Node? current = front;
      while (current != null) {
        print(current.value.toString());
        current = current.next;
      }
    }
  }
}

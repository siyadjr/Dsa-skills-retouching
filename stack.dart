import 'dart:developer';

void main() {
  Stack stack = Stack();
  stack.push(3);
  stack.push(4);
  stack.push(6);
  stack.push(9);
  log('the last element is ${stack.pop()}');
  stack.printStack();
}

class Stack {
  List<int> stack = [];
  void push(int value) {
    stack.add(value);
  }

  int? pop() {
    if (stack.isNotEmpty) {
      return stack.removeLast();
    } else {
      return null;
    }
  }

  void printStack() {
    log(stack.toString());
  }
}

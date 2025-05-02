void main() {
  Stack stack = Stack();
  String str = 'dayis';
  stack.reverseString(str);
}

class Stack {
  List<String> stack = [];
  void reverseString(String str) {
    for (int i = 0; i < str.length; i++) {
      enque(str[i]);
    }
    String result = '';
    while (stack.isNotEmpty) {
      result += deque();
    }
    print(result);
  }

  void enque(String str) {
    stack.add(str);
  }

  String deque() {
    return stack.removeLast();
  }
}

import 'dart:collection';

void main() {
  Tree tree = Tree();
  tree.insert(1);
  tree.insert(2);
  tree.insert(3);
  tree.insert(4);
  tree.preOrder(tree.root);
}

class Node {
  int value;
  Node? left;
  Node? right;
  Node(this.value);
}

class Tree {
  Node? root;

  void insert(int value) {
    Node newNode = Node(value);
    if (root == null) {
      root = newNode;
      return;
    } else {
      Queue queue = Queue();
      queue.add(root!);
      while (queue.isNotEmpty) {
        Node current = queue.removeFirst();
        if (current.left == null) {
          current.left = newNode;
          break;
        } else {
          queue.add(current.left);
        }
        if (current.right == null) {
          current.right = newNode;
          break;   
        } else {
          queue.add(current.right);
        }
      }
    }
  }

  void preOrder(Node? node) {
    if (node == null) return;
    print(node.value);
    preOrder(node.left);
    preOrder(node.right);
  }
}

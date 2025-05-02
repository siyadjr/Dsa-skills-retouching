

import 'dart:collection';

void main() {
  BinaryTree tree = BinaryTree();
  tree.insert(5);
  tree.insert(6);
  tree.insert(4);
  tree.insert(32);
  tree.insert(13);
  tree.insert(87);
  tree.preOrderTraverse(tree.root);
  tree.deleteNode(4, tree.root);
  print('');
  tree.preOrderTraverse(tree.root);
}

class Node {
  int value;
  Node? left;
  Node? right;
  Node(this.value);
}

class BinaryTree {
  Node? root;
  void insert(int value) {
    Node newNode = Node(value);
    if (root == null) {
      root = Node(value);
    } else {
      Queue queue = Queue();
      queue.add(root);
      while (queue.isNotEmpty) {
        Node current = queue.removeFirst();
        if (current.left == null) {
          current.left = newNode;
          return;
        } else {
          queue.add(current.left);
        }
        if (current.right == null) {
          current.right = newNode;
          return;
        } else {
          queue.add(current.right);
        }
      }
    }
  }

  void preOrderTraverse(Node? node) {
    if (node == null) {
      return;
    }
    print(node.value);
    preOrderTraverse(node.left);
    preOrderTraverse(node.right);
  }

  Node? deleteNode(int value, Node? node) {
    if (node == null) return null;
    Node? valueNode;
    Node? lastNode;
    Node? parentNode;
    Queue queue = Queue();
    queue.add(node);
    while (queue.isNotEmpty) {
      Node current = queue.removeFirst();
      if (current.value == value) {
        valueNode = current;
      }
      if (current.left != null) {
        parentNode = current;
        queue.add(current.left);
      }
      if (current.right != null) {
        parentNode = current;
        queue.add(current.right);
      }
      lastNode = current;
    }
    if (valueNode != null && lastNode != null) {
      valueNode.value = lastNode.value;
      if (parentNode?.right==lastNode) {
        parentNode?.right = null;
      } else if (parentNode?.left== lastNode) {
        parentNode?.left = null;
      } else if (root == lastNode) {
        root = null;
      }
    }
    return root;
  }
}

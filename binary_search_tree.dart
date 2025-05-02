void main() {}

class Node {
  int value;
  Node? left;
  Node? right;
  Node(this.value);
}

class BinarySearchTree {
  Node? root;
  void insert(int value) {
    root = insertHelper(value, root);
  }

  Node insertHelper(int value, Node? node) {
    if (root == null) {
      return Node(value);
    } else {
      if (node!.value > value) {
        node.left = insertHelper(value, node.left);
      } else {
        node.right = insertHelper(value, node.right);
      }
    }
    return node;
  }
}

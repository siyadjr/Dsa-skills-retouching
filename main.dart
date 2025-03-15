void main() {
  BinaryTree tree = BinaryTree();
  tree.insert(3);
  tree.insert(5);
  tree.insert(35);
  tree.insert(23);
  tree.insert(2);
  tree.insert(24);
  tree.preOrderTraverse(tree.root);
  // print('Largest element of this tree is ${tree.findLargestValue(tree.root)}');
  // print(
  //     'second Largest element of this tree is ${tree.findSecondLargestValue(tree.root)}');
  // print('height of this tree is  ${tree.findheight(tree.root)}');
  tree.deleteNode(tree.root, 23);
  print('after deletion:');
  tree.preOrderTraverse(tree.root);
  print('depth of 24 is ${tree.finddepth(tree.root, 24)}');
  print('this tree is bst? ${tree.isBst(tree.root)}');
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
    root = insertChecker(root, value);
  }

  Node? insertChecker(Node? node, int value) {
    if (node == null) {
      node = Node(value);
    }
    if (node.value > value) {
      node.left = insertChecker(node.left, value);
    } else if (node.value < value) {
      node.right = insertChecker(node.right, value);
    }
    return node;
  }

  preOrderTraverse(Node? node) {
    if (node != null) {
      print(node.value);
      preOrderTraverse(node.left);
      preOrderTraverse(node.right);
    }
  }

  int? findLargestValue(Node? node) {
    if (node == null) {
      return null;
    }
    Node? current = node;
    while (current!.right != null) {
      current = current.right;
    }
    return current.value;
  }

  double? findSecondLargestValue(Node? node) {
    if (node == null) {}
    double first = double.negativeInfinity;
    double second = double.negativeInfinity;

    find(Node? node) {
      if (node == null) {
        return null;
      }
      if (node.value > first) {
        first = node.value.toDouble();
      } else if (node.value > second && node.value != first) {
        second = node.value.toDouble();
      }
      find(node.left);
      find(node.right);
    }

    find(node);

    return second;
  }

  int? findheight(Node? node) {
    if (node == null) {
      return -1;
    }
    int leftindex = findheight(node.left)!;
    int rightindex = findheight(node.right)!;

    return 1 + (leftindex > rightindex ? leftindex : rightindex);
  }

  deleteNode(Node? node, int value) {
    if (node == null) {
      return null;
    }
    if (node.value < value) {
      node.right = deleteNode(node.right, value);
    } else if (node.value > value) {
      node.left = deleteNode(node.left, value);
    } else {
      if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }
      node.value = minValue(node.right);
      node.right = deleteNode(node.right, node.value);
    }
    return node;
  }

  int minValue(Node? node) {
    int value = node!.value;
    while (node!.left != null) {
      node = node.left;
      value = node!.value;
    }
    return value;
  }

  int finddepth(Node? node, int value, [int depth = 0]) {
    if (node == null) {
      return -1;
    }
    if (node.value == value) {
      return depth;
    } else if (node.value > value) {
      return finddepth(node.left, value, depth + 1);
    } else {
      return finddepth(node.right, value, depth + 1);
    }
  }

  bool isBst(Node? node) {
    return isBstChecker(node, double.negativeInfinity, double.infinity);
  }

  bool isBstChecker(Node? node, double min, double max) {
    if (node == null) {
      return true;
    }
    if (min >= node.value || max <= node.value) {
      return false;
    }
    return isBstChecker(node.left, min, node.value.toDouble()) &&
        isBstChecker(node.right, node.value.toDouble(), max);
  }
}

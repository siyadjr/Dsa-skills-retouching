void main() {
  TrieNode root = TrieNode();
  root.insert('Amal');
  root.insert('Siyad');
  root.insert('Sribin ');
  root.insert('Riya');
  root.insert('Hina');
  root.insert('Chandana');
  root.printTrie();
  final result = root.searchTheWord('Amal');
  print('the result is $result');
}

class Node {
  Map<String, Node> children = {};
  bool endword = false;
}

class TrieNode {
  Node root = Node();
  void insert(String word) {
    Node current = root;
    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      if (!current.children.containsKey(letter)) {
        current.children[letter] = Node();
      }
      current = current.children[letter]!;
    }
    current.endword = true;
  }

  printTrie() {
    displayHelper(root, '');
  }

  displayHelper(Node node, String word) {
    if (node.endword) {
      print(word);
    }
    node.children
        .forEach((char, childNode) => displayHelper(childNode, word + char));
  }

  searchTheWord(String word) {
    Node current = root;
    for (int i = 0; i < word.length; i++) {
      String letter = word[i];
      if (!current.children.containsKey(letter)) {
        return false;
      }
      current = current.children[letter]!;
    }
    if (current.endword) {
      return word;
    } else {
      return 'There is no word like that you idiot!';
    }
  }
}

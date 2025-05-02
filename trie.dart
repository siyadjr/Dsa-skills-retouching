void main() {}

class TrieNode {
  Map<String, TrieNode> childrens = {};
  bool isEndOfWord = false;
}

class Trie {
  TrieNode root = TrieNode();
  void insert(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      
      node.childrens.putIfAbsent(char, () => TrieNode());
      node = node.childrens[char]!;
    }
    node.isEndOfWord = true;
  }

  List<String> autoSuggestion(
    String word,
  ) {
    List<String> result = [];
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!root.childrens.containsKey(char)) {
        return result;
      } else {
        node = node.childrens[char]!;
        if (node.isEndOfWord) {
          result.add(node.childrens.entries.first.key);
        }
      }
    }

    return result;
  }

  void dfs(List<String> result, String current, TrieNode node) {
    if (node.isEndOfWord) {
      result.add(current);
    }
    for (var entry in node.childrens.entries) {
      dfs(result, current + entry.key, entry.value);
    }
  }
}

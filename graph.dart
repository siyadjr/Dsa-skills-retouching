void main() {
  Graph graph = Graph();
  graph.addVertex('Siyad');
  graph.addVertex('Keerthu');
  graph.addVertex('Neymar');
  graph.addEdge('Siyad', 'Keerthu', isDirected: true);
  graph.addEdge('Siyad', 'Neymar', isDirected: false);
  graph.display();
}

class Graph {
  Map<String, List<String>> adjList = {};
  void addVertex(String vertex) {
    adjList.putIfAbsent(vertex, () => []);
  }

  void addEdge(String v1, String v2, {bool isDirected = false}) {
    if(!adjList.containsKey(v1)){
      
    }
    if (isDirected) {
      adjList[v2]?.add(v1);
    }
  }

  void display() {
    adjList.forEach((key, value) {
      print('$key -> $value');
    });
  }
}

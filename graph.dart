void main() {
  Graph graph = Graph();
  graph.addVertex(1);
  graph.addVertex(3);
  graph.addVertex(5);
  graph.addVertex(6);
  graph.addEdges(1, 3);
  graph.addEdges(2, 5, isDirected: true);
  graph.display();
  graph.removeVertex(3);
  graph.display();
  graph.removeEdge(1, 3);
  print('after remove');
  graph.display();
}

class Graph {
  Map<int, List<int>> adjuestList = {};
  void addVertex(int value) {
    if (!adjuestList.containsKey(value)) {
      adjuestList[value] = [];
    }
  }

  void addEdges(int vertex1, int vertex2, {bool isDirected = false}) {
    adjuestList[vertex1]?.add(vertex2);
    adjuestList[vertex2]?.add(vertex1);
  }

  void display() {
    adjuestList.forEach((vertex, edges) {
      print('$vertex -> ${edges.join(',')}');
    });
  }

  void removeVertex(int key) {
    if (adjuestList.containsKey(key)) {
      adjuestList.remove(key);
    }
  }

  void removeEdge(int vertex1, int vertex2) {
    adjuestList[vertex1]?.remove(vertex2);
    adjuestList[vertex2]?.remove(vertex1);
  }

  bool isCycle() {
    Set<int> visited = {};
    for (int vertex in adjuestList.keys) {
      if (!visited.contains(vertex)) {
        if (isCycleUndirected(vertex, -1, visited)) {
          return true;
        }
      }
    }
    return true;
  }

  bool isCycleUndirected(int vertex, int parent, Set<int> visited) {
    visited.add(vertex);
    for (int neightbor in adjuestList[vertex]!) {
      if (!visited.contains(neightbor)) {
        if (isCycleUndirected(vertex, parent, visited)) {
          return true;
        }
      } else if (neightbor != parent) {
        return true;
    }
    }
    return false;
  }
}

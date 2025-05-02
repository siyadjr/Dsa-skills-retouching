void main() {
  MaxHeap heap = MaxHeap();
  heap.insert(4);
  heap.insert(6);
  heap.insert(5);
  heap.insert(3);
  heap.insert(7);
  heap.preOrder(0);
}

class MaxHeap {
  List<int> heap = [];
  void insert(int value) {
    heap.add(value);
    shiftUp(heap.length - 1);
  }

  shiftUp(int index) {
    while (index > 0) {
      int parentindex = (index - 1) ~/ 2;
      if (heap[index] > heap[parentindex]) {
        swap(index, parentindex);
        index = parentindex;
      } else {
        break;
      }
    }
  }

  void shiftDown(int index) {
    int leftChild = 2 * index + 1; 
    int rightChild = 2 * index + 2;
    int largest = index;
    if (leftChild < heap.length && heap[leftChild] > heap[largest]) {
      largest = leftChild;
    }
    if (rightChild < heap.length && heap[rightChild] > heap[largest]) {
      largest = rightChild;
    }
    if (largest != index) {
      swap(index, largest);
      shiftDown(largest);
    }
  }

  int getMax() {
    if (heap.isEmpty) {
      throw Exception('no data');
    }
    return heap[0];
  }

  int removeMax() {
    if (heap.isEmpty) {
      throw Exception('no data');
    }
    if (heap.length == 1) {
      return heap.removeLast();
    }
    int max = heap[0];
    heap[0] = heap.removeLast();
    shiftDown(0);
    return max;
  }

  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  void preOrder(int index) {
    if (index >= heap.length) {
      return;
    }
    print(heap[index]);
    preOrder(index * 2 + 1);
    preOrder(index * 2 + 2);
  }
}



void main() {
  MaxHeap heap = MaxHeap();
  heap.insert(4);
  heap.insert(6);
  heap.insert(3);
  heap.display();
}

class MaxHeap {
  List<int> heapArray = [];
  void insert(int value) {
    heapArray.add(value);
    shiftUp(heapArray.length - 1);
  }

  void heapify(List<int> array) {
    heapArray = List<int>.from(array);
    for (int i = (heapArray.length - 1) ~/ 2; i >= 0; i--) {
      shiftDown(i);
    }
  }

  shiftUp(int index) {
    while (index > 0 && heapArray[getParrent(index)] > heapArray[index]) {
      swap(index, getParrent(index));
      index = getParrent(index);
    }
  }

  shiftDown(int index) {
    int left = leftChild(index);
    int size = heapArray.length;
    int right = rightChild(index);
    int largest = index;
    if (left < size && heapArray[left] > heapArray[largest]) {
      largest = index;
    }
    if (right < size && heapArray[right] > heapArray[largest]) {
      largest = index;
    }
    if (largest != index) {
      swap(index, largest);
      shiftDown(largest);
    }
  }

  int getParrent(int index) => (index - 1) ~/ 2;
  int leftChild(int index) => 2 * index + 1;
  int rightChild(int index) => 2 * index + 2;
  void swap(int index1, int index2) {
    int temp = heapArray[index1];
    heapArray[index1] = heapArray[index2];
    heapArray[2] = temp;
  }

  display() {
    if (heapArray.isNotEmpty) {
      print(heapArray.join(','));
    }
  }
}



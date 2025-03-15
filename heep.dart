void main() {
  // Example of using the MaxHeap class
  MaxHeap heap = MaxHeap([3, 9, 2, 1, 4, 5]);
  print(heap.heapArray); // Output: [9, 4, 5, 1, 3, 2]
  
  List<int> array = [8, 3, 5, 6, 233, 5, 3, 23, 45];
  heap.insert(10);
  print(heap.heapArray); // Output: [10, 9, 5, 1, 4, 2, 3]
  
  print("Original array: $array");
  var sortedArray = heapSort(array);
  print("Sorted array: $sortedArray");
}

class MaxHeap {
  List<int> heapArray = [];

  MaxHeap(List<int> initialArray) {
    if (initialArray.isNotEmpty) {
      heapify(initialArray);
    }
  }

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

  void shiftUp(int index) {
    while (index > 0 && heapArray[index] > heapArray[getParent(index)]) {
      swap(index, getParent(index));
      index = getParent(index);
    }
  }

  void shiftDown(int index) {
    int left = leftChild(index);
    int right = rightChild(index);
    int size = heapArray.length;
    int largest = index;
    if (left < size && heapArray[left] > heapArray[largest]) {
      largest = left;
    }
    if (right < size && heapArray[right] > heapArray[largest]) {
      largest = right;
    }
    if (largest != index) {
      swap(largest, index);
      shiftDown(largest);
    }
  }

  void swap(int index1, int index2) {
    int temp = heapArray[index1];
    heapArray[index1] = heapArray[index2];
    heapArray[index2] = temp;
  }

  int? extractMax() {
    if (heapArray.isEmpty) {
      return null;
    }
    int max = heapArray[0];
    heapArray[0] = heapArray.removeLast();  // Swap the root with the last element
    if (heapArray.isNotEmpty) {
      shiftDown(0);  // Restore heap property after removing the max
    }
    return max;
  }

  int getParent(int value) => (value - 1) ~/ 2;
  int leftChild(int value) => 2 * value + 1;
  int rightChild(int value) => 2 * value + 2;
}

List<int> heapSort(List<int> array) {
  MaxHeap heap = MaxHeap(array);
  List<int> sortedArray = [];
  while (heap.heapArray.isNotEmpty) {
    sortedArray.add(heap.extractMax()!);
  }
  return sortedArray;
}

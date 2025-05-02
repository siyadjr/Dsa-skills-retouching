void main() {
  List<int> array = [3, 5, 6, 2, 1, 4, 6];
  heapSort(array);
  print(array);
}

void heapSort(List<int> array) {
  int n = array.length;
  for (int i = 0; i < n ~/ 2; i++) {
    heapify(array, n, i);
  }
  for (int i = n - 1; i > 0; i--) {
    swap(array, 0, i);
    heapify(array, i, 0);
  }
}

void heapify(List<int> arr, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && arr[left] > arr[largest]) {
    largest = left;
  }
  if (right < n && arr[right] > arr[largest]) {
    largest = right;
  }
  if (largest != i) {
    swap(arr, i, largest);
  }
}

void swap(List<int> arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}


void main() {
  List<int> arr = [4, 2, 4, 5, 2, 6, 7, 2, 24, 763, 23, 65];
  print("Bubble Sort: ${bubbleSort(List.from(arr))}");
  print("Selection Sort: ${selectionSort(List.from(arr))}");
  print("Insertion Sort: ${insertionSort(List.from(arr))}");
  print("Merge Sort: ${mergeSort(List.from(arr))}");
  print("Quick Sort: ${quicksort(List.from(arr))}");
}

List<int> bubbleSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  return arr;
}

List<int> selectionSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    int temp = arr[i];
    arr[i] = arr[minIndex];
    arr[minIndex] = temp;
  }
  return arr;
}

List<int> insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
  return arr;
}

List<int> arr = [4, 1, 3, 2];
List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) {
    return arr;
  }
  int mid = arr.length ~/ 2;
  List<int> leftArray = mergeSort(arr.sublist(0, mid));
  List<int> rightArray = mergeSort(arr.sublist(mid));
  return merge(leftArray, rightArray);
}

List<int> merge(List<int> leftArray, List<int> rightArray) {
  List<int> result = [];
  int i = 0;
  int j = 0;
  while (i < leftArray.length && j < rightArray.length) {
    if (leftArray[i] < rightArray[j]) {
      result.add(leftArray[i++]);
    } else {
      result.add(rightArray[j++]);
    }
  }
  result.addAll(leftArray.sublist(i));
  result.addAll(rightArray.sublist(j));
  return result;
}

List<int> quicksort(List<int> arr) {
  if (arr.length <= 1) {
    return arr;
  }
  int pivot = arr[arr.length - 1];
  List<int> left = [];
  List<int> right = [];
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] <= pivot) {
      left.add(arr[i]);
    } else {
      right.add(arr[i]);
    }

  }
  return [...quicksort(left),pivot,...quicksort(right)];
}

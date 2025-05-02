void main() {
  List<int> arr = [
    4,
    3,
    5,
    2,
    2,
    2,
    2,
    2,
    56,
    1,
    43,
    2,
    14,
    5,
    34,
  ];
  largestElementUsingInsertionSort(arr);
  findSecondLargest(arr);
  print('after delete ');
  DeleteDuplicates(arr);
}

largestElementUsingInsertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
  print(arr);
}

findSecondLargest(List<int> arr) {
  int? largest;
  int? second;
  for (int i = 0; i < arr.length; i++) {
    if (largest == null || largest < arr[i]) {
      second = largest;
      largest = arr[i];
    }
    if (largest > arr[i] && second! < arr[i]) {
      second = arr[i];
    }
  }
  print('second element is : $second');
}

void DeleteDuplicates(List<int> arr) {
  if (arr.isEmpty) return;
  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr.length; j++) {
      if (i != j) {
        if (arr[i] == arr[j]) {
          arr.removeAt(j);
          j--;
        }
      }
    }
  }
  print(arr);
}

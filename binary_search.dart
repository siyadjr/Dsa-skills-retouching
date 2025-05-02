  void main() {
    List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    print(binarySearch(5, arr));
    print(binarySearchUsingRecurion(arr,0,arr.length-1,7));
  }

  int binarySearch(int target, List<int> arr) {
    int left = 0;
    int right = arr.length - 1;
    int mid = (left + right) ~/ 2;
    while (left <= right) {
      if (arr[mid] == target) {
        return mid;
      } else if (arr[mid] > target) {
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }
    return -1;
  }

  int binarySearchUsingRecurion(List<int> arr, int left, int right, int target) {
    if (arr.isEmpty) {
      return -1;
    }
    int mid = (left + right) ~/ 2;
    if (arr[mid] == target) {
      return mid;
    } else if (arr[mid] > target) {
    return  binarySearchUsingRecurion(arr, left, mid, target);
    } else {
    return binarySearchUsingRecurion(arr, mid, right, target);
    }
  }

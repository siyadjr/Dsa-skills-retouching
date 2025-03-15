void main() {
  // List<int> nums = [1, 2, 3, 4, 5, ];
  // int sum = sumOfArray(nums, nums.length);
  // print('The result is $sum');
  String str = 'Naruto Uzumaki';
  print('The result is ${reverseString(str)}');
}

int sumOfArray(List<int> nums, int length) {
  if (length == 0) {
    return 0;
  }
  return nums[length - 1] + sumOfArray(nums, length - 1);
}

String reverseString(String str) {
  if (str.isEmpty) {
    return '';
  }
  return reverseString((str.substring(1) ))+str[0];
}

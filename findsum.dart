void main() {
  int value = 10299;
  findsum(value);
}

findsum(int value) {
  int sum = 0;
  while (value > 0) {
    sum += value % 10;
    ;
    value = value ~/ 10;
  }
  print(sum);
}

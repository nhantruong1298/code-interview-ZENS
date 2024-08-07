List<int> miniMaxSum(List<int> array) {
  if (array.length != 5) {
    throw ArgumentError('Array must have 5 elements');
  }

  array.sort();

  int minSum = array.sublist(0, 4).reduce((a, b) => a + b);
  int maxSum = array.sublist(1, 5).reduce((a, b) => a + b);

  return [minSum, maxSum];
}
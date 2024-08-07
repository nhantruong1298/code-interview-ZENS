List<int> miniMaxSum(List<int> array) {
  if (array.length != 5) {
    throw ArgumentError('Array must have 5 elements');
  }

  int min = array.first;
  int max = array.first;

  int sum = array.reduce((value, element) {
    if (element < min) {
      min = element;
    }

    if (element > max) {
      max = element;
    }

    return value + element;
  });

  return [sum - max, sum - min];
}

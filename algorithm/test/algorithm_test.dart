import 'package:algorithm/algorithm.dart';
import 'package:test/test.dart';

void main() {
  test('algorithm', () {
    expect(miniMaxSum([1, 2, 3, 4, 5]), equals([10, 14]));
    expect(miniMaxSum([9, 8, 7, 6, 5]), equals([26, 30]));

    expect(miniMaxSum([1, 1, 1, 1, 1]), equals([4, 4]));
    expect(miniMaxSum([0, 0, 0, 0, 0]), equals([0, 0]));

    expect(() => miniMaxSum([1, 2, 3, 4]), throwsArgumentError);
    expect(() => miniMaxSum([1, 2, 3, 4, 5, 6]), throwsArgumentError);
  });
}

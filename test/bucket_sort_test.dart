import 'package:flutter_test/flutter_test.dart';
import 'package:trikeright/features/history/domain/bucket_sort.dart';

void main() {
  test('BucketSort sorts a list of integers correctly', () {
    final List<double> unsorted = [5, 3, 8, 4, 2];
    final List<double> sorted = [2, 3, 4, 5, 8];

    expect(BucketSort.bucketSortReturn(unsorted), sorted);
  });

  test('BucketSort handles empty list', () {
    final List<double> emptyList = [];
    final List<double> sorted = [];

    expect(BucketSort.bucketSortReturn(emptyList), sorted);
  });

  test('BucketSort handles list with duplicate values', () {
    final List<double> unsorted = [5, 3, 8, 4, 2, 3, 5];
    final List<double> sorted = [2, 3, 3, 4, 5, 5, 8];

    expect(BucketSort.bucketSortReturn(unsorted), sorted);
  });

  test('BucketSort handles list with negative values', () {
    final List<double> unsorted = [-5, 3, -8, 4, -2];
    final List<double> sorted = [-8, -5, -2, 3, 4];

    expect(BucketSort.bucketSortReturn(unsorted), sorted);
  });

  test('BucketSort handles already sorted list', () {
    final List<double> sortedList = [2, 3, 4, 5, 8];

    expect(BucketSort.bucketSortReturn(sortedList), sortedList);
  });

  test('BucketSort handles large list', () {
    final List<double> unsorted = List.generate(10000, (index) => index * 2.0);

    // Sort the list using Dart's built-in sorting for comparison
    final List<double> sorted = List.from(unsorted)..sort();

    expect(BucketSort.bucketSortReturn(unsorted), sorted);
  });
}

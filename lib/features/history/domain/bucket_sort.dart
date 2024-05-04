class BucketSort {
  static void bucketSort(List<double> arr) {
    int n = arr.length;
    if (n <= 0) {
      return;
    }

    // 1) Find maximum and minimum values in arr[]
    double maxVal = arr[0];
    double minVal = arr[0];
    for (int i = 1; i < n; i++) {
      if (arr[i] > maxVal) {
        maxVal = arr[i];
      }
      if (arr[i] < minVal) {
        minVal = arr[i];
      }
    }

    // 2) Create n empty buckets
    double range = maxVal - minVal;
    List<List<double>> buckets = List<List<double>>.generate(n, (i) => []);

    // 3) Put array elements in different buckets
    for (int i = 0; i < n; i++) {
      int bucketIndex = ((arr[i] - minVal) / range * (n - 1)).floor();
      buckets[bucketIndex].add(arr[i]);
    }

    // 4) Sort individual buckets
    for (int i = 0; i < n; i++) {
      buckets[i].sort();
    }

    // 5) Concatenate all buckets into arr[]
    int index = 0;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < buckets[i].length; j++) {
        arr[index++] = buckets[i][j];
      }
    }
  }

  static List<double> bucketSortReturn(List<double> arr) {
    int n = arr.length;
    if (n <= 0) {
      return [];
    }

    // 1) Find maximum and minimum values in arr[]
    double maxVal = arr[0];
    double minVal = arr[0];
    for (int i = 1; i < n; i++) {
      if (arr[i] > maxVal) {
        maxVal = arr[i];
      }
      if (arr[i] < minVal) {
        minVal = arr[i];
      }
    }

    // 2) Create n empty buckets
    double range = maxVal - minVal;
    List<List<double>> buckets = List<List<double>>.generate(n, (i) => []);

    // 3) Put array elements in different buckets
    for (int i = 0; i < n; i++) {
      int bucketIndex = ((arr[i] - minVal) / range * (n - 1)).floor();
      buckets[bucketIndex].add(arr[i]);
    }

    // 4) Sort individual buckets
    for (int i = 0; i < n; i++) {
      buckets[i].sort();
    }

    // 5) Concatenate all buckets into sortedList
    List<double> sortedList = [];
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < buckets[i].length; j++) {
        sortedList.add(buckets[i][j]);
      }
    }

    return sortedList;
  }
}

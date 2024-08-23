import 'algorithm.dart';

class QuickSort extends Algorithm {
  QuickSort({required super.sortInfo, required super.onSprint})
      : super(name: "Quick sort");

  @override
  Future<void> call() async {
    quickSort(numbers, 0, sortInfo.count - 1);
  }

  void quickSort(List list, int low, int high) async {
    if (low < high) {
      int pi = await partition(low, high);
      quickSort(list, low, pi - 1);
      quickSort(list, pi + 1, high);
    }
  }

  Future<int> partition(low, high) async {
    if (numbers.isEmpty) {
      return 0;
    }
    int pivot = numbers[high];
    int i = low - 1;
    for (int j = low; j < high; j++) {
      if (numbers[j] < pivot) {
        i++;
        swap(numbers, i, j);
        onSprint.call(numbers);
        await Future.delayed(Duration(milliseconds: sortInfo.interval));
      }
    }
    swap(numbers, i + 1, high);
    onSprint.call(numbers);
    return i + 1;
  }
}

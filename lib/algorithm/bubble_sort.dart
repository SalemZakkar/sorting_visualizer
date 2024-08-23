import 'algorithm.dart';

class BubbleSort extends Algorithm {
  BubbleSort({required super.sortInfo, required super.onSprint})
      : super(name: "Bubble sort");

  @override
  Future<void> call() async {
    for (int i = 0; i < numbers.length - 1; i++) {
      bool swapped = false;
      for (int j = 0; j < numbers.length - i - 1; j++) {
        if (numbers[j] > numbers[j + 1]) {
          swap(numbers, j, j+1);
          onSprint.call(numbers);
          await Future.delayed(Duration(milliseconds: sortInfo.interval));
          swapped = true;
        }
      }

      if (swapped == false) {
        break;
      }
    }
    print("sorted");
  }
}

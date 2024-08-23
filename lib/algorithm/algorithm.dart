import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sorting_visualizer/sort_info.dart';
abstract class Algorithm {
  late SortInfo sortInfo;
  late String name;
  late List<int> numbers;
  late ValueChanged<List<int>> onSprint;

  void setData({required int count, required int interval}) {
    sortInfo.interval = interval;
    sortInfo.count = count;
    init();
  }

  Algorithm(
      {required this.sortInfo, required this.onSprint, required this.name}) {
    init();
  }

  void init() {
    int k = 0;
    numbers = List.generate(sortInfo.count, (index) => k++);
    numbers.shuffle();
    log("Generated List ****");
    log(numbers.toString());
  }

  Future<void> call();
}


void swap(List list , int i , int j){
  int x = list[i] , y = list[j];
  list[j] = x;
  list[i] = y;
}

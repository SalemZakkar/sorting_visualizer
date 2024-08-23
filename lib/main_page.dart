import 'package:flutter/material.dart';
import 'package:sorting_visualizer/algorithm/algorithm.dart';
import 'package:sorting_visualizer/sort_sheet.dart';
import 'package:sorting_visualizer/visualizer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<int> numbers = [];
  Algorithm? algorithm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sorting visualizer'),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: VisualizerWidget(
                  numbers: numbers,
                )),
            SortSheet(
              onSelect: (val) {
                setState(() {
                  algorithm = val;
                  numbers = algorithm!.numbers;
                });
                algorithm?.call();
              },
              onSprint: (val) {
                setState(() {
                  numbers = val;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

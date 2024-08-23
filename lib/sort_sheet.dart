import 'package:flutter/material.dart';
import 'package:sorting_visualizer/algorithm/algorithm.dart';
import 'package:sorting_visualizer/algorithm/quick_sort.dart';
import 'package:sorting_visualizer/sort_info.dart';

import 'algorithm/bubble_sort.dart';

class SortSheet extends StatefulWidget {
  final ValueChanged<Algorithm> onSelect;
  final ValueChanged<List<int>> onSprint;

  const SortSheet({super.key, required this.onSelect, required this.onSprint});

  @override
  State<SortSheet> createState() => _SortSheetState();
}

class _SortSheetState extends State<SortSheet> {
  List<Algorithm> algorithms = [];
  int count = 100;
  int interval = 0;
  Algorithm? algorithm;
  GlobalKey<FormState> form = GlobalKey();

  @override
  void initState() {
    super.initState();
    algorithms = [
      BubbleSort(
        sortInfo: SortInfo(
          interval: interval,
          count: count,
        ),
        onSprint: widget.onSprint,
      ),
      QuickSort(
        sortInfo: SortInfo(
          interval: interval,
          count: count,
        ),
        onSprint: widget.onSprint,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            DropdownButtonFormField<Algorithm>(
              validator: (e) {
                if (algorithm == null) {
                  return "Required";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: "Sorting algorithm"),
              items: algorithms
                  .map((e) => DropdownMenuItem<Algorithm>(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: (val) {
                algorithm = val;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (val) {
                      interval = int.tryParse(val) ?? 2;
                    },
                    keyboardType: TextInputType.number,
                    initialValue: interval.toString(),
                    decoration: const InputDecoration(
                        hintText: "delay (ms)", labelText: "delay (ms)"),
                    validator: (e) {
                      if (e?.trim().isEmpty == true || e == null) {
                        return "Required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: count.toString(),
                    onChanged: (val) {
                      count = int.tryParse(val) ?? 2;
                    },
                    decoration: const InputDecoration(
                        hintText: "count", labelText: "count"),
                    keyboardType: TextInputType.number,
                    validator: (e) {
                      if (e?.trim().isEmpty == true || e == null) {
                        return "Required";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                  if (form.currentState!.validate()) {
                    algorithm?.setData(count: count, interval: interval);

                    widget.onSelect.call(algorithm!);
                  }
                },
                child: const Text("GO"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

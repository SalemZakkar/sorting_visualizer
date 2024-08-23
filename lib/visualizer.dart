import 'package:flutter/material.dart';

class VisualizerWidget extends StatefulWidget {
  final List<int> numbers;

  const VisualizerWidget({super.key, required this.numbers});

  @override
  State<VisualizerWidget> createState() => _VisualizerWidgetState();
}

class _VisualizerWidgetState extends State<VisualizerWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Theme.of(context).colorScheme.primary,
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (int i = 0; i < widget.numbers.length; i++)
                Container(
                  height: (widget.numbers[i] / widget.numbers.length) *
                              constraints.maxHeight ==
                          0
                      ? 10
                      : (widget.numbers[i] / widget.numbers.length) *
                          constraints.maxHeight,
                  width: (constraints.maxWidth).abs() / widget.numbers.length,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}

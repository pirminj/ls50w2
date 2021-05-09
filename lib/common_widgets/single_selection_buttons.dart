import 'package:flutter/material.dart';

class SingleSelectionButtons<T> extends StatefulWidget {
  const SingleSelectionButtons({
    Key? key,
    required this.selected,
    required this.options,
    required this.onSelected,
  }) : super(key: key);

  final T selected;
  final Map<T, String> options;
  final void Function(T) onSelected;

  @override
  _SingleSelectionButtonsState<T> createState() =>
      _SingleSelectionButtonsState<T>();
}

class _SingleSelectionButtonsState<T> extends State<SingleSelectionButtons<T>> {
  late List<bool> _isSelected;

  List<bool> get falseList => List.filled(widget.options.length, false);

  @override
  void initState() {
    _setup();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SingleSelectionButtons<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      _setup();
    }
  }

  void _setup() {
    _isSelected = falseList;
    _isSelected[widget.options.keys.toList().indexOf(widget.selected)] = true;
  }

  void onPressed(int index) {
    _isSelected = falseList;
    widget.onSelected(widget.options.keys.toList()[index]);
    setState(() {
      _isSelected[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ToggleButtons(
        selectedColor: theme.colorScheme.onSecondary,
        fillColor: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(32),
        children: widget.options.values.map(buildButton).toList(),
        isSelected: _isSelected,
        onPressed: onPressed,
      ),
    );
  }

  Container buildButton(String option) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      child: Text(option),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

class ValueSlider extends StatefulWidget {
  ValueSlider({
    Key? key,
    this.unit = 'dB',
    required this.initialValue,
    required this.displayMin,
    required this.displayMax,
    required this.min,
    required this.max,
    required this.onChange,
    required this.divisions,
  })  : value = lerpDouble(displayMin, displayMax, initialValue / max)!,
        super(key: key);

  final int initialValue;
  final double displayMin;
  final double displayMax;
  final String unit;
  final double value;
  final double min;
  final double max;
  final int divisions;

  final void Function(int) onChange;

  @override
  _ValueSliderState createState() => _ValueSliderState();
}

class _ValueSliderState extends State<ValueSlider> {
  late double _value;
  late double _oldValue;

  @override
  void initState() {
    _value = widget.value;
    _oldValue = _value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ValueSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget != oldWidget) {
      _value = widget.value;
      _oldValue = _value;
    }
  }

  String format(double value) {
    return '$value ${widget.unit}';
  }

  void onChanged(value) {
    setState(() {
      _value = value;
    });
  }

  void onChangeEnd(double value) {
    if (value != _oldValue) {
      final factor =
          (value - widget.displayMin) / (widget.displayMax - widget.displayMin);
      final internal = lerpDouble(widget.min, widget.max, factor)!.toInt();
      widget.onChange(internal);
      _oldValue = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, right: 8),
      child: Column(
        children: [
          Slider(
            value: _value,
            min: widget.displayMin,
            max: widget.displayMax,
            label: format(_value),
            divisions: widget.divisions,
            onChangeEnd: onChangeEnd,
            onChanged: onChanged,
          ),
          Row(
            children: [
              SizedBox(width: 16),
              Text(format(widget.displayMin)),
              Spacer(),
              Text(format(widget.displayMax)),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ValueSlider extends StatefulWidget {
  const ValueSlider({
    Key? key,
    this.unit = 'dB',
    double? initialValue,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChange,
  })  : value = initialValue ?? max,
        super(key: key);

  final String unit;
  final double value;
  final double min;
  final double max;
  final int divisions;

  final void Function(double) onChange;

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

  void onChangeEnd(value) {
    if (value != _oldValue) {
      widget.onChange(value);
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
            min: widget.min,
            max: widget.max,
            label: format(_value),
            divisions: widget.divisions,
            onChangeEnd: onChangeEnd,
            onChanged: onChanged,
          ),
          Row(
            children: [
              SizedBox(width: 16),
              Text(format(widget.min)),
              Spacer(),
              Text(format(widget.max)),
            ],
          ),
        ],
      ),
    );
  }
}

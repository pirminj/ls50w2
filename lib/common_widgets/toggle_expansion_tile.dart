import 'package:flutter/material.dart';

class ToggleExpansionTile extends StatefulWidget {
  const ToggleExpansionTile({
    Key? key,
    required this.title,
    required this.builder,
    this.isExpanded = false,
    this.onCollapse,
    this.onExpand,
  }) : super(key: key);

  final Widget title;
  final WidgetBuilder builder;
  final bool isExpanded;
  final void Function()? onCollapse;
  final void Function()? onExpand;

  @override
  _ToggleExpansionTileState createState() => _ToggleExpansionTileState();
}

class _ToggleExpansionTileState extends State<ToggleExpansionTile> {
  late bool _expanded;

  @override
  void initState() {
    _expanded = widget.isExpanded;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ToggleExpansionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget != oldWidget) {
      _expanded = widget.isExpanded;
    }
  }

  void setExpanded(bool value) {
    if (value)
      widget.onExpand?.call();
    else
      widget.onCollapse?.call();
    setState(() {
      _expanded = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: widget.title,
          value: _expanded,
          onChanged: setExpanded,
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: _expanded ? widget.builder(context) : SizedBox.shrink(),
        ),
      ],
    );
  }
}

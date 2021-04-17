import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JsonTextPage extends HookWidget {
  const JsonTextPage({
    Key? key,
    required this.asyncJsonData,
  }) : super(key: key);

  final AsyncValue<Map<String, Object?>> asyncJsonData;

  @override
  Widget build(BuildContext context) {
    final wrapLines = useState(false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Player details'),
        actions: [
          Center(child: Text('Wrap text')),
          Switch(
            value: wrapLines.value,
            onChanged: (value) => wrapLines.value = value,
          )
        ],
      ),
      body: asyncJsonData.when(
        data: (data) => Container(
          constraints: const BoxConstraints.expand(),
          child: InteractiveViewer(
            minScale: 0.5,
            maxScale: 1.5,
            constrained: wrapLines.value,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SelectableText(
                JsonEncoder.withIndent('  ').convert(data),
                style: GoogleFonts.firaMono(),
              ),
            ),
          ),
        ),
        loading: () => Container(),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(error.toString()),
              Text(stackTrace.toString()),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ls50w2/providers.dart';
import 'package:ls50w2/utils.dart';

class JsonTextPage extends HookWidget {
  const JsonTextPage({
    Key? key,
    required this.title,
    required this.asyncJsonData,
  }) : super(key: key);

  final String title;
  final AsyncValue<Map<String, Object?>> asyncJsonData;

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = useProvider(isLargeScreenProvider);
    final wrapLines = useState(isLargeScreen);
    final Widget switchButton = Switch(
      value: wrapLines.value,
      onChanged: (value) => wrapLines.value = value,
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !isDesktop,
        title: Text(title),
        actions: [
          Center(child: Text('Wrap text')),
          if (isDesktop)
            Tooltip(
              message: 'You can pan with a rightclick',
              child: switchButton,
            )
          else
            switchButton,
        ],
      ),
      body: asyncJsonData.when(
        data: (data) => Container(
          constraints: const BoxConstraints.expand(),
          child: Scrollbar(
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 1.5,
              scaleEnabled: !isLargeScreen,
              constrained: wrapLines.value,
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

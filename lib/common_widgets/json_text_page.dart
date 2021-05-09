import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ls50w2/utils.dart';

import 'details_page.dart';

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
    return DetailsPage(
      title: title,
      child: asyncJsonData.when(
        data: (data) => Scrollbar(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              // constraints: const BoxConstraints.expand(),
              padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
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

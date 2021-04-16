import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'speaker_status_notifier.dart';

class PlayerDataPage extends HookWidget {
  const PlayerDataPage({
    Key? key,
  }) : super(key: key);

  static final futureProvider = FutureProvider<Map<String, Object?>>((ref) {
    return ref.watch(clientProvider).getPlayerData();
  });

  @override
  Widget build(BuildContext context) {
    final playerData = useProvider(futureProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Player details'),
      ),
      body: playerData.when(
        data: (data) {
          JsonEncoder encoder = JsonEncoder.withIndent('    ');
          String prettyprint = encoder.convert(data);
          return Container(
            constraints: const BoxConstraints.expand(),
            child: InteractiveViewer(
              constrained: false,
              child: SelectableText(
                prettyprint,
                style: GoogleFonts.firaMono(),
              ),
            ),
          );
        },
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

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';
import 'package:ls50w2/settings/settings.dart';

final hostProvider = Provider<String>(
  (ref) => ref.watch(Settings.provider).host,
  name: 'Host IP',
);

final clientProvider = Provider<KefClient>(
  (ref) => KefClient(ref.watch(hostProvider)),
  name: 'LS50W2 client',
);

final playerDataProvider = FutureProvider<Map<String, Object?>>((ref) {
  return ref.watch(clientProvider).playerData.get();
});

final firmwareUpdateProvider = FutureProvider<Map<String, Object?>>((ref) {
  return ref.watch(clientProvider).firmwareUpdateInfo.get();
});

final isLargeScreenProvider = ScopedProvider<bool>(
  (_) => true,
);

enum Details {
  appSettings,
  dsp,
  player,
  firmware,
}

final detailsProvider = StateProvider<Details?>((_) => null);

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    print("${provider.name ?? provider.runtimeType}: $newValue");
  }
}

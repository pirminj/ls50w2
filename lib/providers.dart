import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';

final hostProvider = StateProvider<String>((_) => "192.168.0.149");

final clientProvider = Provider<KefClient>((ref) {
  final String host = ref.watch(hostProvider).state;
  return KefClient(host);
});

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

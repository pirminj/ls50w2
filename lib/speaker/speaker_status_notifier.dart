import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';
import 'package:riverpod/riverpod.dart';

import '../providers.dart';
import 'speaker_status_model.dart';

class Speaker extends StateNotifier<AsyncValue<SpeakerStatusModel>> {
  Speaker(
    AsyncValue<SpeakerStatusModel> state,
    KefClient client,
  )   : _client = client,
        super(state) {
    load();
  }

  final KefClient _client;

  static final provider =
      StateNotifierProvider<Speaker, AsyncValue<SpeakerStatusModel>>((ref) {
    return Speaker(AsyncLoading(), ref.watch(clientProvider));
  });

  Future<void> load() async {
    state = await AsyncValue.guard(() async {
      return SpeakerStatusModel(
        status: await _client.getStatus(),
        source: await _client.getSource(),
      );
    });
  }

  Future<void> refresh() async {
    state = AsyncLoading();
    await load();
  }

  void turnOn() {
    _client.turnOn();
    state = state.whenData(
      (value) => value.copyWith(
        status: SpeakerStatus.powerOn,
      ),
    );
  }

  void turnOff() {
    _client.turnOff();
    state = state.whenData(
      (value) => value.copyWith(
        status: SpeakerStatus.standby,
        source: SpeakerSource.standby,
      ),
    );
  }

  void selectSource(SpeakerSource source) {
    _client.setSource(source);
    state = state.whenData(
      (value) => value.copyWith(
        source: source,
        status: SpeakerStatus.powerOn,
      ),
    );
  }

  void setStatus(SpeakerStatus status) {
    _client.setStatus(status);
    state = state.whenData(
      (value) => value.copyWith(
        source: status == SpeakerStatus.standby
            ? SpeakerSource.standby
            : value.source,
        status: status,
      ),
    );
  }
}

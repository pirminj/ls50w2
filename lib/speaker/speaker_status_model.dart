import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';

part 'speaker_status_model.freezed.dart';
part 'speaker_status_model.g.dart';

@freezed
class SpeakerStatusModel with _$SpeakerStatusModel {
  factory SpeakerStatusModel({
    required SpeakerStatus status,
    required SpeakerSource source,
  }) = _SpeakerStatusModel;

  factory SpeakerStatusModel.fromJson(Map<String, dynamic> json) =>
      _$SpeakerStatusModelFromJson(json);
}

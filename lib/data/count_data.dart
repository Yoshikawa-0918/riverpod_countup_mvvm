import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_data.freezed.dart';
part 'count_data.g.dart';

@freezed
class CountData with _$CountData {
  const factory CountData({
    //必要なものはここに書き加える
    //書き終わったら以下を実行
    //flutter pub run build_runner watch
    required int count,
    required int countUp,
    required int countDown,
  }) = _CountData;

  factory CountData.fromJson(Map<String, dynamic> json) =>
      _$CountDataFromJson(json);
}

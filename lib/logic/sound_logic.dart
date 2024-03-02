import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod_countup_mvvm/data/count_data.dart';

import 'count_data_changed_notifier.dart';

class SoundLogic implements CountDataChangedNotifier {
  static const SOUND_DATA_UP = 'sounds/Onoma-Flash07-1.mp3';
  static const SOUND_DATA_DOWN = 'sounds/Onoma-Flash08-1.mp3';
  static const SOUND_DATA_RESET = 'sounds/Onoma-Flash09-1.mp3';

  final AudioCache _cache = AudioCache(
    //使用するAudioPlayerを定義する
    fixedPlayer: AudioPlayer(),
  );

  //使用する音声ファイルを_cacheの中に入れる
  void load() {
    _cache.loadAll([SOUND_DATA_UP, SOUND_DATA_DOWN, SOUND_DATA_RESET]);
  }

  @override
  void valueChanged(CountData oldValue, CountData newValue) {
    if (newValue.countUp == 0 &&
        newValue.countDown == 0 &&
        newValue.count == 0) {
      playResetSound();
    } else if (oldValue.countUp + 1 == newValue.countUp) {
      playUpSound();
    } else if (oldValue.countDown + 1 == newValue.countDown) {
      playDownSound();
    }
  }

  //ロードした音声ファイルを再生する
  void playUpSound() {
    _cache.play(SOUND_DATA_UP);
  }

  void playDownSound() {
    _cache.play(SOUND_DATA_DOWN);
  }

  void playResetSound() {
    _cache.play(SOUND_DATA_RESET);
  }
}

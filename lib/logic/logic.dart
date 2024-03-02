import 'package:riverpod_countup_mvvm/data/count_data.dart';

//ロジックのクラス
class Logic {
  CountData _countData = CountData(
    count: 0,
    countUp: 0,
    countDown: 0,
  );

  get countData => _countData;

  //+ボタンを押した時の処理
  void increase() {
    _countData = _countData.copyWith(
      count: _countData.count + 1,
      countUp: _countData.countUp + 1,
    );
  }

  //-ボタンを押した時の処理
  void decrease() {
    _countData = _countData.copyWith(
      count: _countData.count - 1,
      countDown: _countData.countDown + 1,
    );
  }

  //refreshボタンを押した時の処理
  void reset() {
    _countData = CountData(
      count: 0,
      countUp: 0,
      countDown: 0,
    );
  }

  void init(CountData countData) {
    _countData = countData;
  }
}

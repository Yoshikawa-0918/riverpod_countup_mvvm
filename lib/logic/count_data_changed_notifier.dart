import 'package:riverpod_countup_mvvm/data/count_data.dart';

//typedef:関数型やクラス型などの型に別名をつける仕組み
typedef ValueChangedCondition = bool Function(
    CountData oldValue, CountData newValue);

abstract class CountDataChangedNotifier {
  void valueChanged(CountData oldValue, CountData newValue);
}

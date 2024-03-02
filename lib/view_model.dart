import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup_mvvm/data/count_data.dart';
import 'package:riverpod_countup_mvvm/logic/button_animation_logic.dart';
import 'package:riverpod_countup_mvvm/logic/count_data_changed_notifier.dart';
import 'package:riverpod_countup_mvvm/logic/logic.dart';
import 'package:riverpod_countup_mvvm/logic/shared_preferences_logic.dart';
import 'package:riverpod_countup_mvvm/logic/sound_logic.dart';
import 'package:riverpod_countup_mvvm/provider.dart';

class ViewModel {
  Logic _logic = Logic();
  late WidgetRef _ref;

  SoundLogic _soundLogic = SoundLogic();
  late ButtonAnimationLogic _buttonAnimationLogicPlus;
  late ButtonAnimationLogic _buttonAnimationLogicMinus;
  late ButtonAnimationLogic _buttonAnimationLogicReset;

  List<CountDataChangedNotifier> notifiers = [];

  ValueChangedCondition conditionPlus =
      (CountData oldValue, CountData newValue) {
    return oldValue.countUp + 1 == newValue.countUp;
  };

  void setRef(WidgetRef ref, TickerProvider tickerProvider) {
    this._ref = ref;
    _buttonAnimationLogicPlus =
        ButtonAnimationLogic(tickerProvider, conditionPlus);
    _buttonAnimationLogicMinus = ButtonAnimationLogic(tickerProvider,
        (CountData oldValue, CountData newValue) {
      return oldValue.countDown + 1 == newValue.countDown;
    });
    _buttonAnimationLogicReset = ButtonAnimationLogic(
      tickerProvider,
      (oldValue, newValue) => newValue.countUp == 0 && newValue.countDown == 0,
    );
    _soundLogic.load();

    notifiers = [
      _soundLogic,
      _buttonAnimationLogicPlus,
      _buttonAnimationLogicMinus,
      _buttonAnimationLogicReset,
      SharedPreferencesLogic(),
    ];

    SharedPreferencesLogic.read().then((value) {
      _logic.init(value);
      update();
    });
  }

  get count => _ref.watch(countDataProvider).count.toString();
  get countUp =>
      _ref.watch(countDataProvider.select((value) => value.countUp)).toString();
  get countDown => _ref
      .watch(countDataProvider.select((value) => value.countDown))
      .toString();

  get animationPlusCombination =>
      _buttonAnimationLogicPlus.animationCombination;

  get animationMinusCombination =>
      _buttonAnimationLogicMinus.animationCombination;

  get animationResetCombination =>
      _buttonAnimationLogicReset.animationCombination;

  void onIncrease() {
    _logic.increase();
    update();
  }

  void onDecrease() {
    _logic.decrease();
    update();
  }

  void onReset() {
    _logic.reset();
    update();
  }

  void update() {
    CountData oldValue = _ref.watch(countDataProvider.notifier).state;
    _ref.watch(countDataProvider.notifier).state = _logic.countData;
    CountData newValue = _ref.watch(countDataProvider.notifier).state;

    notifiers.forEach((element) => element.valueChanged(oldValue, newValue));
  }
}

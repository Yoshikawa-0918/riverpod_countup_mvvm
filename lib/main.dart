import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup_mvvm/logic/button_animation_logic.dart';
import 'package:riverpod_countup_mvvm/provider.dart';
import 'package:riverpod_countup_mvvm/view_model.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        useMaterial3: false,
      ),
      home: MyHomePage(ViewModel()),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  final ViewModel viewModel;
  MyHomePage(this.viewModel, {Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

//TickerProviderStateMixin:このクラスでアニメーションを使うことの宣言
class _MyHomePageState extends ConsumerState<MyHomePage>
    with TickerProviderStateMixin {
  late ViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    //ConsumerStateを使用することにより、setRefメソッドに直接refを渡すことができる
    _viewModel = widget.viewModel;
    _viewModel.setRef(ref, this);
  }

  @override
  Widget build(BuildContext context) {
    print("MyHomePage rebuild");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          //titleProviderの値を監視して、値を表示
          ref.watch(titleProvider),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ref.watch(messageProvider),
            ),
            Text(
              _viewModel.count,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: _viewModel.onIncrease,
                  child: ButtonAnimation(
                    animationCombination: _viewModel.animationPlusCombination,
                    child: const Icon(Icons.add),
                  ),
                ),
                FloatingActionButton(
                  onPressed: _viewModel.onDecrease,
                  child: ButtonAnimation(
                    animationCombination: _viewModel.animationMinusCombination,
                    child: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_viewModel.countUp),
                Text(_viewModel.countDown),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewModel.onReset,
        child: ButtonAnimation(
          animationCombination: _viewModel.animationResetCombination,
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

class ButtonAnimation extends StatelessWidget {
  final AnimationCombination animationCombination;
  final Widget child;
  ButtonAnimation({
    Key? key,
    required this.animationCombination,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animationCombination.animationScale,
      child: RotationTransition(
        turns: animationCombination.animationRotation,
        child: child,
      ),
    );
  }
}

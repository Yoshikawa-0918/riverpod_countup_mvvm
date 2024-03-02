import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_countup_mvvm/main.dart';
import 'package:riverpod_countup_mvvm/provider.dart';
import 'package:riverpod_countup_mvvm/view_model.dart';

//ViewModelのモック
class MockViewModel extends Mock implements ViewModel {}

void main() {
  //全てのテストの前に1回だけ実行される
  setUpAll(() async {
    //assets/FontManifest.jsonで設定したフォントを読み込む
    await loadAppFonts();
  });
  const iPhone55 = Device(
    name: 'iPhone55',
    size: Size(414, 736),
    devicePixelRatio: 3.0,
  );
  List<Device> devices = [iPhone55];

  //golden_toolkitを使ったウィジェットテスト
  testGoldens('normal', (WidgetTester tester) async {
    ViewModel viewModel = ViewModel();

    //pumpDeviceBuilder:スクリーンショットをビルドする
    await tester.pumpWidgetBuilder(
      ProviderScope(
        child: MyHomePage(
          viewModel,
        ),
      ),
    );

    await multiScreenGolden(
      tester,
      'myHomePage_0init',
      devices: devices,
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    await multiScreenGolden(
      tester,
      'myHomePage_1tapped',
      devices: devices,
    );
  });

  //mockitoを利用したユニットテスト
  testGoldens('viewModelTest', (tester) async {
    var mock = MockViewModel();
    //when:モックインスタンスのメソッドの戻り値を設定する
    //thenReturn:特定のメソッドに対して、固定値を返す
    when(() => mock.count).thenReturn(1123456789.toString());
    when(() => mock.countUp).thenReturn(2123456789.toString());
    when(() => mock.countDown).thenReturn(3123456789.toString());

    final mockTitleProvider = Provider<String>((ref) => 'mockTitle');

    //mockのViewModelを渡したMyHomePageのスクリーンショットをビルドする
    await tester.pumpWidgetBuilder(
      ProviderScope(
        child: MyHomePage(mock),
        overrides: [
          titleProvider.overrideWithProvider(mockTitleProvider),
          messageProvider.overrideWithValue('mockMessage'),
          // ↓こういう書き方もできる
          // titleProvider.overrideWithProvider(Provider<String>((ref) => 'mockTitle')),
        ],
      ),
    );

    await multiScreenGolden(
      tester,
      'myHomePage_mock',
      devices: devices,
    );

    //verifyNever:期待される処理が一度も実行されていないことを確認する
    verifyNever(() => mock.onIncrease());
    verifyNever(() => mock.onDecrease());
    verifyNever(() => mock.onReset());

    await tester.tap(find.byIcon(Icons.add));
    //verify:期待される処理が実行されたか確認する
    verify(() => mock.onIncrease()).called(1);
    verifyNever(() => mock.onDecrease());
    verifyNever(() => mock.onReset());

    await tester.tap(find.byIcon(Icons.remove));
    await tester.tap(find.byIcon(Icons.remove));
    verifyNever(() => mock.onIncrease());
    verify(() => mock.onDecrease()).called(2);
    verifyNever(() => mock.onReset());

    await tester.tap(find.byIcon(Icons.refresh));
    verifyNever(() => mock.onIncrease());
    verifyNever(() => mock.onDecrease());
    verify(() => mock.onReset()).called(1);
  });
}

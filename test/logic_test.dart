//test対象のファイルをimport
import 'package:riverpod_countup_mvvm/logic/logic.dart';
import 'package:test/test.dart';

void main() {
  Logic target = Logic();

  //testが始まる前に実行するコマンドをここに書く
  setUp(() async {
    target = Logic();
  });

  //ここにテストする項目を書く
  test('init', () async {
    //expect(テストする変数, 期待する値)
    expect(target.countData.count, 0);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 0);
  });
  test('increase', () async {
    target.increase();
    expect(target.countData.count, 1);
    expect(target.countData.countUp, 1);
    expect(target.countData.countDown, 0);

    target.increase();
    target.increase();
    target.increase();
    expect(target.countData.count, 4);
    expect(target.countData.countUp, 4);
    expect(target.countData.countDown, 0);
  });
  test('decrease', () async {
    target.decrease();
    expect(target.countData.count, -1);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 1);

    target.decrease();
    target.decrease();
    target.decrease();
    expect(target.countData.count, -4);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 4);
  });
  test('reset', () async {
    target.increase();
    target.increase();
    target.decrease();
    expect(target.countData.count, 1);
    expect(target.countData.countUp, 2);
    expect(target.countData.countDown, 1);

    target.reset();
    expect(target.countData.count, 0);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 0);
  });
}

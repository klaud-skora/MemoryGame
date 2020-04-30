import 'package:test/test.dart';
import '../lib//logic/comparer.dart';

void main() {

  Comparer testComparer = Comparer();

  test('length of an array', () {
    testComparer.createSignsArray();
    expect(testComparer.signs.length, Signs.values.length * 2);
  });

  test('comparing one card flipped', () {
    testComparer.setCard(Cards.first, 0);
    testComparer.setCard(Cards.second, 0);
    testComparer.compare();

    expect(testComparer.cardFlips[0], false);
  });

}

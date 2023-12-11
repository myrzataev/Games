import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_game/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.basketballLogo).existsSync(), isTrue);
    expect(File(Images.exitIcon).existsSync(), isTrue);
    expect(File(Images.timerIcon).existsSync(), isTrue);
    expect(File(Images.baketballBackground).existsSync(), isTrue);
    expect(File(Images.basketball).existsSync(), isTrue);
    expect(File(Images.basketballScreenBakground).existsSync(), isTrue);
    expect(File(Images.football).existsSync(), isTrue);
    expect(File(Images.footballBackground).existsSync(), isTrue);
    expect(File(Images.hockeyBackground).existsSync(), isTrue);
    expect(File(Images.hokkey).existsSync(), isTrue);
    expect(File(Images.oneChance).existsSync(), isTrue);
    expect(File(Images.tennis).existsSync(), isTrue);
    expect(File(Images.tennisBackground).existsSync(), isTrue);
    expect(File(Images.timeAttack).existsSync(), isTrue);
  });
}

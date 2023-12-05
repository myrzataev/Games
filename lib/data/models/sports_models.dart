// ignore: empty_constructor_bodies
import 'package:quiz_game/resources/resources.dart';

class SportsModels {
  final String photo;
  SportsModels({required this.photo});
}

abstract class SportsData {
 static
  List<SportsModels> sports = [
    SportsModels(photo: Images.baketballBackground),
    SportsModels(photo: Images.footballBackground),
    SportsModels(photo: Images.hockeyBackground),
    SportsModels(photo: Images.baketballBackground),
    SportsModels(photo: Images.footballBackground),
  ];
}

import 'package:quiz_game/resources/resources.dart';

class SportsModels {
  final String photo;
  final String nameOfSport;
  final String category;

  SportsModels(
      {required this.photo, required this.nameOfSport, required this.category});
}

abstract class SportsData {
  static List<SportsModels> sports = [
    SportsModels(
        photo: Images.baketballBackground,
        nameOfSport: 'Basketball',
        category: 'basketball'),
    SportsModels(
        photo: Images.footballBackground,
        nameOfSport: 'Football',
        category: 'football'),
    SportsModels(
        photo: Images.hockeyBackground,
        nameOfSport: 'Hockey',
        category: 'hockey'),
  ];
}

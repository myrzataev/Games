import 'package:quiz_game/models/question_models.dart';

List<QuestionModel> getQuestionsForCategory(String category) {
  switch (category.toLowerCase()) {
    case 'football':
      return footballQuestions;
    case 'basketball':
      return basketballQuestions;
    case 'hockey':
      return hockeyQuestions;
    default:
      return [];
  }
}

List<QuestionModel> basketballQuestions = [
  QuestionModel(
      'What is the standard height of a basketball hoop in professional games?',
      {"96": false, "108": false, "120": false, "144": true}),
  QuestionModel(
      'In professional basketball, how many quarters are played in a standard game?',
      {"2": false, "3": false, "4": true, "5": false}),
  QuestionModel("What is the diameter of a standard basketball in inches?",
      {"28.5": true, "29.5": false, "30.5": false, "31.5": false}),
  QuestionModel("Which NBA team has won the most championships as of 2022?", {
    "Los Angeles Lakers": true,
    "Boston Celtics": false,
    "Chicago Bulls": false,
    "Golden State Warriors": false
  }),
  QuestionModel("How long is the three-point line in NBA games?",
      {"20 feet": false, "22 feet": false, "24 feet": true, "26 feet": false}),
  QuestionModel(
      "What is the maximum number of personal fouls a player can accumulate before being disqualified in an NBA game?",
      {"4": false, "5": false, "6": true, "7": false}),
  QuestionModel("Which basketball player is known as 'The King'?", {
    "Stephen Curry": false,
    "LeBron James": true,
    "Kevin Durant": false,
    "Kawhi Leonard": false
  }),
  QuestionModel(
      "In basketball, how many seconds does a team have to advance the ball past half-court?",
      {"8": true, "12": false, "24": false, "30": false}),
  QuestionModel(
      "Which international governing body oversees the rules and regulations of basketball worldwide?",
      {"FIBA": true, "NBA": false, "WNBA": false, "NCAA": false}),
  QuestionModel(
      "What is the term for a successful field goal attempt where the shooter is fouled and awarded a free throw?",
      {
        "And-One": true,
        "Double Dribble": false,
        "Fast Break": false,
        "Airball": false
      }),
];

List<QuestionModel> footballQuestions = [
  QuestionModel(
      'What are the dimensions of a standard football field in meters?',
      {"90x120": false, "100x80": false, "100x50": true, "80x100": false}),
  QuestionModel(
      'In football, how many players are there on the field for each team during a match?',
      {"8": false, "11": true, "9": false, "10": false}),
  QuestionModel('Which country hosted the FIFA World Cup in 2018?',
      {"Brazil": false, "Germany": false, "Russia": true, "France": false}),
  QuestionModel(
      'What is the term used for a situation in football when a player scores three goals in a single game?',
      {
        "Hat-trick": true,
        "Triple play": false,
        "Three-peat": false,
        "Goal spree": false
      }),
  QuestionModel(
      'Who is often referred to as "The King of Football" and is widely considered one of the greatest footballers of all time?',
      {
        "Lionel Messi": false,
        "Diego Maradona": false,
        "Cristiano Ronaldo": false,
        "Pelé": true
      }),
  QuestionModel(
      'Which prestigious individual award is given annually to the best player in the world, as recognized by FIFA?',
      {
        "Golden Boot": false,
        "Ballon d'Or": true,
        "Golden Glove": false,
        "FIFA Player of the Year": false
      }),
  QuestionModel(
      'What is the penalty shootout format in major football tournaments to determine a winner in case of a tie after extra time?',
      {
        "Sudden death": false,
        "Golden goal": false,
        "Spot kicks": false,
        "Penalty kicks": true
      }),
  QuestionModel('Which English football club is known as "The Red Devils"?', {
    "Liverpool": false,
    "Arsenal": false,
    "Manchester United": true,
    "Chelsea": false
  }),
  QuestionModel(
      'In football, what is the maximum duration of a regular match, excluding extra time?',
      {
        "90 minutes": true,
        "120 minutes": false,
        "80 minutes": false,
        "100 minutes": false
      }),
  QuestionModel(
      'What is the term for a pass in football where a player uses their head to direct the ball to a teammate?',
      {"Header": true, "Chip": false, "Dribble": false, "Volley": false}),
];
List<QuestionModel> hockeyQuestions = [
  QuestionModel(
      'What is the standard length of a hockey rink in professional games?', {
    "50 meters": false,
    "60 meters": true,
    "40 meters": false,
    "70 meters": false
  }),
  QuestionModel(
      'In ice hockey, how many players are typically on the ice for each team during regular play?',
      {"4": false, "5": true, "6": false, "7": false}),
  QuestionModel(
      'Which country is traditionally strong in field hockey and has won the most Olympic gold medals in the sport?',
      {
        "Germany": false,
        "Netherlands": false,
        "Australia": false,
        "India": true
      }),
  QuestionModel(
      'What is the term for a situation in hockey where a player scores three goals in a single game?',
      {
        "Hat-trick": true,
        "Triple play": false,
        "Three-peat": false,
        "Goal spree": false
      }),
  QuestionModel(
      'Which trophy is awarded annually to the champion of the National Hockey League (NHL) in North America?',
      {
        "Stanley Cup": true,
        "Presidents' Trophy": false,
        "Conn Smythe Trophy": false,
        "Hart Memorial Trophy": false
      }),
  QuestionModel(
      'What is the maximum number of players a team can have on the ice at one time, including the goaltender, during a power play in hockey?',
      {"4": false, "5": true, "6": false, "3": false}),
  QuestionModel(
      'What is the term for a defensive player in hockey whose primary role is to prevent the opposing team from scoring?',
      {"Striker": false, "Winger": false, "Defender": true, "Forward": false}),
  QuestionModel(
      'In field hockey, how many periods are there in a standard international match?',
      {"2": true, "3": false, "4": false, "1": false}),
  QuestionModel("Which country hosted the Men's Hockey World Cup in 2018?", {
    "India": true,
    "Netherlands": false,
    "Australia": false,
    "Germany": false
  }),
  QuestionModel('What is the small, rubber disc used in ice hockey called?',
      {"Puck": true, "Ball": false, "Disk": false, "Biscuit": false}),
];

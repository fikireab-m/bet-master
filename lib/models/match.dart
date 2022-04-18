import 'package:flutter/foundation.dart';

class GameMatch {
  GameMatch(
    this.gameType,
    this.homeTeam,
    this.awayTeam,
    this.result,
    this.oddAmount,
  );
  String gameType;
  String homeTeam;
  String awayTeam;
  String result;
  double oddAmount;
}

class GameMatches with ChangeNotifier {
  final List<GameMatch> matches = [];
  GameMatches() {
    matches.addAll([
      GameMatch(
        "England Premier League",
        "Man United",
        "Liverpool",
        "away win",
        1.4,
      ),
      GameMatch(
        "England Premier League",
        "Man United",
        "Liverpool",
        "away win",
        1.4,
      ),
      GameMatch(
        "England Premier League",
        "Man United",
        "Liverpool",
        "away win",
        1.4,
      ),
      GameMatch(
        "England Premier League",
        "Man United",
        "Liverpool",
        "away win",
        1.4,
      ),
      GameMatch(
        "England Premier League",
        "Man United",
        "Liverpool",
        "away win",
        1.4,
      ),
    ]);
  }
}

import 'package:carg/models/game/game.dart';
import 'package:carg/models/game/game_type.dart';
import 'package:carg/models/players/tarot_players.dart';
import 'package:carg/services/game/tarot_game_service.dart';
import 'package:carg/services/score/tarot_score_service.dart';

class Tarot extends Game<TarotPlayers> {
  Tarot(
      {String? id,
      DateTime? startingDate,
      DateTime? endingDate,
      String? winner,
      bool? isEnded,
      TarotPlayers? players,
      String? notes,
      TarotScoreService? scoreService,
      TarotGameService? gameService,
      GameType? gameType})
      : super(
            id: id,
            gameType: gameType ?? GameType.TAROT,
            gameService: gameService ?? TarotGameService(),
            scoreService: scoreService ?? TarotScoreService(),
            players: players ?? TarotPlayers(),
            endingDate: endingDate,
            startingDate: startingDate ?? DateTime.now(),
            isEnded: isEnded ?? false,
            winner: winner,
            notes: notes);

  @override
  Map<String, dynamic> toJSON() {
    var tmpJSON = super.toJSON();
    tmpJSON.addAll({'players': players!.toJSON()});
    return tmpJSON;
  }

  factory Tarot.fromJSON(Map<String, dynamic>? json, String id) {
    return Tarot(
        id: id,
        startingDate: DateTime.parse(json?['starting_date']),
        endingDate: json?['ending_date'] != null
            ? DateTime.parse(json?['ending_date'])
            : null,
        isEnded: json?['is_ended'],
        winner: json?['winner'],
        players: TarotPlayers.fromJSON(json?['players']),
        notes: json?['notes']);
  }
}

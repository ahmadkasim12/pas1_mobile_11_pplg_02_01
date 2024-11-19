import 'dart:convert';

Team teamFromJson(String str) => Team.fromJson(json.decode(str));

String teamToJson(Team data) => json.encode(data.toJson());

class Team {
  String idTeam;
  String strTeam;
  String strLeague;
  String strBadge;
  String strDescriptionEn;

  Team({
    required this.idTeam,
    required this.strTeam,
    required this.strLeague,
    required this.strBadge,
    required this.strDescriptionEn,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    idTeam: json["idTeam"],
    strTeam: json["strTeam"] ?? '',
    strLeague: json["strLeague"] ?? '',
    strBadge: json["strBadge"] ?? '',
    strDescriptionEn: json["strDescriptionEN"] ?? 'No description.',
  );

  Map<String, dynamic> toJson() => {
    "idTeam": idTeam,
    "strTeam": strTeam,
    "strLeague": strLeague,
    "strBadge": strBadge,
    "strDescriptionEN": strDescriptionEn,
  };
}
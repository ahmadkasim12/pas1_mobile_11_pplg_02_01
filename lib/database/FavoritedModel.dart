class FavoritedModel {
  int? id;
  String strBadge;
  String strTeam;

  FavoritedModel({
    this.id,
    required this.strBadge,
    required this.strTeam
  });

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'strBadge' : strBadge,
      'strTeam' : strTeam
    };
  }

  factory FavoritedModel.fromMap(Map<String, dynamic> map) {
    return FavoritedModel(
        id : map['id'],
        strBadge : map['strBadge'],
        strTeam : map['strTeam']
    );
  }
}
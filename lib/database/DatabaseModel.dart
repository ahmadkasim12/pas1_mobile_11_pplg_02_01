class DatabaseModel {
  int? id;
  String token;

  DatabaseModel({
    this.id,
    required this.token
  });

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'token' : token
    };
  }

  factory DatabaseModel.fromMap(Map<String, dynamic> map) {
    return DatabaseModel(
        id : map['id'],
        token : map['token']
    );
  }
}
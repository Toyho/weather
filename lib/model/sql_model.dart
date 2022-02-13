class SQLModel {
  final int? id;
  String? cityName;

  SQLModel({this.id, this.cityName});

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'cityName': this.cityName,
    };
  }

  factory SQLModel.fromJson(Map<String, dynamic> map) {
    return SQLModel(
      id: map['id'] as int,
      cityName: map['cityName'] as String,
    );
  }
}
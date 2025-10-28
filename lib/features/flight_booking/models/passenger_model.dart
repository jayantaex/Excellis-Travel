class PassengerModel {
  String? name;
  String? citizenship;
  String? gender;
  String? birthDate;

  PassengerModel({this.name, this.citizenship, this.gender, this.birthDate});

  PassengerModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    citizenship = json['citizenship'];
    gender = json['gender'];
    birthDate = json['birthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['citizenship'] = citizenship;
    data['gender'] = gender;
    data['birthDate'] = birthDate;
    return data;
  }
}

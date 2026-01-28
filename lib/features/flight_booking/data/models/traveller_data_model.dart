class TravelerDataModel {
  TravelerDataModel(
      {this.id,
      this.userId,
      this.title,
      this.firstName,
      this.lastName,
      this.nationality,
      this.dateOfBirth,
      this.gender,
      this.type,
      this.createdAt,
      this.updatedAt});

  TravelerDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    nationality = json['nationality'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  String? title;
  String? firstName;
  String? lastName;
  String? nationality;
  String? dateOfBirth;
  String? gender;
  String? type;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['nationality'] = nationality;
    data['dateOfBirth'] = dateOfBirth;
    data['gender'] = gender;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

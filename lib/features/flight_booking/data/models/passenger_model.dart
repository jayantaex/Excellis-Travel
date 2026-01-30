class PassengerModel {
  PassengerModel(
      {this.id,
      this.dateOfBirth,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.type,
      this.gender,
      this.title,
      this.countryCode,
      this.number});

  PassengerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateOfBirth = json['dateOfBirth'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    gender = json['gender'];
    number = json['number'];
    type = json['type'];
  }
  String? id;
  DateTime? dateOfBirth;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? gender;
  String? number;
  String? type;
  String? title;
  String? countryCode;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateOfBirth'] = dateOfBirth;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['emailAddress'] = emailAddress;
    data['gender'] = gender;
    data['number'] = number;
    data['type'] = type;
    return data;
  }
}

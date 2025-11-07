class PassengerModel {
  DateTime? dateOfBirth;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? gender;
  String? number;
  String? type;

  PassengerModel(
      {this.dateOfBirth,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.type,
      this.gender,
      this.number});

  PassengerModel.fromJson(Map<String, dynamic> json) {
    dateOfBirth = json['dateOfBirth'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    gender = json['gender'];
    number = json['number'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

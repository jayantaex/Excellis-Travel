class ChildDataModel {
  ChildDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  ChildDataModel({this.id, this.firstName, this.lastName, this.email});
  int? id;
  String? firstName;
  String? lastName;
  String? email;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    return data;
  }
}

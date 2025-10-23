class AirportModel {
  String? name;
  String? code;
  String? city;
  String? country;

  AirportModel({this.name, this.code, this.city, this.country});

  AirportModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['city'] = city;
    data['country'] = country;
    return data;
  }
}

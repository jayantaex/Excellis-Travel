class AirportModel {

  AirportModel(
      {this.type,
      this.subType,
      this.name,
      this.detailedName,
      this.id,
      this.timeZoneOffset,
      this.iataCode,
      this.geoCode,
      this.address});

  AirportModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subType = json['subType'];
    name = json['name'];
    detailedName = json['detailedName'];
    id = json['id'];
    timeZoneOffset = json['timeZoneOffset'];
    iataCode = json['iataCode'];
    geoCode =
        json['geoCode'] != null ? GeoCode.fromJson(json['geoCode']) : null;
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
  }
  String? type;
  String? subType;
  String? name;
  String? detailedName;
  String? id;
  String? timeZoneOffset;
  String? iataCode;
  GeoCode? geoCode;
  Address? address;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['subType'] = subType;
    data['name'] = name;
    data['detailedName'] = detailedName;
    data['id'] = id;
    data['timeZoneOffset'] = timeZoneOffset;
    data['iataCode'] = iataCode;
    if (geoCode != null) {
      data['geoCode'] = geoCode!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}

class GeoCode {

  GeoCode({this.latitude, this.longitude});

  GeoCode.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Address {

  Address(
      {this.cityName,
      this.cityCode,
      this.countryName,
      this.countryCode,
      this.stateCode,
      this.regionCode});

  Address.fromJson(Map<String, dynamic> json) {
    cityName = json['cityName'];
    cityCode = json['cityCode'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    stateCode = json['stateCode'];
    regionCode = json['regionCode'];
  }
  String? cityName;
  String? cityCode;
  String? countryName;
  String? countryCode;
  String? stateCode;
  String? regionCode;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cityName'] = cityName;
    data['cityCode'] = cityCode;
    data['countryName'] = countryName;
    data['countryCode'] = countryCode;
    data['stateCode'] = stateCode;
    data['regionCode'] = regionCode;
    return data;
  }
}

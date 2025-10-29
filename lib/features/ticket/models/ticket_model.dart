class TicketDataModel {
  String? airlineName;
  String? airplaneName;
  String? ticketNumber;
  String? cabinClass;
  String? ticketType;
  Aparture? aparture;
  Aparture? departure;
  Passengers? passengers;
  Baggages? baggages;
  FareBreakdown? fareBreakdown;

  TicketDataModel(
      {this.airlineName,
      this.airplaneName,
      this.ticketNumber,
      this.cabinClass,
      this.ticketType,
      this.aparture,
      this.departure,
      this.passengers,
      this.baggages,
      this.fareBreakdown});

  TicketDataModel.fromJson(Map<String, dynamic> json) {
    airlineName = json['airlineName'];
    airplaneName = json['airplaneName'];
    ticketNumber = json['ticketNumber'];
    cabinClass = json['cabinClass'];
    ticketType = json['ticketType'];
    aparture =
        json['aparture'] != null ? Aparture.fromJson(json['aparture']) : null;
    departure =
        json['departure'] != null ? Aparture.fromJson(json['departure']) : null;
    passengers = json['passengers'] != null
        ? Passengers.fromJson(json['passengers'])
        : null;
    baggages =
        json['baggages'] != null ? Baggages.fromJson(json['baggages']) : null;
    fareBreakdown = json['fareBreakdown'] != null
        ? FareBreakdown.fromJson(json['fareBreakdown'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airlineName'] = airlineName;
    data['airplaneName'] = airplaneName;
    data['ticketNumber'] = ticketNumber;
    data['cabinClass'] = cabinClass;
    data['ticketType'] = ticketType;
    if (aparture != null) {
      data['aparture'] = aparture!.toJson();
    }
    if (departure != null) {
      data['departure'] = departure!.toJson();
    }
    if (passengers != null) {
      data['passengers'] = passengers!.toJson();
    }
    if (baggages != null) {
      data['baggages'] = baggages!.toJson();
    }
    if (fareBreakdown != null) {
      data['fareBreakdown'] = fareBreakdown!.toJson();
    }
    return data;
  }
}

class Aparture {
  String? airport;
  String? city;
  String? airportCode;
  String? dateTime;

  Aparture({this.airport, this.city, this.airportCode, this.dateTime});

  Aparture.fromJson(Map<String, dynamic> json) {
    airport = json['airport'];
    city = json['city'];
    airportCode = json['airportCode'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airport'] = airport;
    data['city'] = city;
    data['airportCode'] = airportCode;
    data['dateTime'] = dateTime;
    return data;
  }
}

class Passengers {
  List<Adults>? adults;

  Passengers({this.adults});

  Passengers.fromJson(Map<String, dynamic> json) {
    if (json['adults'] != null) {
      adults = <Adults>[];
      json['adults'].forEach((v) {
        adults!.add(Adults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (adults != null) {
      data['adults'] = adults!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Adults {
  String? firstName;
  String? lastName;
  String? gender;
  String? phone;
  String? email;

  Adults({this.firstName, this.lastName, this.gender, this.phone, this.email});

  Adults.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}

class Baggages {
  String? cabin;
  String? checkIn;
  List<Extra>? extra;

  Baggages({this.cabin, this.checkIn, this.extra});

  Baggages.fromJson(Map<String, dynamic> json) {
    cabin = json['cabin'];
    checkIn = json['checkIn'];
    if (json['extra'] != null) {
      extra = <Extra>[];
      json['extra'].forEach((v) {
        extra!.add(Extra.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabin'] = cabin;
    data['checkIn'] = checkIn;
    if (extra != null) {
      data['extra'] = extra!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Extra {
  int? qty;
  double? price;
  int? weight;
  String? unit;

  Extra({this.qty, this.price, this.weight, this.unit});

  Extra.fromJson(Map<String, dynamic> json) {
    qty = json['qty'];
    price = double.parse(json['price'].toString());
    weight = json['weight'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qty'] = qty;
    data['price'] = price;
    data['weight'] = weight;
    data['unit'] = unit;
    return data;
  }
}

class FareBreakdown {
  List<BaseFare>? baseFare;
  List<Charges>? charges;
  double? total;

  FareBreakdown({this.baseFare, this.charges, this.total});

  FareBreakdown.fromJson(Map<String, dynamic> json) {
    if (json['baseFare'] != null) {
      baseFare = <BaseFare>[];
      json['baseFare'].forEach((v) {
        baseFare!.add(BaseFare.fromJson(v));
      });
    }
    if (json['charges'] != null) {
      charges = <Charges>[];
      json['charges'].forEach((v) {
        charges!.add(Charges.fromJson(v));
      });
    }
    total = double.parse(json['total'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (baseFare != null) {
      data['baseFare'] = baseFare!.map((v) => v.toJson()).toList();
    }
    if (charges != null) {
      data['charges'] = charges!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class BaseFare {
  String? title;
  double? cost;

  BaseFare({this.title, this.cost});

  BaseFare.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cost = double.parse(json['cost'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['cost'] = cost;
    return data;
  }
}

class Charges {
  String? title;
  double? cost;

  Charges({this.title, this.cost});

  Charges.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cost = double.parse(json['cost'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['cost'] = cost;
    return data;
  }
}

import '../models/air_port_model.dart';
import '../models/ticket_data_model.dart';

final List airportData = [
  {
    "name": "Los Angeles International Airport",
    "code": "LAX",
    "city": "Los Angeles",
    "country": "United States"
  },
  {
    "name": "Heathrow Airport",
    "code": "LHR",
    "city": "London",
    "country": "United Kingdom"
  },
  {
    "name": "Tokyo Haneda Airport",
    "code": "HND",
    "city": "Tokyo",
    "country": "Japan"
  },
  {
    "name": "Dubai International Airport",
    "code": "DXB",
    "city": "Dubai",
    "country": "United Arab Emirates"
  },
  {
    "name": "Sydney Kingsford Smith Airport",
    "code": "SYD",
    "city": "Sydney",
    "country": "Australia"
  },
  {
    "name": "Frankfurt am Main Airport",
    "code": "FRA",
    "city": "Frankfurt",
    "country": "Germany"
  },
  {
    "name": "Indira Gandhi International Airport",
    "code": "DEL",
    "city": "New Delhi",
    "country": "India"
  },
  {
    "name": "John F. Kennedy International Airport",
    "code": "JFK",
    "city": "New York",
    "country": "United States"
  },
  {
    "name": "Charles de Gaulle Airport",
    "code": "CDG",
    "city": "Paris",
    "country": "France"
  },
  {
    "name": "Changi Airport",
    "code": "SIN",
    "city": "Singapore",
    "country": "Singapore"
  }
];

final List<Map<String, dynamic>> flightData = [
  {
    "start": "CGK",
    "end": "SIN",
    "duration": 165,
    "price": 502,
    "tag": "best value",
    "class": "Business Class"
  },
  {
    "start": "DEL",
    "end": "DXB",
    "duration": 210,
    "price": 450,
    "tag": "cheapest",
    "class": "Economy"
  },
  {
    "start": "LHR",
    "end": "JFK",
    "duration": 420,
    "price": 820,
    "tag": "non stop",
    "class": "Business Class"
  },
  {
    "start": "SYD",
    "end": "AKL",
    "duration": 180,
    "price": 310,
    "tag": "popular",
    "class": "Economy"
  },
  {
    "start": "BOM",
    "end": "BKK",
    "duration": 240,
    "price": 390,
    "tag": "best value",
    "class": "Premium Economy"
  },
  {
    "start": "FRA",
    "end": "DXB",
    "duration": 360,
    "price": 610,
    "tag": "limited offer",
    "class": "Business Class"
  },
  {
    "start": "NRT",
    "end": "ICN",
    "duration": 150,
    "price": 270,
    "tag": "fastest",
    "class": "Economy"
  },
  {
    "start": "JFK",
    "end": "LAX",
    "duration": 370,
    "price": 420,
    "tag": "direct",
    "class": "Business Class"
  },
  {
    "start": "MEL",
    "end": "SGN",
    "duration": 540,
    "price": 580,
    "tag": "new route",
    "class": "Economy"
  },
  {
    "start": "KUL",
    "end": "BKK",
    "duration": 130,
    "price": 210,
    "tag": "cheapest",
    "class": "Economy"
  }
];

class SearchData {
  List<AirportModel> airports = [];
  List<TicketModel> ticketData = [];
  SearchData() {
    airports =
        airportData.map((airport) => AirportModel.fromJson(airport)).toList();
    ticketData =
        flightData.map((ticket) => TicketModel.fromJson(ticket)).toList();
  }

  //searching function
  List<AirportModel> searchAirports({required String query}) {
    return airports
        .where(
          (airport) => airport.name!.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
  }
}

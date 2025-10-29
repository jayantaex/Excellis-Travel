final List<Map<String, dynamic>> ticketData = [
  {
    "airlineName": "Emirates",
    "airplaneName": "Boeing 777-300ER",
    "ticketNumber": "EK4528791",
    "cabinClass": "Business",
    "ticketType": "Round Trip",
    "aparture": {
      "airport": "Dubai International Airport",
      "city": "Dubai",
      "airportCode": "DXB",
      "dateTime": "2025-11-12T10:45:00"
    },
    "departure": {
      "airport": "Heathrow Airport",
      "city": "London",
      "airportCode": "LHR",
      "dateTime": "2025-11-12T15:20:00"
    },
    "passengers": {
      "adults": [
        {
          "firstName": "John",
          "lastName": "Doe",
          "gender": "Male",
          "phone": "+971501234567",
          "email": "john.doe@example.com"
        }
      ]
    },
    "baggages": {
      "cabin": "7 KG",
      "checkIn": "30 KG",
      "extra": [
        {"qty": 1, "price": 1950.25, "weight": 15, "unit": "KG"}
      ]
    },
    "fareBreakdown": {
      "baseFare": [
        {"title": "Adult", "cost": 1200.50}
      ],
      "charges": [
        {"title": "Airline Tax", "cost": 80.0},
        {"title": "G.S.T", "cost": 100.0}
      ],
      "total": 1380.50
    }
  },
  {
    "airlineName": "Qatar Airways",
    "airplaneName": "Airbus A350",
    "ticketNumber": "QR7896543",
    "cabinClass": "Economy",
    "ticketType": "One Way",
    "aparture": {
      "airport": "Doha Hamad International Airport",
      "city": "Doha",
      "airportCode": "DOH",
      "dateTime": "2025-12-05T09:30:00"
    },
    "departure": {
      "airport": "Changi Airport",
      "city": "Singapore",
      "airportCode": "SIN",
      "dateTime": "2025-12-05T16:15:00"
    },
    "passengers": {
      "adults": [
        {
          "firstName": "Aisha",
          "lastName": "Khan",
          "gender": "Female",
          "phone": "+97455334422",
          "email": "aisha.khan@example.com"
        }
      ]
    },
    "baggages": {
      "cabin": "7 KG",
      "checkIn": "25 KG",
      "extra": [
        {"qty": 2, "price": 250.75, "weight": 10, "unit": "KG"}
      ]
    },
    "fareBreakdown": {
      "baseFare": [
        {"title": "Adult", "cost": 900.00}
      ],
      "charges": [
        {"title": "Airline Tax", "cost": 60.0},
        {"title": "G.S.T", "cost": 45.0}
      ],
      "total": 1005.00
    }
  },
  {
    "airlineName": "Singapore Airlines",
    "airplaneName": "Boeing 787 Dreamliner",
    "ticketNumber": "SQ1234567",
    "cabinClass": "First Class",
    "ticketType": "Round Trip",
    "aparture": {
      "airport": "Changi Airport",
      "city": "Singapore",
      "airportCode": "SIN",
      "dateTime": "2025-12-20T22:00:00"
    },
    "departure": {
      "airport": "Sydney Kingsford Smith",
      "city": "Sydney",
      "airportCode": "SYD",
      "dateTime": "2025-12-21T07:15:00"
    },
    "passengers": {
      "adults": [
        {
          "firstName": "Michael",
          "lastName": "Smith",
          "gender": "Male",
          "phone": "+6598887777",
          "email": "michael.smith@example.com"
        }
      ]
    },
    "baggages": {
      "cabin": "10 KG",
      "checkIn": "40 KG",
      "extra": [
        {"qty": 1, "price": 350.00, "weight": 20, "unit": "KG"}
      ]
    },
    "fareBreakdown": {
      "baseFare": [
        {"title": "Adult", "cost": 2500.00}
      ],
      "charges": [
        {"title": "Airline Tax", "cost": 120.0},
        {"title": "G.S.T", "cost": 200.0}
      ],
      "total": 2820.00
    }
  },
  {
    "airlineName": "Turkish Airlines",
    "airplaneName": "Airbus A330",
    "ticketNumber": "TK9087123",
    "cabinClass": "Economy",
    "ticketType": "Round Trip",
    "aparture": {
      "airport": "Istanbul Airport",
      "city": "Istanbul",
      "airportCode": "IST",
      "dateTime": "2025-11-15T06:30:00"
    },
    "departure": {
      "airport": "Charles de Gaulle Airport",
      "city": "Paris",
      "airportCode": "CDG",
      "dateTime": "2025-11-15T09:45:00"
    },
    "passengers": {
      "adults": [
        {
          "firstName": "Fatima",
          "lastName": "Ali",
          "gender": "Female",
          "phone": "+905551112233",
          "email": "fatima.ali@example.com"
        }
      ]
    },
    "baggages": {
      "cabin": "8 KG",
      "checkIn": "20 KG",
      "extra": [
        {"qty": 1, "price": 180.50, "weight": 10, "unit": "KG"}
      ]
    },
    "fareBreakdown": {
      "baseFare": [
        {"title": "Adult", "cost": 700.00}
      ],
      "charges": [
        {"title": "Airline Tax", "cost": 40.0},
        {"title": "G.S.T", "cost": 35.0}
      ],
      "total": 775.00
    }
  },
  {
    "airlineName": "Etihad Airways",
    "airplaneName": "Boeing 787-9",
    "ticketNumber": "EY5678432",
    "cabinClass": "Premium Economy",
    "ticketType": "One Way",
    "aparture": {
      "airport": "Abu Dhabi International Airport",
      "city": "Abu Dhabi",
      "airportCode": "AUH",
      "dateTime": "2025-12-02T14:10:00"
    },
    "departure": {
      "airport": "Frankfurt Airport",
      "city": "Frankfurt",
      "airportCode": "FRA",
      "dateTime": "2025-12-02T19:50:00"
    },
    "passengers": {
      "adults": [
        {
          "firstName": "David",
          "lastName": "Nguyen",
          "gender": "Male",
          "phone": "+971556667777",
          "email": "david.nguyen@example.com"
        }
      ]
    },
    "baggages": {
      "cabin": "10 KG",
      "checkIn": "35 KG",
      "extra": [
        {"qty": 1, "price": 275.00, "weight": 15, "unit": "KG"}
      ]
    },
    "fareBreakdown": {
      "baseFare": [
        {"title": "Adult", "cost": 1450.00}
      ],
      "charges": [
        {"title": "Airline Tax", "cost": 90.0},
        {"title": "G.S.T", "cost": 75.0}
      ],
      "total": 1615.00
    }
  },
  {
    "airlineName": "Lufthansa",
    "airplaneName": "Airbus A340",
    "ticketNumber": "LH9932111",
    "cabinClass": "Economy",
    "ticketType": "Round Trip",
    "aparture": {
      "airport": "Munich Airport",
      "city": "Munich",
      "airportCode": "MUC",
      "dateTime": "2025-11-25T07:00:00"
    },
    "departure": {
      "airport": "Newark Liberty International Airport",
      "city": "New York",
      "airportCode": "EWR",
      "dateTime": "2025-11-25T12:15:00"
    },
    "passengers": {
      "adults": [
        {
          "firstName": "Emma",
          "lastName": "Brown",
          "gender": "Female",
          "phone": "+498912345678",
          "email": "emma.brown@example.com"
        }
      ]
    },
    "baggages": {
      "cabin": "8 KG",
      "checkIn": "23 KG",
      "extra": [
        {"qty": 2, "price": 300.00, "weight": 20, "unit": "KG"}
      ]
    },
    "fareBreakdown": {
      "baseFare": [
        {"title": "Adult", "cost": 1100.00}
      ],
      "charges": [
        {"title": "Airline Tax", "cost": 70.0},
        {"title": "G.S.T", "cost": 90.0}
      ],
      "total": 1260.00
    }
  }
];

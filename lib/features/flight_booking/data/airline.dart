List<Map<String, dynamic>> flights = [
  {"country": "India", "airline": "Air India", "IATA": "AI", "ICAO": "AIC"},
  {
    "country": "Singapore",
    "airline": "Singapore Airlines",
    "IATA": "SQ",
    "ICAO": "SIA"
  },
  {
    "country": "Japan",
    "airline": "Japan Airlines",
    "IATA": "JL",
    "ICAO": "JAL"
  },
  {"country": "China", "airline": "Air China", "IATA": "CA", "ICAO": "CCA"},
  {
    "country": "Thailand",
    "airline": "Thai Airways",
    "IATA": "TG",
    "ICAO": "THA"
  },
  {
    "country": "United Arab Emirates",
    "airline": "Emirates",
    "IATA": "EK",
    "ICAO": "UAE"
  },
  {
    "country": "Malaysia",
    "airline": "Malaysia Airlines",
    "IATA": "MH",
    "ICAO": "MAS"
  },
  {
    "country": "South Korea",
    "airline": "Korean Air",
    "IATA": "KE",
    "ICAO": "KAL"
  },
  {
    "country": "United Kingdom",
    "airline": "British Airways",
    "IATA": "BA",
    "ICAO": "BAW"
  },
  {"country": "Germany", "airline": "Lufthansa", "IATA": "LH", "ICAO": "DLH"},
  {"country": "France", "airline": "Air France", "IATA": "AF", "ICAO": "AFR"},
  {"country": "Italy", "airline": "ITA Airways", "IATA": "AZ", "ICAO": "ITA"},
  {
    "country": "Netherlands",
    "airline": "KLM Royal Dutch Airlines",
    "IATA": "KL",
    "ICAO": "KLM"
  },
  {"country": "Spain", "airline": "Iberia", "IATA": "IB", "ICAO": "IBE"},
  {"country": "Canada", "airline": "Air Canada", "IATA": "AC", "ICAO": "ACA"},
  {
    "country": "Argentina",
    "airline": "Aerolíneas Argentinas",
    "IATA": "AR",
    "ICAO": "ARG"
  },
  {
    "country": "South Africa",
    "airline": "South African Airways",
    "IATA": "SA",
    "ICAO": "SAA"
  },
  {"country": "Egypt", "airline": "EgyptAir", "IATA": "MS", "ICAO": "MSR"},
  {
    "country": "Ethiopia",
    "airline": "Ethiopian Airlines",
    "IATA": "ET",
    "ICAO": "ETH"
  },
  {"country": "Australia", "airline": "Qantas", "IATA": "QF", "ICAO": "QFA"},
  {
    "country": "New Zealand",
    "airline": "Air New Zealand",
    "IATA": "NZ",
    "ICAO": "ANZ"
  }
];

Map<String, dynamic> getAirlineByCode({required String code}) {
  return flights.firstWhere((airline) => airline['IATA'] == code);
}

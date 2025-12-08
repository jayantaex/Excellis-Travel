// /// Temporary in-memory store for airline and aircraft dictionaries.
// /// This data is populated from flight search API responses and used
// /// to look up airline/aircraft names by their IATA codes.
// class TempStore {
//   TempStore._internal();
//   static final TempStore _instance = TempStore._internal();
//   static TempStore get instance => _instance;

//   static Map<String, String>? _aircraft;
//   static Map<String, String>? _carriers;

//   /// Sets the airlines/carriers dictionary (IATA code -> Name mapping)
//   static void setAirlines(Map<String, String> value) {
//     _carriers = value;
//   }

//   /// Sets the aircraft dictionary (IATA code -> Name mapping)
//   static void setAircraft(Map<String, String> value) {
//     _aircraft = value;
//   }

//   /// Gets the carriers dictionary. Returns empty map if not set.
//   static Map<String, String> getCarriers() => _carriers ?? <String, String>{};

//   /// Gets the aircraft dictionary. Returns empty map if not set.
//   static Map<String, String> getAircraft() => _aircraft ?? <String, String>{};

//   /// Gets carrier/airline name by IATA code. Returns empty string if not found.
//   static String getCarrierName(String iataCode) => _carriers?[iataCode] ?? '';

//   /// Gets aircraft name by IATA code. Returns empty string if not found.
//   static String getAircraftName(String iataCode) => _aircraft?[iataCode] ?? '';

//   /// Checks if carriers data is loaded
//   static bool hasCarriers() => _carriers != null && _carriers!.isNotEmpty;

//   /// Checks if aircraft data is loaded
//   static bool hasAircraft() => _aircraft != null && _aircraft!.isNotEmpty;

//   /// Clears all stored data
//   static void clear() {
//     _aircraft = null;
//     _carriers = null;
//   }

//   /// Clears only carriers data
//   static void clearCarriers() {
//     _carriers = null;
//   }

//   /// Clears only aircraft data
//   static void clearAircraft() {
//     _aircraft = null;
//   }
// }

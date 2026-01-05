class TicketLocalDataSrc {
  Map<String, double> savedMarkup = {};

  Future<void> saveMarkup(String bookingId, double markup) async {
    savedMarkup[bookingId] = markup;
  }

  Future<double?> getMarkup(String bookingId) async => savedMarkup[bookingId];

  Future<void> deleteAll() async => savedMarkup.clear();
}

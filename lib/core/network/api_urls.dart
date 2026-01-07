import '../constants/app_constants.dart';

class MainUrl {
  final String env = 'development';

  String getUrl() {
    if (env == 'production') {
      return AppConstants.baseUrl;
    } else {
      // return 'https://api.excellistravel.com';
      return AppConstants.baseUrl;
    }
  }

  String getAmaduesUrl() {
    if (env == 'production') {
      return AppConstants.amaduesUrl;
    } else {
      return AppConstants.amaduesUrl;
    }
  }

  String getAirlineLogoUrl() {
    if (env == 'production') {
      return '${AppConstants.imageKitUrl}/kp6vc3sud/ExTravel/logos/airlines-logos/';
    } else {
      return '${AppConstants.imageKitUrl}/kp6vc3sud/ExTravel/logos/airlines-logos/';
    }
  }
}

class EndPoints {
  static String baseUrl = MainUrl().getUrl();
  static String amaduesBaseUrl = MainUrl().getAmaduesUrl();
  static String airlineLogoUrl = MainUrl().getAirlineLogoUrl();

  //amadues
  static const String amaduesAccessToken = '/v1/security/oauth2/token';
  static const String airportSearchByKeyword = '/v1/reference-data/locations';
  static const String flightSearch = '/v2/shopping/flight-offers';
  static const String seatMap = '/v1/shopping/seatmaps';
  static const String flightOfferPrice = '/v1/shopping/flight-offers/pricing';
  static const String airlineName = '/v1/reference-data/airlines';

  // Authentication
  static const String login = '/auth/login';
  static const String registration = '/auth/register';
  static const String refreshToken = '/auth/refresh-token';
  static const String resetPassword = '/auth/change-password';
  static const String sendRecoverLink = '/auth/request-password-reset';

  //location - state
  static const String state = '/location/states?limit=1000';
  static const String cities = '/location/cities?limit=1000000';
  //wish -list
  static const String wishList = '/wish-list';
  //Profile
  static const String profile = '/auth/profile';
  static const String updateProfileImage = '/auth/profile/upload-image';
  //payment verify
  static const String createPayment = '/bookings/create-payment';
  static const String verifyPayment = '/bookings/verify-payment';
  //markup pricing
  static const String markupPricing = '/markups/calculate-markup';
  static const String myMarkup = '/markups/user';

  //ticket
  static const String ticket = '/bookings/filtered-auto';
  static const String downloadFile = '/bookings';
  static const String updateMarkup = '/bookings/update-instant-markup';

  //sales
  static const String sales = '/commissions/transactions-auto';
  static const String salesByUsers = '/commissions/transactions/user';
  static const String subSalesExecutives =
      '/dynamic-user-hierarchy/my-direct-children';
  static const String agents = '/dynamic-user-hierarchy/children';
  //markup
  static const String markup = '/markups';

  //wallet
  static const String wallet = '/wallet/summary';
  static const String walletTransactions = '/wallet/transactions';
  static const String createWalletOrder = '/wallet/create-order';
  static const String verifyWalletOrder = '/wallet/verify-payment';
  static const String walletCharge = '/wallet/debit';
  static const String walletRecharge = '/wallet/credit';
  static const String requestWithdrawal = '/withdrawals/request';
  static const String withdrawalRequests = '/withdrawals';
  static const String cancelWithdrawalRequest = '/withdrawals/';

  static String getCreditBalance = '/credit-wallet/balance';

  static String getCreditBalanceTransactions = '/credit-wallet/transactions';
  static String getBokkingViaCreditBalance = '/credit-wallet/bookings';
  static String chargeCreditWallet = '/credit-wallet/debit';
}

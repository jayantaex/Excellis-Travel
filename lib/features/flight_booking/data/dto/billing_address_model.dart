class BillingAddressModel {
  BillingAddressModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.pinCode,
    required this.country,
    required this.countryCode,
    required this.state,
  });
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String pinCode;
  final String country;
  final String countryCode;
  final String state;
}

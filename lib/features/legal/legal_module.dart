import 'package:flutter/material.dart';

import 'presentation/screens/policy.dart';

class LegalModule {
//policy
  static String policyRoute = '/policy';
  static String policyName = 'policy';
  static Widget policyBuilder() => const PolicyScreen();

//terms
  static String termsRoute = '/terms';
  static String termsName = 'terms';
  static Widget termsBuilder() => const PolicyScreen();
}

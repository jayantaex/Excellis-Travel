import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/api_client.dart';
import 'api/sales_api.dart';
import 'bloc/sales_bloc.dart';
import 'data/repository/sales_repository.dart';
import 'presentation/screens/my_markup_screen.dart';

class SalesModule {
  static const String myMarkupRoute = '/my-markup';
  static const String myMarkupScreen = 'my_markup_screen';
  static Widget myMarkupBuilder() => BlocProvider(
        create: (context) => SalesBloc(
          SalesRepository(
            SalesApi(
              ApiClient(),
            ),
          ),
        ),
        child: const MyMarkupScreen(),
      );
}

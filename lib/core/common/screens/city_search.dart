import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cities/city_bloc.dart';
import '../models/city_model.dart';
import '../../constants/app_styles.dart';
import '../../../utils/app_helpers.dart';
import '../../widgets/app_custom_appbar.dart';
import '../../widgets/app_gradient_bg.dart';
import '../../widgets/trans_white_bg_widget.dart';

class CitySearch extends StatelessWidget {
  CitySearch(
      {super.key,
      required this.stateId,
      required this.stateCode,
      required this.stateName,
      required this.onSelected});
  final int stateId;
  final String stateCode;
  final String stateName;
  final Function(CityModel city) onSelected;

  final List<CityModel> cities = <CityModel>[];

  @override
  Widget build(BuildContext context) {
    context
        .read<CityBloc>()
        .add(GetCityEvent(stateId: stateId, stateCode: stateCode));
    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: SizedBox(
              height: AppHelpers.getScreenHeight(context),
              width: AppHelpers.getScreenWidth(context),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: AppCustomAppbar(
                        centerTitle: 'Select City',
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: AppHelpers.isDarkMode(context)
                              ? AppColors.secondaryDark
                              : AppColors.white,
                        ),
                        child: BlocConsumer<CityBloc, CityState>(
                          listener: (BuildContext context, CityState state) {},
                          builder: (BuildContext context, CityState state) {
                            if (state is GetCityLoading) {
                              return const Center(
                                  child: CircularProgressIndicator.adaptive());
                            }

                            if (state is CityLoaded) {
                              return Column(
                                children: <Widget>[
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    height:
                                        AppHelpers.getScreenHeight(context) *
                                            0.8,
                                    child: ListView.builder(
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: AppColors.grey
                                              .withValues(alpha: 0.1),
                                        ),
                                        child: ListTile(
                                          onTap: () {
                                            onSelected(state.cities[index]);
                                            Navigator.pop(context);
                                          },
                                          title: Text(
                                            '${state.cities[index].name}',
                                            style: TextStyle(
                                                color: AppHelpers.isDarkMode(
                                                        context)
                                                    ? AppColors.white
                                                    : AppColors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          subtitle: Text(
                                            stateName,
                                            style: const TextStyle(
                                                color: AppColors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      itemCount: state.cities.length,
                                    ),
                                  )
                                ],
                              );
                            }

                            return Container();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

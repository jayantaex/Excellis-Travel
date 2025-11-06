import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/bloc/cities/city_bloc.dart';
import '../../../../core/common/models/city_model.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';

class CitySearch extends StatelessWidget {
  final int stateId;
  final String stateCode;
  final String stateName;
  final Function(CityModel city) onSelected;
  CitySearch(
      {super.key,
      required this.stateId,
      required this.stateCode,
      required this.stateName,
      required this.onSelected});

  List<CityModel> cities = [];

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
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: AppCustomAppbar(
                        centerTitle: 'Select City',
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: AppColors.white,
                        ),
                        child: BlocConsumer<CityBloc, CityState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is GetCityLoading) {
                              return const Center(
                                  child: CircularProgressIndicator.adaptive());
                            }

                            if (state is CityLoaded) {
                              return Column(
                                children: [
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    height:
                                        AppHelpers.getScreenHeight(context) *
                                            0.8,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) =>
                                          Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color:
                                              AppColors.grey.withOpacity(0.1),
                                        ),
                                        child: ListTile(
                                          onTap: () {
                                            onSelected(state.cities[index]);
                                            Navigator.pop(context);
                                          },
                                          title: Text(
                                            '${state.cities[index].name}',
                                            style: const TextStyle(
                                                color: AppColors.black,
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

import 'package:excellistravel/core/widgets/app_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/compact_ticket_card.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../auth/auth_module.dart';
import '../../../flight_booking/data/search_data.dart';
import '../../../flight_booking/models/ticket_data_model.dart';
import '../../../profile_management/bloc/profile_bloc.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final SearchData searchData = SearchData();
  List<TicketModel> wishList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TransWhiteBgWidget(
        child: SafeArea(
          child: Column(
            children: [
              //app bar
              const AppCustomAppbar(
                isBackButtonRequired: false,
                centerTitle: 'Wish List',
              ),

              const SizedBox(height: 24),
              Expanded(
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileInitial) {
                      return const NotLoginWidget();
                    }

                    if (state is ProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is ProfileError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: searchData.ticketData.isEmpty
                          ? const Center(
                              child: Text(
                              'No Tickets Found',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white),
                            ))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: ListView.builder(
                                itemCount: searchData.ticketData.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: CompactTicketCard(
                                      onTap: () {},
                                      isFavIconRequired: true,
                                      isOnWishList: wishList.contains(
                                        searchData.ticketData[index],
                                      ),
                                      onWishListTap: () {
                                        if (wishList.contains(
                                            searchData.ticketData[index])) {
                                          setState(() {
                                            wishList.remove(
                                                searchData.ticketData[index]);
                                          });
                                        } else {
                                          setState(() {
                                            wishList.add(
                                                searchData.ticketData[index]);
                                          });
                                        }
                                      },
                                      data: searchData.ticketData[index],
                                    ),
                                  );
                                },
                              ),
                            ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotLoginWidget extends StatelessWidget {
  const NotLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            'It looks like you are not logged in',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            context.goNamed(AuthModule.loginName);
          },
          child: const Text('LOGIN',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.white,
                  fontSize: 14,
                  color: AppColors.white)),
        ),
      ],
    );
  }
}

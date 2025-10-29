import 'dart:developer';

import 'package:excellistravel/features/ticket/ticket_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/compact_ticket_card.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../auth/auth_module.dart';
import '../../../flight_booking/data/search_data.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../bloc/ticket_bloc.dart';

class TicketScreen extends StatelessWidget {
  TicketScreen({super.key});
  final SearchData searchData = SearchData();
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
                centerTitle: 'Tickets',
              ),

              const SizedBox(height: 24),
              Expanded(
                child: BlocConsumer<ProfileBloc, ProfileState>(
                  listener: (context, state) {
                    log("PROFILE-STATE $state", name: "Ticket-Screen");
                  },
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is ProfileInitial) {
                      return const NotLoginWidget();
                    }
                    if (state is ProfileError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
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
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: BlocConsumer<TicketBloc, TicketState>(
                                listener: (context, state) {
                                  log('state $state');
                                },
                                builder: (context, state) {
                                  if (state is TicketLoading) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }

                                  if (state is TicketError) {
                                    return Center(
                                      child: Text(
                                        state.err,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white),
                                      ),
                                    );
                                  }
                                  if (state is TicketLoaded) {
                                    if (state.tickets.isEmpty) {
                                      return const Center(
                                        child: Text(
                                          'No Tickets Found',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.white),
                                        ),
                                      );
                                    }

                                    return ListView.builder(
                                      itemCount: state.tickets.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          child: CompactTicketCard(
                                            ticketData: state.tickets[index],
                                            onTap: () {
                                              context.pushNamed(
                                                  TicketModule.ticketDetails,
                                                  extra: {
                                                    'ticketIndex': index
                                                  });
                                            },
                                            isFavIconRequired: true,
                                            isOnWishList: false,
                                            onWishListTap: () {},
                                            data: searchData.ticketData[index],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                  return const Center(
                                    child: Text(
                                      'Something went wrong',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white),
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

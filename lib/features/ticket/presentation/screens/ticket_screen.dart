import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/no_login_widget.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../flight_booking/data/search_data.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../bloc/ticket_bloc.dart';
import '../../models/ticket_model.dart';
import '../widgets/ticket_widget.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final SearchData searchData = SearchData();
  int page = 1;
  int limit = 10;
  final ScrollController _scrollController = ScrollController();
  List<TicketDataModel> tickets = [];
  @override
  void initState() {
    context.read<TicketBloc>().add(const FetchTickets(page: 1, limit: 10));
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page++;
        context.read<TicketBloc>().add(
              FetchTickets(
                page: page,
                limit: limit,
              ),
            );
      }
    });
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
                                listener: (context, state) async {
                                  log("Ticket-STATE $state",
                                      name: "Ticket-Screen");
                                  if (state is TicketLoaded) {
                                    for (var element in state.tickets) {
                                      tickets.add(element);
                                    }
                                  }
                                  if (state is TicketLoadedMore) {
                                    for (var element in state.tickets) {
                                      tickets.add(element);
                                    }
                                  }
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
                                  if (state is TicketLoaded ||
                                      state is TicketLoadedMore) {
                                    if (tickets.isEmpty) {
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
                                      controller: _scrollController,
                                      itemCount: tickets.length,
                                      itemBuilder: (context, index) {
                                        return TicketWidget(
                                          isLast: index == tickets.length - 1,
                                          ticketData: tickets[index],
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

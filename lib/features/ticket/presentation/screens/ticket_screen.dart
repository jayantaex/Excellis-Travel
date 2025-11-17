import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/no_login_widget.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../bloc/ticket_bloc.dart';
import '../../models/ticket_model.dart' show Booking;
import '../widgets/ticket_widget.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  int page = 1;
  final int limit = 10;
  int totalItems = 10;
  final ScrollController _scrollController = ScrollController();
  List<Booking>? tickets;
  @override
  void initState() {
    _scrollController.addListener(onScroll);
    context.read<TicketBloc>().add(
          const FetchTickets(),
        );
    super.initState();
  }

  void onScroll() {
    final TicketState ticketState = context.read<TicketBloc>().state;
    if (ticketState is TicketLoading || tickets!.length >= totalItems) {
      return;
    }
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      page++;
      context.read<TicketBloc>().add(
            FetchMoreTickets(
              page: page,
              limit: limit,
            ),
          );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: TransWhiteBgWidget(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                //app bar
                const AppCustomAppbar(
                  isBackButtonRequired: false,
                  centerTitle: 'My Tickets',
                ),

                const SizedBox(height: 24),
                Expanded(
                  child: BlocConsumer<ProfileBloc, ProfileState>(
                    bloc: context.read<ProfileBloc>(),
                    listener: (BuildContext context, ProfileState state) {},
                    builder: (BuildContext context, ProfileState state) {
                      if (state is ProfileInitial) {
                        return const NotLoginWidget();
                      }
                      if (state is ProfileError) {
                        return ErrorScreen(
                          errorDesc: '${state.message}/n Screen: Ticket Screen',
                          errorMessage: 'Profile Error',
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: BlocConsumer<TicketBloc, TicketState>(
                            bloc: context.read<TicketBloc>(),
                            listener: (BuildContext context,
                                TicketState state) async {},
                            builder: (BuildContext context, TicketState state) {
                              if (state is TicketLoading ||
                                  state is TicketInitial) {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(
                                    backgroundColor: AppColors.white,
                                  ),
                                );
                              }

                              if (state is TicketError) {
                                return ErrorScreen(
                                  errorMessage: 'Ticket Error',
                                  errorDesc: state.err,
                                );
                              }
                              if (state is TicketLoaded) {
                                totalItems =
                                    state.tickets.pagination?.totalItems ?? 0;
                                state.tickets.bookings?.forEach((element) {
                                  tickets ??= <Booking>[];
                                  tickets!.add(element);
                                });
                                return ListView.builder(
                                  controller: _scrollController,
                                  itemCount: tickets?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          TicketWidget(
                                    isLast: false,
                                    ticketData: tickets?[index],
                                  ),
                                );
                              }

                              if (state is MoreTicketLoading) {
                                return ListView.builder(
                                  controller: _scrollController,
                                  itemCount: tickets?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          TicketWidget(
                                    isLast: index == tickets!.length - 1,
                                    ticketData: tickets?[index],
                                  ),
                                );
                              }
                              return const ErrorScreen();
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

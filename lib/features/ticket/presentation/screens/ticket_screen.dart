import 'package:excellistravel/core/widgets/app_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/utils/storage_service.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/no_login_widget.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../bloc/ticket_bloc.dart';
import '../../data/models/ticket_model.dart' show Booking;
import '../widgets/ticket_filter_sheet.dart';
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

  final TextEditingController _bookingIdController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  String _selectedStatus = '';
  String _pickedStartDate = '';
  String _pickedEndDate = '';
  List<Booking>? tickets;
  @override
  void initState() {
    Future.microtask(() async {
      final String token = await StorageService.getAccessToken() ?? '';
      if (token.isEmpty) {
        return;
      }
      fetchTickets();
      _scrollController.addListener(onScroll);
    });
    super.initState();
  }

  void onScroll() {
    final TicketState ticketState = context.read<TicketBloc>().state;
    // Check if already loading more or if we've reached the end
    if (ticketState is TicketLoaded && ticketState.isLoadingMore) {
      return;
    }
    if (ticketState is TicketLoading || tickets!.length >= totalItems) {
      return;
    }
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      page++;
      fetchTickets();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScroll);
    _bookingIdController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TransWhiteBgWidget(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              //app bar
              AppCustomAppbar(
                isBackButtonRequired: false,
                centerTitle: 'My Tickets',
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundColor: AppColors.white.withOpacity(0.1),
                    child: IconButton(
                      onPressed: () async {
                        await showAppSheet(
                          context: context,
                          title: 'Filter',
                          child: TicketFilterSheet(
                            bookingIdController: _bookingIdController,
                            startDateController: _startDateController,
                            endDateController: _endDateController,
                            selectedStatus: _selectedStatus,
                            onStatusChanged: (String status) {
                              _selectedStatus = status;
                            },
                            onStartDatePicked: (DateTime picked) {
                              _pickedStartDate = AppHelpers.formatDate(picked,
                                  pattern: 'yyyy-MM-dd');
                            },
                            onEndDatePicked: (DateTime picked) {
                              _pickedEndDate = AppHelpers.formatDate(picked,
                                  pattern: 'yyyy-MM-dd');
                            },
                          ),
                          submitButtonRequired: true,
                          onSubmitPressed: () {
                            // Reset pagination when applying filters
                            page = 1;
                            tickets = null;
                            fetchTickets();
                            Navigator.pop(context); // Close the filter sheet
                          },
                          submitButtonTitle: 'Apply',
                        );
                      },
                      icon: const Icon(
                        Icons.filter_alt_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),

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
                              // Use the bookings directly from the state
                              // The bloc already handles merging for pagination
                              tickets = state.tickets.bookings;
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, top: 8),
                                    child: SizedBox(
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            ' Tickets (${state.tickets.pagination?.totalItems})',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          _bookingIdController.text.isEmpty &&
                                                  _startDateController
                                                      .text.isEmpty &&
                                                  _endDateController
                                                      .text.isEmpty &&
                                                  _selectedStatus.isEmpty
                                              ? const SizedBox()
                                              : GestureDetector(
                                                  onTap: () async {
                                                    _bookingIdController
                                                        .clear();
                                                    _startDateController
                                                        .clear();
                                                    _endDateController.clear();
                                                    _selectedStatus = '';
                                                    _pickedStartDate = '';
                                                    _pickedEndDate = '';
                                                    page = 1;
                                                    tickets = null;
                                                    await fetchTickets();
                                                  },
                                                  child: const SizedBox(
                                                    height: 45,
                                                    child: Text(
                                                      'Clear',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: tickets?.isEmpty ?? true
                                        ? const Center(
                                            child: Text(
                                              'No Data Found',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          )
                                        : ListView.builder(
                                            controller: _scrollController,
                                            itemCount: tickets?.length,
                                            itemBuilder: (BuildContext context,
                                                    int index) =>
                                                TicketWidget(
                                              isLast:
                                                  index == tickets!.length - 1,
                                              ticketData: tickets?[index],
                                            ),
                                          ),
                                  ),
                                ],
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
      );
  Future<void> fetchTickets() async {
    if (context.mounted) {
      context.read<TicketBloc>().add(
            FetchTickets(
              page: page,
              limit: limit,
              startDate: _pickedStartDate,
              endDate: _pickedEndDate,
              status: _selectedStatus,
              bookingId: _bookingIdController.text,
            ),
          );
    }
  }
}

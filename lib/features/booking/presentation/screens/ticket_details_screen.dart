import 'dart:developer';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../core/network/api_urls.dart';
import '../../../../core/services/download_manager.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../../utils/airline_info_provider.dart';
import '../../bloc/ticket_bloc.dart';
import '../../data/models/ticket_model.dart';
import '../widgets/billing_info_widget.dart';
import '../widgets/segment_card.dart' show SegmentCard;

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({super.key, required this.ticketData});
  final Booking? ticketData;

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  AirlineInfoProvider airlineInfoProvider = AirlineInfoProvider();
  final TextEditingController _markupController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _savedMarkup = 0.0;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      context
          .read<TicketBloc>()
          .add(GetMarkup(bookingId: widget.ticketData!.bookingReference ?? ''));
    });
    super.initState();
  }

  // String _airlineName = '';
  @override
  Widget build(BuildContext context) {
    final double width = AppHelpers.getScreenWidth(context);
    final bool isDark = AppHelpers.isDarkMode(context);

    return Scaffold(
      body: BlocConsumer<TicketBloc, TicketState>(
        listener: (context, state) {
          if (state is TicketError) {
            Fluttertoast.showToast(
              msg: state.err,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          }
          if (state is MarkupUpdated) {
            context.read<TicketBloc>().add(GetMarkup(
                bookingId: widget.ticketData!.bookingReference ?? ''));
            AppHelpers.showSnackBar(
                backgroundColor: AppColors.success,
                context,
                'Markup updated successfully');
          }
          if (state is MarkupRetrieved) {
            if (state.markup != null) {
              _savedMarkup = state.markup!;
              _markupController.text = _savedMarkup.toString();
            } else {
              _savedMarkup = widget.ticketData?.fareDetails?.markup ?? 0.0;
              _markupController.text = _savedMarkup.toString();
            }
          }
        },
        builder: (context, state) => AppGradientBg(
          child: TransWhiteBgWidget(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AppCustomAppbar(
                      start:
                          '${widget.ticketData?.flightData?.itineraries?.first.segments?.first.departure?.iataCode}',
                      end:
                          '${widget.ticketData?.flightData?.itineraries?.first.segments?.last.arrival?.iataCode}',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: state is TicketLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : state is TicketError
                            ? ErrorScreen(
                                errorMessage: 'Something went wrong',
                                errorDesc: state.err,
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? AppColors.secondaryDark
                                      : AppColors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                            height: 45,
                                            width: width,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              color: AppColors.info,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(32),
                                                topRight: Radius.circular(32),
                                              ),
                                            ),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                ),
                                                child: Text(
                                                  '${widget.ticketData?.ticketNumbers?.first}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.white,
                                                  ),
                                                ))),
                                        ...widget.ticketData!.flightData!
                                            .itineraries!
                                            .map(
                                          (Itinerary e) => DottedBorder(
                                            options:
                                                CustomPathDottedBorderOptions(
                                              customPath: (Size size) => Path()
                                                ..moveTo(0, size.height)
                                                ..relativeLineTo(size.width, 0),
                                              dashPattern: <double>[5, 5],
                                              color: isDark
                                                  ? AppColors.white
                                                      .withValues(alpha: 0.3)
                                                  : AppColors.grey
                                                      .withValues(alpha: 0.5),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      SizedBox(
                                                          height: 90,
                                                          width: width * 0.25,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Text(
                                                                '${e.segments?.first.departure?.iataCode}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        24,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: isDark
                                                                        ? AppColors
                                                                            .white
                                                                        : AppColors
                                                                            .black),
                                                              ),
                                                              Text(
                                                                AppHelpers.formatDateTime(
                                                                    DateTime.parse(
                                                                        '${e.segments?.first.departure?.at}'),
                                                                    pattern:
                                                                        'dd MMM, yyyy'),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: isDark
                                                                        ? AppColors.white.withValues(
                                                                            alpha:
                                                                                0.7)
                                                                        : AppColors
                                                                            .grey),
                                                              ),
                                                              Text(
                                                                AppHelpers.formatDateTime(
                                                                        DateTime.parse(
                                                                            '${e.segments?.first.departure?.at}'),
                                                                        pattern:
                                                                            'hh:mm a')
                                                                    .toUpperCase(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: isDark
                                                                        ? AppColors.white.withValues(
                                                                            alpha:
                                                                                0.7)
                                                                        : AppColors
                                                                            .grey),
                                                              ),
                                                            ],
                                                          )),
                                                      SizedBox(
                                                          width: width * 0.25,
                                                          child: Column(
                                                            children: <Widget>[
                                                              AppHelpers.svgAsset(
                                                                  assetName:
                                                                      'flight',
                                                                  width: 100,
                                                                  color: isDark
                                                                      ? AppColors
                                                                          .white
                                                                      : null),
                                                              Text(
                                                                '',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: isDark
                                                                        ? AppColors
                                                                            .white
                                                                        : AppColors
                                                                            .black),
                                                              ),
                                                            ],
                                                          )),
                                                      SizedBox(
                                                        height: 90,
                                                        width: width * 0.25,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            Text(
                                                              '${e.segments?.last.arrival?.iataCode}',
                                                              style: TextStyle(
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: isDark
                                                                      ? AppColors
                                                                          .white
                                                                      : AppColors
                                                                          .black),
                                                            ),
                                                            Text(
                                                              AppHelpers.formatDateTime(
                                                                  DateTime.parse(
                                                                      '${e.segments?.last.arrival?.at}'),
                                                                  pattern:
                                                                      'dd MMM, yyyy'),
                                                              style: TextStyle(
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: isDark
                                                                      ? AppColors
                                                                          .white
                                                                          .withValues(
                                                                              alpha:
                                                                                  0.7)
                                                                      : AppColors
                                                                          .grey),
                                                            ),
                                                            Text(
                                                              AppHelpers.formatDateTime(
                                                                      DateTime.parse(
                                                                          '${e.segments?.last.arrival?.at}'),
                                                                      pattern:
                                                                          'hh:mm a')
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: isDark
                                                                      ? AppColors
                                                                          .white
                                                                          .withValues(
                                                                              alpha:
                                                                                  0.7)
                                                                      : AppColors
                                                                          .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  ...widget
                                                      .ticketData!
                                                      .flightData!
                                                      .itineraries!
                                                      .first
                                                      .segments!
                                                      .map(
                                                    (Segment e) =>
                                                        SegmentCard(data: e),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        widget.ticketData!.fareDetails
                                                    ?.showTotalFare ==
                                                true
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 12),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text('Update Markup',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: isDark
                                                              ? AppColors.white
                                                              : AppColors
                                                                  .black)),
                                                ),
                                              )
                                            : const SizedBox(),
                                        widget.ticketData!.fareDetails
                                                    ?.showTotalFare ==
                                                true
                                            ? Form(
                                                key: _formKey,
                                                child: ListTile(
                                                  title: AppPrimaryInput(
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Please enter markup';
                                                      }
                                                      if (double.parse(value) <
                                                          0) {
                                                        return 'Markup cannot be negative';
                                                      }
                                                      if (double.parse(value) >
                                                          5000) {
                                                        return 'Markup cannot be more than 5000';
                                                      }
                                                      return null;
                                                    },
                                                    maxCharacters: 8,
                                                    controller:
                                                        _markupController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    hint:
                                                        'Enter Markup (e.g. 100)',
                                                    label: 'Markup',
                                                  ),
                                                  trailing: InkWell(
                                                    onTap: () {
                                                      _handleUpdateMarkup();
                                                    },
                                                    child: Container(
                                                      height: 50,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            AppColors.primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          'Update',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text('Passenger Details',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: isDark
                                                        ? AppColors.white
                                                        : AppColors.black)),
                                          ),
                                        ),
                                        ...widget.ticketData!.travellerDetails!
                                            .adults!
                                            .map(
                                          (Adult adult) => ListTile(
                                            leading: CircleAvatar(
                                              radius: 16,
                                              backgroundColor: isDark
                                                  ? AppColors.white
                                                      .withValues(alpha: 0.1)
                                                  : null,
                                              child: const Icon(
                                                Icons.person,
                                                color: AppColors.primary,
                                                size: 16,
                                              ),
                                            ),
                                            title: Text(
                                              '${adult.firstName ?? ''} ${adult.lastName ?? ''}',
                                              style: TextStyle(
                                                  color: isDark
                                                      ? AppColors.white
                                                      : AppColors.black),
                                            ),
                                            subtitle: adult
                                                        .dateOfBirth?.isEmpty ??
                                                    true
                                                ? null
                                                : Text(
                                                    AppHelpers.formatDate(
                                                        DateTime.parse(adult
                                                                .dateOfBirth ??
                                                            DateTime.now()
                                                                .toString()),
                                                        pattern: 'dd MMM yyy'),
                                                    style: TextStyle(
                                                        color: isDark
                                                            ? AppColors.white
                                                                .withValues(
                                                                    alpha: 0.7)
                                                            : AppColors.grey),
                                                  ),
                                          ),
                                        ),
                                        ...widget.ticketData!.travellerDetails!
                                            .children!
                                            .map(
                                          (child) => ListTile(
                                            leading: CircleAvatar(
                                              radius: 16,
                                              backgroundColor: isDark
                                                  ? AppColors.white
                                                      .withValues(alpha: 0.1)
                                                  : null,
                                              child: const Icon(
                                                Icons.person,
                                                color: AppColors.primary,
                                                size: 16,
                                              ),
                                            ),
                                            title: Text(
                                              '${child.firstName} ${child.lastName}',
                                              style: TextStyle(
                                                  color: isDark
                                                      ? AppColors.white
                                                      : AppColors.black),
                                            ),
                                            subtitle: child
                                                        .dateOfBirth?.isEmpty ??
                                                    true
                                                ? null
                                                : Text(
                                                    AppHelpers.formatDate(
                                                        DateTime.parse(child
                                                                .dateOfBirth ??
                                                            DateTime.now()
                                                                .toString()),
                                                        pattern: 'dd MMM yyy'),
                                                    style: TextStyle(
                                                        color: isDark
                                                            ? AppColors.white
                                                                .withValues(
                                                                    alpha: 0.7)
                                                            : AppColors.grey),
                                                  ),
                                          ),
                                        ),
                                        ...widget.ticketData!.travellerDetails!
                                            .infants!
                                            .map(
                                          (infant) => ListTile(
                                            leading: CircleAvatar(
                                              radius: 16,
                                              backgroundColor: isDark
                                                  ? AppColors.white
                                                      .withValues(alpha: 0.1)
                                                  : null,
                                              child: const Icon(
                                                Icons.person,
                                                color: AppColors.primary,
                                                size: 16,
                                              ),
                                            ),
                                            title: Text(
                                              '${infant.firstName ?? ''} ${infant.lastName ?? ''}',
                                              style: TextStyle(
                                                  color: isDark
                                                      ? AppColors.white
                                                      : AppColors.black),
                                            ),
                                            subtitle: infant
                                                        .dateOfBirth?.isEmpty ??
                                                    true
                                                ? null
                                                : Text(
                                                    AppHelpers.formatDate(
                                                        DateTime.parse(infant
                                                                .dateOfBirth ??
                                                            DateTime.now()
                                                                .toString()),
                                                        pattern: 'dd MMM yyy'),
                                                    style: TextStyle(
                                                        color: isDark
                                                            ? AppColors.white
                                                                .withValues(
                                                                    alpha: 0.7)
                                                            : AppColors.grey),
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Billing Information',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: isDark
                                                      ? AppColors.white
                                                      : AppColors.black),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: BillingInfo(
                                            bookingReference: widget
                                                .ticketData?.referenceNumber,
                                            billingAddress: widget
                                                .ticketData?.billingAddress,
                                            contactDetails: widget
                                                .ticketData?.contactDetails,
                                            pnr: widget
                                                .ticketData?.bookingReference,
                                            billingDate:
                                                widget.ticketData?.createdAt,
                                          ),
                                        ),
                                        if (widget.ticketData?.bookingStatus ==
                                            'confirmed')
                                          ListTile(
                                            title: Text(
                                              'Invoice',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: isDark
                                                    ? AppColors.white
                                                    : AppColors.black,
                                              ),
                                            ),
                                            subtitle: const Text(
                                              'Download the invoice for this booking',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.grey),
                                            ),
                                            trailing: IconButton(
                                                onPressed: () async {
                                                  try {
                                                    Fluttertoast.showToast(
                                                        msg: 'Downloading...');
                                                    // final bool res =
                                                    //     await FileDownloaderService
                                                    //         .invoiceDownload(
                                                    //   bokkingRefId:
                                                    //       '${widget.ticketData?.bookingReference}',
                                                    //   showDownloadProgress:
                                                    //       (count, total) {},
                                                    // );
                                                    final String bookingRefId =
                                                        '${widget.ticketData?.bookingReference}';
                                                    final String url =
                                                        '${EndPoints.baseUrl}/bookings/$bookingRefId/invoice?format=pdf';
                                                    final String fileName =
                                                        '${widget.ticketData?.bookingReference}_${DateTime.now().millisecondsSinceEpoch}.pdf';
                                                    final String? taskId =
                                                        await DownloadManager
                                                            .downloadFile(
                                                                url, fileName);

                                                    if (taskId != null) {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Downloaded successfully');
                                                    }
                                                  } catch (e) {
                                                    Fluttertoast.showToast(
                                                        msg: '$e');
                                                  }
                                                },
                                                icon: const Icon(
                                                  Icons.download,
                                                  color: AppColors.primary,
                                                )),
                                          ),
                                        const SizedBox(height: 45),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        color: isDark ? AppColors.secondaryDark : AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: AppHelpers.getScreenWidth(context) * 0.4,
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BlocBuilder<TicketBloc, TicketState>(
                    builder: (context, state) {
                      if (state is MarkupRetrieved) {
                        return Text(
                          AppHelpers.formatCurrency(double.parse(
                              widget.ticketData?.totalAmount ?? '0.0')),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color:
                                  isDark ? AppColors.white : AppColors.black),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  Text(
                    '${widget.ticketData?.paymentStatus}'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: widget.ticketData?.paymentStatus == 'paid'
                            ? AppColors.success
                            : AppColors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: AppHelpers.getScreenWidth(context) * 0.4,
              height: 45,
              child: AppPrimaryButton(
                  onPressed: widget.ticketData?.bookingStatus == 'confirmed'
                      ? () async {
                          try {
                            Fluttertoast.showToast(msg: 'Downloading...');
                            // final bool res =
                            //     await FileDownloaderService.saveFile(
                            //   baseFare:
                            //       '${(widget.ticketData?.fareDetails?.totalFare ?? 0.0) - (_savedMarkup)}',
                            //   totalFare:
                            //       '${widget.ticketData?.fareDetails?.totalFare}',
                            //   markupPrice: widget.ticketData?.fareDetails
                            //               ?.showTotalFare ==
                            //           true
                            //       ? _markupController.text
                            //       : '${(widget.ticketData?.fareDetails?.markup ?? 0.00)}',
                            //   bokkingRefId:
                            //       '${widget.ticketData?.bookingReference}',
                            //   showDownloadProgress: (count, total) {},
                            // );
                            final String bookingRefId =
                                '${widget.ticketData?.bookingReference}';
                            final String url =
                                '${EndPoints.baseUrl}${EndPoints.downloadFile}/$bookingRefId/download?format=pdf';
                            final String fileName =
                                '${widget.ticketData?.bookingReference}_${DateTime.now().millisecondsSinceEpoch}.pdf';
                            final String? taskId =
                                await DownloadManager.downloadFile(
                                    url, fileName);

                            if (taskId != null) {
                              log('taskId: $taskId');
                              Fluttertoast.showToast(
                                  msg: 'Downloaded successfully');
                            }
                          } catch (e) {
                            Fluttertoast.showToast(msg: '$e');
                          }
                        }
                      : null,
                  bgColor: widget.ticketData?.bookingStatus == 'confirmed'
                      ? AppColors.primary
                      : AppColors.grey,
                  style: const TextStyle(fontSize: 14, color: AppColors.white),
                  title: 'Download',
                  isLoading: false),
            )
          ],
        ),
      ),
    );
  }

  void _handleUpdateMarkup() {
    if (_formKey.currentState!.validate()) {
      context.read<TicketBloc>().add(UpdateMarkup(
          bookingId: '${widget.ticketData?.bookingReference}',
          markup: double.parse(_markupController.text)));
    }
  }
}

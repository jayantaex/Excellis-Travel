import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/compact_ticket_card.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../flight_booking/data/search_data.dart';

class TicketScreen extends StatelessWidget {
  TicketScreen({super.key});
  final SearchData searchData = SearchData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: TransWhiteBgWidget(
        child: SafeArea(
          child: Column(
            children: [
              //app bar
              const Text(
                'Tickets',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white),
              ),

              const SizedBox(height: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: searchData.ticketData.isEmpty
                      ? const Center(
                          child: Text(
                          'No Tickets Found',
                          style: TextStyle(
                              fontSize: 18,
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
                                  isOnWishList: false,
                                  onWishListTap: () {},
                                  data: searchData.ticketData[index],
                                ),
                              );
                            },
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

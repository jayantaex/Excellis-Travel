import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/compact_ticket_card.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../flight_booking/data/search_data.dart';
import '../../../flight_booking/models/ticket_data_model.dart';

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
      backgroundColor: AppColors.transparent,
      body: TransWhiteBgWidget(
        child: SafeArea(
          child: Column(
            children: [
              //app bar
              const Text(
                'Wish List',
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
                                        wishList
                                            .add(searchData.ticketData[index]);
                                      });
                                    }
                                  },
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

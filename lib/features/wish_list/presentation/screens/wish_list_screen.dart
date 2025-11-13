import 'package:flutter/material.dart';

import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/no_ticket_found.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  List wishList = [];
  @override
  void initState() {
    super.initState();
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
                  centerTitle: 'My Wishlist',
                ),

                const SizedBox(height: 24),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: wishList.isEmpty
                        ? const NoTicketFound()
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: ListView.builder(
                              itemCount: wishList.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: const SizedBox(),
                              ),
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

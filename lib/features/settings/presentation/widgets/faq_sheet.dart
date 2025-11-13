import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';

Future<void> showFaqSheet({required BuildContext context}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    context: context,
    builder: (BuildContext context) => FaqSheet(),
  );
}

class FaqSheet extends StatelessWidget {
  FaqSheet({super.key});
  final List<Map<String, String>> faqs = <Map<String, String>>[
    <String, String>{
      'question': 'How do I book a flight?',
      'answer':
          'You can book a flight by searching for your preferred route, selecting your desired flight, entering passenger details, and completing payment. You will receive an e-ticket once your booking is confirmed.',
    },
    <String, String>{
      'question': 'I didn’t receive my ticket after booking. What should I do?',
      'answer':
          'Please check your email’s spam or junk folder. If you still don’t see the ticket, open the “My Bookings” section in the app to download it, or contact our support team for help.',
    },
    <String, String>{
      'question': 'Can I cancel or change my booking?',
      'answer':
          'Yes, you can cancel or modify your booking from the “My Bookings” page, depending on the airline’s policy. Cancellation or rescheduling charges may apply.',
    },
    <String, String>{
      'question': 'How do I request a refund?',
      'answer':
          'After canceling your booking, refunds are processed automatically within 5–7 business days. If the refund does not appear, please contact our support team with your booking ID.',
    },
    <String, String>{
      'question':
          'My payment failed, but the amount was deducted. What should I do?',
      'answer':
          'If payment was deducted but the booking failed, the amount will usually be refunded automatically within 3–5 business days. If it doesn’t appear, please share the transaction ID with our support team.',
    },
    <String, String>{
      'question': 'Can I add baggage or select a seat after booking?',
      'answer':
          'Yes, you can add extra baggage or choose seats by going to “Manage Booking.” Some airlines may charge additional fees for these services.',
    },
    <String, String>{
      'question': 'How will I know if my flight schedule changes?',
      'answer':
          'We’ll notify you via email, SMS, or app notification if there’s a schedule change. You can also check the latest flight status in “My Bookings.”',
    },
    <String, String>{
      'question': 'Can I book for someone else?',
      'answer':
          'Yes, you can book tickets for family or friends. Just make sure to enter their correct details during booking, as name changes are not allowed after confirmation.',
    },
    <String, String>{
      'question': 'Do I need to print my ticket?',
      'answer':
          'No, a digital e-ticket is sufficient. You can show it on your phone at the airport along with a valid ID proof.',
    },
    <String, String>{
      'question': 'How do I contact customer support?',
      'answer':
          'You can reach our support team through the “Help & Support” section in the app, via chat, email, or phone. Our team is available 24/7 to assist you.',
    },
  ];

  @override
  Widget build(BuildContext context) => Container(
        height: AppHelpers.getScreenHeight(context) * 0.9,
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 40),
        width: AppHelpers.getScreenWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(width: 20),
                const Text(
                  'FAQs',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: AppColors.grey,
                    ))
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 0.5,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                  itemCount: faqs.length,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Text(faqs[index]['question']!,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600)),
                        subtitle: Text(
                          faqs[index]['answer']!,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey),
                        ),
                      )),
            )
          ],
        ),
      );
}

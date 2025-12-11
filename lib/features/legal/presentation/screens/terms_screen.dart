import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  WebViewController? controller;

  String termsUrl = AppConstants.termsAndConditions;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) =>
              NavigationDecision.navigate,
        ),
      )
      ..loadRequest(Uri.parse(termsUrl));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: AppCustomAppbar(
                      centerTitle: 'Terms & Conditions',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: AppColors.white,
                      ),
                      child: controller == null
                          ? const Center(
                              child: CircularProgressIndicator.adaptive())
                          : ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(24),
                              ),
                              child: WebViewWidget(controller: controller!)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

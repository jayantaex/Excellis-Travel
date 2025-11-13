import 'package:flutter/cupertino.dart';

import '../constants/app_styles.dart';

class NoTicketFound extends StatelessWidget {
  const NoTicketFound({super.key});

  @override
  Widget build(BuildContext context) => const Center(
      child: SizedBox(
        child: Text('Tickets not found !',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            )),
      ),
    );
}

const String ticket =
    '<svg fill="#ffffff" viewBox="0 0 32 32" id="icon" xmlns="http://www.w3.org/2000/svg" stroke="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><defs><style>.cls-1{fill:none;}</style></defs><title>no-ticket</title><path d="M28,6h-.5859L30,3.4141,28.5859,2,2,28.5859,3.4141,30l4-4H28a2.0027,2.0027,0,0,0,2-2V19a1,1,0,0,0-1-1,2,2,0,0,1,0-4,1,1,0,0,0,1-1V8A2.0023,2.0023,0,0,0,28,6Zm0,6.1265a4,4,0,0,0,0,7.7465V24H21V21H19v3H9.4141L19,14.4141V19h2V12.4141L25.4141,8H28Z"></path><path d="M4,12.1265V8H19V6H4A2.0023,2.0023,0,0,0,2,8v5a1,1,0,0,0,1,1,2,2,0,0,1,0,4,1,1,0,0,0-1,1v5H4V19.873a4,4,0,0,0,0-7.7465Z"></path><rect id="_Transparent_Rectangle_" data-name="&lt;Transparent Rectangle&gt;" class="cls-1" width="32" height="32"></rect></g></svg>';

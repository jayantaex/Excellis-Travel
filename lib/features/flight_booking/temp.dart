import 'package:flutter/material.dart';

class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.white,
          width: 595,
          height: 842,
          child: Column(
            children: [
              Container(
                height: 120,
                child: Row(
                  children: [
                    Image.asset('assets/images/airways.png'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

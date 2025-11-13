import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../bottom_navigation/bottom_nav_module.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    this.nextRoute = '/profile',
    this.duration = const Duration(seconds: 3),
  });
  final String nextRoute;
  final Duration duration;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  late final Animation<double> _fade;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _scale = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut),
    );

    _fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeIn),
    );

    _ctrl.forward();

    _timer = Timer(widget.duration, () {
      if (!mounted) return;
      context.goNamed(BottomNavModule.name);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AnimatedBuilder(
          animation: _ctrl,
          builder: (BuildContext context, Widget? child) {
            // Animated gradient colors
            final double t = _ctrl.value;
            final Color top = Color.lerp(
                const Color(0xFF4A00E0), const Color(0xFF8E2DE2), t)!;
            final Color bottom = Color.lerp(
                const Color(0xFF00C6FF), const Color(0xFF4CA1FF), t)!;

            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[top, bottom],
                ),
              ),
              child: child,
            );
          },
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ScaleTransition(
                    scale: _scale,
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const FlutterLogo(size: 92),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _fade,
                    child: const Column(
                      children: <Widget>[
                        Text(
                          'Starter App',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.6,
                            shadows: <Shadow>[
                              Shadow(
                                  blurRadius: 6,
                                  color: Colors.black26,
                                  offset: Offset(0, 2))
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Beautiful, fast & productive',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  const SizedBox(
                    width: 48,
                    height: 48,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

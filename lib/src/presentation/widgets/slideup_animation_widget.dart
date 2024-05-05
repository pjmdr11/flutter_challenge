import 'dart:async';

import 'package:flutter/material.dart';

class SlideUpAnimationWidget extends StatefulWidget {
  final Widget child;
  final int delay;

  const SlideUpAnimationWidget(
      {required this.child, this.delay = 0, super.key});

  @override
  _SlideUpAnimationWidgetState createState() => _SlideUpAnimationWidgetState();
}

class _SlideUpAnimationWidgetState extends State<SlideUpAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.easeOutBack, parent: _animController);
    _animOffset = Tween<Offset>(begin: const Offset(0.0, 2.0), end: Offset.zero)
        .animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _animController.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}

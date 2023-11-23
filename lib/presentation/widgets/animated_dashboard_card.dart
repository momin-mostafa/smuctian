import 'package:flutter/material.dart';

class AnimatedSlider extends StatefulWidget {
  const AnimatedSlider({super.key, required this.child});

  final Widget? child;

  @override
  State<AnimatedSlider> createState() => _AnimatedSliderState();
}

class _AnimatedSliderState extends State<AnimatedSlider>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<Offset> _begin = Tween<Offset>(
    begin: const Offset(1, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceIn,
  ));

  late final Animation<Offset> _end = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  bool isPressed = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pressed,
      child: SlideTransition(
        position: isPressed ? _begin : _end,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.child ?? const FlutterLogo(size: 150.0),
        ),
      ),
    );
  }

  _pressed() {

    if (isPressed) {
      isPressed = !isPressed;
      _controller.forward();
    } else {
      isPressed = !isPressed;
      _controller.reverse();
    }
  }
}

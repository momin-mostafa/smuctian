import 'dart:math' as math;

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomFAB extends StatefulWidget {
  const CustomFAB({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<CustomFAB> createState() => _CustomFABState();
}

class _CustomFABState extends State<CustomFAB>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        _open
            ? BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              )
            : const SizedBox(),
        _buildTapToCloseFab(),
        ..._buildExpandingActionButtons(),
        _buildTapToOpenFab(),
      ],
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // List<Widget> _buildExpandingActionButtons() {
  //   final children = <Widget>[];
  //   final count = widget.children.length;
  //   final verticalSpacing = 20.0;
  //
  //   for (var i = 0; i < count; i++) {
  //     children.add(
  //       Container(
  //         color: Colors.red,
  //         width: 100,
  //         height: verticalSpacing,
  //       ),
  //     );
  //     children.add(
  //       _ExpandingActionButton(
  //         directionInDegrees: 90.0,
  //         maxDistance: widget.distance,
  //         progress: _expandAnimation,
  //         child: widget.children[i],
  //       ),
  //     );
  //   }
  //
  //   return children;
  //   // final children = <Widget>[];
  //   // final count = widget.children.length;
  //   // final step =  0.0 + (count - 1);
  //   // for (var i = 0, angleInDegrees = 90.0;
  //   //     i < count;
  //   //     i++, angleInDegrees += step) {
  //   //   children.add(
  //   //     _ExpandingActionButton(
  //   //       directionInDegrees: 0,//angleInDegrees,
  //   //       maxDistance: widget.distance,
  //   //       progress: _expandAnimation,
  //   //       child: widget.children[i],
  //   //     ),
  //   //   );
  //   // }
  //   // // children.add(const SizedBox(height: 60));
  //   // return children;
  // }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final verticalSpacing = 20.0;



    children.add(
      _ExpandingActionButton(
        directionInDegrees: 90.0,
        maxDistance: widget.distance,
        progress: _expandAnimation,
        child: widget.children[0],
      ),
    );

    children.add(
      SizedBox(
        height: verticalSpacing,
      ),
    );

    children.add(
      _ExpandingActionButton(
        directionInDegrees: 90.0,
        maxDistance: widget.distance - 60,
        progress: _expandAnimation,
        child: widget.children[1],
      ),
    );

    return children;
  }


  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            onPressed: _toggle,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          // 180/math.pi * (math.pi / 180.0),
          (progress.value * 1.1) * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
    required this.label,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        color: theme.scaffoldBackgroundColor,
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: icon,
              color: theme.colorScheme.onSecondary,
            ),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

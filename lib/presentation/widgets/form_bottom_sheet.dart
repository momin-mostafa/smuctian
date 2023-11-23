import 'package:flutter/material.dart';

class FormBottomSheet extends StatelessWidget {
  const FormBottomSheet({
    super.key,
    this.previousButtonText = 'Previous',
    this.nextButtonText = 'Next',
    this.onPreviousButtonPress,
    this.onNextButtonPress, this.child,
  });

  final String previousButtonText;
  final String nextButtonText;
  final VoidCallback? onPreviousButtonPress;
  final VoidCallback? onNextButtonPress;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: child ?? Row(
                children: [
                  Expanded(
                    child: FormBottomSheetButton(
                      label: previousButtonText,
                      onTap: onPreviousButtonPress,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FormBottomSheetButton(label: nextButtonText,onTap: onNextButtonPress,)
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}

class FormBottomSheetButton extends StatelessWidget {
  const FormBottomSheetButton({super.key, this.onTap, required this.label});

  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size(
            double.maxFinite,
            50,
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }
}

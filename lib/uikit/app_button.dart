import 'package:flutter/material.dart';
import 'package:suai_coursework_frontend/services/extensions.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.borderColor,
  });

  final String text;
  final Widget icon;
  final Color? borderColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: borderColor ?? context.colors.borderPrimary,
            ),
          ),
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Row(
                children: [
                  Text(
                    text,
                    style: context.textStyles.onButton,
                  ),
                  const Spacer(),
                  icon,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

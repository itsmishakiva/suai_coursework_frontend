import 'package:flutter/material.dart';
import 'package:suai_coursework_frontend/services/extensions.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.loading = false,
  });

  final String text;
  final void Function() onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Material(
          color: context.colors.button,
          child: InkWell(
            onTap: loading ? null : onTap,
            child: Center(
              child: loading
                  ? SizedBox(
                      width: 16.0,
                      height: 16.0,
                      child: CircularProgressIndicator(
                        color: context.colors.textPrimary,
                        strokeWidth: 2.0,
                      ),
                    )
                  : Text(
                      text,
                      style: context.textStyles.onTextButton,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

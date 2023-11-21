import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suai_coursework_frontend/services/extensions.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.controller,
  });

  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: context.colors.borderSecondary,
        width: 1.0,
      ),
    );
    return SizedBox(
      height: 40,
      child: TextField(
        controller: widget.controller,
        style: context.textStyles.textField1,
        cursorColor: context.colors.textPrimary,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 0.0,
          ),
          hintText: widget.hintText,
          hintStyle: context.textStyles.textFieldLabel1,
          border: defaultBorder,
          enabledBorder: defaultBorder,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: context.colors.borderPrimary,
              width: 1.0,
            ),
          ),
          suffixIcon: !widget.obscureText
              ? null
              : SizedBox(
                  width: 45,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        obscureText
                            ? 'assets/icons/obscure.svg'
                            : 'assets/icons/no_obscure.svg',
                        colorFilter: ColorFilter.mode(
                          context.colors.textPrimary,
                          BlendMode.srcIn,
                        ),
                        width: 18,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

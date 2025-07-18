// lib/components/button_render.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dekul_connect_app/styles/styles.dart';

class ButtonRender extends StatelessWidget {
  const ButtonRender({
    super.key,
    required this.title,
    required this.onTap,
    this.backgroundColor = AppColors.white,
    this.borderColor = AppColors.white,
    this.textColor = AppColors.black,
    this.isLoading = false,
    this.icon,
  });

  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final bool isLoading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0,
        ),
        child:
            isLoading
                ? CupertinoActivityIndicator(color: textColor)
                : (icon != null
                    ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon ?? SizedBox.shrink(),
                        SizedBox(width: 12),
                        _textRender(),
                      ],
                    )
                    : _textRender()),
      ),
    );
  }

  Widget _textRender() {
    return Text(
      title,
      style: BiryaniTextStyles.bold.copyWith(color: textColor),
    );
  }
}

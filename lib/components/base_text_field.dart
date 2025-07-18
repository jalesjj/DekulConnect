// lib/components/base_text_field.dart
import 'package:dekul_connect_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    this.name,
    this.hintText,
    this.initialValue,
    this.prefixText,
    this.helperText,
    this.message = "",
    this.maxLines,
    this.maxLength,
    this.isObscure,
    this.isEnabled = true,
    this.isReadOnly,
    this.isAutoValidate,
    this.isRequired,
    this.showHintText,
    this.isError = false,
    this.focusNode,
    this.validator,
    required this.controller,
    this.inputType = TextInputType.text,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters = const [],
    this.onTap,
    this.onChanged,
    this.onSubmitted,
  });

  final String? name;
  final String? hintText, initialValue, prefixText, helperText;
  final String message;
  final int? maxLines, maxLength;
  final bool? isObscure, isReadOnly, isAutoValidate, isRequired, showHintText;
  final bool isEnabled, isError;

  final FocusNode? focusNode;
  final FormFieldValidator<String?>? validator;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextStyle? textStyle;
  final Widget? prefixIcon, suffixIcon;
  final List<TextInputFormatter> inputFormatters;

  final Function? onTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  bool get hasMessage => message.isNotEmpty;
  bool get enabledOverride => onTap != null ? false : isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          onTap != null && isEnabled
              ? InkWell(onTap: () => onTap?.call(), child: _renderTextField())
              : _renderTextField(),
          Visibility(
            visible: hasMessage,
            maintainSize: false,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 0),
              child: Row(
                children: [
                  Icon(Icons.info_rounded, size: 16),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      message,
                      style: BiryaniTextStyles.normal.copyWith(
                        color: isError ? AppColors.red : AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderTextField() {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autovalidateMode:
          isAutoValidate == null ? null : AutovalidateMode.onUserInteraction,
      showCursor: true,
      enabled: enabledOverride,
      readOnly: onTap != null ? true : isReadOnly ?? false,
      obscureText: (isObscure ?? false),
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      style:
          textStyle ??
          BiryaniTextStyles.normal.copyWith(
            color: AppColors.black,
            fontSize: 14,
          ),
      keyboardType: inputType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconConstraints: BoxConstraints(minHeight: 12, minWidth: 12),
        suffixIconConstraints: BoxConstraints(minHeight: 12, minWidth: 12),
        hintStyle: BiryaniTextStyles.normal.copyWith(
          color: AppColors.black.withValues(alpha: 0.5),
          fontSize: 14,
        ),
        hintText: hintText,
        enabled: isEnabled == true,
        filled: true,
        fillColor:
            isEnabled
                ? AppColors.white
                : AppColors.black.withValues(alpha: 0.1),
        border: Borders.textFieldBorder,
        enabledBorder: Borders.textFieldBorder,
        focusedBorder: Borders.textFieldFocusedBorder,
        errorBorder: Borders.textFieldErrorBorder,
        disabledBorder: Borders.textFieldDisabledBorder,
        error: isError ? SizedBox() : null, // manipulate state
        contentPadding:
            prefixIcon != null ? EdgeInsets.zero : EdgeInsets.all(16),
      ),
      validator: validator,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      onFieldSubmitted: (value) {
        if (onSubmitted != null) {
          onSubmitted!(value);
        }
      },
    );
  }
}

// lib/components/progress_dialog.dart
import 'package:flutter/material.dart';
import 'package:dekul_connect_app/components/components.dart';

class ProgressDialog extends StatelessWidget {
  final void Function()? onDismiss;
  final bool isShow;

  const ProgressDialog({super.key, this.onDismiss, this.isShow = false});

  @override
  Widget build(BuildContext context) {
    return isShow
        ? GestureDetector(
          onTap: onDismiss,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withValues(alpha: 0.5),
              child: const LoadingContainer(),
            ),
          ),
        )
        : const SizedBox();
  }
}

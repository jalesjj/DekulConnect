// lib/components/progress_container.dart
import 'package:dekul_connect_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading_container.dart';

class ProgressContainer extends StatelessWidget {
  final void Function()? onDismiss;
  final bool isShow;
  final Widget? customLoading;

  const ProgressContainer({
    super.key,
    this.onDismiss,
    this.isShow = false,
    this.customLoading,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isShow ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 600),
      child:
          isShow
              ? customLoading ??
                  GestureDetector(
                    onTap: onDismiss,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: Get.width,
                        height: Get.height,
                        color: AppColors.softBlue.withValues(alpha: 0.7),
                        child: LoadingContainer(color: AppColors.white),
                      ),
                    ),
                  )
              : null,
    );
  }
}

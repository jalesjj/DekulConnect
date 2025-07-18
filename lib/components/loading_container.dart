// lib/components/loading_container.dart
import 'package:dekul_connect_app/styles/styles.dart';
import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final double? width, height;
  final Color? color;
  const LoadingContainer({super.key, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: width ?? 100,
            height: height ?? 100,
            child: CircularProgressIndicator(
              color: color ?? AppColors.white,
              strokeCap: StrokeCap.round,
              strokeWidth: 6,
            ),
          ),
        ),
      ],
    );
  }
}

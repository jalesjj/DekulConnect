// lib/core/base_view.dart
import 'package:dekul_connect_app/components/components.dart';
import 'package:dekul_connect_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'base_view_model.dart';

abstract class BaseView<T extends BaseViewModel> extends GetView<T> {
  const BaseView({super.key});

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GestureDetector(child: annotatedRegion(context));
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(color: AppColors.softBlue, child: pageScaffold(context)),
    );
  }

  Widget pageScaffold(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaler: TextScaler.linear(1.0));
    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        // background home
        resizeToAvoidBottomInset: true,
        extendBody: true,
        backgroundColor: backgroundColor(),
        appBar: appBar(context),
        floatingActionButton: floatingActionButton(),
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.softBlue, AppColors.aqua],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Obx(
                () => AnimatedOpacity(
                  opacity: controller.isLoadingContainer ? 0 : 1,
                  duration: const Duration(milliseconds: 750),
                  child: pageContent(context),
                ),
              ),
              Obx(
                () => ProgressContainer(
                  isShow: controller.isLoadingContainer,
                  onDismiss: null,
                  customLoading: customLoadingContent(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomNavigationBar(),
        floatingActionButtonLocation: floatingActionButtonLocation(),
        drawer: drawer(),
      ),
    );
  }

  Widget? customLoadingContent() {
    return null;
  }

  Color statusBarColor() {
    return AppColors.softBlue;
  }

  Color backgroundColor() {
    return AppColors.softBlue;
  }

  Widget? floatingActionButton() {
    return null;
  }

  FloatingActionButtonLocation floatingActionButtonLocation() {
    return FloatingActionButtonLocation.centerFloat;
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      bottom: allowSafeArea(),
      top: allowSafeArea(),
      child: body(context),
    );
  }

  bool allowSafeArea() {
    return true;
  }

  Widget? drawer() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }
}

// lib/core/base_view_model.dart
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BaseViewModel extends GetxController {
  final _loadingContainer = false.obs;

  final cancelToken = CancelToken();
  bool get isLoadingContainer => _loadingContainer.value;

  _updateLoadingContainer(bool isLoading) => _loadingContainer(isLoading);

  showLoadingContainer() => _updateLoadingContainer(true);

  hideLoadingContainer() => _updateLoadingContainer(false);

  @override
  void onClose() {
    _loadingContainer.close();
    cancelToken.cancel();
    super.onClose();
  }
}

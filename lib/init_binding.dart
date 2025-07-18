// lib/init_binding.dart
import 'package:dekul_connect_app/base/base.dart';
import 'package:dekul_connect_app/components/components.dart';
import 'package:dekul_connect_app/configuration/configuration.dart';
import 'package:dekul_connect_app/core/core.dart';
import 'package:dekul_connect_app/data/data.dart';
import 'package:dekul_connect_app/resources/resources.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // dio
    Get.lazyPut<Dio>(
      () => Dio()
          .addBaseUrl(AppEnvironment.apiUrl) 
          .addInterceptor(
            AuthorizationHeaderInterceptor(
              onToken:
                  () async => BearerToken(
                    token: SharedPrefs.getString(SessionConstant.token) ?? "",
                  ),
            ),
          )
          .addInterceptor(
            ErrorJsonApiResponseInterceptor(
              onUnauthorized: (error) {
                logger.e(error);
                _unauthorizeSession();
              },
              onErrorException: (error) {
                logger.e(error);
              },
            ),
          )
          .addInterceptor(PlatformHeaderInterceptor())
          .addInterceptor(
            PrettyDioLoggerInterceptor(maxWidth: 80, compact: true),
          ),
      fenix: true,
    );

    // services
    Get.lazyPut<AuthenticationServices>(
      () => AuthenticationServices(Get.find()),
      fenix: true,
    );
    Get.lazyPut<SchoolServices>(() => SchoolServices(Get.find()), fenix: true);
  }

  Future<void> _unauthorizeSession() async {
    await SharedPrefs.remove(SessionConstant.token);

    if (Get.currentRoute == Routes.LOGIN) return;
    Get.offAllNamed(Routes.LOGIN);
    showAlertDialog(content: "Mohon login kembali");
  }
}

// ignore_for_file: constant_identifier_names

class AppConstants {}

extension ErrorMessage on AppConstants {
  static const msg_oops_error = "Oops,";
  static const msg_generic_error = "Something went wrong.";
  static const msg_request_error = "Request Error";
  static const msg_generic_error_body = "Please try again later.";
  static const msg_generic_error_cancel = "Request to API server was cancelled";
  static const msg_generic_error_connect_timeout =
      "Connection timeout with API server";
  static const msg_generic_error_network = "There is no internet connection";
  static const msg_generic_error_receive_timeout =
      "Receive timeout in connection with API server";
  static const msg_generic_error_send_timeout =
      "Send timeout in connection with API server";
  static const msg_generic_error_service = "Service Temporarily Unavailable";
}

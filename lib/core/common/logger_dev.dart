// lib/core/common/logger_dev.dart
import 'package:logger/logger.dart';

Logger get logger => Log.instance;

class Log extends Logger {
  Log._() : super(printer: PrettyPrinter());
  static final instance = Log._();
}

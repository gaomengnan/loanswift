import 'package:get_storage/get_storage.dart';
import 'package:loanswift/core/core.dart';

class Storage {
  static DataMap? get  token => GetStorage().read(AppContant.tokenKey);

  static Future<void> removeToekn() => GetStorage().remove(AppContant.tokenKey);

}

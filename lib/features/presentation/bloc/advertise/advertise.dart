import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loanswift/core/config_manager.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/common/configure.dart';

class AdvertiseCubit extends Cubit<AdvertiseEntity?> {
  final ConfigManager configManager;

  // 构造函数
  AdvertiseCubit({
    required this.configManager,
  }) : super(null) {
    _initialize(); // 调用初始化方法
  }

  void setKnown() {
    GetStorage().write(
      AppContant.appAdvertiseIdKey,
      state!.id,
    );
    emit(null);
  }

  Future<void> _initialize() async {
    final advertise = await configManager.getAdvertisesConfigure();

    // 如果没有值那么不弹出窗口
    if (advertise.id.isEmpty) {
      emit(null);
      return;
    }
    final cachedAdverId =
        GetStorage().read<String>(AppContant.appAdvertiseIdKey);

    bool isExpired = false;

    if (advertise.expire.isNotEmpty) {
      DateTime expired = DateTime.parse(advertise.expire);
      DateTime currentDate = DateTime.now();
      DateTime givenDateOnly =
          DateTime(expired.year, expired.month, expired.day);
      DateTime currentDateOnly =
          DateTime(currentDate.year, currentDate.month, currentDate.day);

      if (currentDateOnly.isAfter(givenDateOnly)) {
        isExpired = true;
      }
    }

    if ((cachedAdverId == null /* 没有弹出过窗口或者删掉APP重新进入*/ ||
            cachedAdverId != advertise.id /*是否已经过期*/) && /*没有过期*/
        !isExpired) {
      emit(advertise);
      return;
    }
    emit(null);
  }
}

import 'package:get_storage/get_storage.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/configure_model.dart';
import 'package:loanswift/features/domain/entity/common/configure.dart';
import 'package:loanswift/features/domain/usecases/common/get_configure.dart';

class ConfigManager {
  static const String _configKey = 'pintek@appConfig';
  final GetConfigureUseCase useCase;

  ConfigManager({required this.useCase});
  //static const String _configTimestampKey = 'appConfigTimestamp';

  /// 获取配置：从缓存中读取，如果缓存无效则返回空
  Future<DataMap> getConfig() async {
    final cachedConfig = GetStorage().read<DataMap>(_configKey);
    return cachedConfig ?? {};
  }

  /// 获取配置：从缓存中读取，如果缓存无效则返回空
  Future<AdvertiseEntity> getAdvertisesConfigure() async {
    final cachedConfig = GetStorage().read<DataMap>(_configKey);
    final configModelData = ConfigureModel.fromMap(cachedConfig ?? {});
    return configModelData.advertise;
  }

  Future<String> getUpgradeLink() async {
    final cachedConfig = GetStorage().read<DataMap>(_configKey);
    final configModelData = ConfigureModel.fromMap(cachedConfig ?? {});
    return configModelData.upgradeLink;
  }

  Future<String> getCurrentVersion() async {
    final cachedConfig = GetStorage().read<DataMap>(_configKey);
    final configModelData = ConfigureModel.fromMap(cachedConfig ?? {});
    return configModelData.currentVersion;
  }

  /// 初始化配置：先从缓存读取，如果缓存失效则从远程获取
  Future<void> initConfig() async {
    await _refreshConfig(); // 缓存失效，从远程获取配置
  }

  /// 缓存配置数据并记录缓存时间
  Future<void> _cacheConfig(ConfigureModel data) async {
    GetStorage().remove(_configKey);
    GetStorage().write(_configKey, data.toMap());
  }

  /// 强制刷新配置：从远程获取配置并更新缓存
  Future<void> _refreshConfig() async {
    try {
      final config = await useCase.call();
      config.fold((l) {}, (r) async {
        await _cacheConfig(r);
      });
    } catch (error) {
      logger.e(error);
    }
  }
}

import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/models/bank_card.dart';
import 'package:loanswift/features/data/models/city_model.dart';
import 'package:loanswift/features/data/models/configure_model.dart';
import 'package:loanswift/features/data/models/upload_model.dart';
import 'package:loanswift/features/domain/entity/common/messages.dart';

abstract class ICommonService {
  ResultFuture<UploadModel> fileUpload({required String path});
  ResultFuture<DataMap> ocr({required String objectKey});
  ResultFuture<List<CityModel>> getCities();
  ResultFuture<List<BankCardModel>> getBanks();
  ResultFuture<ConfigureModel> getConfigure();
  ResultFuture<List<MessagesEntity>> getNotifyMessages();
}

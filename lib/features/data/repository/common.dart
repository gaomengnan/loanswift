import 'package:dartz/dartz.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/common.dart';
import 'package:loanswift/features/data/models/bank_card.dart';
import 'package:loanswift/features/data/models/city_model.dart';
import 'package:loanswift/features/data/models/configure_model.dart';
import 'package:loanswift/features/data/models/upload_model.dart';
import 'package:loanswift/features/domain/entity/common/messages.dart';
import 'package:loanswift/features/domain/repos/common.dart';

class CommonRepositry implements ICommonService {
  final ICommonDataSource dataSource;

  CommonRepositry({required this.dataSource});
  @override
  ResultFuture<UploadModel> fileUpload({required String path}) async {
    final resp = await dataSource.fileUpload(filePath: path);

    return resp.fold(
      (l) => left(l),
      (r) => right(r.data!),
    );
  }

  @override
  ResultFuture<DataMap> ocr({required String objectKey}) async {
    final rep = await dataSource.ocr(objectKey: objectKey);
    return rep.fold(
      (l) => left(l),
      (r) => right(r.data!),
    );
  }

  @override
  ResultFuture<List<CityModel>> getCities() async {
    final rep = await dataSource.getCities();

    return rep.fold(
      (l) => left(l),
      (r) => right(r.data!),
    );
  }

  @override
  ResultFuture<List<BankCardModel>> getBanks() async {
    final rt = await dataSource.getBanks();

    return rt.fold(
      (l) => left(l),
      (r) => right(r.data!),
    );
  }

  @override
  ResultFuture<ConfigureModel> getConfigure() async {
    final rt = await dataSource.getConfigure();

    return rt.fold(
      (l) => left(l),
      (r) => right(r.data!),
    );
  }

  @override
  ResultFuture<List<MessagesEntity>> getNotifyMessages() async {
    final rt = await dataSource.getNotifyMessages();

    return rt.fold(
      (l) => left(l),
      (r) => right(r.data!),
    );
  }
}

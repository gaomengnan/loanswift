import 'package:equatable/equatable.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

class SendPhoneCodeUsecase extends UsecaseParams<void, SendPhoneCodeRequest> {
  final AuthRepo _authRepo;

  const SendPhoneCodeUsecase(this._authRepo);

  @override
  ResultVoid call(SendPhoneCodeRequest params) async => _authRepo.sendPhoneCode(
        phone: params.phone,
      );
}

class SendPhoneCodeRequest extends Equatable {
  const SendPhoneCodeRequest.empty()
      : this(
          phone: "_unknown.phone",
        );
  final String phone;
  const SendPhoneCodeRequest({
    required this.phone,
  });
  @override
  List<Object?> get props => [
        phone,
      ];
}

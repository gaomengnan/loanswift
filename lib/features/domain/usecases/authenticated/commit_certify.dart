import 'package:loanswift/core/api_response.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

class CommitCertify extends UsecaseParams<void, CommitCertifyRequest> {
  final AuthRepo authRepo;

  CommitCertify({required this.authRepo});
  @override
  ResultFuture<ApiResponse> call(CommitCertifyRequest params) =>
      authRepo.commitCertify(
        data: {
          'certify_id': params.certifyId,
          'certify_result': params.certifyResult,
        },
      );
}

class CommitCertifyRequest {
  final int certifyId;
  final dynamic certifyResult;

  CommitCertifyRequest({required this.certifyId, required this.certifyResult});
}

import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/domain/entity/user/bank_card.dart';

BankCardModel bankCardDataFromMap(DataMap e) => BankCardModel.fromMap(e);

List<BankCardModel> bankCardsDataFromList(List<dynamic> data) =>
    data.map((item) => bankCardDataFromMap(item)).toList();

class BankCardModel extends BankCard {
  BankCardModel({
    required super.bankLogo,
    required super.bankName,
    required super.bankCode,
    required super.cardNo,
    required super.ifsc,
    required super.cardType,
    required super.mainCard,
    required super.validPeriod,
    required super.creditAmount,
  });

  BankCardModel.empty()
      : super(
          cardType: 0,
          mainCard: 0,
          validPeriod: 0,
          creditAmount: 0,
          bankLogo: '',
          bankName: '',
          bankCode: '',
          cardNo: '',
          ifsc: '',
        );

// 从 Map 创建 BankCard 实体
  factory BankCardModel.fromMap(Map<String, dynamic> map) {
    return BankCardModel(
      bankLogo: map['bank_logo'] ?? '',
      bankName: map['bank_name'] ?? '',
      bankCode: map['bank_code'] ?? '',
      cardNo: map['card_no'] ?? '',
      ifsc: map['ifsc'] ?? '',
      cardType: map['card_type'] ?? 0,
      mainCard: map['main_card'] ?? 0,
      validPeriod: map['valid_period'] ?? 0,
      creditAmount: map['credit_amount'] ?? 0,
    );
  }

  // 将 BankCard 实体转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'bank_logo': bankLogo,
      'bank_name': bankName,
      'bank_code': bankCode,
      'card_no': cardNo,
      'ifsc': ifsc,
      'card_type': cardType,
      'main_card': mainCard,
      'valid_period': validPeriod,
      'credit_amount': creditAmount,
    };
  }
}

class BankCard {
  final String bankLogo;
  final String bankName;
  final String bankCode;
  final String cardNo;
  final String ifsc;
  final int cardType;
  final int mainCard;
  final int validPeriod;
  final int creditAmount;

  // 构造函数
  BankCard({
    required this.bankLogo,
    required this.bankName,
    required this.bankCode,
    required this.cardNo,
    required this.ifsc,
    required this.cardType,
    required this.mainCard,
    required this.validPeriod,
    required this.creditAmount,
  });

  @override
  String toString() {
    return 'BankCard(bankLogo: $bankLogo, bankName: $bankName, bankCode: $bankCode, cardNo: $cardNo, ifsc: $ifsc, cardType: $cardType, mainCard: $mainCard, validPeriod: $validPeriod, creditAmount: $creditAmount)';
  }
}

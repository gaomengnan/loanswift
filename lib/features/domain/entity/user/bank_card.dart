class BankCard {
  final String? _bankLogo;
  final String? _bankName;
  final String? _bankCode;
  final String? _cardNo;
  final String? _ifsc;
  final int? _cardType;
  final int? _mainCard;
  final int? _validPeriod;
  final int? _creditAmount;

  // 构造函数
  BankCard({
    String? bankLogo,
    String? bankName,
    String? bankCode,
    String? cardNo,
    String? ifsc,
    int? cardType,
    int? mainCard,
    int? validPeriod,
    int? creditAmount,
  })  : _bankLogo = bankLogo,
        _bankName = bankName,
        _bankCode = bankCode,
        _cardNo = cardNo,
        _ifsc = ifsc,
        _cardType = cardType,
        _mainCard = mainCard,
        _validPeriod = validPeriod,
        _creditAmount = creditAmount;

  // 默认构造函数
  BankCard.empty()
      : _bankLogo = '',
        _bankName = '',
        _bankCode = '',
        _cardNo = '',
        _ifsc = '',
        _cardType = 0,
        _mainCard = 0,
        _validPeriod = 0,
        _creditAmount = 0;

  // Getter 方法
  String get bankLogo => _bankLogo ?? '';
  String get bankName => _bankName ?? '';
  String get bankCode => _bankCode ?? '';
  String get cardNo => _cardNo ?? '';
  String get ifsc => _ifsc ?? '';
  int get cardType => _cardType ?? 0;
  int get mainCard => _mainCard ?? 0;
  int get validPeriod => _validPeriod ?? 0;
  int get creditAmount => _creditAmount ?? 0;

  @override
  String toString() {
    return 'BankCard(bankLogo: $bankLogo, bankName: $bankName, bankCode: $bankCode, cardNo: $cardNo, ifsc: $ifsc, cardType: $cardType, mainCard: $mainCard, validPeriod: $validPeriod, creditAmount: $creditAmount)';
  }
}

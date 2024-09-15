import 'package:loanswift/features/domain/entity/orders/order_confirm.dart';

class OrderConfirmModel extends OrderConfirm {
  OrderConfirmModel(
      {required super.serviceFee,
      required super.controlNumber,
      required super.serviceFeeDesc,
      required super.interestFee,
      required super.firstPeriodInterest,
      required super.repayAmount,
      required super.totalInterest,
      required super.totalServiceFee,
      required super.deductionFee,
      required super.firstPeriodInterestFee,
      required super.platformManagementFee,
      required super.riskServiceFee,
      required super.actualAmount,
      required super.firstPeriodPayTime,
      required super.processingFee,
      required super.gstFee,
      required super.repaymentAmount,
      required super.repayPlan});

  //factory OrderConfirmModel.fromJson(Map<String, dynamic> json) {
  //  return OrderConfirmModel(
  //    serviceFee: json["service_fee"],
  //    controlNumber: json["controlNumber"],
  //    serviceFeeDesc: json["service_fee_desc"],
  //    interestFee: json["interest_fee"],
  //    firstPeriodInterest: json["first_period_interest"],
  //    repayAmount: json["repay_amount"],
  //    totalInterest: json["total_interest"],
  //    totalServiceFee: json["total_service_fee"],
  //    deductionFee: json["deduction_fee"],
  //    firstPeriodInterestFee: json["first_period_interest_fee"],
  //    platformManagementFee: json["platform_management_fee"],
  //    riskServiceFee: json["risk_service_fee"],
  //    actualAmount: json["actual_amount"],
  //    firstPeriodPayTime: json["first_period_pay_time"],
  //    processingFee: json["processing_fee"],
  //    gstFee: json["gst_fee"],
  //    repaymentAmount: json["repaymentAmount"],
  //    repayPlan: json["repay_plan"] == null
  //        ? []
  //        : List<RepayPlan>.from(
  //            json["repay_plan"].map((x) => RepayPlan.fromJson(x))),
  //  );
  //}

  factory OrderConfirmModel.fromMap(Map<String, dynamic> map) {
    return OrderConfirmModel(
      serviceFee: map["service_fee"],
      controlNumber: map["controlNumber"],
      serviceFeeDesc: map["service_fee_desc"],
      interestFee: map["interest_fee"],
      firstPeriodInterest: map["first_period_interest"],
      repayAmount: map["repay_amount"],
      totalInterest: map["total_interest"],
      totalServiceFee: map["total_service_fee"],
      deductionFee: map["deduction_fee"],
      firstPeriodInterestFee: map["first_period_interest_fee"],
      platformManagementFee: map["platform_management_fee"],
      riskServiceFee: map["risk_service_fee"],
      actualAmount: map["actual_amount"],
      firstPeriodPayTime: map["first_period_pay_time"],
      processingFee: map["processing_fee"],
      gstFee: map["gst_fee"],
      repaymentAmount: map["repaymentAmount"],
      repayPlan: map["repay_plan"] == null
          ? []
          : List<RepayPlanConfirm>.from(
              map["repay_plan"].map((x) => RepayPlanConfirm.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "service_fee": serviceFee,
      "controlNumber": controlNumber,
      "service_fee_desc": serviceFeeDesc,
      "interest_fee": interestFee,
      "first_period_interest": firstPeriodInterest,
      "repay_amount": repayAmount,
      "total_interest": totalInterest,
      "total_service_fee": totalServiceFee,
      "deduction_fee": deductionFee,
      "first_period_interest_fee": firstPeriodInterestFee,
      "platform_management_fee": platformManagementFee,
      "risk_service_fee": riskServiceFee,
      "actual_amount": actualAmount,
      "first_period_pay_time": firstPeriodPayTime,
      "processing_fee": processingFee,
      "gst_fee": gstFee,
      "repaymentAmount": repaymentAmount,
      "repay_plan": List<dynamic>.from(repayPlan.map((x) => x.toMap())),
    };
  }
}

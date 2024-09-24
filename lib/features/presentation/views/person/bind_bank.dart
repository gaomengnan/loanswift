import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/event_bus_service.dart';
import 'package:loanswift/core/report.dart';
import 'package:loanswift/features/data/models/bank_card.dart';
import 'package:loanswift/features/domain/repos/auth.dart';
import 'package:loanswift/features/domain/usecases/common/get_banks.dart';
import 'package:loanswift/features/presentation/views/index/index_page.dart';
import 'package:loanswift/features/presentation/views/widgets/order_confirm_dialog.dart';
import 'package:loanswift/theme/pallete.dart';

class BindBank extends StatefulWidget {
  const BindBank({super.key});

  static const routerName = "/bink_band";

  @override
  State<BindBank> createState() => _BindBankState();
}

class _BindBankState extends State<BindBank> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<BankCardModel> banks = [];

  final TextEditingController _controller = TextEditingController();

  final DataMap data = {};

  // 创建 StreamSubscription 变量
  StreamSubscription? subscription;

  late final DateTime startTime;

  Future<List<BankCardModel>> getBankds() async {
    final GetBanks getBanks = sl();
    final resp = await getBanks.call();
    return resp.fold((l) {
      return [];
    }, (r) {
      return r;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    if (subscription != null) {
      subscription?.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now();
  }

  void startPollCreditState() {
    if (subscription != null) {
      subscription?.resume();
      return;
    }
    subscription =
        Stream.periodic(const Duration(seconds: 2)).listen((event) async {
      final AuthRepo repo = sl();
      final creditResult =
          await repo.getCreditResult(productId: getProductId());

      creditResult.fold((l) {
        UI.showError(context, l.message);
        subscription?.pause();
      }, (r) {
        final creditStatus = r['credit_status'];

        if (creditStatus == 1) {
          // 上报
          bus.fire(TargetPointEvent(
            startTime,
            DateTime.now(),
            SceneType.bindCard,
            productCode: getProductId().toString(),
          ));

          UI.showSuccess(context, S.current.credit_success);

          subscription?.pause();

          final orderStartTime = DateTime.now();

          showOrderConfirmDialog(context, productId: getProductId(), onOK: (
            context,
          ) async {
            bus.fire(TargetPointEvent(
              orderStartTime,
              DateTime.now(),
              SceneType.applyPage,
              productCode: getProductId().toString(),
            ));

            final nav = Navigator.of(context);
            await EasyLoading.showSuccess(
              S.current.order_success,
              duration: const Duration(seconds: 2),
              dismissOnTap: false,
            );

            nav.pushReplacementNamed(IndexPage.routerName);
            //nav.pushReplacementNamed(context, IndexPage.routerName);
          }, onCancel: () {
            Navigator.pushReplacementNamed(context, IndexPage.routerName);
          });
        }

        if (creditStatus == -2) {
          UI.showError(context, S.current.credit_failure);
          subscription?.pause();
          Navigator.pushReplacementNamed(context, IndexPage.routerName);
        }
      });
    });
  }

  void showPicker(List<BankCardModel> optisons) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => SizedBox(
        width: double.infinity,
        height: 250.h,
        child: CupertinoPicker(
          backgroundColor: Pallete.whiteColor,
          itemExtent: 50,
          onSelectedItemChanged: (index) {
            //print(index);
          },
          scrollController: FixedExtentScrollController(
            initialItem: 1,
          ),
          children: optisons.map((e) {
            return GestureDetector(
              onTap: () {
                _controller.text = e.bankName.toString();
                data['bank_code'] = e.bankCode.toString();
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(
                        0.3,
                      ), // 可以更改颜色
                      width: 1.0, // 可以更改宽度
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        height: 50.h,
                        width: 50.w,
                        imageUrl: e.bankLogo,
                      ),
                      UI.kWidth5(),
                      RText(
                        text: e.bankName,
                        size: 14.sp,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  int getProductId() {
    // 获取参数
    int productId = 0;

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is DataMap) {
      productId = args['productId'] ?? 0;
    }

    return productId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text(S.current.bind_bank_card),
      ),
      body: FutureBuilder(
          future: getBankds(),
          builder: (context, snap) {
            //if (snap.connectionState == ConnectionState.waiting) {
            //  return const LoadingPage();
            //}
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        _buildBindBankField(S.current.phone_number,
                            Icons.phone_rounded, 'user_mobile', true),
                        //UI.kHeight10(),
                        _buildBindBankField(S.current.user_name,
                            Icons.person_rounded, 'user_name', false),
                        //UI.kHeight10(),
                        _buildBindBankField(S.current.id_card,
                            Icons.credit_score_outlined, 'id_card', false),
                        UI.kHeight20(),
                        buildBank(snap),
                        UI.kHeight20(),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // 背景颜色
                            borderRadius: BorderRadius.circular(12), // 圆角半径
                          ),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(19),
                              CardNumberInputFormatter(),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.current.required_field;
                              }

                              return null;
                            },
                            onSaved: (s) {
                              data['card_no'] = s!.replaceAll(' ', '');
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.w),
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              focusedBorder: const OutlineInputBorder(),
                              errorBorder: InputBorder.none,
                              hintText: S.current.bank_card,
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: const Icon(
                                  Icons.credit_card_rounded,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 50.h,
                        ),

                        OutlinedButton(
                          onPressed: () async {
                            final validate =
                                formKey.currentState?.validate() ?? false;

                            if (validate) {
                              UI.showLoading();
                              formKey.currentState?.save();

                              final AuthRepo authRepo = sl();
                              data['product_id'] = getProductId();
                              data['main_card'] = 1;
                              final resp = await authRepo.bindBank(data);
                              resp.fold((l) {
                                UI.showError(context, l.message);
                              }, (r) {
                                // 轮训结果
                                UI.showLoadingWithMessage(
                                    context, S.current.credit_fetching_result);
                                startPollCreditState();
                              });
                            }
                          },
                          style: OutlinedButton.styleFrom(
                              minimumSize: Size(300.w, 40.h)),
                          child: Text(S.current.submit),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget buildBank(AsyncSnapshot<List<BankCardModel>> snap) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      onTap: () {
        showPicker(snap.data ?? []);
        //CupertinoPicker(itemExtent: itemExtent, onSelectedItemChanged: onSelectedItemChanged, children: children)
      },
      validator: (val) {
        if (val == null || val.isEmpty) {
          return S.current.required_field;
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: S.current.please_select_bank,
        suffixIcon: const Icon(Icons.arrow_drop_down_sharp),
        filled: true,
        fillColor: Colors.grey[200], // 背景颜色
        //contentPadding: EdgeInsets.symmetric(
        //    horizontal: 10.w, vertical: 10.h),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // 圆角半径
          borderSide: BorderSide.none, // 去除边框线
        ),
      ),
      //items: const [],
      onChanged: (s) {},
    );
  }

  Widget _buildBindBankField(
      String hintText, IconData icon, String fieldName, bool isNum) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey[200], // 背景颜色
        borderRadius: BorderRadius.circular(12), // 圆角半径
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.current.required_field;
          }
          return null;
        },
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: const [],
        onSaved: (value) {
          data[fieldName] = value;
        },
        keyboardType: isNum ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          focusedBorder: const OutlineInputBorder(),
          errorBorder: InputBorder.none,
          hintText: hintText,
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Icon(
              icon,
            ),
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;

    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);

      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write("  ");
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
  }
}

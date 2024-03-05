import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loanswift/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:loanswift/features/presentation/bloc/bloc.dart';
import 'package:loanswift/theme/pallete.dart';

import '../../../core/common/widgets/widgets.dart';
import '../../../core/core.dart';
import '../../../core/generated/l10n.dart';

class LoginWidget extends StatefulWidget {
  final String sourceName;
  const LoginWidget({
    super.key,
    this.sourceName = "sheet",
  });

  static const routerName = "/verification_code";

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late String initialCountry;
  late PhoneNumber number;
  final List<String> countries = <String>[S.current.phone_code];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    initialCountry = S.current.phone_code.toUpperCase();
    number = PhoneNumber(isoCode: initialCountry);
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Text("tesx"),
              if (widget.sourceName == 'sheet')
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Pallete.primaryColor,
                  ),
                ),
            ],
          ),
          // SizedBox(
          //   height: 5.h,
          // ),
          // title / close
          Row(
            children: [
              AppText(
                text: S.current.huanying,
                size: 20.sp,
                fontWeight: FontWeight.w900,
              ),
            ],
          ),

          UI.kHeight20(),

          BuildForm(
            formKey: formKey,
            countries: countries,
            controller: controller,
            number: number,
            focusNode: focusNode,
          ),


          UI.kHeight20(),

          BuildBottomButton(
            formKey: formKey,
          ),
          // 协议
        ],
      ),
    );
  }
}

class BuildForm extends StatelessWidget {
  const BuildForm({
    super.key,
    required this.formKey,
    required this.countries,
    required this.controller,
    required this.number,
    required this.focusNode,
  });

  final GlobalKey<FormState> formKey;
  final List<String> countries;
  final TextEditingController controller;
  final PhoneNumber number;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: InternationalPhoneNumberInput(
        focusNode: focusNode,
        autoFocus: false,
        errorMessage: S.current.errorPhone,
        countries: countries,
        textFieldController: controller,
        inputDecoration: InputDecoration(
          labelText: S.current.shurushoujihao,
          labelStyle: const TextStyle(
            color: Pallete.greyColor,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
        ),
        formatInput: false,
        keyboardType: const TextInputType.numberWithOptions(
          signed: true,
          decimal: true,
        ),
        inputBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey.withOpacity(
            0.3,
          ),
        )),
        onFieldSubmitted: (val) {
          final validator = formKey.currentState?.validate() ?? false;
          if (validator) {
            // 解除按钮禁用状态
            context.read<AuthBloc>().add(
                  EnabledButtonStateEvent(),
                );
          } else {
            context.read<AuthBloc>().add(
                  DisabledButtonStateEvent(),
                );
          }
          // showInfo(context, "tesxt");
        },
        onInputChanged: (PhoneNumber val) {
          // setState(() {
          //   number = val;
          // });
        },
        onInputValidated: (bool value) {},
        onSaved: (PhoneNumber val) {
          context.read<PhoneSenderBloc>().add(
                PhoneSenderStarted(
                  60,
                  val.phoneNumber ?? "",
                ),
              );
      
          Navigator.of(context).pop();
          UI.showVerifyCodeSheet(
            context,
          );
          // final ph = context.read<PhoneSenderBloc>().state.phone;
          // print("state val${ph}");
        },
        initialValue: number,
        // locale: Locale("id"),
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DROPDOWN,
          useBottomSheetSafeArea: true,
        ),
      ),
    );
  }
}

class BuildBottomButton extends StatelessWidget {
  const BuildBottomButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final buttonStateDisabled =
        context.watch<AuthBloc>().state.buttonState.isForbidden;

    final Color btnColor = buttonStateDisabled
        ? Pallete.greyColor.withOpacity(0.2)
        : Pallete.whiteColor; // 设置按钮背景颜色
    final Color textColor =
        buttonStateDisabled ? Pallete.greyColor : Pallete.primaryColor;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
              onPressed: () async {
                // formKey.currentState?.save();
                // print(number.phoneNumber);
                final validator = formKey.currentState?.validate() ?? false;
                if (validator) {
                  formKey.currentState?.save();
                }
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 0,
                ),
                backgroundColor: btnColor, // 设置按钮背景颜色
              ).copyWith(
                foregroundColor: MaterialStateProperty.all<Color>(
                  Pallete.primaryColor,
                ), // 设置字体颜色
              ),
              child: AppText(
                text: S.current.jindengluzhuce,
                fontWeight: FontWeight.bold,
                color: textColor,
                size: 13.sp,
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  width: 0,
                ),
                backgroundColor: btnColor,
              ).copyWith(
                foregroundColor: MaterialStateProperty.all<Color>(
                  Pallete.primaryColor,
                ), // 设置字体颜色
              ),
              child: AppText(
                text: S.current.lijishengqing,
                fontWeight: FontWeight.bold,
                color: textColor,
                size: 13.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

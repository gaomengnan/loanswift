import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/bloc/bloc.dart';
import 'package:loanswift/features/presentation/views/index/index_page.dart';
import 'package:loanswift/features/presentation/views/widgets/verification_code.dart';
import 'package:loanswift/theme/pallete.dart';

import '../../../../core/common/widgets/widgets.dart';

class LoginWidget extends StatefulWidget {
  final String sourceName;
  const LoginWidget({
    super.key,
    this.sourceName = "sheet",
  });

  //static const routerName = "/verification_code";

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

    final authBloc = context.read<AuthBloc>();

    final loginState = authBloc.state.authenticationStatus.isLogined;

    if (loginState) {
      Navigator.of(context).pushReplacementNamed(
        IndexPage.routerName,
      );
    }

    authBloc.add(
      UserLoginLogTime(
        startTime: DateTime.now(),
      ),
    );
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
        // vertical: 10.h,
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
              RText(
                text: S.current.huanying,
                size: 20.sp,
                fontWeight: FontWeight.w900,
              ),
            ],
          ),

          Ui.kHeight20(),

          BuildVerifyCode(
            formKey: formKey,
            countries: countries,
            controller: controller,
            number: number,
            focusNode: focusNode,
          ),

          Ui.kHeight20(),

          BuildBottomButton(
            formKey: formKey,
          ),
          // 协议
        ],
      ),
    );
  }
}

class BuildVerifyCode extends StatelessWidget {
  const BuildVerifyCode({
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
          suffix: BlocBuilder<PhoneSenderBloc, PhoneSenderState>(
            builder: (context, state) {
              if (state.countdownState.isRunning && state.duration > 0) {
                return Text("${state.duration}(s)");
              }
              return const SizedBox();
            },
          ),
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
          //final countdownState =
          //    context.read<PhoneSenderBloc>().state.countdownState;
          //if (countdownState == CountdownState.running) {
          //  return;
          //}
          formKey.currentState?.validate();

          //if (validator) {
          //  // 解除按钮禁用状态
          //  context.read<AuthBloc>().add(
          //        EnabledButtonStateEvent(),
          //      );
          //} else {
          //  context.read<AuthBloc>().add(
          //        DisabledButtonStateEvent(),
          //      );
          //}
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
                  val.parseNumber(),
                ),
              );

          //UI.showLoading();

          Navigator.of(context).pushNamed(
            VerificationCodePage.routerName,
          );

          //UI.showVerifyCodeSheet(
          //  context,
          //);
        },
        initialValue: number,
        // locale: Locale("id"),
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          useBottomSheetSafeArea: true,
          showFlags: false,
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
    const Color btnColor = Pallete.primaryColor; // 设置按钮背景颜色
    const Color textColor = Pallete.whiteColor;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                //if (isButnDisabled) {login
                //  return;
                //}
                // formKey.currentState?.save();
                // print(number.phoneNumber);
                final validator = formKey.currentState?.validate() ?? false;
                if (validator) {
                  formKey.currentState?.save();
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(
                    0.1,
                  ),
                ),
                backgroundColor: btnColor, // 设置按钮背景颜色
              ).copyWith(
                foregroundColor: WidgetStateProperty.all<Color>(
                  Pallete.primaryColor,
                ), // 设置字体颜色
              ),
              child: RText(
                text: S.current.jindengluzhuce,
                fontWeight: FontWeight.bold,
                color: textColor,
                size: 12.sp,
              ),
            ),
            //ElevatedButton(
            //  onPressed: () {
            //    //if (isButnDisabled) {
            //    //  return;
            //    //}
            //  },
            //  style: ElevatedButton.styleFrom(
            //    elevation: 0,
            //    side: BorderSide(
            //      width: 1,
            //      color: Colors.black.withOpacity(
            //        0.1,
            //      ),
            //    ),
            //    backgroundColor: btnColor,
            //  ).copyWith(
            //    foregroundColor: WidgetStateProperty.all<Color>(
            //      Pallete.primaryColor,
            //    ), // 设置字体颜色
            //  ),
            //  child: AppText(
            //    text: S.current.lijishengqing,
            //    fontWeight: FontWeight.bold,
            //    color: textColor,
            //    size: 12.sp,
            //  ),
            //),
          ],
        ),
      ],
    );
  }
}

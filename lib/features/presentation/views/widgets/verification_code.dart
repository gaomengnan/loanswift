import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/generated/l10n.dart';
import 'package:loanswift/features/presentation/bloc/bloc.dart';
import 'package:loanswift/features/presentation/views/index/index_page.dart';
import 'package:loanswift/theme/theme.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/common/widgets/widgets.dart';
import '../../../../core/constants/constants.dart';

class VerificationCode extends StatefulWidget {
  // final String? phoneNumber;
  const VerificationCode({
    super.key,
    // required this.phoneNumber,
  });

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  //bool isDurationed = true;

  @override
  void dispose() {
    pinController.dispose();
    focusNode.unfocus();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //isDurationed = context.select((PhoneSenderBloc b) => b.state.duration > 0);
    const focusedBorderColor = Pallete.primaryColor;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Pallete.greyColor;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: borderColor),
      ),
    );

    return BlocBuilder<PhoneSenderBloc, PhoneSenderState>(builder: (
      context,
      state,
    ) {
      final isDurationed = state.duration > 0;
      return BlocListener<AuthBloc, AuthState>(
        listener: (context, sate) {
          if (sate is AuthFailure) {
            UI.showError(context, sate.error.error, (staus) {
              debugPrint('AuthFailure: ${staus.toString()}');
            });
          }

          if (sate is AuthSuccess) {
            context.read<PhoneSenderBloc>().add(PhoneSenderReset());
            Navigator.of(context).pushNamed(IndexPage.routerName);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Text("tesx"),
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
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: S.current.enter_verification_code,
                      size: 16.sp,
                    ),
                    UI.kHeight10(),
                    RichText(
                      text: TextSpan(
                        text: S.current.verification_code_sendto,
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                        children: [
                          TextSpan(
                            text: " ${state.phone}",
                            style: const TextStyle(
                              color: Pallete.blackColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // AppText(
                    //   text: "短信验证码已发送至 ${widget.phoneNumber}",
                    //   size: 16.sp,
                    // ),
                  ],
                ),
              ),
              UI.kHeight10(),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Directionality(
                      // Specify direction if desired
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        autofocus: true,
                        length: 5,
                        controller: pinController,
                        focusNode: focusNode,
                        //androidSmsAutofillMethod:
                        //    AndroidSmsAutofillMethod.smsUserConsentApi,
                        //listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,
                        separatorBuilder: (index) => const SizedBox(width: 8),
                        // validator: (value) {
                        // return null;
                        // return S.current.verification_code_wrong;
                        // },
                        // onClipboardFound: (value) {
                        //   debugPrint('onClipboardFound: $value');
                        //   pinController.setText(value);
                        // },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          debugPrint('onCompleted: $pin');
                          context.read<AuthBloc>().add(
                                UserLoginEvent(
                                  phone: state.phone.trim(),
                                  code: pin.trim(),
                                ),
                              );
                        },
                        onChanged: (value) {},
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              color: focusedBorderColor,
                            ),
                          ],
                        ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: fillColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppText(
                            text:
                                "${S.current.unable_to_receive_the_verification_code}?"),

                        // Text("${context.select((PhoneSenderBloc bloc) => bloc.state.duration)}"),

                        // Text("${context.watch<PhoneSenderProvider>().seconds}"),
                        if (!isDurationed)
                          TextButton(
                            onPressed: () {
                              context.read<PhoneSenderBloc>().add(
                                    const PhoneSenderReStarted(60),
                                  );
                            },
                            child: Text(
                              S.current.retrieve_again,
                              style: const TextStyle(
                                color: Pallete.primaryColor,
                              ),
                            ),
                          ),

                        if (isDurationed)
                          TextButton(
                            onPressed: () {},
                            child: RichText(
                              text: TextSpan(
                                  // text: "重发",
                                  // style: const TextStyle(
                                  //   color: Pallete.greyColor,
                                  // ),
                                  children: [
                                    TextSpan(
                                      text: S.current.resend,
                                      style: const TextStyle(
                                        color: Pallete.greyColor,
                                      ),
                                    ),
                                    // WidgetSpan(
                                    //   child: SizedBox(
                                    //     width: 1.w,
                                    //   ),
                                    // ),
                                    TextSpan(
                                      style: const TextStyle(
                                        color: Pallete.redColor,
                                      ),
                                      text: "(${state.duration})s",
                                    )
                                  ]),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:lottie/lottie.dart';

class FormDayField extends StatefulWidget {
  final String hitText;
  //final String label;
  final Info info;
  //final bool isMust;
  //final String prompt;
  //final TextEditingController controller;

  final void Function(String)? onChanged;

  const FormDayField({
    super.key,
    required this.hitText,
    //required this.label,
    this.onChanged,
    required this.info,
    //required this.controller,
  });

  @override
  State<FormDayField> createState() => _FormDayFieldState();
}

class _FormDayFieldState extends State<FormDayField> {
  final TextEditingController controller = TextEditingController();
  Future<void> _showDayPicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1000),
      lastDate: DateTime(3101),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = pickedDate.toLocal().toString().split(' ')[0];
        if (widget.onChanged != null) {
          widget.onChanged!(controller.text);
        }
      });
    }
  }

  @override
  void initState() {
    if (widget.info.isCertify()) {
      controller.text = widget.info.certifyResult == null
          ? ''
          : widget.info.certifyResult.toString();
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: widget.info.isCertify()
                    ? Lottie.asset(
                        height: 20.h,
                        width: 20.w,
                        Assets.check,
                        repeat: false,
                      )
                    : Icon(
                        Icons.task_alt,
                        color: widget.info.isCertify()
                            ? Colors.green
                            : Colors.grey,
                      ),
              ),
              Ui.kWidth5(),
              Expanded(
                child: RText(
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  size: 13.sp,
                  fontWeight: FontWeight.w600,
                  text: widget.info.certifyFieldName,
                ),
              ),
            ],
          ),
          Ui.kHeight5(),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 10.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onTap: () {
                  _showDayPicker(context);
                },
                validator: (value) {
                  if (!widget.info.isMust()) {
                    return null;
                  }
                  if (value == null || value.isEmpty) {
                    return widget.info.promptSubtitle;
                  }
                  return null;
                },
                //onChanged: widget.onChanged,
                readOnly: true,
                controller: controller,
                decoration: const InputDecoration(
                    focusedErrorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    //focusColor: Colors.red,
                    //contentPadding: EdgeInsets.only(left: 1.w,),
                    //hintText: ,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

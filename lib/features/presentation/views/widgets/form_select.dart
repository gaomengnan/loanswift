import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:lottie/lottie.dart';

class FormSelectField extends StatefulWidget {
  final String hitText;
  final Info info;
  final void Function(String)? onChanged;

  const FormSelectField({
    super.key,
    required this.hitText,
    this.onChanged,
    required this.info,
  });

  @override
  State<FormSelectField> createState() => _FormSelectFieldState();
}

class _FormSelectFieldState extends State<FormSelectField> {
  final TextEditingController controller = TextEditingController();

  final List<Widget> optisons = [];

  @override
  void initState() {
    if (widget.info.note is DataMap) {
      widget.info.note.forEach((k, v) {

        if (widget.info.isCertify() && widget.info.certifyResult.toString() == k.toString() ) {
          controller.text = v.toString();
        }

        optisons.add(
          GestureDetector(
            onTap: () async {
              controller.text = v;
              if (widget.onChanged != null) {
                widget.onChanged!(k);
              }
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
              child: Center(
                child: RText(
                  text: v,
                  size: 14.sp,
                ),
              ),
            ),
          ),
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void showPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => SizedBox(
        width: double.infinity,
        height: 250.h,
        child: CupertinoPicker(
          backgroundColor: Pallete.whiteColor,
          itemExtent: 50,
          onSelectedItemChanged: (index) {},
          scrollController: FixedExtentScrollController(
            initialItem: 1,
          ),
          children: [...optisons],
        ),
      ),
    );
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
              UI.kWidth5(),
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
          UI.kHeight5(),
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
                autovalidateMode: AutovalidateMode.disabled,
                onTap: () {
                  showPicker();
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
                    suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                    focusedErrorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
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

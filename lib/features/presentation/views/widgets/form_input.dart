import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';

class FormInputField extends StatefulWidget {
  final String hitText;
  final String label;
  final void Function(String)? onChanged;

  const FormInputField({
    super.key,
    required this.hitText,
    required this.label,
    //required this.controller,
    this.onChanged,
  });

  @override
  State<FormInputField> createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  //final TextEditingController controller;

  @override
  void dispose() {
    //controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RText(
              size: 13.sp,
              fontWeight: FontWeight.w600,
              text: widget.label,
            ),
          ),
          //UI.kHeight5(),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                onSaved: (val) {
                },
                onFieldSubmitted: (value) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                },
                //controller: controller,
                decoration: const InputDecoration(
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

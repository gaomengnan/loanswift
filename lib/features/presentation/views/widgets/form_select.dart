import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';

class FormSelectField extends StatefulWidget {
  final String hitText;
  final String label;
  //final TextEditingController controller;

  final void Function(String)? onChanged;

  const FormSelectField({
    super.key,
    required this.hitText,
    required this.label,
    //required this.controller,
    this.onChanged,
  });

  @override
  State<FormSelectField> createState() => _FormSelectFieldState();
}

class _FormSelectFieldState extends State<FormSelectField> {
  final String? _selectedValue = null;
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
              child: DropdownButtonFormField(
                value: _selectedValue,
                items: const [
                  DropdownMenuItem(
                    value: 'Option 1',
                    child: Text('选项 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Option 2',
                    child: Text('选项 2'),
                  ),
                ],
                onChanged: (val) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(val ?? '');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

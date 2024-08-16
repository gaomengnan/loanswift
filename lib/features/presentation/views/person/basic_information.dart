import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';

class BasicInformation extends StatefulWidget {
  const BasicInformation({super.key});

  @override
  State<BasicInformation> createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /*  FormField Controller  */

  late TextEditingController _eduController;
  late TextEditingController _emailController;
  late TextEditingController _marController;
  late TextEditingController _cityController;
  late TextEditingController _loctController;

  late List<Widget> formFields = [];

  @override
  void initState() {
    super.initState();
    _eduController = TextEditingController();
    _emailController = TextEditingController();
    _marController = TextEditingController();
    _cityController = TextEditingController();
    _loctController = TextEditingController();

    formFields = [
      /*  BASIC INFO TITLE */

      Row(
        children: [
          AppText(
            size: 20.sp,
            fontWeight: FontWeight.w900,
            text: "基础信息",
            textAlign: TextAlign.start,
          ),
        ],
      ),

      /*  BUILD EMAIL FIELD  */

      BuildFormItem(
        controller: _emailController,
        label: '电子邮箱',
        validator: (p0) {
          if (p0 == null || p0.isEmpty) {
            return '请输入邮箱';
          }
          return null;
        },
      ),

      /*  BUILD EDU FIELD  */

      BuildFormItem(
        controller: _eduController,
        label: '学历',
        validator: (p0) {
          if (p0 == null || p0.isEmpty) {
            return '请输入学历';
          }
          return null;
        },
      ),

      /*  BUILD marriage**/

      BuildFormItem(
        controller: _marController,
        label: '婚姻',
        validator: (p0) {
          if (p0 == null || p0.isEmpty) {
            return '请输入婚姻';
          }
          return null;
        },
      ),
      BuildFormItem(
        controller: _cityController,
        label: '家庭住址',
        validator: (p0) {
          if (p0 == null || p0.isEmpty) {
            return '请输入家庭住址';
          }
          return null;
        },
      ),
      BuildFormItem(
        controller: _loctController,
        label: '居住类型',
        validator: (p0) {
          if (p0 == null || p0.isEmpty) {
            return '请输入居住类型';
          }
          return null;
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ...List.generate(formFields.length, (index) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 5.h,
              ),
              child: formFields[index],
            );
          }),
        ],
      ),
    );
  }
}

class BuildFormItem extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const BuildFormItem({
    super.key,
    required this.label,
    this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: validator,
    );
  }
}

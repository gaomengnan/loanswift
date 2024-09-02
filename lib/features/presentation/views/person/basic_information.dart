import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicInformation extends StatefulWidget {
  const BasicInformation({super.key});

  @override
  State<BasicInformation> createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /*  FormField Controller  */

  final Map<String, TextEditingController> _controllers = {};

  late List<Widget> formFields = [];

  TextEditingController generateController(String name) {
    final controller = TextEditingController();
    _controllers[name] = controller;
    return controller;
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach(
      (key, value) {
        value.dispose();
      },
    );
  }

  @override
  void initState() {
    super.initState();

    formFields = [
      /*  BASIC INFO TITLE */
      /*  BUILD EMAIL FIELD  */

      //BuildFormItem(
      //  controller: generateController("email"),
      //  label: '电子邮箱',
      //  validator: (p0) {
      //    if (p0 == null || p0.isEmpty) {
      //      return '请输入邮箱';
      //    }
      //    return null;
      //  },
      //),
      //
      //BuildFormItem(
      //  controller: generateController("email"),
      //  label: '电子邮箱',
      //  isSelect: true,
      //  items: const [
      //    {"value": 1, "label": "test"},
      //    {"value": 2, "label": "test"},
      //    {"value": 3, "label": "test"}
      //  ],
      //  validator: (p0) {
      //    if (p0 == null || p0.isEmpty) {
      //      return '请输入邮箱';
      //    }
      //    return null;
      //  },
      //),
      //
      ///*  BUILD EDU FIELD  */
      //
      //BuildFormItem(
      //  controller: generateController("edu"),
      //  label: '学历',
      //  validator: (p0) {
      //    if (p0 == null || p0.isEmpty) {
      //      return '请输入学历';
      //    }
      //    return null;
      //  },
      //),
      //
      ///*  BUILD marriage**/
      //
      //BuildFormItem(
      //  controller: generateController("marriage"),
      //  label: '婚姻',
      //  validator: (p0) {
      //    if (p0 == null || p0.isEmpty) {
      //      return '请输入婚姻';
      //    }
      //    return null;
      //  },
      //),
      //BuildFormItem(
      //  controller: generateController("address"),
      //  label: '家庭住址',
      //  validator: (p0) {
      //    if (p0 == null || p0.isEmpty) {
      //      return '请输入家庭住址';
      //    }
      //    return null;
      //  },
      //),
      //BuildFormItem(
      //  controller: generateController("address_type"),
      //  label: '居住类型',
      //  validator: (p0) {
      //    if (p0 == null || p0.isEmpty) {
      //      return '请输入居住类型';
      //    }
      //    return null;
      //  },
      //),
      //
      ///*  WORK INFO  */
      //
      ///* WORK TYPE*/
      //
      //BuildFormItem(
      //  controller: generateController("work_type"),
      //  label: '工作类型',
      //  validator: (p0) {
      //    if (p0 == null || p0.isEmpty) {
      //      return '请输入工作类型';
      //    }
      //    return null;
      //  },
      //),
      //
      ///* DIS */
      //BuildFormItem(
      //  controller: generateController("industry"),
      //  label: '行业',
      //  validator: (p0) {
      //    if (p0 == null || p0.isEmpty) {
      //      return '请输入行业';
      //    }
      //    return null;
      //  },
      //),
      //BuildFormItem(
      //  controller: generateController("work_year"),
      //  label: '工作年份',
      //  validator: (p0) {
      //    if (p0 == null || p0.isEmpty) {
      //      return '请输入工作年份';
      //    }
      //    return null;
      //  },
      //),
      //BuildFormItem(
      //  controller: generateController("company_addr"),
      //  label: '公司地址',
      //  validator: (p0) {
      //    if (p0 == null || p0.isEmpty) {
      //      return '请输入公司地址';
      //    }
      //    return null;
      //  },
      //),
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

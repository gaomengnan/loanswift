import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginedPage extends StatefulWidget {
  const LoginedPage({super.key});

  @override
  State<LoginedPage> createState() => _LoginedPageState();
}

class _LoginedPageState extends State<LoginedPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.sp,
      ),
      child: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.settings,
                ),
                title: Text("hi~ 15077832398"),
                subtitle: Text("asdadasd"),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

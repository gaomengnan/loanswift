import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/features/presentation/bloc/auth/auth_bloc.dart';

import '../../../../core/core.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: AppText(
      //    text: S.current.personal_info,
      //    size: 17.sp,
      //    // color: Pallete.whiteColor,
      //  ),
      //  centerTitle: true,
      //  // backgroundColor: Pallete.backgroundColor,
      //),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                //color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    size: 40,
                    Icons.person_pin_circle_rounded,
                    color: Colors.white,
                  ),
                ),
                //tileColor: Colors.orange,
                onTap: () {
                  Navigator.of(context).pushNamed("/auth");
                },
                title: Row(
                  children: [
                    AppText(
                      text: S.current.login_register,
                      size: 18.sp,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w600,
                    ),
                    const Icon(
                      Icons.arrow_right,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

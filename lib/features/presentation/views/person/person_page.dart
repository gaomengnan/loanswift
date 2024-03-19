import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:loanswift/theme/theme.dart';

import '../../../../core/generated/l10n.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: S.current.personal_info,
          size: 17.sp,
          // color: Pallete.whiteColor,
        ),
        centerTitle: true,
        // backgroundColor: Pallete.backgroundColor,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.loginState.isLogined) {
            return loginedStateWidget();
          } else {
            return loginStateIdelWidget(context);
          }
        },
      ),
    );
  }

  // 已经登陆
  Widget loginedStateWidget() {
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
                  Icons.av_timer_sharp,
                ),
                title: Text("您好 15077832398"),
                subtitle: Text("asdadasd"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginStateIdelWidget(BuildContext context) {
    return Center(
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(
              0.1,
            ),
          ),
          backgroundColor: Pallete.whiteColor,
        ).copyWith(
          foregroundColor: MaterialStateProperty.all<Color>(
            Pallete.primaryColor,
          ), // 设置字体颜色
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/auth');
        },
        child: AppText(
          text: S.current.login_register,
          color: Pallete.primaryColor,
        ),
      ),
    );
  }
}

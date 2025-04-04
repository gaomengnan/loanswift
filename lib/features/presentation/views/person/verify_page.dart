import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/core/event_bus_service.dart';
import 'package:loanswift/features/presentation/bloc/certify/certifies_bloc.dart';
import 'package:loanswift/features/presentation/views/person/basic_information.dart';
import 'package:loanswift/features/presentation/views/person/bind_bank.dart';
import 'package:loanswift/features/presentation/views/person/emergency_info.dart';
import 'package:loanswift/features/presentation/views/person/identify_verify_page.dart';
import 'package:loanswift/features/presentation/views/person/job_info.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../core/core.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  static const routerName = "/identity_vefification";

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage>
    with SingleTickerProviderStateMixin {
  final List<Widget> stepers = [
    const IdentifyVerifyPage(
      productId: "",
    ),
    const BasicInformation(
      productId: "",
    ),
    const EmergencyInfo(productId: ""),
    const JobInfo(
      productId: "",
    ),
  ];

  final ScrollController _scrollController =
      ScrollController(); // ScrollController 控制滚动

  late AnimationController _aniController;
  late Animation<double> _animation;

  //Stream<bool> executeReportTask() async* {
  //  ReportService reportService = sl();
  //  reportService.applyReportTasks();
  //}

  //late Animation<double> _shadeAnimation;

  void _scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _aniController.dispose();
    Ui.hideLoading();
    super.dispose();
  }

  @override
  void initState() {
    // 初始化 AnimationController，设置时长和重复方式
    _aniController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // 动画时长
    )..repeat(reverse: true); // 循环动画，自动反向

    // 使用 Tween 和 CurvedAnimation 定义动画范围和效果
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _aniController,
        curve: Curves.easeInOut, // 使用缓入缓出的动画曲线
      ),
    );

    //executeReportTask().listen((r) {
    //  logger.i("task execute $r");
    //});
    bus.fire(
      ReportTaskEvent(),
    );

    super.initState();
  }

  Future<void> _showToBankDialog(int? productId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            S.current.congratulations_verified,
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('.'),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(80.w, 30.h)),
                      child: RText(
                        textAlign: TextAlign.start,
                        text: S.current.go_bind_bank_card,
                        color: Colors.white,
                        size: 8.sp,
                        //style: TextStyle(
                        //  color: Colors.white,
                        //  fontSize: 9.sp
                        //),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed(
                            BindBank.routerName,
                            arguments: {
                              'productId': productId,
                            });
                      },
                    ),
                  );
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(S.current.cancel)),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 获取参数
    int? productId = 0;

    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is DataMap) {
      productId = args['productId'] ?? 0;
    }

    //return StepperExample();
    final currentStep =
        context.select((CertifiesBloc bloc) => bloc.state.cerfityStep);

    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 80.h,
        centerTitle: false,
        backgroundColor: Pallete.backgroundColor,
        title: Text(
          S.current.real_authentication,
          style: const TextStyle(
              //color: Pallete.whiteColor,
              ),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 10.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 10.h,
                ),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //alignment: WrapAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 80.h,
                      child: buildStep(
                          S.current.identity_authentication,
                          true,
                          false,
                          currentStep.value > 0,
                          currentStep.value == 0,
                          false),
                    ),

                    SizedBox(
                      height: 80.h,
                      child: buildStep(
                          S.current.personal_information,
                          false,
                          false,
                          currentStep.value > 1,
                          currentStep.value == 1,
                          true),
                    ),
                    SizedBox(
                      height: 80.h,
                      child: buildStep(
                          S.current.emergency_contact,
                          false,
                          false,
                          currentStep.value > 2,
                          currentStep.value == 2,
                          false),
                    ),

                    SizedBox(
                      height: 80.h,
                      child: buildStep(S.current.work_information, false, true,
                          currentStep.value > 3, currentStep.value == 3, true),
                    ),
                    //buildStep(false, false, false, true),
                    //buildStep(false, false, false, false),
                    //buildStep(false, true, false, false),
                  ],
                ),
              ),
            )),
        //bottom: PreferredSize(
        //  preferredSize: Size.fromHeight(80.h),
        //  child: buildStepper(
        //    currentStep,
        //  ),
        //),
      ),
      body: SafeArea(
        child: BlocListener<CertifiesBloc, CertifiesState>(
          listener: (context, state) {
            if (state is CertifiesSettingLoadFailure) {
              Ui.showError(
                context,
                state.error.error,
              );
            }

            if (state is CertifiesSettingsLoading) {
              Ui.showLoading();
            }

            if (state is CertifiesSettingsLoadSuccess) {
              Ui.hideLoading();
            }

            if (state is CertifiesRequestState) {
              Future.delayed(const Duration(milliseconds: 20), () {
                if (!state.isDone) {
                  _scrollToTop();
                }
              });
              if (state.isDone == true) {
                _showToBankDialog(productId);
              }
            }
            if (state is CertifyFailure) {
              Ui.showError(context, state.error.error);
            }
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                children: [
                  stepers[currentStep.value],
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            context
                                .read<CertifiesBloc>()
                                .add(CertifyStepBack());
                            //_scrollToTop();
                          },
                          child: RText(
                            text: S.current.previousStep,
                            color: Pallete.whiteColor,
                          ),
                        ),
                      ),
                      Ui.kWidth10(),
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            context
                                .read<CertifiesBloc>()
                                .add(CertifyStepRequest());
                          },
                          child: RText(
                            text: S.current.nextStep,
                            color: Pallete.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStep(String title, bool isFirst, bool isLast, bool isPast,
      bool isCurrent, bool inTop) {
    return TimelineTile(
      startChild: inTop
          ? SizedBox(
              width: 90.w,
              child: RText(
                textAlign: TextAlign.start,
                text: title,
              ),
            )
          : Container(),
      endChild: !inTop
          ? SizedBox(
              width: 90.w,
              child: RText(
                textAlign: TextAlign.start,
                text: title,
              ),
            )
          : Container(),
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.manual,
      lineXY: 0.5,
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: const LineStyle(
        thickness: 2,
        color: Pallete.primaryColor,
      ),
      indicatorStyle: IndicatorStyle(
        indicator: !isCurrent
            ? (isPast
                ? Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Pallete.primaryColor,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check_outlined,
                        color: Pallete.whiteColor,
                        size: 10.sp,
                      ),
                    ),
                  )
                : Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey
                        // color: Color(0xFF2ACA8E),
                        ),
                    child: Center(
                      child: SizedBox(
                        height: 15,
                        width: 15,
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 12.sp,
                        ),
                        //child: CircularProgressIndicator(
                        //  strokeWidth: 1,
                        //  valueColor:
                        //      AlwaysStoppedAnimation<Color>(Colors.white),
                        //),
                      ),
                    ),
                  ))
            : Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Pallete.primaryColor,
                ),
                child: Center(
                  child: Icon(
                    size: 12.sp,
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
        width: 30.w,
        //height: 30,
        color: Pallete.secondaryColor,
        iconStyle: IconStyle(
          iconData: Icons.check_circle,
          color: Pallete.timelineNo,
        ),
      ),
    );
  }
}

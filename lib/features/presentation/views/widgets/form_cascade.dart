import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/common/city.dart';
import 'package:loanswift/features/domain/entity/user/certify.dart';
import 'package:loanswift/features/domain/usecases/common/get_cities.dart';
import 'package:lottie/lottie.dart';
import 'package:dropdown_search/dropdown_search.dart';

class FormCascade extends StatefulWidget {
  final String hitText;
  final Info info;

  final void Function(String)? onChanged;

  const FormCascade({
    super.key,
    required this.hitText,
    this.onChanged,
    required this.info,
  });

  @override
  State<FormCascade> createState() => _FormCascadeState();
}

class _FormCascadeState extends State<FormCascade> {
  final TextEditingController controller = TextEditingController();

  late List<City> c2 = [];
  late List<City> c1 = [];
  late List<City> c3 = [];

  City? c1Value;
  City? c2Value;
  City? c3Value;

  @override
  void initState() {
    if (widget.info.isCertify()) {
      controller.text = widget.info.certifyResult == null
          ? ''
          : widget.info.certifyResult.toString();
    }

    loadCities();

    //context.read<CertifiesBloc>().add(LoadCitiesEvent());
    super.initState();
  }

  void loadCities() async {
    final GetCities getCities = sl<GetCities>();
    final resp = await getCities.call();

    resp.fold((l) {}, (r) {
      setState(() {
        c1 = r;
      });

      if (widget.info.isCertify()) {
        List<String> crs = widget.info.certifyResult.split('|');
        if (crs.isNotEmpty && crs.length == 3) {
          c1Value = r.firstWhere((c) => c.name == crs[0]);

          if (c1Value == null) {
            return;
          }

          c2 = c1Value!.children;

          c2Value = c2.firstWhere((c) => c.name == crs[1]);

          if (c2Value == null) {
            return;
          }

          c3 = c2Value!.children;

          c3Value = c3.firstWhere((c) => c.name == crs[2]);
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<List<City>> getData(String f) {
    if (f.isEmpty) {
      return Future.value(c1);
    } else {
      List<City> filteredCities =
          c1.where((city) => city.name.contains(f)).toList();
      return Future.value(filteredCities);
    }
  }

  Future<List<City>> getLevel2(String f) {
    if (f.isEmpty) {
      return Future.value(c2);
    } else {
      List<City> filteredCities =
          c2.where((city) => city.name.contains(f)).toList();
      return Future.value(filteredCities);
    }
  }

  Future<List<City>> getLevel3(String f) {
    if (f.isEmpty) {
      return Future.value(c3);
    } else {
      List<City> filteredCities =
          c3.where((city) => city.name.contains(f)).toList();
      return Future.value(filteredCities);
    }
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
            child: Row(
              children: [
                Expanded(
                  child: DropdownSearch<City>(
                    selectedItem: c1Value,
                    compareFn: (i, s) => i.code == s.code,
                    asyncItems: (String filter) => getData(filter),
                    itemAsString: (City u) => u.name,
                    onChanged: (City? data) {
                      if (data != null) {
                        c2 = data.children;
                        c3 = [];
                        setState(() {
                          c1Value = data;
                          c2Value = null;
                          c3Value = null;
                        });
                      }
                    },
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          //labelText: S.current.please_select,
                          ),
                      baseStyle: TextStyle(
                          //color: Colors.red,
                          //fontSize: 14.sp,
                          overflow: TextOverflow.ellipsis),
                    ),
                    popupProps: PopupPropsMultiSelection.modalBottomSheet(
                      searchFieldProps: const TextFieldProps(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          //border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 16),
                      ),
                      //isFilterOnline: true,
                      showSelectedItems: true,
                      showSearchBox: true,
                      itemBuilder: _customPopupItemBuilder,
                    ),
                  ),
                ),
                Ui.kWidth10(),
                Expanded(
                  child: DropdownSearch<City>(
                    selectedItem: c2Value,
                    compareFn: (i, s) => i.code == s.code,
                    asyncItems: (String filter) => getLevel2(filter),
                    itemAsString: (City u) => u.name,
                    onChanged: (City? data) {
                      if (data != null) {
                        c3 = data.children;
                      }
                      setState(() {
                        c2Value = data;
                        c3Value = null;
                      });
                    },
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      baseStyle: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                      dropdownSearchDecoration: InputDecoration(),
                    ),
                    popupProps: PopupPropsMultiSelection.modalBottomSheet(
                      searchFieldProps: const TextFieldProps(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          //border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 16),
                      ),
                      //isFilterOnline: true,
                      showSelectedItems: true,
                      showSearchBox: true,
                      itemBuilder: _customPopupItemBuilder,
                    ),
                  ),
                ),
                Ui.kWidth10(),
                Expanded(
                  child: DropdownSearch<City>(
                    selectedItem: c3Value,
                    compareFn: (i, s) => i == s,
                    asyncItems: (String filter) => getLevel3(filter),
                    itemAsString: (City u) => u.name,
                    onChanged: (City? data) {
                      setState(() {
                        c3Value = data;
                      });

                      if (c1Value != null &&
                          c2Value != null &&
                          c3Value != null &&
                          widget.onChanged != null) {
                        // Perform your action here, e.g., save the selected cities.
                        widget.onChanged!(
                            "${c1Value!.name}|${c2Value!.name}|${c3Value!.name}");
                      }
                    },
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      baseStyle: TextStyle(overflow: TextOverflow.ellipsis),
                      dropdownSearchDecoration: InputDecoration(
                          //suffixIcon: Text("asda")
                          //labelText: S.current.please_select,
                          ),
                    ),
                    popupProps: PopupPropsMultiSelection.modalBottomSheet(
                      searchFieldProps: const TextFieldProps(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          //border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 16),
                      ),
                      isFilterOnline: true,
                      showSelectedItems: true,
                      showSearchBox: true,
                      itemBuilder: _customPopupItemBuilder,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _customPopupItemBuilder(
      BuildContext context, City item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              //border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade200,
            ),
      child: RText(
        text: item.name,
        color: Colors.black,
        size: 15.sp,
      ),
    );
  }
}

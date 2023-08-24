import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../res/color.dart';
import '../../../res/components/round_button.dart';
import '../../../res/components/textfield.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../../../view_model/add_project_view_model/add_project_view_model.dart';

class PostProjectScreen extends StatefulWidget {
  const PostProjectScreen({super.key});

  @override
  State<PostProjectScreen> createState() => _PostProjectScreenState();
}

class _PostProjectScreenState extends State<PostProjectScreen> {
  final schemeNameController = TextEditingController();
  final costController = TextEditingController();
  final durationController = TextEditingController();
  final populationController = TextEditingController();
  final detailController = TextEditingController();
  final budgetController = TextEditingController();
  final assetsController = TextEditingController();

  final schemeNameFocusNode = FocusNode();
  final costFocusNode = FocusNode();
  final durationFocusNode = FocusNode();
  final detailFocusNode = FocusNode();
  final populationFocusNode = FocusNode();
  final budgetFocusNode = FocusNode();
  final assetsFocusNode = FocusNode();

  @override
  void dispose() {
    schemeNameController.dispose();
    costController.dispose();
    durationController.dispose();
    populationController.dispose();
    detailController.dispose();
    assetsController.dispose();
    schemeNameFocusNode.dispose();
    assetsFocusNode.dispose();
    costFocusNode.dispose();

    detailFocusNode.dispose();
    populationFocusNode.dispose();
    budgetFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddProjectViewModel>(context, listen: true);

    provider.stopLocationUpdates();
    return Scaffold(
      appBar: AppBar(
        elevation: 3.w,
        title: Text(
          'Add New Project',
          style: GoogleFonts.mulish(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: GestureDetector(
              onTap: () {
                if (schemeNameController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter scheme', context);
                } else if (costController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter cost', context);
                } else if (durationController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter duration', context);
                } else if (populationController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      'Please enter population', context);
                } else if (detailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter detail', context);
                } else if (budgetController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter budget', context);
                } else if (assetsController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter assets', context);
                } else {
                  provider.saveProjectData(
                      schemeNameController.text,
                      costController.text,
                      durationController.text,
                      populationController.text,
                      detailController.text,
                      budgetController.text,
                      assetsController.text);
                  provider.clearData();
                  Navigator.pushNamed(context, RoutesName.dashboardScreen);
                  Utils.toastMessage('Data Added Successfully');
                }
              },
              child: const FaIcon(
                FontAwesomeIcons.check,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: ListView(
          children: [
            Text(
              'Site Details',
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            Text(
              provider.address ?? '',
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xfff5f5f5),
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff033345).withOpacity(0.1),
                          offset: const Offset(5, 5),
                          blurRadius: 10,
                          blurStyle: BlurStyle.normal,
                        ),
                        const BoxShadow(
                          color: Colors.white24,
                          offset: Offset(-1, -4),
                          blurRadius: 10,
                          spreadRadius: -1,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        provider.position != null
                            ? provider.position!.latitude.toString()
                            : 'Lat',
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.w),
                Expanded(
                  child: Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xfff5f5f5),
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff033345).withOpacity(0.1),
                          offset: const Offset(5, 5),
                          blurRadius: 10,
                          blurStyle: BlurStyle.normal,
                        ),
                        const BoxShadow(
                          color: Colors.white24,
                          offset: Offset(-1, -4),
                          blurRadius: 10,
                          spreadRadius: -1,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        provider.position != null
                            ? provider.position!.longitude.toString()
                            : 'Lon',
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ReusableButton(
                  title: 'Get Location',
                  onPress: () {
                    setState(() {
                      provider.requestLocationUpdates();
                    });
                  },
                  color: AppColors.buttonColor,
                  textColor: AppColors.whiteColor,
                  width: 100.w,
                  height: 40.h,
                  radius: 8.r,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Divider(
              color: AppColors.grey300Color,
            ),
            SizedBox(height: 20.h),
            InputTextField(
              myController: schemeNameController,
              focusNode: schemeNameFocusNode,
              maxLine: 1,
              onFieldSubmittedValue: (value) {},
              hint: 'Scheme Name',
              keyBoardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            InputTextField(
              myController: costController,
              focusNode: costFocusNode,
              maxLine: 1,
              onFieldSubmittedValue: (value) {},
              hint: 'Cost',
              keyBoardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            InputTextField(
              myController: durationController,
              focusNode: durationFocusNode,
              maxLine: 1,
              onFieldSubmittedValue: (value) {},
              hint: 'Duration',
              keyBoardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            InputTextField(
              myController: populationController,
              focusNode: populationFocusNode,
              maxLine: 1,
              onFieldSubmittedValue: (value) {},
              hint: 'Population',
              keyBoardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            InputTextField(
              myController: detailController,
              focusNode: detailFocusNode,
              maxLine: 4,
              onFieldSubmittedValue: (value) {},
              hint: 'Detail',
              keyBoardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            InputTextField(
              myController: budgetController,
              focusNode: budgetFocusNode,
              maxLine: 1,
              onFieldSubmittedValue: (value) {},
              hint: 'Budget',
              keyBoardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            InputTextField(
              myController: assetsController,
              focusNode: assetsFocusNode,
              maxLine: 1,
              onFieldSubmittedValue: (value) {},
              hint: 'Assets',
              keyBoardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Site Image',
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                provider.pickImage();
              },
              child: provider.images == null
                  ? Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff033345).withOpacity(0.1),
                            offset: const Offset(5, 5),
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                          ),
                          const BoxShadow(
                            color: Colors.white24,
                            offset: Offset(-1, -4),
                            blurRadius: 10,
                            spreadRadius: -1,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundColor: AppColors.buttonColor,
                            child: const FaIcon(
                              FontAwesomeIcons.plus,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            'Add Picture',
                            style: GoogleFonts.mulish(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                          height: 300.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xfff5f5f5),
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xff033345).withOpacity(0.1),
                                offset: const Offset(5, 5),
                                blurRadius: 10,
                                blurStyle: BlurStyle.normal,
                              ),
                              const BoxShadow(
                                color: Colors.white24,
                                offset: Offset(-1, -4),
                                blurRadius: 10,
                                spreadRadius: -1,
                              )
                            ],
                          ),
                          child: Image.file(
                            provider.images!,
                            fit: BoxFit.cover,
                          )),
                    ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

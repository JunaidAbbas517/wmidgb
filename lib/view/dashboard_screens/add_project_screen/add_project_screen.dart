import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wmidgb/res/color.dart';
import 'package:wmidgb/res/components/round_button.dart';
import 'package:wmidgb/utils/routes/routes_name.dart';
import 'package:wmidgb/utils/utils.dart';

import '../../../view_model/add_project_view_model/add_project_view_model.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({Key? key}) : super(key: key);

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
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
                // provider.saveProjectData(feedbackText!);
                provider.clearData();
                Navigator.pushNamed(context, RoutesName.dashboardScreen);
                Utils.toastMessage('Data Added Successfully');
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Engineer Name',
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Junaid Abbas',
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h),
            Divider(
              color: AppColors.grey300Color,
            ),
            SizedBox(height: 20.h),
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
                ReusableButton(
                  title: 'Feedback',
                  onPress: () {
                    Navigator.pushNamed(context, RoutesName.feedBackScreen);
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
            GestureDetector(
              onTap: () {
                provider.pickImage();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff033345)
                          .withOpacity(0.1),
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
                      height: 25.h,
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
              ),
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         GridView.builder(
            //           scrollDirection: Axis.vertical,
            //           shrinkWrap: true,
            //           physics: const NeverScrollableScrollPhysics(),
            //           itemCount: provider.imageList.length + 1,
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //             crossAxisSpacing: 10.w,
            //             mainAxisSpacing: 16.h,
            //             childAspectRatio: 3 / 3,
            //           ),
            //           itemBuilder: (BuildContext context, int index) {
            //             if (index < provider.imageList.length) {
            //               final imageFile = provider.imageList[index];
            //               return Container(
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(12.r),
            //                   color: const Color(0xffffffff),
            //                   boxShadow: [
            //                     BoxShadow(
            //                       color:
            //                           const Color(0xff033345).withOpacity(0.1),
            //                       offset: const Offset(5, 5),
            //                       blurRadius: 10,
            //                       blurStyle: BlurStyle.normal,
            //                     ),
            //                     const BoxShadow(
            //                       color: Colors.white24,
            //                       offset: Offset(-1, -4),
            //                       blurRadius: 10,
            //                       spreadRadius: -1,
            //                     )
            //                   ],
            //                 ),
            //                 child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(12.r),
            //                   child: Image.file(
            //                     imageFile,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               );
            //             } else {
            //               // Image picker container
            //               return GestureDetector(
            //                 onTap: () {
            //                   provider.pickImage();
            //                 },
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(12.r),
            //                     color: const Color(0xffffffff),
            //                     boxShadow: [
            //                       BoxShadow(
            //                         color: const Color(0xff033345)
            //                             .withOpacity(0.1),
            //                         offset: const Offset(5, 5),
            //                         blurRadius: 10,
            //                         blurStyle: BlurStyle.normal,
            //                       ),
            //                       const BoxShadow(
            //                         color: Colors.white24,
            //                         offset: Offset(-1, -4),
            //                         blurRadius: 10,
            //                         spreadRadius: -1,
            //                       )
            //                     ],
            //                   ),
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       CircleAvatar(
            //                         radius: 30.r,
            //                         backgroundColor: AppColors.buttonColor,
            //                         child: const FaIcon(
            //                           FontAwesomeIcons.plus,
            //                           color: AppColors.whiteColor,
            //                         ),
            //                       ),
            //                       SizedBox(
            //                         height: 25.h,
            //                       ),
            //                       Text(
            //                         'Add Picture',
            //                         style: GoogleFonts.mulish(
            //                           fontSize: 14.sp,
            //                           fontWeight: FontWeight.w500,
            //                         ),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //               );
            //             }
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

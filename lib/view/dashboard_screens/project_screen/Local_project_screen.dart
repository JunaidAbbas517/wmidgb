import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:wmidgb/boxes/boxes.dart';
import 'package:wmidgb/model/hive_models/add_project_model.dart';
import 'package:wmidgb/utils/utils.dart';

import '../../../res/color.dart';
import '../../../view_model/project_screen_view_model/project_screen_view_model.dart';

class LocalProjectScreen extends StatefulWidget {
  const LocalProjectScreen({Key? key}) : super(key: key);

  @override
  State<LocalProjectScreen> createState() => _LocalProjectScreenState();
}

class _LocalProjectScreenState extends State<LocalProjectScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('dfdfd ');
    var provider = Provider.of<ProjectScreenViewModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: ValueListenableBuilder<Box<AddProjectModel>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {
          try {
            var data = box.values.toList().cast<AddProjectModel>();
            var testBox = Hive.box<AddProjectModel>('addProject');

            print("data  ${data}");
            return ListView.separated(
              itemCount: box.length,
              padding: EdgeInsets.only(bottom: 28.h, top: 10.h),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final projectData = data[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                provider.projectDelete(data[index]);
                                Utils.flushBarErrorMessage(
                                    'Project Delete Successfully', context);
                              },
                              child: CircleAvatar(
                                radius: 15.r,
                                backgroundColor: AppColors.buttonColor,
                                child: FaIcon(
                                  FontAwesomeIcons.trash,
                                  color: AppColors.whiteColor,
                                  size: 14.r,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Scheme Name: ${projectData.name}',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'Cost: ${projectData.cost}',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'Budget: ${projectData.budget}',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'Duration: ${projectData.duration}',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'Population: ${projectData.population}',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'Detail: ${projectData.detail}',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'Latitude: ${projectData.latitude}',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          'Longitude: ${projectData.longitude}',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Divider(
                          color: AppColors.grey300Color,
                        ),
                        Text(
                          'Site Images',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          height: 200.h,
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.file(
                              File(projectData.image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 23.w);
              },
            );
          } catch (error) {
            print("Error occurred: $error");
            return Text("Error occurred");
          }
        },
      ),
    );
  }
}

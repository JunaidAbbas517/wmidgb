import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_model/project_status_view_model/project_status_contoller.dart';

class ProjectStatusScreen extends StatefulWidget {
  const ProjectStatusScreen({Key? key}) : super(key: key);

  @override
  State<ProjectStatusScreen> createState() => _ProjectStatusScreenState();
}

class _ProjectStatusScreenState extends State<ProjectStatusScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<ProjectStatusViewModel>(context, listen: false);
    provider.projectStatusApi();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.maybeSizeOf(context)!.height.h;
    var width = MediaQuery.maybeSizeOf(context)!.width.w;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Project Status',
          style: GoogleFonts.mulish(),
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Consumer<ProjectStatusViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return value.loading == false
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: ListView.separated(
                      itemCount: value.response.length,
                      itemBuilder: (context, index) {
                        return Container(
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
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 10.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    " Project Id: ${value.response[index].id}"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                    "Thescheme Id: ${value.response[index].theschemeId}"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                    "PlanStartDate: ${value.response[index].planStartDate}"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                    "PlanEndDate: ${value.response[index].planEndDate}"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                    "TaskDescription: ${value.response[index].taskDescription}"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                    "TaskStatus: ${value.response[index].taskStatus}"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text("Notes: ${value.response[index].notes}"),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

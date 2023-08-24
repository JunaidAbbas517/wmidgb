import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../res/color.dart';
import '../../../view_model/get_scheme_view_model/get_scheme_controller.dart';

class LiveProjectScreen extends StatefulWidget {
  const LiveProjectScreen({Key? key}) : super(key: key);

  @override
  State<LiveProjectScreen> createState() => _LiveProjectScreenState();
}

class _LiveProjectScreenState extends State<LiveProjectScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<GetSchemeViewModel>(context, listen: false);
    provider.getSchemeApi();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Consumer<GetSchemeViewModel>(
        builder: (BuildContext context, value, Widget? child) {
          return value.loading == false
              ? ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.response.length,
                  padding: EdgeInsets.only(bottom: 28.h, top: 10.h),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              'Scheme Name: ${value.response[index].name}',
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              'Cost: ${value.response[index].cost}',
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              'Budget: ${value.response[index].budget}',
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              'Duration: ${value.response[index].duration}',
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              'Population: ${value.response[index].population}',
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              'Detail: ${value.response[index].detail}',
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              'Latitude: ${value.response[index].latitude}',
                              style: GoogleFonts.mulish(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              'Longitude: ${value.response[index].longitude}',
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child:
                                    value.response[index].documentation != null
                                        ? Container(
                                            height: 300.h,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: const Color(0xfff5f5f5),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
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
                                            child: Image.network(
                                              "https://spms.wmidgb.gov.pk/${value.response[index].documentation}",
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : SizedBox(),
                              ),
                            ),
                            Divider(
                              color: AppColors.grey300Color,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 23.w);
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../res/color.dart';
import '../../../res/components/round_button.dart';
import '../../../view_model/profile_screen_view_model/profile_contoller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<ProfileViewModel>(context, listen: false);
    provider.profileApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.mulish(),
        ),
      ),
      body: Consumer<ProfileViewModel>(
          builder: (BuildContext context, value, Widget? child) {
        return value.loading == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=600',
                    ), // Replace with actual image asset
                  ),
                  SizedBox(height: 20),
                  Text(
                    value.response.role!,
                    style: GoogleFonts.mulish(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    value.response.name!,
                    style: GoogleFonts.mulish(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    value.response.email!,
                    style: GoogleFonts.mulish(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ReusableButton(
                    title: 'Ok',
                    onPress: () {
                      Navigator.pop(context);
                    },
                    color: AppColors.buttonColor,
                    textColor: AppColors.whiteColor,
                    width: 247.w,
                    height: 57.h,
                    radius: 8.r,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wmidgb/res/color.dart';
import 'package:wmidgb/utils/routes/routes_name.dart';

import '../../res/components/home_dashboard_item.dart';
import '../../view_model/logout_view_model/logout_controller.dart';
import '../../view_model/post_scheme_project_view_model/post_scheme_project_controller.dart';
import '../auth_screens/login_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  var provider;
  var provider1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<PostSchemeProjectViewModel>(context, listen: false);
    provider1 = Provider.of<LogoutViewModel>(context, listen: false);
  }
  final List<FaIcon> icon = [
    const FaIcon(
      FontAwesomeIcons.plus,
      color: AppColors.whiteColor,
    ),
    const FaIcon(
      FontAwesomeIcons.pencil,
      color: AppColors.whiteColor,
    ),
    const FaIcon(
      FontAwesomeIcons.upload,
      color: AppColors.whiteColor,
    ),
    const FaIcon(
      FontAwesomeIcons.file,
      color: AppColors.whiteColor,
    ),
    const FaIcon(
      FontAwesomeIcons.person,
      color: AppColors.whiteColor,
    ),
    const FaIcon(
      FontAwesomeIcons.arrowRightFromBracket,
      color: AppColors.whiteColor,
    ),
  ];

  final List<String> cardName = [
    'Add Project',
    'Project',
    'Sync Data',
    'Project Status',
    'Profile',
    'Logout',
  ];
  List<dynamic> routes = [
    RoutesName.postProjectScreen,
    RoutesName.projectScreen,
    RoutesName.dashboardScreen,
    RoutesName.deleteProjectScreen,
    RoutesName.settingScreen,
    RoutesName.loginScreen,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: EdgeInsets.zero,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Dashboard',
            style: GoogleFonts.mulish(
              fontWeight: FontWeight.w500,
              fontSize: 25.sp,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Flexible(
                child: GridView.builder(
                  itemCount: cardName.length,
                  padding: EdgeInsets.only(
                    top: 5.h,
                    bottom: 5,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 3 / 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if(index == 2){
                          provider.postSchemeProjectApi();
                        }else{
                          Navigator.pushNamed(context, routes[index]);
                        } if(index == 5){
                          provider1.logoutApi();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogInScreen(),
                            ),
                          );
                        }

                      },
                      child: HomeDashBoardItem(
                        iconData: icon[index],
                        text: cardName[index].toString(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:wmidgb/res/color.dart';
import 'package:wmidgb/utils/routes/routes.dart';
import 'package:wmidgb/utils/routes/routes_name.dart';
import 'package:wmidgb/view_model/add_project_view_model/add_project_view_model.dart';
import 'package:wmidgb/view_model/get_scheme_view_model/get_scheme_controller.dart';
import 'package:wmidgb/view_model/login_view_model/login_contoller.dart';
import 'package:wmidgb/view_model/logout_view_model/logout_controller.dart';
import 'package:wmidgb/view_model/post_scheme_project_view_model/post_scheme_project_controller.dart';
import 'package:wmidgb/view_model/profile_screen_view_model/profile_contoller.dart';
import 'package:wmidgb/view_model/project_screen_view_model/project_screen_view_model.dart';
import 'package:wmidgb/view_model/project_status_view_model/project_status_contoller.dart';

import 'model/hive_models/add_project_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(AddProjectModelAdapter());
     await Hive.openBox<AddProjectModel>('addProject');

  runApp(const WMIDGB());
}

class WMIDGB extends StatelessWidget {
  const WMIDGB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider<AddProjectViewModel>(
                    create: (_) => AddProjectViewModel()),
                ChangeNotifierProvider<ProjectScreenViewModel>(
                    create: (_) => ProjectScreenViewModel()),
                ChangeNotifierProvider<LoginViewModel>(
                    create: (_) => LoginViewModel()),
                ChangeNotifierProvider<ProjectStatusViewModel>(
                    create: (_) => ProjectStatusViewModel()),
                ChangeNotifierProvider<GetSchemeViewModel>(
                    create: (_) => GetSchemeViewModel()),
                ChangeNotifierProvider<PostSchemeProjectViewModel>(
                    create: (_) => PostSchemeProjectViewModel()),
                ChangeNotifierProvider<ProfileViewModel>(
                    create: (_) => ProfileViewModel()),
                ChangeNotifierProvider<LogoutViewModel>(
                    create: (_) => LogoutViewModel()),
              ],
              child: MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  useMaterial3: true,
                  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
                ),
                initialRoute: RoutesName.splashScreen,
                onGenerateRoute: Routes.generateRoute,
              ));
        });
  }
}

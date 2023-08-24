import 'package:flutter/material.dart';
import 'package:wmidgb/utils/routes/routes_name.dart';
import 'package:wmidgb/view/auth_screens/login_screen.dart';
import 'package:wmidgb/view/dashboard_screens/add_project_screen/add_project_screen.dart';

import 'package:wmidgb/view/dashboard_screens/delete_project_screen/project_status_screen.dart';
import 'package:wmidgb/view/dashboard_screens/home_screen.dart';
import 'package:wmidgb/view/dashboard_screens/settings_screen/settings_screen.dart';
import 'package:wmidgb/view/dashboard_screens/sync_data_screen/sync_data_screen.dart';

import '../../view/dashboard_screens/add_project_screen/post_project_screen.dart';
import '../../view/dashboard_screens/project_screen/live_projects_screen.dart';
import '../../view/dashboard_screens/project_screen/Local_project_screen.dart';
import '../../view/dashboard_screens/project_screen/project_screen.dart';
import '../../view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LogInScreen());
      case RoutesName.dashboardScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DashBoardScreen());
      // case RoutesName.addProjectScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const AddProjectScreen());
        case RoutesName.postProjectScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PostProjectScreen());
      case RoutesName.projectScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProjectScreen());
        // case RoutesName.updateProjectScreen:
        // return MaterialPageRoute(
        //     builder: (BuildContext context) => const ProjectScreen());
      case RoutesName.syncDataScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SyncDataScreen());
      case RoutesName.deleteProjectScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProjectStatusScreen());
      case RoutesName.settingScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SettingsScreen());


      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}

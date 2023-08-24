import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:wmidgb/utils/routes/routes_name.dart';

class SplashServices {
  void isLogIn(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(
        context,
        RoutesName.loginScreen,
      ),
    );
  }
}

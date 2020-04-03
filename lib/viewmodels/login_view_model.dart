import 'package:flutter/cupertino.dart';
import 'package:relief_test/constants/route_names.dart';
import 'package:relief_test/services/authentication_service.dart';
import 'package:relief_test/services/dialog_service.dart';
import 'package:relief_test/services/navigation_service.dart';

import '../locator.dart';
import 'base_model.dart';
class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginwithEmail(
      email: email,
      password: password,
    );
    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(StartUpViewRoute);
      } else
        _dialogService.showDialog(
          title: "Login has failed",
          description: "General Sign Up failure. Try Again",
        );
    } else
      _dialogService.showDialog(
        title: "Login has failed",
        description: result,
      );
  }
}


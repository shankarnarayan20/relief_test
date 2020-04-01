import 'package:flutter/cupertino.dart';
import 'package:relief_test/constants/route_names.dart';
import 'package:relief_test/locator.dart';
import 'package:relief_test/services/authentication_service.dart';
import 'package:relief_test/services/dialog_service.dart';
import 'package:relief_test/services/navigation_service.dart';

import 'base_model.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signUp({
    @required String email,
    @required String password,
    @required String fullname,
    @required String phonenumber,
    @required String address,
    @required String location,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signupwithEmail(
      email: email,
      password: password,
      address: address,
      fullname: fullname,
      location: location,
      phonenumber: phonenumber,
    );
    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else
        _dialogService.showDialog(
          title: "Sign up has failed",
          description: "General Sign Up failure. Try Again",
        );
    } else
      _dialogService.showDialog(
        title: "Sign up has failed",
        description: result,
      );
  }
}

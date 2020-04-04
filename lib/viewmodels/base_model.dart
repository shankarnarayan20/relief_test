import 'package:flutter/widgets.dart';
import 'package:relief_test/locator.dart';
import 'package:relief_test/models/user.dart';
import 'package:relief_test/services/authentication_service.dart';

class BaseModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  User get currentUser => _authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

import 'package:relief_test/constants/route_names.dart';
import 'package:relief_test/services/authentication_service.dart';
import 'package:relief_test/services/navigation_service.dart';
import 'package:relief_test/viewmodels/base_model.dart';

import '../locator.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
}

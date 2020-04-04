import 'package:relief_test/constants/route_names.dart';
import 'package:relief_test/locator.dart';
import 'package:relief_test/services/navigation_service.dart';
import 'package:relief_test/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToDonationsView() => _navigationService.navigateTo(DonationsViewRoute);
}

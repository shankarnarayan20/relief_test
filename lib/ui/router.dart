import 'package:flutter/material.dart';
import 'package:relief_test/constants/route_names.dart';
import 'package:relief_test/ui/views/create_donations_view.dart';
import 'package:relief_test/ui/views/home_view.dart';
import 'package:relief_test/ui/views/login_view.dart';
import 'package:relief_test/ui/views/signup_view.dart';
import 'package:relief_test/ui/views/view_donations_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case CreateDonationsViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreateDonationsView(),
      );
    case ViewDonationsViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ViewDonationsView(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

class DonationsView {}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}

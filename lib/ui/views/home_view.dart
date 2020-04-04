import 'package:relief_test/ui/shared/ui_helpers.dart';
import 'package:relief_test/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: HomeViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                      color: Colors.teal,
                      child: Text("Make new donation"),
                      onPressed: () {
                        model.navigateToDonationsView();
                      }),
                  verticalSpaceLarge,
                  MaterialButton(
                      color: Colors.teal,
                      child: Text("View your donations / entries"),
                      onPressed: () {}),
                  verticalSpaceLarge,
                  MaterialButton(
                      color: Colors.teal,
                      child: Text("Logout"),
                      onPressed: () {
                        model.navigateToLoginView(context);
                      })
                ],
              )),
            ));
  }
}

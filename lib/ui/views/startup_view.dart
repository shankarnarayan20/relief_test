import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:relief_test/viewmodels/startup_view_model.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewModel>.withConsumer(
      viewModel: StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text("Hello World"),
          )),
    );
  }
}

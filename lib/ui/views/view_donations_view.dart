import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:relief_test/ui/shared/ui_helpers.dart';
import 'package:relief_test/ui/widgets/donation_item.dart';
import 'package:relief_test/viewmodels/viewdonations_view_model.dart';

class ViewDonationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ViewDonationsViewModel>.withConsumer(
        viewModel: ViewDonationsViewModel(),
        onModelReady:(model) => model.getDonations(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                children: <Widget>[
                  Text("View your Donations"),
                  verticalSpaceLarge,
                  Expanded(
                      child: model.donations != null
                          ? ListView.builder(
                              itemCount: model.donations.length,
                              itemBuilder: (context, index) => DonationsItem(
                                  donations: model.donations[index]))
                          : Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    Theme.of(context).primaryColor),
                              ),
                            ))
                ],
              ),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:relief_test/ui/shared/ui_helpers.dart';
import 'package:relief_test/ui/widgets/input_field.dart';
import 'package:relief_test/viewmodels/createdonations_view_model.dart';

class CreateDonationsView extends StatelessWidget {
  final foodcontroller = TextEditingController();
  final medicalcontroller = TextEditingController();
  final othercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreateDonationsViewModel>.withConsumer(
        viewModel: CreateDonationsViewModel(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InputField(
                    placeholder: 'Food items',
                    controller: foodcontroller,
                    additionalNote: 'Also mention the quantity.',
                  ),
                  verticalSpaceLarge,
                  InputField(
                    placeholder: 'Medical items (Masks/ Hand Sanitizers)',
                    controller: medicalcontroller,
                    additionalNote: 'Also mention the quantity.',
                  ),
                  verticalSpaceLarge,
                  InputField(
                    placeholder: 'Other items (Water Bottles)',
                    controller: othercontroller,
                    additionalNote: 'Also mention the quantity.',
                  ),
                  verticalSpaceLarge,
                  MaterialButton(
                    child: Text(
                      "Donate",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.black,
                    elevation: 5,
                    onPressed: () {
                      if (!model.busy) {
                        print("Button pressed");
                        model.addDonations(
                          foodcontroller.text,
                          medicalcontroller.text,
                          othercontroller.text,
                        );
                      }
                    },
                  )
                ],
              ),
            )));
  }
}

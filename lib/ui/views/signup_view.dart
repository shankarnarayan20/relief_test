import 'package:relief_test/locator.dart';
import 'package:relief_test/services/location_service.dart';
import 'package:relief_test/ui/shared/ui_helpers.dart';
import 'package:relief_test/ui/widgets/busy_button.dart';
import 'package:relief_test/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:relief_test/viewmodels/signup_view_model.dart';

class SignUpView extends StatefulWidget {
  SignUpView({Key key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  final phonenumberController = TextEditingController();
  final addressController = TextEditingController();
  var currentLocation = "";
  
  final LocationService _locationService = locator<LocationService>();


  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModel: SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 38,
                    ),
                  ),
                  verticalSpaceLarge,
                  InputField(
                    placeholder: 'Full Name',
                    controller: fullnameController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Phone Number',
                    controller: phonenumberController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Address',
                    controller: addressController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Email',
                    controller: emailController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Password',
                    password: true,
                    controller: passwordController,
                    additionalNote:
                        'Password has to be a minimum of 6 characters.',
                  ),
                  Center(
                    child: BusyButton(
                        title: 'Location',
                        onPressed: () {
                          setState(() {
                            currentLocation =
                                _locationService.getCurrentLocation();
                            if (currentLocation == null) currentLocation = "";
                            print(currentLocation);
                          });
                        }),
                  ),
                  verticalSpaceSmall,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BusyButton(
                        busy: model.busy,
                        title: 'Sign Up',
                        onPressed: () {
                          model.signUp(
                            email: emailController.text,
                            password: passwordController.text,
                            address: addressController.text,
                            fullname: fullnameController.text,
                            location: currentAddress,
                            phonenumber: phonenumberController.text,
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

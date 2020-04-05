import 'package:relief_test/models/donation_model.dart';
import 'package:relief_test/services/dialog_service.dart';
import 'package:relief_test/services/firestore_service.dart';
import 'package:relief_test/services/navigation_service.dart';
import 'package:relief_test/viewmodels/base_model.dart';

import '../locator.dart';

class CreateDonationsViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future addDonations(
      String fooditems, String medicalitems, String otheritems) async {
    setBusy(true);
    var result = await _firestoreService.addDonations(
        Donations(currentUser.id, fooditems, medicalitems, otheritems),
        currentUser);
    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: "Could not create a new Donation",
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: "Donation Request Successful",
        description: "Your new Donation has been recorded in out database",
      );
    }
    _navigationService.pop();
  }
}

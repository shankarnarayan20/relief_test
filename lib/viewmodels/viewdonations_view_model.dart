import 'package:relief_test/locator.dart';
import 'package:relief_test/models/donation_model.dart';
import 'package:relief_test/services/dialog_service.dart';
import 'package:relief_test/services/firestore_service.dart';
import 'package:relief_test/services/navigation_service.dart';
import 'package:relief_test/viewmodels/base_model.dart';

class ViewDonationsViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();

  List<Donations> _donations;
  List<Donations> get donations => _donations;

  Future getDonations() async {
    setBusy(true);
    var donationResults = await _firestoreService.getDonations();
    setBusy(false);

    if (donationResults is List<Donations>) {
      _donations = donationResults;
      notifyListeners();
    } else {
      _dialogService.showDialog(
        title: "Post update failed",
        description: donationResults,
      );
    }
  }
}

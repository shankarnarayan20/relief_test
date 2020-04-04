class Donations {
  final String uid;
  final String fooditems;
  final String medicalitems;
  final String otheritems;

  Donations(this.uid, this.fooditems, this.medicalitems, this.otheritems);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fooditems': fooditems,
      'medicalitems': medicalitems,
      'otheritems': otheritems,
    };
  }

  static Donations fromMap(Map<String, dynamic> map) {
    if (map = null) return null;

    Donations newDonations = Donations(
        map['uid'], map['fooditems'], map['medicalitems'], map['otheritems']);
    return newDonations;
  }
}

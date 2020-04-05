import 'package:flutter/material.dart';
import 'package:relief_test/models/donation_model.dart';

class DonationsItem extends StatelessWidget {
  final Donations donations;
  const DonationsItem({Key key, this.donations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Food items:-"),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(donations.fooditems),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Medical items:-"),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(donations.medicalitems),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Other items:-"),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(donations.otheritems),
                  )),
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {},
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(blurRadius: 8, color: Colors.grey[200], spreadRadius: 3)
          ]),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pickngo/Presenter/mainPresenter.dart';
import 'package:pickngo/Styles/textStyles.dart';
import 'package:pickngo/animation/FadeAnimation.dart';
import 'package:pickngo/animation/Form.dart';
import 'package:pickngo/login.dart';
import 'package:pickngo/chooseLocation.dart';
import 'package:pickngo/search.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PlaceOrder extends StatefulWidget {
  final String address;
  final String subadministrative;
  final String longitude;
  final String latitude;

  PlaceOrder({this.address, this.subadministrative, this.longitude, this.latitude});

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  String parceltypes = 'Normal';
  var items = [
    'Normal',
    'Sensitive',
  ];
  String reciever_city;
  String reciever_city_id;
  String selectedval;

  final receiver_name = TextEditingController();
  final receiver_address = TextEditingController();
  final receiver_contact = TextEditingController();
  final receiver_type = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  Presenter _presenter = new Presenter();





  @override
  Widget build(BuildContext context) {

    String request_date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String request_time = DateFormat('H:m').format(DateTime.now());


    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0XFF0099FF),
                    Color(0XFF0088FE),
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.address,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                margin: EdgeInsets.only(bottom: 30.0),
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0XFFF6FBFF),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8,
                        offset: Offset(5, 10),
                        color: Color(0xffB1DBFF).withOpacity(.6),
                        spreadRadius: -9)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Receiver Details",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(children: <Widget>[
                      Expanded(child: Divider()),
                    ]),
                    SizedBox(
                      height: 20.0,
                    ),
                    FadeAnimation(
                      1.2,
                      makeInput(
                        label: "Receiver Name",
                        capitalization: true,
                        controller: receiver_name,
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      makeInput(
                        label: "Receiver Address",
                        capitalization: true,
                        controller: receiver_address,
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      makeInput(
                        label: "Receiver Contact Number",
                        capitalization: true,
                        controller: receiver_contact,
                        keyboard: TextInputType.number,

                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FadeAnimation(
                      1.2,
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('service_area')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }

                          return Container(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Text(
                                      "City",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: DropdownButton(
                                    value: selectedval,
                                    isDense: true,
                                    dropdownColor: Color(0xffcfe9ff),
                                    onChanged: (valueSelectedByUser) {
                                      _onShopDropItemSelected(
                                          valueSelectedByUser);
                                    },
                                    hint: Text('Select City'),
                                    items: snapshot.data.docs.map(
                                      (DocumentSnapshot document) {
                                        return DropdownMenuItem<String>(
                                          value: document.id +
                                              "," +
                                              document["servicearea_name"],
                                          child: Text(
                                              document["servicearea_name"]),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FadeAnimation(
                      1.2,
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Order Type",
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: DropdownButton(
                              value: parceltypes,
                              dropdownColor: Color(0xffcfe9ff),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              hint: Text('Select Type'),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String newValue) {
                                setState(
                                  () {
                                    parceltypes = newValue;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FlatButton(
                      splashColor: Color(0XFFFEC405),
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        _presenter.placeRequest(
                            _auth.currentUser.uid,
                            widget.address,
                            widget.subadministrative,
                            widget.latitude,
                            widget.longitude,
                            receiver_name.text,
                            reciever_city,
                            reciever_city_id,
                            receiver_address.text,
                            receiver_contact.text,
                            parceltypes,
                            "",
                            "Pending",
                            request_date,
                            request_time);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ChooseLocation();
                            },
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0XFF0099FF),
                                Color(0XFF0088FE),
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          constraints: const BoxConstraints(
                              minWidth: 88.0, minHeight: 36.0),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Place Request",
                                style: titleText.copyWith(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onShopDropItemSelected(String newValueSelected) {
    setState(
      () {
        final data = newValueSelected.split(',');

        this.selectedval = newValueSelected;
        this.reciever_city = data[1];
        this.reciever_city_id = data[0];
      },
    );
  }
}

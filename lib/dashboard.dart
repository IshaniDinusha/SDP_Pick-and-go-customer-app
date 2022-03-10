import 'package:flutter/material.dart';
import 'package:pickngo/Styles/textStyles.dart';
import 'package:pickngo/login.dart';
import 'package:pickngo/chooseLocation.dart';
import 'package:pickngo/search.dart';
import 'package:pickngo/trackingpage.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(right: 30.0, left: 30.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0XFF0099FF),
                        Color(0XFF0088FE),
                      ]),
                  borderRadius: BorderRadius.circular(40.0)),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/icons/totorders.png"),
                            width: 50.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "100",
                            style: titleText.copyWith(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "TOTAL ORDERS",
                        style: titleText.copyWith(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PackageTracking();
                    },
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0XFF1E2733),
                        Color(0XFF203D56),
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  constraints:
                      const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/icons/reqplacepickup.png"),
                        width: 50.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Place Pickup Request",
                        style: titleText.copyWith(
                          fontSize: 18.0,
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
    );
  }
}

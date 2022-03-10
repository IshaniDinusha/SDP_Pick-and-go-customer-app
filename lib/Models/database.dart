import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickngo/Models/Users.dart';
import 'package:pickngo/Models/order_requests.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class Database {
  Future<void> addUser(Users users,String userid) async {
    var userdata = users.toMap();

    await _firestore.collection('customer').doc(userid).set(userdata);
  }


  Future<void>addOrderRequest(OrderRequests ordReq) async{
    var orderReq=ordReq.toMap();

    await _firestore.collection('order_requests').add(orderReq);
  }
}
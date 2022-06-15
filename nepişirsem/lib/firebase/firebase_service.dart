import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerFirebase(
      //Kayıt işlemini yaptık bundan sonra kullanıcı girişini de yapıyoruz.
      String email,
      String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      addFirestore(email);
    } catch (e) {
      print(e.toString());
    }
    if (auth.currentUser == null) {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
  }

  Future<void> loginFirebase(
      //Giriş işlemleri
      String email,
      String password) async {
    try {
      if (auth.currentUser == null) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> exitFirebase() async {
    {
      await auth.signOut();
    }
  }

  Future<void> addFirestore(
      //Firestoreye kayıt işlemini gerçekleştiriyoruz
      String email) async {
    await _firestore.collection('Person').doc(auth.currentUser!.uid).set({
      'email': email,
    }, SetOptions(merge: true));
  }
}

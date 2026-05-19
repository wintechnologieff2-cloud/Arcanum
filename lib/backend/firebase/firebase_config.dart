import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD4lGUgQnz8PxfVEiVbvHeA4ph73ueqkYU",
            authDomain: "arcanum-aba1c.firebaseapp.com",
            projectId: "arcanum-aba1c",
            storageBucket: "arcanum-aba1c.firebasestorage.app",
            messagingSenderId: "673037118515",
            appId: "1:673037118515:web:1173fdbcb98633f2490746",
            measurementId: "G-XRXQ8TPLSP"));
  } else {
    await Firebase.initializeApp();
  }
}

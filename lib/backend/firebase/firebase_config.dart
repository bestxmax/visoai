import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBZ7bxbKicOeCgV6wBLbTkm2RZR5w1ohCo",
            authDomain: "pro6-p5vcwb.firebaseapp.com",
            projectId: "pro6-p5vcwb",
            storageBucket: "pro6-p5vcwb.firebasestorage.app",
            messagingSenderId: "231608692415",
            appId: "1:231608692415:web:ab784c90b3831d6a06e00a",
            measurementId: "G-XSTFFSLMPT"));
  } else {
    await Firebase.initializeApp();
  }
}

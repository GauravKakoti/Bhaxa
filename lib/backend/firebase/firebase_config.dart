import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDI4dSJEg15_lHZDtmmA8QP1QlWIpzGlWQ",
            authDomain: "bhaxa-login.firebaseapp.com",
            projectId: "bhaxa-login",
            storageBucket: "bhaxa-login.appspot.com",
            messagingSenderId: "102520075898",
            appId: "1:102520075898:web:0d109c9e1a799763aeadc3"));
  } else {
    await Firebase.initializeApp();
  }
}

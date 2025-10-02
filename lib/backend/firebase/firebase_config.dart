import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCTStgMTLQF8JNrhpWoiijaht0f8j-CYtk",
            authDomain: "streetball-f9e53.firebaseapp.com",
            projectId: "streetball-f9e53",
            storageBucket: "streetball-f9e53.firebasestorage.app",
            messagingSenderId: "985480551767",
            appId: "1:985480551767:web:196549e2773f1d072f7212",
            measurementId: "G-EFVT4C6T7Z"));
  } else {
    await Firebase.initializeApp();
  }
}

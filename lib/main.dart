import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nectar_store/app.dart';
import 'package:nectar_store/firebase_options.dart';

const String serverClientId =
    '624356040244-pnoraa40jnjk59pojibaem2u6mevu788.apps.googleusercontent.com';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await GoogleSignIn.instance.initialize(serverClientId: serverClientId);

  runApp(const NectarStoreApp());
}

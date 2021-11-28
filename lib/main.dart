import 'package:ecomerceflutter/medilwere/redirect_if_authenticated.dart';
import 'package:ecomerceflutter/utils/binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness:Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      color: Colors.black,
      initialBinding: LoginBinding(),
      theme: ThemeData(
        backgroundColor: Colors.black
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: RedirectIfAuth(),
    );
  }
}

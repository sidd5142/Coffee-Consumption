
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:menu_order/models/user.dart';
import 'package:menu_order/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menu_order/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.android) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCzJ_yfUbMqYeHsiqTT4e-JA39fnTqHkzk",
        appId: '1:914412824910:android:c9a9cc880270b69c28561f',
        messagingSenderId: '914412824910',
        projectId: '914412824910',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

//
// class MyApp extends StatelessWidget {
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<Users?>.value(
//       value : AuthService().user,
//       initialData: null,
//       child: MaterialApp(
//        home: Wrapper(),
//       ),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      value: AuthService().user,
      initialData: null,
      catchError: (context, error) {
        print("Error in stream: $error");
        return null; // Return a default value or handle the error appropriately
      },
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:menu_order/models/user.dart';
import 'package:menu_order/screens/authenticate/authenticate.dart';
import 'package:menu_order/screens/authenticate/sign_in.dart';
import 'package:menu_order/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Users?>(context);
    // print(user);
    // // return either home or authenticate
    // return Authenticate();
    if(user == null)
      {
        return Authenticate();
      } else{
      return Home();
    }
  }
}

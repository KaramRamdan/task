import 'package:flutter/material.dart';
import 'package:task1/screens/login_screen.dart';
import 'package:task1/screens/scans_screen.dart';
import 'package:task1/shared/network/cachHelper/cache_helper.dart';
import 'package:task1/shared/network/dioHelper/dio_helper.dart';

import 'components/end_point.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  token = CacheHelper.getData(key: 'token');
  Widget? widget;
  if(token!=null){
    widget=const ScansScreen();
  }else{
    widget=LoginScreen();
  }
  runApp(MyApp(   startWidget:widget,));
}

class MyApp extends StatelessWidget { final Widget? startWidget;
  const MyApp({  this.startWidget,super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

      ),
      home:startWidget ,
    );
  }
}

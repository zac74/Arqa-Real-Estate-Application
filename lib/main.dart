import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gam3a/network/cache-helper.dart';
import 'package:gam3a/register/register-screen.dart';
import 'cubit/cubit.dart';
import 'homescreen.dart';
import 'login/arqalogin.dart';

void main() async{

  //Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //cache helper
  await CacheHelper.init();

  //open home if uId !=null
  Widget startScreen ;
  var uId =CacheHelper.getData(key:'uId');
  if(uId!=null){
    startScreen= HomeScreen();
  }else{
    startScreen=ARQALogin();
  }
  runApp(MyApp(startScreen));
}

class MyApp extends StatelessWidget {
  //startScreen
  late final Widget startWidgetScreen;
  MyApp(this.startWidgetScreen);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context)=>RealEstateCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: startWidgetScreen,
      ),
    );
  }
}






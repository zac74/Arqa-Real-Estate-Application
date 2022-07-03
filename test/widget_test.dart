// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gam3a/homescreen.dart';
import 'package:gam3a/login/arqalogin.dart';

import 'package:gam3a/main.dart';
import 'package:gam3a/network/cache-helper.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {

    await CacheHelper.init();
    //open home if uId !=null
    Widget startScreen ;
    var uId =CacheHelper.getData(key:'uId');
    if(uId!=null){
      startScreen=const HomeScreen();
    }else{
      startScreen=ARQALogin();
    }
    // Build our app and trigger a frame.
    await tester.pumpWidget( MyApp(startScreen));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

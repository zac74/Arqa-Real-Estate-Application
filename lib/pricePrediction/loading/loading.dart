import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gam3a/profile/mytheme.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              SizedBox(
                height: 100,
              ),
              Text(
                'Just Wait a Second ..',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                    fontSize: 15,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              SpinKitHourGlass(
                color: MyTheme.blueBorder,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import '../../profile/mytheme.dart';
import '../loading/loading.dart';
import 'form.dart';


class Result extends StatefulWidget {
  final area, houseAge, roomsNum, bedroomsNum, population;
  Result(
      {this.area,
      this.houseAge,
      this.roomsNum,
      this.bedroomsNum,
      this.population});



  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Result> {
  int? prediction;

  Future<void> predict() async {
    try {
      String  url =
          'https://flutteruse.herokuapp.com/predict/?areaincome=${widget.area}&areahouseage=${widget.houseAge}&areanorooms=${widget.roomsNum}&areanobedrooms=${widget.bedroomsNum}&areapopulation=${widget.population}';
      Response data = await http.get(Uri.parse(url));

          setState(() {
        prediction = jsonDecode(data.body)['prediction'];
      });
    } catch (e) {
      Alert(
              context: context,
              title: 'Error',
              buttons: [],
      )
          .show();
    }
  }

  @override
  void initState() {
    predict();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (prediction == null) {
      return  Loading();
    } else {
      return Scaffold(
        body: Center(
          child: Builder(
            builder: (context) => SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          'Predicted Price according to the Details',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Result = $prediction\$',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton.icon(
                        icon: const Icon(
                          Icons.home,
                        ),
                        style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(MyTheme.blueBorder),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)))),

                        label: const Text(
                          'Predict another House Price',
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Getdata()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

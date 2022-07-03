import 'package:flutter/material.dart';
import 'package:gam3a/pricePrediction/screens/result.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../profile/mytheme.dart';
import '../shared/formdecoration.dart';

class Getdata extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Getdata> {
   late double? areaincome, areahouseage, areanorooms, areanobedrooms, areapopulation;



  validform() {
    if (areahouseage != null &&
        areaincome != null &&
        areanorooms != null &&
        areanobedrooms != null &&
        areapopulation != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.blueBorder,
        centerTitle: true,
        title: const Text(
          'House Price Prediction',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black87, fontSize: 15),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Area :',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                areaincome = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        const SizedBox(height: 10),
                        TextField(

                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black87, fontSize: 15),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'House Age :',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                areahouseage = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black87, fontSize: 15),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Number of Rooms :',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                areanorooms = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black87, fontSize: 15),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Number of Bedrooms:',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                areanobedrooms = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black87, fontSize: 15),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Population:',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                areapopulation = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        const SizedBox(height: 30),
                        TextButton.icon(
                          icon: const Icon(
                            Icons.home,
                          ),
                          label: const Text(
                            'Predict House Price',
                          ),
                          style: ButtonStyle(
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(MyTheme.blueBorder),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                          onPressed: () {
                            if (validform()) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Result(
                                            houseAge: areahouseage,
                                            area: areaincome,
                                            bedroomsNum: areanobedrooms,
                                            roomsNum: areanorooms,
                                            population: areapopulation,
                                          )));
                            } else {
                              Alert(
                                      context: context,
                                      title: 'All fields are required',
                                      buttons: [],
                                      )
                                  .show();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

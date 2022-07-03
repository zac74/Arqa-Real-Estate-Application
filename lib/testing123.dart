import 'package:flutter/material.dart';

class Testing123 extends StatefulWidget {
  const Testing123({Key? key}) : super(key: key);

  @override
  State<Testing123> createState() => _Testing123State();
}

class _Testing123State extends State<Testing123> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(20)
          ),
          width:350 ,
          height:40 ,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 8,),
              Icon(Icons.history),
            SizedBox(width: 12,),
            Text('HEllo'),
          ],)
        ),
      ),
    );
  }
}

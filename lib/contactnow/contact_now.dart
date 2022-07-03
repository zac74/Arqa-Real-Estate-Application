import 'package:flutter/material.dart';
import 'package:gam3a/component/components.dart';
import '../profile/mytheme.dart';

class ContactNow extends StatefulWidget {
  const ContactNow({Key? key}) : super(key: key);

  @override
  State<ContactNow> createState() => _ContactNowState();
}

class _ContactNowState extends State<ContactNow> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ElevatedButton(onPressed: (){
        showDialog(context: context, builder: (_) => Dialog(

          child: Container(

            height: 110,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Owner's Number ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: MyTheme.blueBorder,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.phone,
                        size: 30, color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("PhoneNumber",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
      },
          child: Text("Contact Now",style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: MyTheme.blueBorder,)
      ),
    );
  }
}

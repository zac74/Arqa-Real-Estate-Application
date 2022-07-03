import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'mytheme.dart';

class ProfileTtest extends StatefulWidget {
  @override
  State<ProfileTtest> createState() => _ProfileTtestState();
}

class _ProfileTtestState extends State<ProfileTtest> {
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  bool enabletext = true;
  // final databaseRef = FirebaseDatabase.instance.ref();
  final ImagePicker _picker = ImagePicker();
  late PickedFile _imageFile;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: MyTheme.statusBar));
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: MyTheme.blueBorder,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              alignment: AlignmentDirectional.topCenter,
              //width: double.maxFinite ,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [

                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      height: 160.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: MyTheme.blueBorder,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0)
                          )
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 62.0,
                    backgroundColor: Theme
                        .of(context)
                        .scaffoldBackgroundColor,
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/474x/06/6b/c2/066bc2d557414eee11ad4006f81e01ef--michael-scott-quotes-tv-quotes.jpg') ,
                    )
                  ),
                  Row(
                    children: [
                      SizedBox(width: 200.0,),
                      FloatingActionButton(
                        mini: true,
                        backgroundColor: MyTheme.blueBorder,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet()),
                          );
                        },
                        child: Icon(
                          Icons.camera_alt,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),

              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey,)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text('Name',
                        style: TextStyle(fontSize: 18,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: namecontroller,
                        textAlign: TextAlign.left,
                        enabled: enabletext,
                        style: TextStyle(
                            fontSize: 20.0
                        ),
                        onFieldSubmitted: (value) {},
                        //onChanged: onChange,
                        //onTap: onTap,
                        textCapitalization: TextCapitalization.words,
                        textAlignVertical: TextAlignVertical.center,
                        //initialValue:initialValue ,
                        decoration: InputDecoration(
                          hintText: 'Amr Yasser',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.account_circle, size: 30.0,),
                          //IconButton(onPressed: suffixPressed, icon: Icon(suffix)) : null,

                        ),
                      ),
                    ),
                    SizedBox(height: 8.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text('Email',
                        style: TextStyle(fontSize: 18,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.left,
                        enabled: enabletext,
                        style: TextStyle(
                            fontSize: 20.0
                        ),
                        onFieldSubmitted: (value) {},
                        //onChanged: onChange,
                        //onTap: onTap,
                        textCapitalization: TextCapitalization.words,
                        textAlignVertical: TextAlignVertical.center,
                        //initialValue:initialValue ,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'amryasser52@gmail.com',
                          prefixIcon: Icon(Icons.email, size: 25.0,),
                          //IconButton(onPressed: suffixPressed, icon: Icon(suffix)) : null,

                        ),
                      ),
                    ),
                    SizedBox(height: 8.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text('Phone number',
                        style: TextStyle(fontSize: 18,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: phonecontroller,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.left,
                        enabled: enabletext,
                        style: TextStyle(
                            fontSize: 20.0
                        ),
                        onFieldSubmitted: (value) {},
                        //onChanged: onChange,
                        //onTap: onTap,
                        textCapitalization: TextCapitalization.words,
                        textAlignVertical: TextAlignVertical.center,
                        //initialValue:initialValue ,
                        decoration: InputDecoration(
                          hintText: ' 01020526957',

                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.phone, size: 25.0,),
                          //IconButton(onPressed: suffixPressed, icon: Icon(suffix)) : null,

                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 260.0,),
                        FloatingActionButton(
                          backgroundColor: MyTheme.blueBorder,
                          onPressed: () async {
                            //await bl7(namecontroller.text);
                            // UpdateProfile(
                            //     emailcontroller.text, namecontroller.text,
                            //     phonecontroller.text);
                            //  if (namecontroller.text.isNotEmpty&&
                            //  emailcontroller.text.isNotEmpty&&
                            //  phonecontroller.text.isNotEmpty){
                            //    insertdata(namecontroller.text,emailcontroller.text,phonecontroller.text);
                            //  }
                            // SafeArea(
                            //   child: FirebaseAnimatedList(
                            //     query: databaseRef,
                            //     itemBuilder: (BuildContext context,
                            //         DataSnapshot snapshot,
                            //         Animation<double> animation,
                            //         int index) {
                            //       return Text('hellow');
                            //     },
                            //   ),
                            // );
                          },
                          child: Icon(
                            Icons.edit,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.0,),
            Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.house, color: Colors.grey,),
                SizedBox(width: 10,),
                Container(
                  child: TextButton(
                    child: Text('My Listings',
                      style: TextStyle(color: Colors.black,),),
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),

                    onPressed: () {},

                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.phone, color: Colors.grey,),
                SizedBox(width: 10,),
                Container(
                  child: TextButton(
                    child: Text('Contact customer service',
                      style: TextStyle(color: Colors.black,),),
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.privacy_tip_outlined, color: Colors.grey,),
                SizedBox(width: 10,),
                Container(

                  child: TextButton(
                    child: Text('Privacy Policy',
                      style: TextStyle(color: Colors.black,),),
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),

                    onPressed: () {},

                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                  width: 200,
                  height: 40.0,
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text('Log out'),
                    textColor: Colors.white,
                    //color: MyTheme.appBarColor,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: MyTheme.blueBorder)
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),

    );
  }
//inserting data in firebase
//   void insertdata(String name, String email, String phone) {
//     String? key = databaseRef
//         .child("users")
//         .push()
//         .key;
//     databaseRef.child("users").child(key!).set({
//       'id': key,
//       'name': name,
//       'email': email,
//       'phone': phone,
//     });
//     namecontroller.clear();
//     emailcontroller.clear();
//     phonecontroller.clear();
//   }
// // updating profile info
//   Future<void> UpdateProfile(String email, String name, String phone) async
//   {
//     final snapshot = await databaseRef.child('users/$email').get();
//     //print(snapshot.runtimeType);
//     //map of the fields and values (using feilds as keys to map)
//
//     final postData = {
//       'id': '-N2M9RXVg9w4aTcnsaXs',
//       'name': name,
//       'email': email,
//       'phone': phone,
//
//     };
//
//     final Map<String, Map> updates = {};
//     updates['/users/-N2M9RXVg9w4aTcnsaXs'] = postData;
//
//     return databaseRef.update(updates);
//   }

// Future<void> bl7Get(String email) async
// {
//   final snapshot = await databaseRef.child('users/-N1inIkrKBizOTO-NT7i/').get();
//   print(snapshot.value.runtimeType);
//   Object? redVal = snapshot.value?? {
//     'id' : '-N1inIkrKBizOTO-NT7i',
//   };
//   print(redVal!['name']);
//
//
// }
  //image update
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      // width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
void takePhoto(ImageSource source) async {
  final pickedFile = await _picker.getImage(
    source: source,
  );
  setState(() {
    _imageFile = pickedFile!;
  });
}
  // Future<void> UpdateImage(String image,String email) async
  // {
  //   final snapshot = await databaseRef.child('users/$email').get();
  //   //print(snapshot.runtimeType);
  //   //map of the fields and values (using feilds as keys to map)
  //
  //   final postData = {
  //     'image': image,
  //   };
  //
  //   final Map<String, Map> updates = {};
  //   updates['/users/-N2M9RXVg9w4aTcnsaXs'] = postData;
  //
  //   return databaseRef.update(updates);
  // }
}
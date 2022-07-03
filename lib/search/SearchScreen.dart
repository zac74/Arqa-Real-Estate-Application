import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gam3a/component/components.dart';

import '../profile/mytheme.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var inputText = "";
  late String Title;
  late String Details;
  late String Location;
  late String Bedroom;
  late String Bathroom;
  late String Area;
  late String PhoneNumber;
  late String Price;
  late String image;
  CollectionReference favorites = FirebaseFirestore.instance.collection('favorites');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    inputText = val;
                    print(inputText);
                  });
                },
              ),
              Expanded(
                child: Container(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("property")
                          .where("Title",
                          isGreaterThanOrEqualTo: inputText)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Something went wrong"),
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Text("Loading"),
                          );
                        }

                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                            return Card(
                              child: ListTile(
                                leading: Image.network(data['image']),
                                title: Text(data['Title']),
                                onTap: (){
                                  showDialog(context: context, builder: (_)=> Dialog(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child:
                                            Image(
                                              image: NetworkImage(data['image']),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      data['Title'],
                                                      style:
                                                      Theme.of(context).textTheme.headline6!.copyWith(
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 32,
                                                ),
                                                SingleChildScrollView(
                                                  scrollDirection: Axis.horizontal,
                                                  child: Row(
                                                    children: [


                                                      Container(
                                                        height: 45,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                          color: MyTheme.blueBorder,
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Icon(Icons.home,
                                                          size: 30, color: Colors.white,
                                                        ),

                                                      ),
                                                      SizedBox(width: 10,),

                                                      Text("${data['Bedroom']} Rooms",style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.bold,
                                                      ),),

                                                      SizedBox(width: 10,),


                                                      Container(
                                                        height: 45,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                          color: MyTheme.blueBorder,
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Icon(Icons.area_chart_outlined,
                                                          size: 30, color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),

                                                      Text("${data['Area']} Meters",style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.bold,
                                                      ),),

                                                      SizedBox(width: 10,),

                                                      Container(
                                                        height: 45,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                          color: MyTheme.blueBorder,
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Icon(Icons.currency_pound,
                                                          size: 30, color: Colors.white,
                                                        ),
                                                      ),

                                                      SizedBox(width: 10,),

                                                      Text("${data['Price']} EGP",style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.bold,
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 32,
                                                ),
                                                Text(
                                                  "Descriptions",
                                                  style: Theme.of(context).textTheme.headline6,
                                                ),
                                                const SizedBox(
                                                  height: 12,
                                                ),
                                                Text(
                                                  data['Details'],
                                                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                                    color: Colors.black.withOpacity(0.5),
                                                    letterSpacing: 1.1,
                                                    height: 1.4,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    ElevatedButton(onPressed: ()async {
                                                      await favorites.add({
                                                        'Title' : Title,
                                                        'Details' : Details,
                                                        'Location' : Location,
                                                        'Bedroom' : Bedroom,
                                                        'Bathroom' : Bathroom,
                                                        'Area' : Area,
                                                        'PhoneNumber' : PhoneNumber,
                                                        'Price' : Price,
                                                        'image' : image,
                                                      }).then((value) => print("Property Added To Favorites")).catchError((error) => print("Faild : $error"));
                                                    },child: Text("Add To Favorite",style: TextStyle(color: Colors.white),),
                                                        style: ElevatedButton.styleFrom(
                                                          shape: StadiumBorder(),
                                                          primary: MyTheme.blueBorder,)
                                                    ),
                                                    ElevatedButton(onPressed: (){
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
                                                                  Text("$PhoneNumber",
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
                                                  ],

                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                                },

                              ),
                            );
                            /*Card(
                              shape: StadiumBorder(),
                              elevation: 5,
                              child: GestureDetector(
                                onTap: (){
                                  showDialog(context: context, builder: (_)=> Dialog(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child:
                                            Image(
                                              image: NetworkImage(data['image']),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      data['Title'],
                                                      style:
                                                      Theme.of(context).textTheme.headline6!.copyWith(
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 32,
                                                ),
                                                SingleChildScrollView(
                                                  scrollDirection: Axis.horizontal,
                                                  child: Row(
                                                    children: [


                                                      Container(
                                                        height: 45,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                          color: MyTheme.blueBorder,
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Icon(Icons.home,
                                                          size: 30, color: Colors.white,
                                                        ),

                                                      ),
                                                      SizedBox(width: 10,),

                                                      Text("${data['Bedroom']} Rooms",style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.bold,
                                                      ),),

                                                      SizedBox(width: 10,),


                                                      Container(
                                                        height: 45,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                          color: MyTheme.blueBorder,
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Icon(Icons.area_chart_outlined,
                                                          size: 30, color: Colors.white,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),

                                                      Text("${data['Area']} Meters",style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.bold,
                                                      ),),

                                                      SizedBox(width: 10,),

                                                      Container(
                                                        height: 45,
                                                        width: 45,
                                                        decoration: BoxDecoration(
                                                          color: MyTheme.blueBorder,
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Icon(Icons.currency_pound,
                                                          size: 30, color: Colors.white,
                                                        ),
                                                      ),

                                                      SizedBox(width: 10,),

                                                      Text("${data['Price']} EGP",style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.bold,
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 32,
                                                ),
                                                Text(
                                                  "Descriptions",
                                                  style: Theme.of(context).textTheme.headline6,
                                                ),
                                                const SizedBox(
                                                  height: 12,
                                                ),
                                                Text(
                                                  data['Details'],
                                                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                                    color: Colors.black.withOpacity(0.5),
                                                    letterSpacing: 1.1,
                                                    height: 1.4,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    ElevatedButton(onPressed: ()async {
                                                      await favorites.add({
                                                        'Title' : Title,
                                                        'Details' : Details,
                                                        'Location' : Location,
                                                        'Bedroom' : Bedroom,
                                                        'Bathroom' : Bathroom,
                                                        'Area' : Area,
                                                        'PhoneNumber' : PhoneNumber,
                                                        'Price' : Price,
                                                        'image' : image,
                                                      }).then((value) => print("Property Added To Favorites")).catchError((error) => print("Faild : $error"));
                                                    },child: Text("Add To Favorite",style: TextStyle(color: Colors.white),),
                                                        style: ElevatedButton.styleFrom(
                                                          shape: StadiumBorder(),
                                                          primary: MyTheme.blueBorder,)
                                                    ),
                                                    ElevatedButton(onPressed: (){
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
                                                                  Text("$PhoneNumber",
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
                                                  ],

                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                                },
                                child: Container(
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
                                        Text(data['Title']),
                                      ],)
                                ),
                              ),
                            );*/
                          }).toList(),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

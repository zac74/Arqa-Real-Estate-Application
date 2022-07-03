import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gam3a/profile/mytheme.dart';
import '../component/components.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final Stream<QuerySnapshot> favorites = FirebaseFirestore.instance.collection('favorites').snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.blueBorder,
        title: Text("Favourites"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: favorites,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot){
                if (snapshot.hasError){
                  return const Text('Something went wrong');
                }
                if(snapshot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                }
                final data = snapshot.requireData;
                return Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: width,
                      height: 640,
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 12),
                          itemCount: data.size,
                          itemBuilder:(context, index) {
                            return defulatCard(
                              Area: data.docs[index]["Area"],
                              Bedroom: data.docs[index]["Bedroom"],
                              Bathroom: data.docs[index]["Bathroom"],
                              Details: data.docs[index]["Details"],
                              Location: data.docs[index]["Location"],
                              PhoneNumber: data.docs[index]["PhoneNumber"],
                              Price: data.docs[index]["Price"],
                              Title: data.docs[index]["Title"],
                              image: data.docs[index]["image"],

                            );
                          }
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
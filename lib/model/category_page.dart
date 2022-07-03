
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gam3a/component/components.dart';
import 'package:gam3a/contactnow/contact_now.dart';
import 'package:gam3a/model/property_model.dart';
import 'package:gam3a/profile/mytheme.dart';
import 'package:line_icons/line_icons.dart';

import 'category_model.dart';
import 'details_page.dart';


class CategoryPage extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryPage({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> property = FirebaseFirestore.instance.collection('property').snapshots();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    Text(
                      widget.categoryModel.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(LineIcons.search),
                      hintText: "Search...",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                StreamBuilder(
                  stream: property ,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasError){
                      return const Text('Something went wrong');
                    }
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator());
                    }
                    final data = snapshot.requireData;
                    return Container(
                      width: width,
                      height: height,
                      child: ListView.builder(
                          itemCount: data.size,
                          itemBuilder:(context, index) {
                            return categoryCard1(
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
                          }),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedRecommendationCard extends StatelessWidget {
  const ExpandedRecommendationCard({
    Key? key,
    required this.propertyModel,
  }) : super(key: key);

  final PropertyModel propertyModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(propertyModel: propertyModel),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 8, top: 12, bottom: 12),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                height: 200,
                width: double.infinity,
                image: AssetImage(propertyModel.thumbnail),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  propertyModel.title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                const Icon(
                  LineIcons.starAlt,
                  color: Colors.amber,
                ),
                Text(
                  propertyModel.rating.toString(),
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "${propertyModel.rooms} Rooms - ${propertyModel.area} Meters - ${propertyModel.floors} Floors",
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)  => ContactNow(),
                            )
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: MyTheme.blueBorder,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 5),
                              blurRadius: 20,
                              spreadRadius: 4,
                            )
                          ],
                        ),
                        height: 55,
                        width: 55,
                        child: Center(
                          child: Text(
                            "Contact Now",
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

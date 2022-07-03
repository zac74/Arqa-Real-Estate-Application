import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gam3a/component/components.dart';
import 'package:gam3a/profile/mytheme.dart';
import 'package:gam3a/search/SearchScreen.dart';
import '../model/category_model.dart';
import '../model/category_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final Stream<QuerySnapshot> property = FirebaseFirestore.instance.collection('property').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text('Arqa Developments'),
        backgroundColor: MyTheme.blueBorder,
        actions: [
          IconButton(icon: Icon(Icons.search),onPressed: (){
            navigateTo(context, SearchScreen());
          },),

        ],
      ),
      
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 0.4,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryButton(categoryModel: categories[index]);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Properties",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 300,
                  child:  Container(
                    height: 150,
                    width: width,
                    child: SingleChildScrollView(
                      child: StreamBuilder(
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
                            height: 300,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
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
                                }),
                          );
                        },
                      ),
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

// class RecommendationCard extends StatelessWidget {
//   const RecommendationCard({
//     Key? key,
//     // required this.propertyModel,
//
//
//   }) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){},
//       child: Container(
//         width: 200,
//         padding: const EdgeInsets.all(16),
//         margin: const EdgeInsets.only(right: 8),
//         decoration: BoxDecoration(
//           color: Colors.grey.withOpacity(0.15),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 0,
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image(
//                 height: 140,
//                 width: double.infinity,
//                 image: NetworkImage(image),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context)  => ContactNow(),
//                     )
//                 );
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: MyTheme.blueBorder,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Text(
//                   "Contact Now",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 6,
//             ),
//             Text(
//               Title,
//               style: Theme.of(context).textTheme.subtitle1!.copyWith(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 4,
//             ),
//             Text(
//               "${propertyModel.rooms} Rooms - ${propertyModel.area} Meters - ${propertyModel.floors} Floors",
//               style: Theme.of(context).textTheme.caption!.copyWith(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CategoryButton extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryButton({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              categoryModel: categoryModel,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: MyTheme.greyColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              categoryModel.title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  height: 50,
                  width: 50,
                  image: AssetImage('images/${categoryModel.assetPath}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

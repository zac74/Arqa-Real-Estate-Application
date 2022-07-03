import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../contactnow/contact_now.dart';
import '../model/details_page.dart';
import '../profile/mytheme.dart';

Widget categoryCard1({
  required String Title,
  required String Details,
  required String Location,
  required String Bedroom,
  required String Bathroom,
  required String Area,
  required String PhoneNumber,
  required String Price,
  required String image,
})=>  Builder(
  builder: (context) {
    CollectionReference favorites = FirebaseFirestore.instance.collection('favorites');
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (_)=> Dialog(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child:
                  Image(
                    image: NetworkImage(image),
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
                            Title,
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

                            Text("${Bedroom} Rooms",style: TextStyle(
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

                            Text("${Area} Meters",style: TextStyle(
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

                            Text("${Price} EGP",style: TextStyle(
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
                        Details,
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
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  Title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),

              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "${Bedroom} Rooms - ${Area} Meters - ${Price} EGP",
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
);

Widget defulatCard({
  required String Title,
  required String Details,
  required String Location,
  required String Bedroom,
  required String Bathroom,
  required String Area,
  required String PhoneNumber,
  required String Price,
  required String image,
}
    )=> Builder(
    builder: (context) {

      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
      CollectionReference favorites = FirebaseFirestore.instance.collection('favorites');
      return GestureDetector(
        onTap: (){
          showDialog(context: context, builder: (_)=> Dialog(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                  child:
                  Image(
                    image: NetworkImage(image),
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
                              Title,
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
                                
                                Text("${Bedroom} Rooms",style: TextStyle(
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

                                Text("${Area} Meters",style: TextStyle(
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

                                Text("${Price} EGP",style: TextStyle(
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
                          Details,
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
          width: 200,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  height: 140,
                  width: double.infinity,
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
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
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: MyTheme.blueBorder,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Contact Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                Title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${Bedroom} Rooms - ${Area}  Square Meters - ${Price} EGP",
                style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinish(context,widget)=> Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) =>  widget,
    ),
        (route) => false
);

Widget defaultFormField({

  TextEditingController? controller,
  dynamic label,
  IconData ? prefix,
  String ? initialValue,
  TextInputType ?keyboardType,
  Function? onSubmit,
  onChange,
  onTap,
  required String? Function(String?) validate,
  bool isPassword = false,
  bool enabled = true,
  IconData ?suffix,
  suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textAlign: TextAlign.start,
      onFieldSubmitted: (value) {
        onSubmit!(value);
      },
      enabled: enabled,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      textCapitalization: TextCapitalization.words,
      textAlignVertical: TextAlignVertical.center,
      initialValue:initialValue ,
      //textCapitalization: TextCapitalization.words,

      decoration: InputDecoration(
        hintText: label,
        border:UnderlineInputBorder(),
        prefixIcon: Icon(prefix,),
        suffixIcon: suffix != null ? IconButton(onPressed: suffixPressed, icon: Icon(suffix)) : null,

      ),
    );
Widget defaultTextButton({
  required Function function,
  required String text,
})=>TextButton(
  onPressed :()=> function(),
  child:Text(
      text.toUpperCase()),);

Widget defaultButton({

  double r = 30.0,
  required String text,
  bool isUpper = true,
  Color back = MyTheme.blueBorder,
  required Function function,
}) =>
    Container(
      width: 200,
      decoration: BoxDecoration(
        color: back,
        borderRadius: BorderRadius.circular(
          r,
        ),
      ),
      child: FlatButton(
        onPressed: ()=> function(),
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );





Widget myDivider()=> Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child: Container(
    width: double.infinity ,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

 /*void signOut(context){
  CacheHelper.removeData('token').then((value)
  {
    if(value){
    navigateAndFinish(context, ShopLoginScreen(),);
    }
  });
}*/
String? token = '';
void printFullText( String text){
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}
Widget specWidget(BuildContext context, IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: MyTheme.blueBorder,
            shape: BoxShape.circle,
          ),
          child: Icon(icon),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    ),
  );
}


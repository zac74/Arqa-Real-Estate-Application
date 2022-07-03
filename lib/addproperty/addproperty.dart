import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gam3a/profile/mytheme.dart';
import 'package:image_picker/image_picker.dart';

import '../component/components.dart';
import '../pricePrediction/screens/form.dart';


class AddProperty extends StatefulWidget {
  @override
  State<AddProperty> createState() => _AddPropertyState();
}
class _AddPropertyState extends State<AddProperty> {

   CollectionReference property = FirebaseFirestore.instance.collection('property');
   final databaseRef = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  late PickedFile _imageFile;

   String? Title;
   String? Details;
   String? Location;
   String? Bedroom;
   String? Bathroom;
   String? Area;
   String? PhoneNumber;
   String? Price;
   String? Image;

  @override
  void initState()   {
    // TODO: implement initState
    super.initState();
    // CollectionReference reference = FirebaseFirestore.instance.collection("property");

  }


  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(25),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value){
                Title = value;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                labelText: 'Title',
                hintText: 'Property Title',
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value){
                Details = value;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.assignment),
                labelText: 'Details',
                hintText: 'Property Details',
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value){
                Bedroom = value ;
              },
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                icon: Icon(Icons.bedroom_parent_outlined),
                labelText: 'Bedrooms ',
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value){
                Bathroom = value ;
              },
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                icon: Icon(Icons.bathroom_outlined),
                labelText: 'Bathrooms',
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value){
                Area = value ;
              },
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                icon: Icon(Icons.crop_square_outlined),
                labelText: 'Area',
                hintText: 'Property Area',
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value){
                Location = value;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.location_on),
                labelText: 'Location',
                hintText: 'Add Address',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value){
                PhoneNumber = value ;
              },
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                labelText: 'Phone Number',
                hintText: '01115123763',
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value){
                Image = value ;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.image),
                labelText: 'Image',
                hintText: 'Enter image path',
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5)),
              ),
            ),
            TextFormField(
              onChanged: (value){
                Price = value ;
              },
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                icon: Icon(Icons.attach_money_outlined),
                labelText: 'Price',
                hintText: 'property price',
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(MyTheme.blueBorder),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  onPressed: () async {
                    await property.add({
                      'Title' : Title,
                      'Details' : Details,
                      'Location' : Location,
                      'Bedroom' : Bedroom,
                      'Bathroom' : Bathroom,
                      'Area' : Area,
                      'PhoneNumber' : PhoneNumber,
                      'Price' : Price,
                      'image' : Image,
                    }).then((value) => print("Property Added")).catchError((error) => print("Faild : $error"));
                  },
                  child: Text('Add'),
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(MyTheme.blueBorder),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  onPressed: ()  {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.camera_alt),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),

                TextButton(  //Price Prediction
                  style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(MyTheme.blueBorder),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  onPressed: () {
                    navigateTo(context, Getdata());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Prediction'),
                  ),

                ),
                const SizedBox(
                  width: 20,
                ),


              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),

          ],
        ),

      ),
    );


  }
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
  Future<void> UpdateImage(String image,String email) async
  {
    // final snapshot = await databaseRef.child('users/$email').get();
    //print(snapshot.runtimeType);
    //map of the fields and values (using feilds as keys to map)

    final postData = {
      'image': image,
    };

  }
}

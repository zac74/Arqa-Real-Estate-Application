class PropertyModel {
  String title;
  String subTitle;
  String details;
  String thumbnail;
  List<String> images;
  int rooms;
  int area;
  int floors;
  int price;
  double rating;
  PropertyModel({
    required this.title,
    required this.subTitle,
    required this.details,
    required this.thumbnail,
    required this.images,
    required this.rooms,
    required this.area,
    required this.floors,
    required this.price,
    required this.rating,
  });
}

List<PropertyModel> properties = [
  PropertyModel(
    title: 'I-Business Park',
    subTitle: "New Capital",
    details:
        'The iBusiness Park project is one of the most important projects that we have worked with at Arqa Real Estate Development Company. The project was built in a very strategic location in the heart of Downtown, in order to improve the investment opportunities in the project as much as possible.',
    thumbnail: 'images/properties/slide-re.jpg',
    images: [
      'images/properties/slide-re.jpg',
      'images/properties/ibp-mob2.jpg',
      'images/properties/ibp-mob4.jpg'
    ],
    rooms: 7,
    area: 220,
    floors: 10,
    price: 10000,
    rating: 4.7,
  ),
  PropertyModel(
    title: 'Porto October',
    subTitle: "6 october october",
    details:
        'Porto October is located in the heart of 6th of October City, just 5 minutes from Juhayna Square. More than just a place to enjoy living, Porto October offers an upscale lifestyle with international schools, a quiet residential community, administrative offices, an international medical center and a 5-star hotel. Its the place for everything you need and more',
    thumbnail: 'images/properties/villa2.jpeg',
    images: [
      'images/properties/villa1.jpeg',
      'images/properties/villa2.jpeg',
      'images/properties/villa3.jpeg'
    ],
    rooms: 5,
    area: 3000,
    floors: 3,
    price: 10000,
    rating: 4.3,
  ),
  PropertyModel(
    title: 'Pyramids Hills ',
    subTitle: "PYRAMIDS HILLS, CAIRO ALEXANDRIA DESERT ROAD",
    details:
        'Pyramid Hills is located conveniently between central Cairo and western Cairo (Giza). The compound’s incredible location provides it with a spectacular view of the Pyramids of Giza, while also providing its residents with a very close proximity to the downtown core and the Sheikh Zayed area. Phase One featured 93, semi-finished villas , twin & town-houses. Phase Two, with only some remaining availabilities, features 376 fully finished apartments and 62 semi-finished twin & town houses and an extension - Pyramid Hills West Gate - which features another 20 twin & town houses ..',
    thumbnail: 'images/properties/ap4.jpeg',
    images: [
      'images/properties/ap2.jpeg',
      'images/properties/ap7.jpeg',
      'images/properties/ap6.jpeg'
    ],
    rooms: 3,
    area: 3500,
    floors: 2,
    price: 5000,
    rating: 4.7,
  ),
  PropertyModel(
    title: 'iCity October',
    subTitle: "Mountain View iCity October",
    details:
        'It is located a short distance from the famous Mall of Arabia, estimated at about five minutes, no more.It is located behind the shooting club.Mountain View October is located ten minutes from Dar Al Fouad Hospital and Nile National University.The distance between it and Juhayna Mall does not exceed four minutes only.',
    thumbnail: 'images/properties/ap6.jpeg',
    images: [
      'images/properties/ap4.jpeg',
      'images/properties/ap5.jpeg',
      'images/properties/ap6.jpeg'
    ],
    rooms: 4,
    area: 4200,
    floors: 3,
    price: 6000,
    rating: 4.5,
  ),
  PropertyModel(
    title: ' BADYA PALM HILLS',
    subTitle: "BADYA PALM HILLS, SHEIKH ZAYED COMPOUNDS",
    details:
        'The location of badya is one of the most important features and success factors for the project.They choose a prime location near all the vital services and places.It is located on El Wahat Road, specifically in the Creative City area, and near Dahshour Main Road near Cairo. It is closeto Nile University and Dar Al Fouad Hospital.',
    thumbnail: 'images/properties/badya.jpg',
    images: [
      'images/properties/badya.jpg',
      'images/properties/ap4.jpeg',
      'images/properties/ap5.jpeg',
      'images/properties/ap6.jpeg'
    ],
    rooms: 4,
    area: 4600,
    floors: 5,
    price: 6000,
    rating: 4.4,
  ),
];

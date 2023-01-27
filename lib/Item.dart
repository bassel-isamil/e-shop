// ignore_for_file: non_constant_identifier_names
class Item {
  String img_url;
  String title;
  String about;
  double price;

  Item(
      {required this.img_url,
      required this.title,
      required this.about,
      required this.price});
}
final List<Item> items = [

  Item(img_url: "https://m.media-amazon.com/images/I/51sgZiMX+DL._AC_SX425_.jpg",
      title: "LCD Writing Tablet",
      about: "The useful LCD writing tablet is a greater helper for",
      price: 80),
  Item(img_url: "https://m.media-amazon.com/images/I/4174hmb5xkL._AC_SX425_.jpg",
      title: "Nik case Silicon Cover",
      about: "Compatbile : Realme Bud Air Pro December 2020 Launch Only", price: 55.6),
  Item(img_url: "https://m.media-amazon.com/images/I/71yzJoE7WlL._AC_SX679_.jpg",
      title: "Apple iPhone 14 Pro Max (256 GB) ",
      about: "6,7 Super Retina XDR Display mit Always On und ProMotion", price: 1500),
  Item(img_url: "https://m.media-amazon.com/images/I/71kZfQA-Y7L._AC_SX679_.jpg",
      title: "Apple iPhone 11 with FaceTime - 128GB",
      about: "Display: 6.1-inch Liquid Retina HD display, Weight: 194 grams", price: 700),

];




import 'package:slicing_design/model/category.dart';

class Product {
  final int id;
  final String name;
  final Category type;
  final double rating;
  final double amount;
  final String image;
  bool favorite;

  Product({
    required this.id,
    required this.name,
    required this.type,
    required this.rating,
    required this.amount,
    required this.image,
    this.favorite = false,
  });
}

List<Product> products = [
  Product(
    id: 1,
    name: 'Modern Light Clothes',
    type: categories[0],
    amount: 212.99,
    rating: 5,
    image: "assets/images/Product1.png",
    favorite: false,
  ),
  Product(
    id: 2,
    name: 'Light Dress Bless',
    type: categories[1],
    amount: 162.99,
    rating: 5,
    image: "assets/images/Product2.png",
    favorite: true,
  ),
  Product(
    id: 3,
    name: 'Modern Jacket',
    type: categories[1],
    amount: 212.99,
    rating: 5,
    image: "assets/images/Product3.png",
    favorite: false,
  ),
  Product(
    id: 4,
    name: 'Dress Yellow',
    type: categories[2],
    amount: 212.99,
    rating: 5,
    image: "assets/images/Product4.png",
    favorite: false,
  ),
 
  Product(
    id: 5,
    name: 'Modern Light Clothes',
    type: categories[0],
    amount: 212.99,
    rating: 5,
    image: "assets/images/Product1.png",
    favorite: false,
  ),
  Product(
    id: 6,
    name: 'Light Dress Bless',
    type: categories[1],
    amount: 162.99,
    rating: 5,
    image: "assets/images/Product2.png",
    favorite: true,
  ),
  Product(
    id: 7,
    name: 'Modern Jacket',
    type: categories[1],
    amount: 212.99,
    rating: 5,
    image: "assets/images/Product3.png",
    favorite: false,
  ),
  Product(
    id: 8,
    name: 'Dress Yellow',
    type: categories[2],
    amount: 212.99,
    rating: 5,
    image: "assets/images/Product4.png",
    favorite: false,
  ),
 
];

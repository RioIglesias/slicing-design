class Category {
  final int id;
  final String name;
  final String icon;

  Category({required this.id, required this.name, required this.icon});

  @override
  String toString() {
    return '''
Category:
- ID         : $id
- Title      : $name
''';
  }
}

List<Category> categories = [
  Category(id: 1, name: 'T-Shirt', icon: 'assets/images/clothes.png'),
  Category(id: 2, name: 'Dress Modern', icon: 'assets/images/dress.png'),
  Category(id: 3, name: 'Pants', icon: 'assets/images/pants.png'),
];

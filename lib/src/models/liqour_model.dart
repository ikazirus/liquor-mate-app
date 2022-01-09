import 'package:liquor_mate/index.dart';

class Liquor {
  final int id;
  final String name;
  final LiquorBrand brand;
  final LiquorType type;
  final Category category;

  Liquor(this.id, this.name, this.brand, this.type, this.category);
}

import 'package:liquor_mate/index.dart';

class LiquorBottle {
  final int id;
  late final String name;
  final Liquor liquor;
  final double volumeML;
  final double emptyBottleWeightMG;
  final double sealedBottleWeightMG;

  LiquorBottle(this.id, this.liquor, this.volumeML, this.emptyBottleWeightMG,
      this.sealedBottleWeightMG) {
    name = liquor.name + " " + volumeML.toString() + "ml";
  }
}

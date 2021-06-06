import 'package:hive/hive.dart';

part 'Settings.g.dart';

@HiveType(typeId: 2)
class Settings extends HiveObject{
  @HiveField(0)
  final bool enableProductGrouping;
  @HiveField(1)
  final bool enableServicePrice;
  @HiveField(2)
  final bool enableDiscount;
  @HiveField(3)
  final int maxDiscount;
  @HiveField(4)
  final bool darkMode;

  Settings(this.darkMode,this.enableDiscount,this.enableProductGrouping,this.enableServicePrice,this.maxDiscount);
}
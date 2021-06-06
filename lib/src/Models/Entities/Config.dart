import 'package:hive/hive.dart';

part 'Config.g.dart';

@HiveType(typeId: 1)
class Config extends HiveObject{
  @HiveField(0)
  final String token;
  @HiveField(1)
  final int clientID;
  @HiveField(2)
  final int storageID;
  @HiveField(3)
  final String apiname;
  @HiveField(4)
  final DateTime until;
  @HiveField(5)
  final DateTime? dayopened;
  @HiveField(6)
  final String ClientName;
  @HiveField(7)
  final String TenantName;

  Config(this.token, this.clientID,this.until, this.dayopened,this.apiname,this.storageID,this.TenantName,this.ClientName);
}
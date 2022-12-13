import 'package:hive/hive.dart';
part 'catogory.g.dart';

@HiveType(typeId: 2)
enum catagorytype {
  @HiveField(0)
  income,

  @HiveField(1)
  expense
}

@HiveType(typeId: 1)
class catagorymodel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  bool isdeleted;

  @HiveField(3)
  catagorytype type;

  catagorymodel({
    required this.id,
    required this.name,
    this.isdeleted = false,
    required this.type,
  });
}

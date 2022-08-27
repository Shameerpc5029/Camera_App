import 'package:hive/hive.dart';
part 'db_model.g.dart';

@HiveType(typeId: 1)
class GallaryModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String image;

  GallaryModel({
    this.id,
    required this.image,
  });
}

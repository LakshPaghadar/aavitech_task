import 'package:floor/floor.dart';


@entity
class CategoryWithId{
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String? name;

  CategoryWithId(this.id,this.name);
}
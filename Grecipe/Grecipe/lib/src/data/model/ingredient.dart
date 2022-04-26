import 'package:hive/hive.dart';
part 'ingredient.g.dart';

@HiveType(typeId: 1,adapterName: "IngredientAdapter")
class DataModel{
  @HiveField(0)
  int index;

  @HiveField(1)
  String ingredientName;

  @HiveField(2)
  String userSpecIngredientName;

  @HiveField(3)
  String shelfLife;

  @HiveField(4)
  String memo;

DataModel({required this.index,required this.ingredientName,required this.userSpecIngredientName,required this.shelfLife,required this.memo});

  DataModel.fromJson(Map json)
      : index = json['index'],
        ingredientName = json['ingredientName'],
        userSpecIngredientName = json['userSpecIngredientName'],
        shelfLife = json['shelfLife'],
        memo = json['memo'];

  toJson() {
    return {
      'index': index,
      'ingredientName': ingredientName,
      'userSpecIngredientName': userSpecIngredientName,
      'shelfLife': shelfLife,
      'memo': memo
    };
  }
}
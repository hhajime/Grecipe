import 'package:hive/hive.dart';
part 'ingredient.g.dart';

@HiveType(typeId: 1,adapterName: "IngredientAdapter")
class Ingredients {
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

Ingredients({required this.index,required this.ingredientName,required this.userSpecIngredientName,required this.shelfLife,required this.memo});
  Ingredients.fromJson(Map json)
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
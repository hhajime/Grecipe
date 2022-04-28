class Fi{
  final int? id;
  final String ingName;
  final String? userSpecIngName;
  final String shelfLife;
  final String? ingMemo;

  Fi({this.id, required this.ingName, this.userSpecIngName, required this.shelfLife,this.ingMemo});

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'ingName': ingName,
      'userSpecIngName': userSpecIngName,
      'shelfLife': shelfLife,
      'ingMemo': ingMemo,
    };
  }
  
  @override
  String toString() {
    return 'Fi{id: $id, ingName: $ingName, userSpecIngName: $userSpecIngName, shelfLife: $shelfLife, ingMemo: $ingMemo}';
  }
}
class BoxModel{
  int? id;
  bool? isBlue;
  bool? isRed;

  BoxModel({this.id, this.isBlue, this.isRed,});

  BoxModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    isBlue = json['isBlue'];
    isRed = json['isRed'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["isBlue"] = isBlue;
    data["isRed"] = isRed;
    return data;
  }
}
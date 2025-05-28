class BasicApiUserModel{
  int? userId;
  int? id;
  String? title;
  String? body;

  BasicApiUserModel({this.userId, this.id, this.title, this.body});

  // this is used for get data from api using Get method
  BasicApiUserModel.fromJson(Map<String, dynamic>json){
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  //This is used for post data from api using post method

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

}
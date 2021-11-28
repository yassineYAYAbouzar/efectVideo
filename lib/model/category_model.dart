class CatgoryModel{
   String name,image;

   CatgoryModel({this.name, this.image});
   CatgoryModel.fromjson(Map<dynamic, dynamic> map){
       if(map== null){
          return ;
       }
         name =map['name'];
         image =map['image'];
   }
   tojson(){
    return{
      'name':name,
      'email':image,
    };
   }
}
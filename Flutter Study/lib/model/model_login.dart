class login{
  int? id;
  String? username;
  String? password;
  String? type;
  loginmap(){
    var mapping = Map<String, dynamic>();
    mapping['id']=id ?? null;
    mapping['username']=username!;
    mapping['password']=password!;
    mapping['type']=type!;
    return mapping;
  }
}
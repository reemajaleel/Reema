class user{
  int? id;
  String? fname;
  String? lname;
  String? dob;
  String? email;
  String? phone;
  int? login;
  usermap(){
    var mapping = Map<String, dynamic>();
    mapping['id']=id ?? null;
    mapping['fname']=fname!;
    mapping['lname']=lname!;
    mapping['dob']=dob!;
    mapping['email']=email!;
    mapping['phone']=phone!;
    mapping['login']=login!;
    return mapping;
  }


}
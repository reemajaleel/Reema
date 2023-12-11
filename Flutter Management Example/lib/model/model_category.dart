class category{
  int? id;
  String? name;
  categorymap(){
    var mapping = Map<String, dynamic>();
    mapping['id']=id ?? null;
    mapping['name']=name!;
    return mapping;
  }
}
class category{
  int? id;
  String? catname;
  categorymap(){
    var mapping = Map<String, dynamic>();
    mapping['id']=id ?? null;
    mapping['catname']=catname!;
    return mapping;
  }
}
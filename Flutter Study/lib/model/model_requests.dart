class requests{
  int? id;
  String? reqstatus;
  String? reqdate;
  int? user;
  int? book;
  requestsmap(){
    var mapping = Map<String, dynamic>();
    mapping['id']=id ?? null;
    mapping['reqstatus']=reqstatus!;
    mapping['reqdate']=reqdate!;
    mapping['user']=user!;
    mapping['book']=book!;
    return mapping;
  }
}
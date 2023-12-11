class complaints{
  int? id;
  String? complaint;
  String? comdate;
  String? reply;
  String? comstatus;
  int? user;
  complaintmap(){
    var mapping = Map<String, dynamic>();
    mapping['id']=id ?? null;
    mapping['complaint']=complaint!;
    mapping['comdate']=comdate!;
    mapping['reply']=reply!;
    mapping['comstatus']=comstatus!;
    mapping['user']=user!;
    return mapping;
  }
}
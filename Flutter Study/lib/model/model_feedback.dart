class feedbacks{
  int? id;
  String? feedback;
  String? feedbackdate;
  int? user;
  feedbackmap(){
    var mapping = Map<String, dynamic>();
    mapping['id']=id ?? null;
    mapping['feedback']=feedback!;
    mapping['feedbackdate']=feedbackdate!;
    mapping['user']=user!;
    return mapping;
  }
}
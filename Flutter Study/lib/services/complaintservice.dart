import 'package:sqllitebookmate/model/model_complaint.dart';
import 'package:sqllitebookmate/Dbconnection/crudfile.dart';

class complaintsservice{
  late Repository  complaint;
  complaintsservice(){
    complaint = Repository();
  }
  SaveComplaint(complaints c) async{
    return await complaint.insertData('complaints', c.complaintmap());
  }
  //Read All Users
  readAllComplaint() async{
    return await complaint.readData('complaints');
  }
  //Edit User
  UpdateComplaint(complaints c) async{
    return await complaint.updateData('complaints', c.complaintmap());
  }

  deleteComplaint(cid) async {
    return await complaint.deleteDataById('complaints', cid);
  }

  rawquerycomplaint(q) async{
    var dbClient =  complaint;
    var result = await dbClient.rawquerys(q);
    return result;
  }

}
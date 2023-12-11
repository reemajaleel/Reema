import 'package:sqllitebookmate/model/model_requests.dart';
import 'package:sqllitebookmate/Dbconnection/crudfile.dart';

class requestsservice{
  late Repository  req;
  requestsservice(){
    req = Repository();
  }
  SaveRequest(requests c) async{
    return await req.insertData('requests', c.requestsmap());
  }
  //Read All Users
  readAllRequest() async{
    return await req.readData('requests');
  }
  //Edit User
  UpdateRequest(requests c) async{
    return await req.updateData('requests', c.requestsmap());
  }

  deleteRequest(cid) async {
    return await req.deleteDataById('requests', cid);
  }

  rawqueryrequest(q) async{
    var dbClient =  req;
    var result = await dbClient.rawquerys(q);
    return result;
  }

}
import 'package:sqllitebookmate/model/model_login.dart';
import 'package:sqllitebookmate/Dbconnection/crudfile.dart';

class loginservice{
  late Repository  l;
  loginservice(){
    l = Repository();
  }
  SaveLogin(login c) async{
    return await l.insertData('login', c.loginmap());
  }
  //Read All Users
  readAllLogin() async{
    return await l.readData('login');
  }
  //Edit User
  UpdateLogin(login c) async{
    return await l.updateData('login', c.loginmap());
  }

  deleteLogin(cid) async {
    return await l.deleteDataById('login', cid);
  }
  queryOperation(q) async{
    var dbClient =  l;
    var result = await dbClient.rawquerys(q);
    return result;
  }
}
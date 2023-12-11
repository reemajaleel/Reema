import 'package:sqllitebookmate/model/model_user.dart';
import 'package:sqllitebookmate/Dbconnection/crudfile.dart';

class userservice{
  late Repository  user1;
  userservice(){
    user1 = Repository();
  }
  SaveUser(user c) async{
    return await user1.insertData('user', c.usermap());
  }
  //Read All Users
  readAllUser() async{
    return await user1.readData('user');
  }
  //Edit User
  UpdateUser(user c) async{
    return await user1.updateData('user', c.usermap());
  }

  deleteUser(cid) async {
    return await user1.deleteDataById('user', cid);
  }

}
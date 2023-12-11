import 'package:sqlflutter2/model/model_category.dart';
import 'package:sqlflutter2/Dbconnection/crudfile.dart';

class categoryservice{
  late Repository  cat;
  categoryservice(){
    cat = Repository();
  }
  SaveCategory(category c) async{
    return await cat.insertData('data1', c.categorymap());
  }
  //Read All Users
  readAllCategory() async{
    return await cat.readData('data1');
  }
  //Edit User
  UpdateCategory(category c) async{
    return await cat.updateData('data1', c.categorymap());
  }

  deleteCategory(cid) async {
    return await cat.deleteDataById('data1', cid);
  }

}
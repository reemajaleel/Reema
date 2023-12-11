import 'package:sqllitebookmate/model/model_category.dart';
import 'package:sqllitebookmate/Dbconnection/crudfile.dart';

class categoryservice{
  late Repository  cat;
  categoryservice(){
    cat = Repository();
  }
  SaveCategory(category c) async{
    return await cat.insertData('category', c.categorymap());
  }
  //Read All Users
  readAllCategory() async{
    return await cat.readData('category');
  }
  //Edit User
  UpdateCategory(category c) async{
    return await cat.updateData('category', c.categorymap());
  }

  deleteCategory(cid) async {
    return await cat.deleteDataById('category', cid);
  }

  rawquerycategory(q) async{
    var dbClient =  cat;
    var result = await dbClient.rawquerys(q);
    return result;
  }

  readDataByIdCategory(cid) async{
    return await cat.readDataById('category', cid);
  }
}
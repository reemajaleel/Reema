import 'package:sqllitebookmate/model/model_book.dart';
import 'package:sqllitebookmate/Dbconnection/crudfile.dart';

class bookservice{
  late Repository  book1;
  bookservice(){
    book1 = Repository();
  }
  SaveBook(book c) async{
    return await book1.insertData('book', c.bookmap());
  }
  //Read All Users
  readAllBook() async{
    return await book1.readData('book');
  }
  //Edit User
  UpdateBook(book c) async{
    return await book1.updateData('book', c.bookmap());
  }


  rawqueryBook(q) async{
    var dbClient =  book1;
    var result = await dbClient.rawquerys(q);
    return result;
  }


  readDataByIdBook(bid) async{
    return await book1.readDataById('book', bid);
  }

  deleteBook(cid) async {
    return await book1.deleteDataById('book', cid);
  }

}
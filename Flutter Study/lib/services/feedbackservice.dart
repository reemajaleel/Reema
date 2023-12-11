import 'package:sqllitebookmate/model/model_feedback.dart';
import 'package:sqllitebookmate/Dbconnection/crudfile.dart';

class feedbacksservice{
  late Repository  feedback;
  feedbacksservice(){
    feedback = Repository();
  }
  SaveFeedback(feedbacks c) async{
    return await feedback.insertData('feedbacks', c.feedbackmap());
  }
  //Read All Users
  readAllFeedback() async{
    return await feedback.readData('feedbacks');
  }
  //Edit User
  UpdateFeedback(feedbacks c) async{
    return await feedback.updateData('feedbacks', c.feedbackmap());
  }

  deleteFeedback(cid) async {
    return await feedback.deleteDataById('feedbacks', cid);
  }

  rawqueryfeedback(q) async{
    var dbClient =  feedback;
    var result = await dbClient.rawquerys(q);
    return result;
  }

}
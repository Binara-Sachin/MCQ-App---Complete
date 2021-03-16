import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mcq_app/core/models/answer_model.dart';
import 'package:mcq_app/core/models/paper_model.dart';
import 'package:mcq_app/core/models/question_model.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference paperCollection = Firestore.instance.collection('papers');
  final CollectionReference studentCollection = Firestore.instance.collection('students');
  final CollectionReference teacherCollection = Firestore.instance.collection('teachers');

  //user ???
  Future updateUserData(String email, String password, bool teacher) async {
    if (teacher) {
      return await teacherCollection.document(uid).setData({
        'email': email,
        'password': password,
      });
    } else {
      return await studentCollection.document(uid).setData({
        'email': email,
        'password': password,
      });
    }
  }

  //save paper

  //get papers stream
  Stream<List<Paper>> get papers {
    return paperCollection.snapshots().map(_paperListFromSnapshot);
  }

  //get questions
  Stream<List<Question>> getQuestions(Paper paper) {
    final CollectionReference questionsCollection = Firestore.instance.collection(paper.collectionName);
    return questionsCollection.snapshots().map(_questionListFromSnapshot);
  }

  List<Question> _questionListFromSnapshot(QuerySnapshot snapshot) {
    print(snapshot);
    return snapshot.documents.map((doc) {
      return Question(
          text: doc.data['text'] ?? 'Error Getting Data',
          correctAnswer: doc.data['correct'] ?? 'Error Getting Data',
          answers: [
            Answer(
              text: doc.data['answer_1'] ?? 'Error Getting Data',
            ),
            Answer(
              text: doc.data['answer_2'] ?? 'Error Getting Data',
            ),
            Answer(
              text: doc.data['answer_3'] ?? 'Error Getting Data',
            ),
            Answer(
              text: doc.data['answer_4'] ?? 'Error Getting Data',
            ),
          ]);
    }).toList();
  }

  //paper list from snapshot
  List<Paper> _paperListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Paper(
        name: doc.data['Name'] ?? 'Error Getting Data',
        subject: doc.data['Subject'] ?? 'Error Getting Data',
        collectionName: doc.data['Collection'] ?? 'Error Getting Data',
        duration: Duration(minutes: doc.data['Duration'] ?? 0),
        //questions: _questionListFromSnapshot(doc.data['Questions']),
      );
    }).toList();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {

  //get
  final CollectionReference events = FirebaseFirestore.instance.collection('events');

  //CREATE
  //to add images
  Future<void>addEvent(String eventName, String description, String email, String location, String organizer){
    return events.add({
      'eventName': eventName,
      'description': description,
      'email': email,
      'location': location,
      'organizer': organizer,
      'images': [],
      // 'startDate': startDate,
      // 'endDate': endDate,
    });
  }

  //UPDATE
  Future<void> updateEvent(String eventId, String eventName, String description, String email, String location, String organizer){
    return events.doc(eventId).update({
      'eventName': eventName,
      'description': description,
      'email': email,
      'location': location,
      'organizer': organizer,
    }
    );
  }
}
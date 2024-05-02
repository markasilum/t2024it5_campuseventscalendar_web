import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {

  //get
  final CollectionReference events = FirebaseFirestore.instance.collection('events');

  //CREATE
  //to add images
  Future<void>addEvent(String eventName, String description, String email, String location, String organizer,List<String>_downloadUrls,){
    return events.add({
      'eventName': eventName,
      'description': description,
      'email': email,
      'location': location,
      'organizer': organizer,
      // 'images': _downloadUrls,
      'images':["missing"]
      // 'startDate': startDate,
      // 'endDate': endDate,
    });
  }

  //UPDATE
  Future<void> updateEvent(String eventId, String newEventName, String newDescription, String newEmail, String newLocation, String newOrganizer){
    return events.doc(eventId).update({
      'eventName': newEventName,
      'description': newDescription,
      'email': newEmail,
      'location': newLocation,
      'organizer': newOrganizer,
      'images': ['temp'],
    }
    );
  }
}
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2024it5_campuseventscalendar_web/provider/SignInProvider.dart';
import 'package:t2024it5_campuseventscalendar_web/services/firestoreservice.dart';
import 'package:t2024it5_campuseventscalendar_web/widgets/eventsCards.dart';
import 'package:t2024it5_campuseventscalendar_web/widgets/header.dart';
import 'package:t2024it5_campuseventscalendar_web/widgets/sideBarWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  void createEvent(
  BuildContext context, {
  String? eventId,
  String? eventName,
  String? description,
  String? email,
  String? location,
  String? organizer,
}) {
  final _homeScreenState = context.findAncestorStateOfType<_HomeScreenState>();
  _homeScreenState?.showCreateEventDialog(
    eventId: eventId,
    eventName: eventName,
    description: description,
    email: email,
    location: location,
    organizer: organizer,
  );

}
}

class _HomeScreenState extends State<HomeScreen> {

  final FireStoreService fireStoreService = FireStoreService();

  final ImagePicker picker = ImagePicker();

  List<XFile> _imageFiles = [];
  List<String> _downloadUrls = [];

  Future pickImage() async {
    List<XFile>? pickedImages = await picker.pickMultiImage();

    if (pickedImages!.isNotEmpty) {
      _imageFiles!.addAll(pickedImages);
    }
    print("Image List Length:" + _imageFiles!.length.toString());
    print(_imageFiles);
    setState((){});
  }

  Future uploadPhotos() async {
    print('upload images called');

    
  final path = 'images/';

  for (var imageFile in _imageFiles) {
    final file = File(imageFile.path);
    print("file path: ${file}");
    final ref = FirebaseStorage.instance.ref().child(path + imageFile.name);
    print("Reference to $ref");


    final uploadTask = await ref.putFile(file);

    final downloadUrl = await ref.getDownloadURL();
    print(downloadUrl);
    setState(() {
        _downloadUrls.add(downloadUrl);
      });
    
    // await uploadTask.whenComplete(() async {
    //   final downloadUrl = await ref.getDownloadURL();
    //   print(downloadUrl);
    //   setState(() {
    //     _downloadUrls.add(downloadUrl);
    //   });
    // });
  }
}

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();
  

  void showCreateEventDialog({String? eventId,String? eventName, String? description, String? email, String? location, String? organizer}) {
    nameController.text = eventName ?? '';
    descriptionController.text = description ?? '';
    emailController.text = email ?? '';
    locationController.text = location ?? '';
    organizationController.text = organizer ?? '';

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Create New Event',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              backgroundColor: Colors.white,
              content: Container(
                width: 600,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Name",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter name of event'),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      "Description",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Description'),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      "Email",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Email'),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      "Location",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextField(
                      controller: locationController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Location'),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      "Organization",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextField(
                      controller: organizationController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Organization'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                      
                     SizedBox(
                      width: 160,
                       child: ElevatedButton(
                        onPressed: ()=>pickImage(), 
                        child: Row(
                          children: [
                            const Icon(Icons.upload),
                            Text("Upload image")
                          ],
                        ),
                        ),
                     )

                    //  Text("Start Date", style: TextStyle(fontSize: 15),),
                    // TextField(),
                    // SizedBox(height: 5,),

                    //  Text("End Date", style: TextStyle(fontSize: 15),),
                    // TextField(),
                    // SizedBox(height: 5,),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    // fireStoreService.addEvent(nameController.text, descriptionController.text, emailController.text, locationController.text, organizationController.text);
                   

                    if(eventId == null){
                      print("id present");
                      uploadPhotos();
                      print(_downloadUrls);
                      fireStoreService.addEvent(nameController.text, descriptionController.text, emailController.text, locationController.text, organizationController.text, _downloadUrls);
                    
                    }else{
                       print("id not present");
                       print(eventId);
                       fireStoreService.updateEvent(eventId, nameController.text, descriptionController.text, emailController.text, locationController.text, organizationController.text, );
                    }
                     
                     nameController.clear();
                    descriptionController.clear();
                    emailController.clear();
                    locationController.clear();
                    organizationController.clear();

                    Navigator.pop(context);
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: Text("Add", style: TextStyle(color: Colors.white),)),
              ],
            )
            );
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF08228D),
        centerTitle: false,
        title: Header(),
        // actions: [
        //   TextButton(
        //     onPressed: () {
        //       // Add your onPressed action here
        //     },
        //     child: Container(
        //       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //       child: Row(
        //         children: [
        //           Icon(
        //             Icons.add,
        //             color: Color(0xFF08228D), // Set icon color to blue
        //           ),
        //           Text(
        //             'Add Event',
        //             style: TextStyle(
        //               color: Color(0xFF08228D), // Set text color to white
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: showCreateEventDialog,
        icon: const Icon(Icons.add),
        label: const Text("Add event"),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF08228D),
      ),
      body: Row(
        children: [
          SideBar(),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('events').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final events = snapshot.data?.docs.reversed.toList();
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Limit to three columns
                        crossAxisSpacing: 25.0, // Spacing between columns
                        mainAxisSpacing: 25.0, // Spacing between rows
                        childAspectRatio: .67),
                    itemCount: events!.length,
                    itemBuilder: (context, index) {
                      final event = events[index];

                      return EventCard(event: event);
                    },
                  ),
                );
              } else {
                return CircularProgressIndicator(); // Placeholder while data is loading
              }
            },
          ),
        ],
      ),
    );
  }
}

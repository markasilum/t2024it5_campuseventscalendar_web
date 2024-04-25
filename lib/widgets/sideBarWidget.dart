
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2024it5_campuseventscalendar_web/provider/SignInProvider.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
            final signInProvider = Provider.of<SignInProvider>(context, listen: false);

    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      height: screenSize.height,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey[400]
      ),
      child: Column(
        children: [
          // Container(
          //   height: 100,
          //   width: 100,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("/images/university-seal.png"))
          //   ),
          // ),
          SizedBox(height: 20,),
          Text("Community Center Asset Management System", textAlign: TextAlign.center,),
          SizedBox(height: 40),
          TextButton(
            onPressed: (){
              //  Navigator.pop(context);
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
            }, 
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Dashboard", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,),),
                ],
              ),
            )),
            SizedBox(height: 5),
          TextButton(
            onPressed: (){
              //  Navigator.pop(context);
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
            }, 
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Setting", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
            )),
             SizedBox(height: 5),
          TextButton(
            onPressed: (){
              //  Navigator.pop(context);
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
            }, 
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
            )),
            SizedBox(height: 5),
          TextButton(
            onPressed: () async {
                await signInProvider.signOutGoogle(context);
               
              },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Logout", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
            )),

            
        ],
      ),
    );
  }
}
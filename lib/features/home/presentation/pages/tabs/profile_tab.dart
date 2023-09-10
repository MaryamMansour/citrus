import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/cache_helper.dart';

class ProfileTab extends StatelessWidget {
  var userMail = CacheHelper.getData("UserMail");
  @override

  Widget build(BuildContext context) {return Scaffold(
    // appBar: AppBar(
    //   title: Text('User Profile'),
    //
    // ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CircleAvatar(
              radius: 30,
              // backgroundImage: AssetImage('assets/images/person.png'),
                 backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(50),
                  child: Image.asset('assets/images/person.png'),
                )
            ),
            SizedBox(height: 20),
            Text(
              'Username',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "$userMail",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Name'),
              subtitle: Text('name '),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text("$userMail"),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('011 12345688'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('Cairo , Egypt'),
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  CacheHelper.removeData("User");
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.login, (route) => false);
                  },
                child: Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }
}

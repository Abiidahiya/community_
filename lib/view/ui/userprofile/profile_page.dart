import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/view/ui/userdatawizard/wizard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:community/utils/constants/dimen.dart';
import 'package:community/uicomponents/button/roundedbutton.dart';
import 'package:community/view_model/userlogin/logout_all.dart';
import 'package:flutter_wizard/flutter_wizard.dart';
import 'package:get/get.dart';

import 'package:flutter/src/painting/image_provider.dart';
import 'package:community/uicomponents/images.dart';
import 'package:community/view_model/userwizard/wizard_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LogoutController _logoutController = Get.find<LogoutController>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final UserWizardController wizardController = Get.put(UserWizardController());
  User? _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    _user = _auth.currentUser;
    if (_user != null) {
      final uid = _user!.uid;
      final userDoc = await _firestore.collection('users').doc(uid).get();
      setState(() {
        _userData = userDoc.data() as Map<String, dynamic>;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedButton(
                btnName: 'Edit Profile', // Replace with your actual button text
                textStyle: const TextStyle(color: Colors.white),
                bgColor: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  wizardController.resetWizard();
                  Get.to(WizardPage());
                },
              ),
              SizedBox(height: Dimen_24), // Replace with your actual value
              Container(
                height: Dimen_500,
                width: Dimen_400,
                key: Key('userdata'),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary, // Change the color as needed
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: _userData != null
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 90, // Adjust the size as needed
                        backgroundImage: _userData != null && _userData!['photoURL'] != null
                            ? NetworkImage(_userData!['photoURL'])
                            : AssetImage(Images.blankdp) as ImageProvider, // Provide a default image
                      ),
                      Text(
                        'Name: ${_userData!['displayName']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Email: ${_userData!['email']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'UID: ${_userData!['uid']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Bio: ${_userData!['userbio']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Address: ${_userData!['address']}',
                        style: TextStyle(color: Colors.white),
                      ),


                    ],
                  )
                      : CircularProgressIndicator(), // Show loading indicator while fetching data
                ),
              ),

              SizedBox(height: 24),
              RoundedButton(
                btnName: 'Logout', // Replace with your actual button text
                textStyle: const TextStyle(color: Colors.white),
                bgColor: Theme.of(context).colorScheme.secondary,
                onPressed: () => _logoutController.logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



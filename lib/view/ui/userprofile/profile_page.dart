import 'package:community/view/ui/userdatawizard/wizard_page.dart';
import 'package:flutter/material.dart';
import 'package:community/utils/dimen.dart';
import 'package:community/uicomponents/button/roundedbutton.dart';
import 'package:community/utils/app_string_res.dart';
import 'package:community/utils/color.dart';
import 'package:community/view_model/logout_all.dart';
import 'package:get/get.dart';
import 'package:community/utils/font_size_constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LogoutController _logoutController = Get.find<LogoutController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(profilePage),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(profileMessage, style: TextStyle(fontSize: largeFontSize)),
            const SizedBox(height: Dimen_20),
            RoundedButton(
              btnName: editprofile,
              textStyle: const TextStyle(color: white),
              bgColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                Get.to(WizardPage());
              },
            ),
            const SizedBox(height: Dimen_150),
            RoundedButton(
              btnName: logout,
              textStyle: const TextStyle(color: white),
              bgColor: Theme.of(context).colorScheme.secondary,
              onPressed: () => _logoutController.logout(),
            ),
          ],
        ),
      ),
    );
  }
}




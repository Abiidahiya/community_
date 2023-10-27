import 'package:community/utils/app_string_res.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../view_model/nearbyusers/nearby_users_controller.dart';

class NearbyUsersPage extends StatelessWidget {
  final NearbyUsersController _controller = Get.put(NearbyUsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nearby_user_page),
      ),
      body: Obx(
            () {
          if (_controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: _controller.nearbyUsers.length,
              itemBuilder: (context, index) {
                var user = _controller.nearbyUsers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.photoURL),
                  ),
                  title: Text(user.displayName),
                  subtitle: Text(user.email),

                );
              },
            );
          }
        },
      ),
    );
  }
}
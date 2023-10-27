import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:community/utils/model_constants.dart';


class NearbyUsersController extends GetxController {
  var isLoading = true.obs;
  var nearbyUsers = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    exploreNearbyUsers();
  }

  Future<void> exploreNearbyUsers() async {
    try {
      print(current_position_fetch);
      Position currentUserPosition = await Geolocator.getCurrentPosition();
      print( '$currentUserPosition');

      double range = 0.1;

      double minLatitude = currentUserPosition.latitude - range;
      double maxLatitude = currentUserPosition.latitude + range;
      double minLongitude = currentUserPosition.longitude - range;
      double maxLongitude = currentUserPosition.longitude + range;

      print(user_query);
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(user_collection)
          .get();
      print('Query result: ${querySnapshot.docs.length} documents');


      nearbyUsers.clear();

      // Display nearby users
      for (QueryDocumentSnapshot document in querySnapshot.docs) {

        if (document.id == FirebaseAuth.instance.currentUser?.uid) {
          print('Skipping current user document: ${document.id}');
          continue;
        }

        Map<String, dynamic> userData =
        (document.data() as Map<String, dynamic>);

        double userLatitude = double.parse(userData[user_latitude].toString());
        double userLongitude = double.parse(userData[user_longitude].toString());

        if (userLatitude > minLatitude &&
            userLatitude < maxLatitude &&
            userLongitude > minLongitude &&
            userLongitude < maxLongitude) {
          print('Nearby User: ${userData[user_name]}, ${userData[user_email]}');


          String photoURL = userData[profile_pic] ?? '';
          nearbyUsers.add(UserModel.fromJson(userData, photoURL));
        }
      }

      isLoading.value = false;
      print(success_data_load);
    } catch (e) {
      print(nearby_user_error);
      isLoading.value = false;
    }
  }
}

class UserModel {
  final String displayName;
  final String email;
  final String photoURL; // Add this property

  UserModel({
    required this.displayName,
    required this.email,
    required this.photoURL,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String photoURL) {
    return UserModel(
      displayName: json[user_name] ?? '',
      email: json[user_email] ?? '',
      photoURL: photoURL,
    );
  }
}
import 'package:community/utils/font_size_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community/utils/app_string_res.dart';
import 'map_widget.dart';


class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
      ),
      body: MapWidget(),
    );
  }
}
import 'package:flutter/material.dart';

const continueWith="Continue with..";
const welcome='Welcome to the vegan community';

var facebookButton=ElevatedButton(
    style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12))),
    onPressed: (){

    }, child: const Text('Facebook'));
var googleButton=ElevatedButton(
    style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12))),
    onPressed: (){

    }, child: const Text('Google'));
var instagramButton=ElevatedButton(
    style:ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12))),
    onPressed: (){

    }, child: const Text('Instagram'));

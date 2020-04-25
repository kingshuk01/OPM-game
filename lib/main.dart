import 'dart:io';
import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';


void main() => runApp(new MaterialApp(home: Camera()));


class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  
  File _image;
  Future getImage(bool isCamera) async{
    File image;
    if(isCamera){
      debugPrint("cam");
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    }
    else{
      debugPrint("gal");
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image =image;
    });
  }

    List heroName =[
   "One Punch Man",
   "Genos",
   "Mummen Rider", 
   "Sweet Musk",
   "Puri Puri Prisoner",
   "Speed Sonic",
   "Watch Dog Man",
   "King",
   "Pig God",
   "Tang Top Master"
    ];

  
    List hero =[
   "images/opm.png",
   "images/genos.jpg",
   "images/mummen.jpg",
   "images/musk.jpg",
   "images/puri.jpg",
   "images/sonic.jpg",
   "images/watchdog.jpg",
   "images/king.jpg",
   "images/piggod.jpg",
   "images/tangtop.jpg"
   
    ];
     
    int r;
    
    int getRandom(){
        var ran = new Random();

        return ran.nextInt(9);
    }
    
  
    
 
    
  @override
  Widget build(BuildContext context) {
    r =getRandom();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("Hero Predictor"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
              icon: Icon(Icons.insert_drive_file), 
              onPressed:(){
                getImage(false);
              }),
            IconButton(
              icon: Icon(Icons.camera_alt), 
              onPressed: (){
                getImage(true);
              }),
              ],
            ),
          ),
          
           // Image.file(_image,height: 300.0,width: 300.0,),
          _image == null? Container() : Column(            
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Image.file(_image,height: 200,width: 200,),
                ),
                Container(
                  child: Image.asset("${hero.elementAt(r)}"),
                  
                ),
               
              ],
            ),
              _image == null? Container() : Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Text("${heroName.elementAt(r)}",style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold
                 ),),
               ),
               
                
              ],
            ),
          ) 
             
          ]
          ),
          
          
          
        ],
      ),
    );
  }

 
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart' as color;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SinglePlayer extends StatefulWidget {
  const SinglePlayer({Key? key}) : super(key: key);

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {

  final List<String> contents = [
    'Single Player',
    'Multiplayer',
    'Profile',
    'Exit',
  ];
  final Stream<QuerySnapshot> sSingleplayer = FirebaseFirestore.instance.collection("singlePlayer").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.AppColor.homePageBackground,
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 1.0,
        leading: IconButton(
          color: color.AppColor.homePageIcons,
          icon: const Icon(Icons.arrow_back,
          size: 30,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        title: Text('Game-Hub',
          style: GoogleFonts.getFont('Satisfy',
              textStyle: TextStyle(
                color: color.AppColor.homePageTitle,
                fontSize: 35,
                fontWeight: FontWeight.w600,
              )
          ),
        ),
        actions: [
          IconButton(
            color: color.AppColor.homePageIcons,
            icon: const Icon(Icons.search,
            size: 30,),
            onPressed: (){
            },
          ),
          PopupMenuButton(
            icon: Icon(Icons.menu_outlined,
              color: color.AppColor.homePageIcons,
            size: 35,),
            color: color.AppColor.homePageBackground,
            itemBuilder: (context){
              return contents
                  .map((e) => PopupMenuItem<String>(value: e, child: Text(e,
                style: GoogleFonts.getFont('Sarabun',
                    textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: color.AppColor.homePageSubtitle
                    )
                ),
              )
              )
              ).toList();
            },
            onSelected: (value){
              switch(value){
                case 'Single Player' :
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>const SinglePlayer()));
                  break;
                case 'Multiplayer' :
                  Fluttertoast.showToast(
                      msg: "Oops, Feature is not available yet. sorry :-(",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.black,
                      fontSize: 16.0
                  );;
                  break;
                case 'Profile' :
                  Fluttertoast.showToast(
                      msg: "Oops, Feature is not available yet. sorry :-(",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.black,
                      fontSize: 16.0
                  );
                  break;
                case 'Exit' :
                  SystemNavigator.pop();
                  break;
              }
            },
          ),
        ],
      ),
      backgroundColor: color.AppColor.homePageBackground,
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              Container(padding: const EdgeInsets.all(10),
                child: Text('Single Player Mode',
                style: GoogleFonts.getFont('Barlow Semi Condensed',
                textStyle: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600
                )
                )
                ),
              ),
              const SizedBox(width: 5,),
              Icon(Icons.videogame_asset_sharp,
              size: 40,
              color: color.AppColor.homePageSubtitle,),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top:15, left:10, right: 10, bottom: 10),
                height: 380,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder<QuerySnapshot>(
                  stream:sSingleplayer,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if(snapshot.hasError){
                      return Center(
                        child: Text('Something went wrong',
                          style: GoogleFonts.getFont('Barlow Semi Condensed',
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: color.AppColor.homePageTitle,
                              fontWeight: FontWeight.w600,
                            )
                        )
                        ),
                      );
                    }
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Row(
                        children:  [
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                          const SizedBox(width: 10,),
                          Text('Loading',
                            style: GoogleFonts.getFont('Barlow Semi Condensed',
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: color.AppColor.homePageTitle,
                              fontWeight: FontWeight.w600,
                            )
                            )
                          )
                        ],
                      );
                    }
                    return ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot document){
                            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                            return Card(
                              elevation: 0,
                              color: color.AppColor.homePageBackground,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(35),
                                  color: Colors.blue.shade100
                                ),
                                padding: const EdgeInsets.all(10),
                                child: ListTile(
                                  isThreeLine: false,
                                  title: Text('${data['Name']}',
                                      style: GoogleFonts.getFont('Barlow Semi Condensed',
                                          textStyle: TextStyle(
                                            fontSize: 20,
                                            color: color.AppColor.homePageTitle,
                                            fontWeight: FontWeight.w700,
                                          )
                                      ),
                                    ),
                                  subtitle: Row(
                                    children: [
                                      const SizedBox(height: 10,),
                                      Icon(Icons.access_time_outlined,
                                      color: color.AppColor.homePageIcons,
                                      size: 16,),
                                      const SizedBox(width: 5,),
                                      Text('${data['last played'].toDate()}',
                                      style: GoogleFonts.getFont('Barlow Semi Condensed',
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16
                                      )),),
                                    ],
                                  ),
                                  leading: Image.network('${data['picture']}',
                                    width: 70,
                                    height: 70,),
                                ),
                              ),
                            );
                          }).toList()
                      );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

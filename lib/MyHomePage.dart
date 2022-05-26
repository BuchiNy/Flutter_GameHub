import 'package:Flutter_GameHub/singleplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart' as color;

class homePage extends StatelessWidget {
   homePage({Key? key}) : super(key: key);

  final List<String> _contents = [
    'Single Player',
    'Multiplayer',
    'Profile',
    'Exit',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      appBar: AppBar(
        backgroundColor: color.AppColor.homePageBackground,
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 1.0,
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
                return _contents
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
                )
                    .toList();
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
                  );
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
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              const SizedBox(width: 10, height: 20,),
              Container(
                padding: const EdgeInsets.only(top: 10, right: 10,left: 10, bottom: 10),
                child: Text("Welcome to Game Hub",
                style:GoogleFonts.getFont('Sarabun',
                    textStyle: TextStyle(
                      color: color.AppColor.homePageTitle,
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    )
                ),
                )
              )
            ],
          ),
          const SizedBox(height:50,),
          Row(
            children: [
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.only(top: 10, right: 10,left: 10, bottom: 10),
                child:  InkWell(
                  onTap: () {
                    Get.to(() => const SinglePlayer());
                  },
                  child: Text('Single Player games',
                  style: GoogleFonts.getFont('Sarabun',
                    textStyle: TextStyle(
                      color: color.AppColor.homePageSubtitle,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                  ),
                ),
              ),
              InkWell
                (onTap: () {
                Get.to(() => const SinglePlayer());
              },
                  child: Icon(Icons.arrow_forward,
                    color: color.AppColor.homePageSubtitle,
                  )
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.only(top: 10, right: 10,left: 10, bottom: 10),
                child:  Text('Multiplayer games',
                  style: GoogleFonts.getFont('Sarabun',
                      textStyle: TextStyle(
                        color: color.AppColor.homePageSubtitle,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                ),
              ),
               Icon(Icons.arrow_forward,
                color: color.AppColor.homePageSubtitle,),
            ],
          ),
          const SizedBox(height:20,),
          SizedBox(
            height: 380,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(10),
                      // scrollDirection: Axis.horizontal,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: [
                        Container(
                          height: 15,
                          color: Colors.white10,
                          child:
                            Container(
                              color: Colors.white10,
                              padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                               Center(
                                          child: Image.asset('assets/IMG-20220519-WA0004.jpg',
                                            width: 120, height: 120,),
                                    ),
                                  const SizedBox(height: 10,),
                                  Center(
                                      child: Text("Board Games",
                                        style:GoogleFonts.getFont('Sarabun',
                                            textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            )
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                        ),
                        Container(
                          height: 15,
                          color: Colors.white10,
                          child:
                          Container(
                            padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Center(
                                          child: Image.asset('assets/1c716527afc780720743af8d17b5a1fd--icon-set-game-ui.jpg',
                                            width: 120, height: 120,),
                                      ),
                                const SizedBox(height: 10,),
                                Center(
                                    child: Text("Casual",
                                        style:GoogleFonts.getFont('Sarabun',
                                            textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            )
                                        ),
                                      )
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 15,
                          color: Colors.white10,
                          child:
                          Container(
                            padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                          child: Image.asset('assets/1129996.jpeg',
                                          width: 120, height: 120,)
                                      ),
                                const SizedBox(height: 10,),
                                Center(
                                      child: Text("Action",
                                        style:GoogleFonts.getFont('Sarabun',
                                            textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            )
                                        ),
                                      )
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 15,
                          color: Colors.white10,
                          child:
                          Container(
                            padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                          child: Image.asset('assets/1_mIjIjWIUc45MQjLDVkOC-w.png',
                                          width: 120, height: 120,)
                                      ),
                                const SizedBox(height: 10,),
                                Center(
                                    child: Text("Arcade Games",
                                        style:GoogleFonts.getFont('Sarabun',
                                            textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            )
                                        ),
                                      )
                                )
                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
          )
        ],
      ),
    );
  }
}

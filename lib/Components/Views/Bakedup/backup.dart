import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/Global/font.dart';
import '../../../Utils/Helpers/FirebaseHelper/firebasehelper.dart';

class BackUp extends StatefulWidget {
  const BackUp({super.key});

  @override
  State<BackUp> createState() => _BackUpState();
}

class _BackUpState extends State<BackUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Back Up",
          style: Global.size18,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        color: Colors.white,
        child: StreamBuilder(
          stream: Firestore_Helper.firestore_helper.fetchContact(),
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              QuerySnapshot<Map<String, dynamic>>? querySnapshot =
                  snapshot.data;
              List<QueryDocumentSnapshot<Map<String, dynamic>>>? userData =
                  querySnapshot?.docs;

              return ListView.builder(
                itemCount: userData?.length,
                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      GestureDetector(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Colors.orangeAccent.withOpacity(.7),
                              child: Center(
                                child: Text(
                                  "${userData?[i]['name'][0]}",
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    fontSize: 30,
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${userData?[i]['name']}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${userData?[i]['email']}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Firestore_Helper.firestore_helper.deleteUser(
                                    deleteData: "${userData?[i]['id']}");
                              },
                              icon: Icon(
                                Icons.delete,
                              ),
                            ),
                          ],
                        ),
                        onTap: () async {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

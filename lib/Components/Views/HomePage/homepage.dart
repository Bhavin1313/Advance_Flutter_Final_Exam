import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Model/ContactModel/contactmodel.dart';
import '../../../Utils/Global/font.dart';
import '../../../Utils/Global/globalvar.dart';
import '../../../Utils/Helpers/DataBaseHelper/dbhelper.dart';
import '../../../Utils/Helpers/FirebaseHelper/firebasehelper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.defaultDialog(
              title: "Add New Contact",
              titleStyle: Global.size17,
              content: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Name",
                      style: Global.size17,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Plese Enter Name";
                        } else {
                          return null;
                        }
                      },
                      controller: GlobalVar.name_c,
                      onSaved: (val) {
                        GlobalVar.name = val!;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.2),
                        hintText: "Enter Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xffB8B8B8),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Enter Email",
                      style: Global.size17,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Plese Enter Email";
                        } else {
                          return null;
                        }
                      },
                      controller: GlobalVar.email_c,
                      onSaved: (val) {
                        GlobalVar.email = val!;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.2),
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xffB8B8B8),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Enter Number",
                      style: Global.size17,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Plese Enter Number";
                        } else {
                          return null;
                        }
                      },
                      controller: GlobalVar.number_c,
                      onSaved: (val) {
                        GlobalVar.number = val!;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.2),
                        hintText: "Enter Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xffB8B8B8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              confirm: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState?.save();

                    Contact contact_data = Contact(
                      number: GlobalVar.number,
                      name: GlobalVar.name,
                      email: GlobalVar.email,
                    ); // Cate

                    int? res = await DB_Helper.db_helper
                        .insertContact(con_data: contact_data);
                    Get.snackbar(
                      backgroundColor: Colors.greenAccent.withOpacity(.7),
                      "Contact Diary App",
                      "Contact Successfully Inserted on $res....",
                    );

                    GlobalVar.number_c.clear();
                    GlobalVar.name_c.clear();
                    GlobalVar.email_c.clear();
                  }
                },
                child: Text(
                  "SAVE",
                  style: Global.size15,
                ),
              ),
              cancel: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    Contact contact = Contact(
                        email: GlobalVar.email,
                        name: GlobalVar.name,
                        number: GlobalVar.number);

                    Map<String, dynamic> res = await Firestore_Helper
                        .firestore_helper
                        .addContact(user_data: {
                      "name": contact.name,
                      "email": contact.email,
                      "number": contact.number,
                      "id": contact.id,
                    });
                  }
                },
                child: Text(
                  "BACKUP",
                  style: Global.size15,
                ),
              ),
              onConfirm: () {
                Get.back();
              });
        },
        label: Text("Add Contact"),
        icon: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/backup');
            },
            icon: Icon(
              Icons.backup,
            ),
          ),
        ],
        title: Text(
          "Home Page",
          style: Global.size17,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DB_Helper.db_helper.fetchContactData(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<Contact>? contactdata = snapshot.data;
            return ListView.builder(
              itemCount: contactdata!.length,
              itemBuilder: (ctx, i) {
                return Card(
                  color: Colors.white,
                  elevation: 3,
                  child: ListTile(
                    onTap: () {
                      Get.toNamed('/detail', arguments: contactdata[i]);
                    },
                    focusColor: Colors.white,
                    title: Text(
                      "${contactdata[i].name}",
                      style: Global.size18,
                    ),
                    subtitle: Text(
                      "${contactdata[i].number}",
                      style: Global.size16,
                    ),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.orangeAccent.withOpacity(.7),
                      child: Center(
                        child: Text(
                          "${contactdata[i].name[0]}",
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontSize: 30,
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () async {
                        await launchUrl(
                          Uri.parse("tel:+91${contactdata[i].number}"),
                        );
                      },
                      icon: Icon(
                        Icons.call,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

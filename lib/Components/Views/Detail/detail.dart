import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_extend/share_extend.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Model/ContactModel/contactmodel.dart';
import '../../../Utils/Global/font.dart';

class Detail_Page extends StatefulWidget {
  const Detail_Page({super.key});

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Contact data = ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: Global.size18,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orangeAccent.withOpacity(.7),
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 100,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${data.name}",
                style: Global.size30,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse("tel:+91${data.number}"),
                      );
                    },
                    child: Icon(Icons.phone),
                    heroTag: null,
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse("sms:+91${data.number}"),
                      );
                    },
                    child: Icon(Icons.chat),
                    heroTag: null,
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse("mailto:${data.email}"),
                      );
                    },
                    child: Icon(Icons.email),
                    heroTag: null,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      ShareExtend.share("${data.name}", "Text");
                    },
                    child: Icon(Icons.share),
                    heroTag: null,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 10),
                      child: Text(
                        "Contact info",
                        style: Global.size17,
                      ),
                    ),
                    ListTile(
                      leading: IconButton(
                        onPressed: () async {
                          await launchUrl(
                            Uri.parse("tel:+91${data.number}"),
                          );
                        },
                        icon: Icon(Icons.call),
                      ),
                      title: Text(
                        "${data.number}",
                        style: Global.size16,
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          await launchUrl(
                            Uri.parse("sms:+91${data.number}"),
                          );
                        },
                        icon: Icon(
                          Icons.chat,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                height: 200,
                width: w,
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact settings",
                      style: Global.size18,
                    ),
                    Row(
                      children: [
                        Icon(Icons.block),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Block Number",
                          style: Global.size15,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.contact_page_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Reminders",
                          style: Global.size15,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.voicemail),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Divert to voicemail",
                          style: Global.size15,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.link),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "View Linked contacts",
                          style: Global.size15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

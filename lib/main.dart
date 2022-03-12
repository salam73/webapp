// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter_example/InAppWebViewExampleScreen.dart';
import 'package:webview_flutter_example/myweb.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
void main() => runApp(
      MaterialApp(
        home: WebViewExample(),
        debugShowCheckedModeBanner: false,
      ),
    );

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        //backgroundColor: Colors.black,
        appBar: AppBar(
            toolbarHeight: 120,
            //title: const Text('eng70.com'),
            flexibleSpace: const Image(
              image: AssetImage('assets/company.jpg'),
              fit: BoxFit.cover,
            ),
            backgroundColor: Colors.transparent
            // This drop down menu demonstrates that Flutter widgets can be shown over the web view.

/* actions: <Widget>[
            NavigationControls(_controller.future),
            SampleMenu(_controller.future),
          ], */

            ),
        // We're using a Builder here so we have a context that is below the Scaffold
        // to allow calling Scaffold.of(context) so we can show a snackbar.
        body: Builder(builder: (BuildContext context) {
          return Center(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                // ignore: always_specify_types
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      myButton(context, 'https://eng70.com/hotel.html',
                          'حجز الفنادق', 'hotel.png'),
                      myButton(context, 'https://eng70.com', 'حجز الطيران',
                          'travel.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      myButton(context, 'https://eng70.com/about.html',
                          'معلومات عن الشركة', 'about.png'),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: openwhatsapp,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              height: MediaQuery.of(context).size.height / 7.5,
                              child: Card(
                                elevation: 7,
                                child: Image.asset(
                                  'assets/whatsapp.png',
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'الدعم الفني',
                            style: GoogleFonts.cairo(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
        // floatingActionButton: favoriteButton(),
      ),
    );
  }

  Widget myButton(
      BuildContext context, String link, String title, String assets) {
    return Column(children: <Widget>[
      SizedBox(
        width: MediaQuery.of(context).size.width / 2.2,
        height: MediaQuery.of(context).size.height / 7.5,
        child: GestureDetector(
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => InAppWebViewExampleScreen(
                  webLink: link,
                  title: title,
                ),
              ),
            );
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 7,
            child: Image.asset(
              'assets/$assets',
            ),
          ),
        ),
      ),
      Text(
        title,
        style: GoogleFonts.cairo(
            textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    ]);
  }

  // ignore: avoid_void_async
  void openwhatsapp() async {
    const String whatsapp = '+9647723771737';
    const String whatsappURl_android =
        'whatsapp://send?phone=' + whatsapp + '&text=السلام عليكم ';
    final String whatappURLIos =
        'https://wa.me/$whatsapp?text=${Uri.parse("السلام عليكم ")}';
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('whatsapp no installed')));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('whatsapp no installed')));
      }
    }
  }
}

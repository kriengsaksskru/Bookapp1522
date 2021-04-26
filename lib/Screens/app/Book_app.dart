import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookapp2 extends StatefulWidget {
  final String name;
  final String short_Stories;
  final String the_storyline;
  final String thoughts;
  final String photo;

  Bookapp2(
      {Key key,
      @required this.name,
      this.short_Stories,
      this.the_storyline,
      this.thoughts,
      this.photo})
      : super(key: key);
  @override
  _Bookapp2State createState() => _Bookapp2State();
}

class _Bookapp2State extends State<Bookapp2> {
  var templel;

  @override
  Widget build(BuildContext context) {
    @override
    // ignore: unused_element
    void initState() {
      super.initState();
      if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    }

    print(widget.short_Stories);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        title: Text(
          'นิทาน',
          style: GoogleFonts.kanit(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(0),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Text(
                    "${widget.name}",
                    style: GoogleFonts.kanit(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Card(
                child: Image.network('${widget.photo}'),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                margin: EdgeInsets.all(0),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: Text(
                    "${widget.short_Stories}",
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.red,
                      height: 2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: Text(
                    "${widget.the_storyline}",
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: Text(
                    "${widget.thoughts}",
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:BOOKAPP1522/Screens/app/Book_app.dart';
import 'package:http/http.dart' as Http;
import '../Login/components/background.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Search Bar',
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var jsonData;
  SearchBar searchBar;
  String searchKey = "";

  List<TemplelData> templeList = [];
  List<TemplelData> templeListShow = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      backgroundColor: Colors.blue.shade600,
      title: new Text(
        'นิทานทั้งหมด',
        style: GoogleFonts.kanit(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  void onSubmitted(String value) {
    setState(() {
      searchKey = value;
      _scaffoldKey.currentState.showSnackBar(
          new SnackBar(content: new Text('You search for $value!')));
    });
  }

  _MenuPageState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("Closed");
        });
  }

  Future<String> _getMenuAPI() async {
    var response =
        await Http.get('https://kriengsaksskru.github.io/book156/book.json');

    jsonData = json.decode(utf8.decode(response.bodyBytes));
    templeList.clear();
    for (var item in jsonData) {
      TemplelData templelData = TemplelData(item['photo'], item['name'],
          item['short_Stories'], item['the_storyline'], item['thoughts']);
      templeList.add(templelData);
    }
    if (searchKey == "") {
      templeListShow = templeList;
    } else {
      print(searchKey);
      templeListShow = templeList
          .where((element) => element.name.startsWith(searchKey))
          .toList();
    }

    return 'jsonData';
  }

  @override
  Widget build(BuildContext context) {
    var background = Background(
      child: FutureBuilder(
        future: _getMenuAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: templeListShow.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      )),
                  child: InkWell(
                    onTap: () {
                      // ! Use templeListShow to display temple data
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              // ignore: missing_required_param
                              builder: (context) => Bookapp2(
                                    photo: templeListShow[index].photo,
                                    name: templeListShow[index].name,
                                    short_Stories:
                                        templeListShow[index].short_Stories,
                                    the_storyline:
                                        templeListShow[index].the_storyline,
                                    thoughts: templeListShow[index].thoughts,
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(100),
                              ),
                            ),
                          ),
                          child: Image.network(
                            "${templeListShow[index].photo}",
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                              alignment: FractionalOffset.center,
                              width: double.infinity,
                              child: Text(
                                "${templeListShow[index].name}",
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      body: background,
    );
  }
}

class TemplelData {
  String photo;
  String name;
  String short_Stories;
  String the_storyline;
  String thoughts;

  TemplelData(this.photo, this.name, this.short_Stories, this.the_storyline,
      this.thoughts);
  startsWith(String searchKey) {}
}

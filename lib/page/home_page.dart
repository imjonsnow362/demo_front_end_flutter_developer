import 'package:onboarding_screen_example/main.dart';
import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:onboarding_screen_example/shared/listitem.dart';
import 'package:onboarding_screen_example/shared/listwidget.dart';

import '../details.dart';
import '../profile_page.dart';

class NewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {


  List<ListItem> listTiles = [
    ListItem(
      "https://www.aceshowbiz.com/images/photo/cristiano_ronaldo.jpg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "8 Jan 2020",
    ),
    ListItem(
      "https://www.aceshowbiz.com/images/photo/lionel_messi.jpg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "9 Jan 2020",
    ),
    ListItem(
      "https://dp.profilepics.in/profile_pictures/paul-pogba/paul-pogba-profile-pics-dp-for-whatsapp-facebook-290.jpg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "10 Jan 2020",
    ),
    ListItem(
      "https://dp.profilepics.in/profile_pictures/paul-pogba/paul-pogba-profile-pics-dp-for-whatsapp-facebook-290.jpg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "10 Jan 2020",
    ),
  ];


  List<Tab> _tabList = [
    Tab(
      child: Text("For you"),
    ),
    Tab(
      child: Text("Design"),
    ),
    Tab(
      child: Text("Beauty"),
    ),
    Tab(
      child: Text("Education"),
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build (BuildContext context){
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120.0,
          leading: IconButton(
            icon: Icon(
              Icons.category,
              color: Colors.black,
            ),
              onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),
                );},
            ),
          ],
          backgroundColor: Color(0XFFFAFAFA),
          centerTitle: true,
          title: Text(
            "Categories",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: TabBar(
              indicatorColor: Colors.redAccent,
              isScrollable: true,
              labelColor: Colors.black,
              controller: _tabController,
              tabs: _tabList,
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: ListView.builder(
                  itemCount: listTiles.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (
                          ) {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              item: listTiles[index],
                              tag: listTiles[index].newsTitle,
                            )
                        ));
                      },
                      child: listWidget(listTiles[index]),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(),
            ),

          ],
        )
    );
  }
}

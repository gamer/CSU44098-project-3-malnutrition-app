import 'package:flutter/material.dart';
import 'package:apoyo/services/apoyoDrawer.dart';
import 'package:apoyo/services/apoyoBottomNavBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<InfoListItem> data = [
    InfoListItem(imageURL: 'assets/honduras.jpeg',title: 'Info 1'),
    InfoListItem(imageURL: 'assets/honduras.jpeg',title: 'Info 2'),
    InfoListItem(imageURL: 'assets/honduras.jpeg',title: 'Info 3'),
    InfoListItem(imageURL: 'assets/honduras.jpeg',title: 'Info 4'),
    InfoListItem(imageURL: 'assets/honduras.jpeg',title: 'Info 5'),
    InfoListItem(imageURL: 'assets/honduras.jpeg',title: 'Info 6'),
    InfoListItem(imageURL: 'assets/honduras.jpeg',title: 'Info 7'),
    InfoListItem(imageURL: 'assets/honduras.jpeg',title: 'Info 8'),
    InfoListItem(imageURL: 'assets/honduras.jpeg',title: 'Info 9'),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          'Apoyo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: ApoyoDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: Offset(0,3),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/hondurasOutside.jpeg'),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 180, 10),
                  child: Text(
                    'Apoyo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),

                      ],
                    ),
                  ),
                ),
                Divider(),
                Text(
                  'A malnutrition tracker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    shadows: <Shadow>[Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(20),
                    onTap: (){},
                    leading: Image(
                      width: 100,
                      height: 100,
                      image: AssetImage(data[index].imageURL),
                    ),
                    title: Text(data[index].title),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: ApoyoBottomNavBar(),
    );
  }
}

class InfoListItem {
  String imageURL;
  String title;

  InfoListItem({this.imageURL, this.title});

}
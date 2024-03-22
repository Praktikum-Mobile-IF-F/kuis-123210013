import 'package:flutter/material.dart';
import 'package:kuis/data/top_album.dart';
import 'package:kuis/screens/detail.dart';
import 'package:kuis/screens/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          icon: Icon(
            Icons.logout_rounded,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            "Top Album",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontStyle: FontStyle.italic),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: topAlbumList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Detail(detail: topAlbumList[index]);
                }),
              );
            },
            child: Card(
              color: Colors. green[100],
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.network(
                topAlbumList[index].imageUrls,
                fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

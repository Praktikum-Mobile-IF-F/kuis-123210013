import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuis/data/top_album.dart';
import 'package:kuis/data/top_album.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  Detail({required this.detail, super.key});

  //mengganti nama list DataBuku menjadi detail (DataBuku diganti yang sesuai)
  TopAlbum detail;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isFavorit = false;

  @override
  void initState() {
    super.initState();
    isFavorit = widget.detail.isFavorit;
  }

  void toggleFavorit() {
    setState(() {
      isFavorit = !isFavorit;
      widget.detail.isFavorit = isFavorit;
    });

    final snackBar = SnackBar(
      content: (isFavorit == true)
          ? Text('Album ditambahkan ke favorit')
          : Text('Almbum dihapus dari favorit'),
      duration: Duration(seconds: 1),
      backgroundColor: isFavorit ? Colors.green : Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.undo, color: Colors.white),
        ),
        title: Center(
          child: Text(
            widget.detail.albumName,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontStyle: FontStyle.italic),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              toggleFavorit();
            },
            icon: Icon(
              isFavorit ? Icons.favorite : Icons.favorite_border,
              color: isFavorit ? Colors.red : Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Image.network(widget.detail.imageUrls)
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.detail.albumName,
                  style: TextStyle (fontSize: 35,fontWeight: FontWeight.bold)),
                  Text(widget.detail.singer),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_month_rounded),
                  SizedBox(width: 5),
                  Text(widget.detail.releaseDate),
                  SizedBox(width: 20),
                  Icon(Icons.business_rounded),
                  SizedBox(width: 5),
                  Text(widget.detail.source),
                ],
              ),
              Card(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child:  Text(
                    'Songlist',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                ),
                color: Colors.green,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.detail.songs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text('${index + 1}'),
                            SizedBox(width: 5),
                            Text('${widget.detail.songs[index]}'),
                          ]
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[100],
        onPressed: (){_launchURL(widget.detail.albumurl);},
        tooltip: 'Share Album',
        child: const Icon(Icons.share_rounded,
        color: Colors.black87,),
      ),
    );
  }
}

  Future<void> _launchURL (String url) async{
  if (await canLaunch(url)) {
    await launch(url);
  }else {
    throw 'Tidak Bisa Membuka $url';
  }
}


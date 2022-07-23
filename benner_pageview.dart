import 'package:flutter/material.dart';
import 'dart:convert'; //json convert
import 'package:http/http.dart' as http; //http connect
import 'package:app/page/view.dart'; //view page


class Qlist extends StatefulWidget {
  const Qlist({Key? key}) : super(key: key);

  @override
  State<Qlist> createState() => _QlistState();
}

class _QlistState extends State<Qlist> {
  
  //url data downloadn async structure // datatype dynamic not model class //json return
  Future<List<dynamic>> fetchBenner() async {
    var result = await http.get(Uri.parse('url'));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:       
      AppBar(title: Text('title'),),
      
      body:
      Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchBenner(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) => AnimalPage(
                                    content: snapshot.data[index]["content"])));
                      },
                      child: Container(
                        child: Image.network(snapshot.data[index]['thumbnail']),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

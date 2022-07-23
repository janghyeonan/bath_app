import 'package:flutter/material.dart';

class AnimalPage extends StatelessWidget {
  final String content; //param
  const AnimalPage({Key? key, required this.content}) : super(key: key); //add to required this.param

  @override
  Widget build(BuildContext context) {
    List<String> result = content.split(',');
    return Scaffold(
      appBar: AppBar(
        title: Text("DetailPage"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: result.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Image.network(
                result[index],
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}

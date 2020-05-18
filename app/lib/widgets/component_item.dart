import 'package:flutter/material.dart';

class ComponentItem extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> list;
  final Function selectItem;

  ComponentItem(
      {this.id,
      @required this.selectItem,
      @required this.title,
      @required this.list,
      @required this.imageUrl});

  @override
  _ComponentItemState createState() => _ComponentItemState();
}
void showComponents(){
  
}
class _ComponentItemState extends State<ComponentItem> {
  String imageUrl = 'asd';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      // itemCount: integers.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 90,
          child: Center(
              child: Ink.image(
            image: AssetImage(imageUrl),
            fit: BoxFit.fitWidth,
            child: InkWell(
              onTap: ()=>showComponents(),
            ),
          )),
        );
      },
    );
  }
}

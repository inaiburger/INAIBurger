import 'package:flutter/material.dart';
import 'package:inaiburger/models/component_images.dart';

const _horizontalPadding = 32.0;
const _carouselItemMargin = 8.0;

class AnimSliderWidget extends StatefulWidget {
  final int component;
  AnimSliderWidget(this.component);
  @override
  _AnimSliderWidgetState createState() => _AnimSliderWidgetState();
}

class _AnimSliderWidgetState extends State<AnimSliderWidget> {
  PageController pageController;
  int currentPage = 0;
  List<List> lists = [
    componentImages,
    componentImagesMeat,
    componentImagesLettuce,
    componentImagesGar,
    componentImagesBunbot
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final width = MediaQuery.of(context).size.width;
    final padding = (_horizontalPadding * 2) - (_carouselItemMargin * 2);
    pageController = PageController(
        initialPage: currentPage, viewportFraction: (width - padding) / width);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: PageView(
          onPageChanged: (index) {
            currentPage = index;
            slider[widget.component] = index;
          },
          controller: pageController,
          children: <Widget>[
            for (int i = 0; i < lists[widget.component].length; i++)
              buildItem(i)
          ],
        ),
      ),
    ]));
  }

  Widget buildItem(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
        } else {
          value = (currentPage - index).toDouble();
        }
        value = (1 - (value.abs() * .5)).clamp(0, 1).toDouble();
        value = Curves.bounceInOut.transform(value);
        return Center(
          child: Transform(
            transform: Matrix4.diagonal3Values(1.0, value, 1.0),
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Image.asset(
                lists[widget.component][index],
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}

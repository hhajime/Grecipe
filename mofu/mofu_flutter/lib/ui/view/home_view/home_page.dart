import 'package:flutter/material.dart';
import 'package:mofu_flutter/ui/view/home_view/Group140Widget.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 120,
          decoration: const BoxDecoration(
              color: Color(0xffFFBA7D),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Center(
            child: Text('우리집 냉장고'),
          ),
        ),
        Container(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              AspectRatio(
                aspectRatio: 2.5,
                child: PageView(
                  controller: _controller,
                  children: [
                    Container(
                      child: Group140Widget(),
                    ),
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              ScrollingPageIndicator(
                  dotColor: Colors.grey,
                  dotSelectedColor: Colors.deepPurple,
                  dotSize: 6,
                  dotSelectedSize: 8,
                  dotSpacing: 12,
                  controller: _controller,
                  itemCount: 3,
                  orientation: Axis.horizontal),
            ],
          ),
        ),
      ],
    ));
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_app_ui/pages/delivery/delivery_screen.dart';
import 'package:food_app_ui/pages/trending/trending_screen.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  double _progress = 0;
  double trendingOBS = 0.5;
  double deliveryOBS = 1;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _progress = _pageController.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double safeAreaHeight = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    double remainingHeight = size.height - safeAreaHeight;
    if (_progress == 1) {
      trendingOBS = 1;
      deliveryOBS = 0.5;
    } else if (_progress == 0) {
      trendingOBS = 0.5;
      deliveryOBS = 1;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Image.asset('assets/images/offers/1.jpg'),
                Image.asset('assets/images/offers/2.jpg'),
                Image.asset('assets/images/offers/3.jpg'),
              ],
              options: CarouselOptions(
                height: size.width / 2,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 8),
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                onPageChanged: (index, reason) {},
                scrollDirection: Axis.horizontal,
              ),
            ),
            ScrollPages(
              remainingHeight: remainingHeight,
              titles: [
                'Delivery',
                'Trending',
                'Delivery',
                'Trending',
              ],
              pages: [
                DeliveryScreen(),
                TrendingScreen(),
                DeliveryScreen(),
                TrendingScreen(),
              ],
              pageController: _pageController, // Pass the PageController
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollPages extends StatefulWidget {
  final double remainingHeight;
  final List<String> titles;
  final List<Widget> pages;
  final PageController pageController; // Add a PageController property

  const ScrollPages({
    Key? key,
    required this.remainingHeight,
    required this.titles,
    required this.pages,
    required this.pageController, // Add required PageController parameter
  }) : super(key: key);

  @override
  _ScrollPagesState createState() => _ScrollPagesState();
}

class _ScrollPagesState extends State<ScrollPages> {
  int _selectedTitleIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_handlePageChange);
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {
      _selectedTitleIndex = widget.pageController.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.remainingHeight - 100,
      child: Column(
        children: [
          Container(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.titles.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    gradient: const SweepGradient(
                      colors: [Color(0xfffca200), Color(0xfffee941)],
                    ),
                    color: _selectedTitleIndex == index
                        ? Colors.red.withOpacity(0.9)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.black.withOpacity(0.9),
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0, 0),
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTitleIndex = index;
                      });
                      widget.pageController.animateToPage(
                        index,
                        duration: Duration(seconds: 1),
                        curve: Curves.ease,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.titles[index],
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 126, 59, 1),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: PageView(
              controller: widget.pageController,
              children: widget.pages,
              onPageChanged: (index) {
                setState(() {
                  _selectedTitleIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testfeflutterordo/screen_page/nav_bar.dart';

class HomeScreenEmpty extends StatefulWidget {
  @override
  _HomeScreenEmptyState createState() => _HomeScreenEmptyState();
}

class _HomeScreenEmptyState extends State<HomeScreenEmpty> {
  late final PageController _pageController;
  int _currentPageIndex = 0;
  final List<String> _imagePaths = [
    'lib/assets/carousel.png',
    'lib/assets/carousel.png',
    'lib/assets/carousel.png',
  ];

  int _notificationCount = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPageIndex,
    );
    _startAutoPageView();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPageView() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPageIndex < _imagePaths.length - 1) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('lib/assets/profile.png'),
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Temukan Hunian\nImpian',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF334A34),
                              ),
                            ),
                            Text(
                              'agent properti terbaik',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          icon: Icon(Icons.notifications,
                              color: Color(0xFF334A34)),
                          onPressed: () {},
                        ),
                        if (_notificationCount > 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Center(
                                child: Text(
                                  '$_notificationCount',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                height: 200.0,
                child: Card(
                  elevation: 4,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _imagePaths.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _buildPageViewItem(_imagePaths[index]);
                    },
                  ),
                ),
              ),
              SizedBox(height: 35.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pesanan Terbaru',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF334A34),
                          ),
                        ),
                        Text(
                          'Daftar pesanan terbaru anda',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF334A34),
                      size: 20.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70.0),
              Center(
                child: Image.asset(
                  'lib/assets/empty.png',
                  height: 196.66,
                  width: 318.76,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12.0),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pesanan Kosong',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF334A34),
                      ),
                    ),
                    Text(
                      'Ayo tambahkan pesanan baru',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreenEmpty()),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Eksplor Properti',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        backgroundColor: Color(0xFF334A34),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        minimumSize: Size(200, 40),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageViewItem(String imagePath) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardCarousel extends StatefulWidget {
  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 180.0,
            autoPlay: false,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: List.generate(5, (index) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  color: Colors.white,
                  elevation: 3,
                  child: Container(
                    width: double.infinity,
                    height: 180.0,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                '#881726478123',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF334A34),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SizedBox(
                                    width: 150.0,
                                    height: 100.0,
                                    child: Image.asset(
                                      'lib/assets/card.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.home,
                                            color: Color(0xFF334A34),
                                            size: 16.0,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            'Candra Bhirawa',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color(0xFF334A34),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Color(0xFF334A34),
                                            size: 16.0,
                                          ),
                                          SizedBox(width: 8.0),
                                          Expanded(
                                            child: Text(
                                              'Lotus, Kavling A1, Blok B No. 4',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Color(0xFF334A34),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            color: Color(0xFF334A34),
                                            size: 16.0,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            '25/11/2022, 09:00',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color(0xFF334A34),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        'Rp 850.000.000',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF334A34),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          top: 16.0,
                          right: 16.0,
                          child: ElevatedButton(
                            onPressed: () {
                              // Button action
                            },
                            child: Text(
                              'Komersil',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF9ACA3E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Color(0xFF9ACA3E)
                    : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}

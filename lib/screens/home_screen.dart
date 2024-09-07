import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  // Sample data for the carousel
  final List<Map<String, String>> carouselItems = [
    {
      'title': 'Beautiful Sunset',
      'image': 'assets/images/slide1.jpg',
    },
    {
      'title': 'Beautiful Sunset',
      'image': 'assets/images/slide2.jpg',
    },
  ];

  // Sample data for the carousel
  final List<Map<String, String>> contactItems = [
    {
      'title': 'Viber',
      'image': 'assets/images/viber.png',
      'data': "https://cutt.ly/regeRvDR"
    },
    {
      'title': 'Telegram',
      'image': 'assets/images/telegram.png',
      'data': "https://t.me/skmtaungpawthar"
    },
    {
      'title': 'Messenger',
      'image': 'assets/images/messenger.png',
      'data': "https://m.me/102537869192132"
    },
  ];

  HomeScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri url0 = Uri.parse(url);

    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taung Paw Thar'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Carousel Slider
          CarouselSlider(
            options: CarouselOptions(
              height: 160.0,
              autoPlay: true,
              enlargeFactor: 0.2,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
            items: carouselItems.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      item['image']!,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          // Flexible GridView that scrolls independently
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: contactItems
                    .length, // Define the number of items in the grid
                itemBuilder: (context, index) {
                  return Container(
                    child: Center(
                      child: GestureDetector(
                        child: Column(
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                contactItems[index]['image']!,
                                height: 48,
                                width: 48,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              contactItems[index]['title']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          _launchUrl(contactItems[index]['data']!);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

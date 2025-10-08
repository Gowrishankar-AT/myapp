
import 'package:flutter/material.dart';
import '../models/establishment.dart';
import 'establishment_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Establishment> establishments = [
    Establishment(
      name: 'Grand Hyatt',
      type: 'Hotel',
      imageUrl: 'https://picsum.photos/seed/hotel1/800/600',
      description: 'A 5-star hotel with a stunning view.',
      galleryImageUrls: [
        'https://picsum.photos/seed/hotel2/800/600',
        'https://picsum.photos/seed/hotel3/800/600',
      ],
      rentPerDay: 250.0,
      rentPerPerson: 75.0,
      bookedDates: [DateTime(2024, 8, 10), DateTime(2024, 8, 11)],
    ),
    Establishment(
      name: 'The Golden Spoon',
      type: 'Restaurant',
      imageUrl: 'https://picsum.photos/seed/restaurant1/800/600',
      description: 'Fine dining with a variety of cuisines.',
      galleryImageUrls: [
        'https://picsum.photos/seed/restaurant2/800/600',
      ],
      rentPerDay: 0,
      rentPerPerson: 50.0,
      bookedDates: [],
    ),
    Establishment(
        name: 'The Royal Banquet',
        type: 'Banquet',
        imageUrl: 'https://picsum.photos/seed/banquet1/800/600',
        description: 'A grand hall for all your special occasions.',
        galleryImageUrls: [],
        rentPerDay: 1200.0,
        rentPerPerson: 0,
        bookedDates: [DateTime(2024, 9, 5)]),
    Establishment(
      name: 'The Ritz-Carlton',
      type: 'Hotel',
      imageUrl: 'https://picsum.photos/seed/hotel2/800/600',
      description: 'Experience luxury like never before.',
      galleryImageUrls: [
        'https://picsum.photos/seed/hotel1/800/600',
        'https://picsum.photos/seed/hotel3/800/600',
      ],
      rentPerDay: 400.0,
      rentPerPerson: 120.0,
      bookedDates: [],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.hotel, color: Colors.white),
            const SizedBox(width: 8),
            const Text('Plan My Trip'),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Hotels'),
            Tab(text: 'Restaurants'),
            Tab(text: 'Banquets'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEstablishmentList('All'),
          _buildEstablishmentList('Hotel'),
          _buildEstablishmentList('Restaurant'),
          _buildEstablishmentList('Banquet'),
        ],
      ),
    );
  }

  Widget _buildEstablishmentList(String type) {
    final filteredList = type == 'All'
        ? establishments
        : establishments.where((e) => e.type == type).toList();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final establishment = filteredList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EstablishmentDetailScreen(establishment: establishment),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.all(12.0),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    establishment.imageUrl,
                    height: 200,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        establishment.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        establishment.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


import 'package:flutter/material.dart';
import '../models/establishment.dart';

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
      imageUrl: 'https://picsum.photos/seed/picsum/200/300',
      description: 'A 5-star hotel with a stunning view.',
    ),
    Establishment(
      name: 'The Golden Spoon',
      type: 'Restaurant',
      imageUrl: 'https://picsum.photos/seed/picsum/200/300',
      description: 'Fine dining with a variety of cuisines.',
    ),
    Establishment(
      name: 'The Royal Banquet',
      type: 'Banquet',
      imageUrl: 'https://picsum.photos/seed/picsum/200/300',
      description: 'A grand hall for all your special occasions.',
    ),
    Establishment(
        name: 'The Ritz-Carlton',
        type: 'Hotel',
        imageUrl: 'https://picsum.photos/seed/picsum/200/300',
        description: 'Experience luxury like never before.'),
    Establishment(
        name: 'The Olive Kitchen',
        type: 'Restaurant',
        imageUrl: 'https://picsum.photos/seed/picsum/200/300',
        description: 'A cozy restaurant with a rustic ambiance.'),
    Establishment(
        name: 'The Crystal Ballroom',
        type: 'Banquet',
        imageUrl: 'https://picsum.photos/seed/picsum/200/300',
        description: 'A beautiful ballroom for weddings and events.'),
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
        title: const Text('Hotel & Event Booking'),
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
        return Card(
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
        );
      },
    );
  }
}

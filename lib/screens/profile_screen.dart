
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/user.dart';
import '../models/booking.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock user data
    final user = User(name: 'John Doe', phoneNumber: '+1 123-456-7890');

    // Mock list of previous bookings
    final bookings = [
      Booking(establishmentName: 'Grand Hyatt', date: '2024-07-15', status: 'Completed'),
      Booking(establishmentName: 'The Ritz-Carlton', date: '2024-06-20', status: 'Completed'),
      Booking(establishmentName: 'Le Bernardin', date: '2024-05-10', status: 'Cancelled'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: GoogleFonts.oswald(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=a042581f4e29026704d'),
            ),
            const SizedBox(height: 10),
            Text(
              user.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              user.phoneNumber,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Previous Bookings',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.hotel,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      booking.establishmentName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Date: ${booking.date}'),
                    trailing: Text(
                      booking.status,
                      style: TextStyle(
                        color: booking.status == 'Completed' ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

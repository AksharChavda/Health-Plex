import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/slot.dart';
import '../services/supabase_service.dart';

class SlotBookingScreen extends StatelessWidget {
  final Slot slot;

  const SlotBookingScreen({Key? key, required this.slot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Slot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Slot Time: ${slot.startTime.hour}:${slot.startTime.minute}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Capacity: ${slot.capacity}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                final supabaseService = SupabaseService();
                final user = Supabase.instance.client.auth.currentUser;

                if (user != null) {
                  await supabaseService.bookSlot(user.id, slot.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Slot booked successfully!')),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User not logged in!')),
                  );
                }
              },
              child: const Text('Book Slot'),
            ),
          ],
        ),
      ),
    );
  }
}

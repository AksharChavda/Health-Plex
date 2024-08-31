import 'package:flutter/material.dart';
import '../services/supabase_service.dart';
import '../models/slot.dart';
import 'slot_booking_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slot Booking'),
      ),
      body: FutureBuilder<List<Slot>>(
        future: SupabaseService().fetchSlots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final slots = snapshot.data!;
          return ListView.builder(
            itemCount: slots.length,
            itemBuilder: (context, index) {
              final slot = slots[index];
              return ListTile(
                title: Text(
                    'Slot at ${slot.startTime.hour}:${slot.startTime.minute}'),
                subtitle: Text('Capacity: ${slot.capacity}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SlotBookingScreen(slot: slot),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

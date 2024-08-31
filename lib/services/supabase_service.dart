import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user.dart' as local; // Prefix to avoid naming conflict
import '../models/slot.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Slot>> fetchSlots() async {
    final response = await _client
        .from('slots')
        .select()
        .order('start_time', ascending: true)
        .execute();

    if (response.error != null) {
      throw response.error!;
    }

    final data = response.data as List<dynamic>;
    return data.map((json) => Slot.fromJson(json)).toList();
  }

  Future<local.User> getUserById(String userId) async {
    final response = await _client
        .from('users')
        .select()
        .eq('id', userId)
        .single()
        .execute();

    if (response.error != null) {
      throw response.error!;
    }

    return local.User.fromJson(response.data);
  }

  Future<void> bookSlot(String userId, String slotId) async {
    final response = await _client
        .from('users')
        .update({
          'booked_slot': slotId,
          'booking_date': DateTime.now().toIso8601String(),
        })
        .eq('id', userId)
        .execute();

    if (response.error != null) {
      throw response.error!;
    }

    await _client
        .from('slots')
        .update({'capacity': 'capacity - 1'})
        .eq('id', slotId)
        .execute();
  }
}

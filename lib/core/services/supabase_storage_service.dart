import 'package:fruits_hub_dashboard/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  static late Supabase _supabase;

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSubabaseUrl,
      anonKey: kSubabaseApiKey,
    );
  }
}

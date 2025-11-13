import 'dart:io';

import 'package:fruits_hub_dashboard/constants.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static createBucket(String bucketName) async {
    await _supabase.client.storage.createBucket(bucketName);
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSubabaseUrl,
      anonKey: kSubabaseApiKey,
    );
  }

  @override
  Future<String> uploadFile(String path, File file) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);
    var result = await _supabase.client.storage
        .from('fruits_bucket')
        .update('$path/$fileName.$extensionName', file);
    return result;
  }
}

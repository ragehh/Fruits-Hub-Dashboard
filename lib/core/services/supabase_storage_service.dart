import 'dart:io';

import 'package:fruits_hub_dashboard/constants.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static createBucket(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExists = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExists = true;
        break;
      }
    }
    if (!isBucketExists) {
      await _supabase.client.storage.createBucket(bucketName);
    }
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
    var result = await _supabase.client.storage
        .from('fruits_bucket')
        .upload('$path/$fileName', file);
    var fileUrl = _supabase.client.storage
        .from('fruits_bucket')
        .getPublicUrl('$path/$fileName');
    return fileUrl;
  }
}

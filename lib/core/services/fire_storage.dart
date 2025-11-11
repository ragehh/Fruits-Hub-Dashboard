import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance;

  @override
  Future<String> uploadFile(String file) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}

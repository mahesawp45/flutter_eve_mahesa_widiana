import 'package:get_storage/get_storage.dart';

class Storage {
  // final GetStorage _box = GetStorage();

  save({required String key, required dynamic data}) async {
    final GetStorage box = GetStorage();
    await box.write(key, data);
  }

  dynamic get({required String key}) {
    final GetStorage box = GetStorage();
    return box.read(key);
  }

  delete({required String key}) {
    final GetStorage box = GetStorage();
    box.remove(key);
  }
}

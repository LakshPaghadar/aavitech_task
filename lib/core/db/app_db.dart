
import 'package:hive/hive.dart';

import '../locator/locator.dart';

class AppDB {
  static const _appDbBox = '_appDbBox';
  final Box<dynamic> _box;

  AppDB._(this._box);

  static Future<AppDB> getInstance() async {
    final box = await Hive.openBox<dynamic>(_appDbBox);
    return AppDB._(box);
  }

  T getValue<T>(String key, {T? defaultValue}) =>
      _box.get(key, defaultValue: defaultValue) as T;

  Future<void> setValue<T>(String key, T value) => _box.put(key, value);

  bool get firstTime => getValue("firstTime", defaultValue: true);

  set firstTime(bool update) => setValue("firstTime", update);

}

AppDB appHiveDb=locator.get<AppDB>();

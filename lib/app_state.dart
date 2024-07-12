import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _userid = await secureStorage.getInt('ff_userid') ?? _userid;
    });
    await _safeInitAsync(() async {
      _phonenum = await secureStorage.getString('ff_phonenum') ?? _phonenum;
    });
    await _safeInitAsync(() async {
      _locationname =
          await secureStorage.getString('ff_locationname') ?? _locationname;
    });
    await _safeInitAsync(() async {
      _slotId = await secureStorage.getString('ff_slotId') ?? _slotId;
    });
    await _safeInitAsync(() async {
      _robotqrcode =
          await secureStorage.getString('ff_robotqrcode') ?? _robotqrcode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _scanResult = '';
  String get scanResult => _scanResult;
  set scanResult(String value) {
    _scanResult = value;
  }

  String _wrongscanresult = '';
  String get wrongscanresult => _wrongscanresult;
  set wrongscanresult(String value) {
    _wrongscanresult = value;
  }

  String _loginscanimage = '';
  String get loginscanimage => _loginscanimage;
  set loginscanimage(String value) {
    _loginscanimage = value;
  }

  int _userid = 0;
  int get userid => _userid;
  set userid(int value) {
    _userid = value;
    secureStorage.setInt('ff_userid', value);
  }

  void deleteUserid() {
    secureStorage.delete(key: 'ff_userid');
  }

  String _phonenum = '';
  String get phonenum => _phonenum;
  set phonenum(String value) {
    _phonenum = value;
    secureStorage.setString('ff_phonenum', value);
  }

  void deletePhonenum() {
    secureStorage.delete(key: 'ff_phonenum');
  }

  String _locationname = '';
  String get locationname => _locationname;
  set locationname(String value) {
    _locationname = value;
    secureStorage.setString('ff_locationname', value);
  }

  void deleteLocationname() {
    secureStorage.delete(key: 'ff_locationname');
  }

  String _slotId = '';
  String get slotId => _slotId;
  set slotId(String value) {
    _slotId = value;
    secureStorage.setString('ff_slotId', value);
  }

  void deleteSlotId() {
    secureStorage.delete(key: 'ff_slotId');
  }

  List<String> _storename = [];
  List<String> get storename => _storename;
  set storename(List<String> value) {
    _storename = value;
  }

  void addToStorename(String value) {
    storename.add(value);
  }

  void removeFromStorename(String value) {
    storename.remove(value);
  }

  void removeAtIndexFromStorename(int index) {
    storename.removeAt(index);
  }

  void updateStorenameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    storename[index] = updateFn(_storename[index]);
  }

  void insertAtIndexInStorename(int index, String value) {
    storename.insert(index, value);
  }

  String _robotqrcode = '';
  String get robotqrcode => _robotqrcode;
  set robotqrcode(String value) {
    _robotqrcode = value;
    secureStorage.setString('ff_robotqrcode', value);
  }

  void deleteRobotqrcode() {
    secureStorage.delete(key: 'ff_robotqrcode');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}

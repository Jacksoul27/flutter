import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _urlvirtualshowroom =
          prefs.getString('ff_urlvirtualshowroom') ?? _urlvirtualshowroom;
    });
    _safeInit(() {
      _leadsname = prefs.getString('ff_leadsname') ?? _leadsname;
    });
    _safeInit(() {
      _startdate = prefs.containsKey('ff_startdate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_startdate')!)
          : _startdate;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _urlvirtualshowroom = 'http://172.16.6.34:81/Elegant/';
  String get urlvirtualshowroom => _urlvirtualshowroom;
  set urlvirtualshowroom(String value) {
    _urlvirtualshowroom = value;
    prefs.setString('ff_urlvirtualshowroom', value);
  }

  int _greetings = 0;
  int get greetings => _greetings;
  set greetings(int value) {
    _greetings = value;
  }

  bool _fab = false;
  bool get fab => _fab;
  set fab(bool value) {
    _fab = value;
  }

  bool _showStyle = false;
  bool get showStyle => _showStyle;
  set showStyle(bool value) {
    _showStyle = value;
  }

  String _leadsname = '';
  String get leadsname => _leadsname;
  set leadsname(String value) {
    _leadsname = value;
    prefs.setString('ff_leadsname', value);
  }

  DateTime? _startdate = DateTime.fromMillisecondsSinceEpoch(1702400400000);
  DateTime? get startdate => _startdate;
  set startdate(DateTime? value) {
    _startdate = value;
    value != null
        ? prefs.setInt('ff_startdate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_startdate');
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

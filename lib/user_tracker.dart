import 'package:shared_preferences/shared_preferences.dart';

class UserTracker {
  static late SharedPreferences _preferences;

  static const _keyGeographyIndex = 'geographyIndex';
  static const _keyHistoryIndex = 'historyIndex';
  static const _keyStatsIndex = 'statsIndex';
  static const _keyTransfersIndex = 'transfersIndex';
  static const _keyGossipIndex = 'gossipIndex';
  static const _keyLineupsIndex = 'lineupsIndex';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setGeographyIndex(int questionIndex) async =>
      await _preferences.setInt(_keyGeographyIndex, questionIndex);

  static int getGeographyIndex() {
    return _preferences.getInt(_keyGeographyIndex) ?? 0;
  }

  static Future setHistoryIndex(int questionIndex) async =>
      await _preferences.setInt(_keyHistoryIndex, questionIndex);

  static int getHistoryIndex() {
    return _preferences.getInt(_keyHistoryIndex) ?? 0;
  }

  static Future setStatsIndex(int questionIndex) async =>
      await _preferences.setInt(_keyStatsIndex, questionIndex);

  static int getStatsIndex() {
    return _preferences.getInt(_keyStatsIndex) ?? 0;
  }

  static Future setTransfersIndex(int questionIndex) async =>
      await _preferences.setInt(_keyTransfersIndex, questionIndex);

  static int getTransfersIndex() {
    return _preferences.getInt(_keyTransfersIndex) ?? 0;
  }

  static Future setGossipIndex(int questionIndex) async =>
      await _preferences.setInt(_keyGossipIndex, questionIndex);

  static int getGossipIndex() {
    return _preferences.getInt(_keyGossipIndex) ?? 0;
  }

  static Future setLineupsIndex(int questionIndex) async =>
      await _preferences.setInt(_keyLineupsIndex, questionIndex);

  static int getLineupsIndex() {
    return _preferences.getInt(_keyLineupsIndex) ?? 0;
  }
}

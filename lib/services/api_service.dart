import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.stagingcupid.com/api/v1';
  static const String apiKey = 'sA,{tzUD=]dHvYNBJ4xVZ3c=&zS%.UqVc{But?kc';

  static Future<String> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return 'Android/${androidInfo.version.sdkInt}';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return 'iOS/${iosInfo.systemVersion}';
    }
    return '';
  }

  static Future<String> generateUserAgent() async {
    ///Kept this static because changing this value to dynamic
    ///'package name/app version (variant)'
    ///was resulted to empty response
    String appInfo = "com.stagingcupid.api/10.16.6 (Release)";
    String deviceInfo = await getDeviceInfo();
    return '$appInfo $deviceInfo';
  }

  static Future<List<Map<String, dynamic>>> fetchCountries() async {
    final response = await http.get(
      Uri.parse('$baseUrl/countries'),
      headers: {
        'X-API-Key': apiKey,
        'User-Agent': await generateUserAgent(),
      },
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load countries');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchStates(int countryId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/countries/$countryId/states'),
      headers: {
        'X-API-Key': apiKey,
        'User-Agent': await generateUserAgent(),
      },
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load states');
    }
  }
}

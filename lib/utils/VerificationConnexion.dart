import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
class VerificationConnexion{

  static Future<bool> hasNetwork() async {
    final url = Uri.parse('https://www.salon.oasis-rdc.com');
    final response = await http.get(url);
    try {
      // final result = await InternetAddress.lookup('https://salon.oasis-rdc.com');
      return response.statusCode == 200;
    } on SocketException catch (_) {
      return false;
    }
  }

  static void checkConnectionPeriodically(Function onConnected) {
    int attempt = 0;
    const int maxAttempts = 10;
    const Duration initialDelay = Duration(seconds: 2);

    Timer checkTimer;

    void check() async {
      bool isOnline = await hasNetwork();
      if (isOnline) {
        onConnected();
      } else {
        attempt++;
        if (attempt < maxAttempts) {
          Duration delay = initialDelay * (1 << attempt); // Backoff exponentiel
          checkTimer = Timer(delay, check);
        }
      }
    }

    checkTimer = Timer(initialDelay, check);
  }
}
import 'dart:io';

Future<bool> isInternetConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty;
  } on SocketException{
    return false;
  }
}
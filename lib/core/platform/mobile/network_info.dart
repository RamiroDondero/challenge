import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  // final Connectivity connectivity;

  NetworkInfoImpl(
    // required this.connectivity
    );

  @override
  Future<bool> isConnected() async {
    // final connectivityResult = await (Connectivity().checkConnectivity());
    // return connectivityResult == ConnectivityResult.mobile
    //   ?  Future.value(true)
    //   : (connectivityResult == ConnectivityResult.wifi)
    //   ? Future.value(true)
    //   : Future.value(false);
    return Future.value(true);
  }
}

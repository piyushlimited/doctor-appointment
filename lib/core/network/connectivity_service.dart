import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../utils/utils.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  Future<bool> checkConnectionStatus() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  void startMonitoring() {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        Utils.showSnackBar(title: 'Warning', message: 'No internet connection');
      }
    });
  }

  void dispose() {
    connectivitySubscription.cancel();
  }
}

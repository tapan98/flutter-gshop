import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/snackbars.dart';

import '../logger/logger.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }


  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    if (results.contains(ConnectivityResult.none)) {
      GSnackBar.warningSnackBar(title: GTexts.noInternetConnection);
    }
  }

  /// Checks the Network connection status
  /// 
  /// returns false if no network connection is available,
  /// otherwise [true]
  Future<bool> isConnected() async {
    Log.debug("Checking internet connection...");
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.any((element) => element == ConnectivityResult.none)) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
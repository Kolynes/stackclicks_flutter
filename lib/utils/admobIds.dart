
import 'dart:io';

import '../settings.dart';

String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return admobIds["banner"]["ios"];
  } else if (Platform.isAndroid) {
    return admobIds["banner"]["android"];
  }
  return null;
}

String getInterstitialAdUnitId() {
  if (Platform.isIOS) {
    return admobIds["interstitial"]["ios"];
  } else if (Platform.isAndroid) {
    return admobIds["interstitial"]["android"];
  }
  return null;
}

String getRewardBasedVideoAdUnitId() {
  if (Platform.isIOS) {
    return admobIds["reward"]["ios"];
  } else if (Platform.isAndroid) {
    return admobIds["reward"]["android"];
  }
  return null;
}
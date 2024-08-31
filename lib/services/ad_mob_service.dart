import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_monetization_course/utils/ad_unit_id.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  Future<InitializationStatus> initialization;
  AdMobService(this.initialization);

  String? get bannerAdUnitId {
    if (kReleaseMode) {
      if (Platform.isIOS) {
        return IOS.bannerAdId;
      } else if (Platform.isAndroid) {
        return Android.bannerAdId;
      }
    } else {
      if (Platform.isIOS) {
        return IOSTesting.bannerAdId;
      } else if (Platform.isAndroid) {
        return AndroidTesting.bannerAdId;
      }
    }
    return null;
  }

  String? get interstitialAdUnitId {
    if (kReleaseMode) {
      if (Platform.isIOS) {
        return IOS.interstitialAdId;
      } else if (Platform.isAndroid) {
        return Android.interstitialAdId;
      }
    } else {
      if (Platform.isIOS) {
        return IOSTesting.interstitialAdId;
      } else if (Platform.isAndroid) {
        return AndroidTesting.interstitialAdId;
      }
    }
    return null;
  }

  String? get rewardAdUnitId {
    if (kReleaseMode) {
      if (Platform.isIOS) {
        return IOS.interstitialAdId;
      } else if (Platform.isAndroid) {
        return Android.interstitialAdId;
      }
    } else {
      if (Platform.isIOS) {
        return IOSTesting.rewardAdUnitIdId;
      } else if (Platform.isAndroid) {
        return AndroidTesting.rewardAdUnitIdId;
      }
    }
    return null;
  }

  final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (Ad ad) => debugPrint('Ad loaded.'),
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    onAdOpened: (Ad ad) => debugPrint('Ad opened.'),
    onAdClosed: (Ad ad) => debugPrint('Ad closed.'),
  );
}

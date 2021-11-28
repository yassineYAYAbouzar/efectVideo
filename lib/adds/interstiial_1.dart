import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterClassStateOne {
  //Start inter
  int maxFailedLoadAttempts = 3;
  InterstitialAd interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-7532546851612653/7480219053",
        // ignore: prefer_const_constructors
        request: AdRequest(
          keywords: <String>['foo', 'bar'],
          contentUrl: 'http://foo.com/bar.html',
          nonPersonalizedAds: true,
        ),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            interstitialAd.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            _numInterstitialLoadAttempts += 1;
            interstitialAd = null;
            if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
              createInterstitialAd();
            }
          },
        ));
  }

  void showInterstitialAd() {
    if (interstitialAd == null) {
      return;
    }
    interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          // ignore: avoid_print
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        createInterstitialAd();
      },
    );
    interstitialAd.show();
    interstitialAd = null;
  }
}

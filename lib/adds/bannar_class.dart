import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannarClass {
  final BannerAd myBanner = BannerAd(
    adUnitId:'ca-app-pub-7532546851612653/4563423439',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdFailedToLoad: (ad, error) {
        ad.dispose(); // disposes of ad
      },
    ),
  );
  final BannerAd myBanner2 = BannerAd(
    adUnitId: 'ca-app-pub-7532546851612653/6797692775',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdFailedToLoad: (ad, error) {
        ad.dispose(); // disposes of ad
      },
    ),
  );
}

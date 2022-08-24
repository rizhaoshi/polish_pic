class CommonUtils {
  static String getLottieByName(String lottieName) {
    return 'assets/lotties/' + lottieName + ".json";
  }

  static String getSvgImageByName(String imageName) {
    return 'assets/images/svg/' + imageName + ".svg";
  }
  static String getImageAssetByName(String imageName) {
    return 'assets/images/' + imageName + ".png";
  }
}

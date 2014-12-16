App.info({
  name: 'Tin Whiskers',
  description: 'An app to track if your favorite brews are currently on tap',
  version: '0.0.5',
  email: 'george@twbrewing.com',
  website: 'http://twbrewing.com'
});

App.icons({
  'android_ldpi': 'icons/robot_icon_36x36.png',
  'android_mdpi': 'icons/robot_icon_48x48.png',
  'android_hdpi': 'icons/robot_icon_72x72.png',
  'android_xhdpi': 'icons/robot_icon_96x96.png',
          
  'iphone': 'icons/robot_icon_60x60square.png',
  'iphone_2x': 'icons/robot_icon_120x120square.png',
  'iphone_3x': 'icons/robot_icon_180x180square.png'
  //'ipad': 'resources/icons/icon-72x72.png',
  //'ipad_2x': 'resources/icons/icon-72x72@2x.png'
});

App.launchScreens({
  'android_ldpi_portrait' : 'mobile/launchScreens/drawable-ldpi/circle_wordmark_200x320.png',
  'android_mdpi_portrait' : 'mobile/launchScreens/drawable-mdpi/circle_wordmark_320x480.png',
  'android_hdpi_portrait' : 'mobile/launchScreens/drawable-hdpi/circle_wordmark_480x800.png',
  'android_xhdpi_portrait' : 'mobile/launchScreens/drawable-xhdpi/circle_wordmark_720x1280.png',
                  
  // iOS
  'iphone': 'mobile/launchScreens/drawable-mdpi/circle_wordmark_320x480.png',
  'iphone_2x': 'mobile/launchScreens/ios/circle_wordmark_640x960.png',
  'iphone5': 'mobile/launchScreens/ios/circle_wordmark_640x1136.png',
  'iphone6': 'mobile/launchScreens/ios/circle_wordmark_750x1334.png'
  //'ipad_portrait': 'resources/splash/splash-768x1024.png',
  //'ipad_portrait_2x': 'resources/splash/splash-768x1024@2x.png',
  //'ipad_landscape': 'resources/splash/splash-1024x768.png',
  //'ipad_landscape_2x': 'resources/splash/splash-1024x768@2x.png',
});
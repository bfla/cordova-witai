// Examples
// https://github.com/apache/cordova-plugin-geolocation/blob/master/src/ios/CDVLocation.h
// https://github.com/apache/cordova-plugin-media-capture/blob/master/src/ios/CDVCapture.h

#import <Cordova/CDVPlugin.h>
#import <AVFoundation/AVFoundation.h>
#import <Wit/Wit.h>

@interface CDVWitai : CDVPlugin {


}

- (void)initMicrophone:(CDVInvokedUrlCommand*)command;
@end
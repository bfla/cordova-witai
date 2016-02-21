// Examples
// https://github.com/apache/cordova-plugin-geolocation/blob/master/src/ios/CDVLocation.h
// https://github.com/apache/cordova-plugin-media-capture/blob/master/src/ios/CDVCapture.h

#import <Cordova/CDVPlugin.h>
#import <AVFoundation/AVFoundation.h>
#import <Wit/Wit.h>

@interface CDVWit : CDVPlugin

@property(nonatomic, copy) NSString *callbackId;

- (void)initMicrophone:(CDVInvokedUrlCommand*)command;
- (void)handleWitResponse:(NSArray *)outcomes messageId:(NSString *)messageId customData:(id) customData error:(NSError*)e;

@end
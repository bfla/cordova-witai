// Examples:
// https://github.com/apache/cordova-plugin-geolocation/blob/master/src/ios/CDVLocation.m
// https://github.com/apache/cordova-plugin-media-capture/blob/master/src/ios/CDVCapture.m
#import "CDVWitStore.h"

@implementation CDVWit

#pragma initMicrophone
- (void)initMicrophone:(CDVInvokedUrlCommand*)command
{
    [CDVWitStore setWit:self]; // Store this as a singleton so other modules can access it.
    self.callbackId = command.callbackId;
    CDVPluginResult* pluginResult = nil;
    NSString* token = [command.arguments objectAtIndex:0];

    if (token == nil) {
        // create response for Cordova errorCallback
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg[0] (wit.ai token) was null"];
    } else {

        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
        [Wit sharedInstance].accessToken = token; // Initialize Wit.ai client with your token
        //enabling detectSpeechStop will automatically stop listening the microphone when the user stop talking
        [Wit sharedInstance].detectSpeechStop = WITVadConfigDetectSpeechStop;
        // create response for Cordova successCallback
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    }
    // run cordova callback
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

#pragma handleWitResponse
- (void)handleWitResponse:(NSArray *)outcomes messageId:(NSString *)messageId customData:(id) customData error:(NSError*)e
{
    CDVPluginResult *pluginResult = nil;
    // FIXIT - convert response to JSON or another readable format...
    NSString* messageAsString = @"This is my fancy response";
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
}

@end
// Examples:
// https://github.com/apache/cordova-plugin-geolocation/blob/master/src/ios/CDVLocation.m
// https://github.com/apache/cordova-plugin-media-capture/blob/master/src/ios/CDVCapture.m

// - (void)init:(CDVInvokedUrlCommand*)command
// {
//     CDVPluginResult* pluginResult = nil;
//     NSString* myarg = [command.arguments objectAtIndex:0];

//     if (myarg != nil) {
//         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
//     } else {
//         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
//     }
//     [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
// }

- (void)initMicrophone:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult.keepCallback = true; // Let callback fire multiple times
    CDVPluginResult* pluginResult = nil;
    NSString* token = [command.arguments objectAtIndex:0];

    if (token == nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg[0] (wit.ai token) was null"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        
    }

    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    // FIXIT -- function must take an access token
    [Wit sharedInstance].accessToken = token; // replace xxx by your Wit.AI access token
    //enabling detectSpeechStop will automatically stop listening the microphone when the user stop talking
    [Wit sharedInstance].detectSpeechStop = WITVadConfigDetectSpeechStop;

    // this.witCallback = ;

}

- (BOOL)render:(CDVInvokedUrlCommand*)command
{

}
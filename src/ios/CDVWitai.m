// Examples:
// https://github.com/apache/cordova-plugin-geolocation/blob/master/src/ios/CDVLocation.m
// https://github.com/apache/cordova-plugin-media-capture/blob/master/src/ios/CDVCapture.m


- (void)initMicrophone:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* token = [command.arguments objectAtIndex:0];

    if (token == nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg[0] (wit.ai token) was null"];
    } else {

        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
        [Wit sharedInstance].accessToken = token; // Initialize Wit.ai client with your token
        //enabling detectSpeechStop will automatically stop listening the microphone when the user stop talking
        [Wit sharedInstance].detectSpeechStop = WITVadConfigDetectSpeechStop;

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];

    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
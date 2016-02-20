- Code in this folder is originally from here: https://github.com/wit-ai/wit-ios-sdk

## Example (derived from: https://wit.ai/docs/ios/4.0.0/quickstart):
```
// AppDelegate.h
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import <Wit/Wit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate



// AppDelegate.m
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    [Wit sharedInstance].accessToken = @"YOUR_ACCESS_TOKEN"; // replace xxx by your Wit.AI access token
    //enabling detectSpeechStop will automatically stop listening the microphone when the user stop talking
    [Wit sharedInstance].detectSpeechStop = WITVadConfigDetectSpeechStop;

    return YES;
}



// ViewController.h
#include <Wit/Wit.h>
// ...
// ...
@implementation ViewController : UIViewController <WitDelegate> {
  UILabel *labelView;
}



// ViewController.m
// Integrate Wit.ai interface
- (void)viewDidLoad
{
  [super viewDidLoad];

  // set the WitDelegate object
  [Wit sharedInstance].delegate = self;

  // create the button
  CGRect screen = [UIScreen mainScreen].bounds;
  CGFloat w = 100;
  CGRect rect = CGRectMake(screen.size.width/2 - w/2, 60, w, 100);

  WITMicButton* witButton = [[WITMicButton alloc] initWithFrame:rect];
  [self.view addSubview:witButton];

  // create the label
  labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, screen.size.width, 50)];
  labelView.textAlignment = NSTextAlignmentCenter;
  [self.view addSubview:labelView];
}

// Handle Wit.ai response
- (void)witDidGraspIntent:(NSArray *)outcomes messageId:(NSString *)messageId customData:(id) customData error:(NSError*)e {
    if (e) {
        NSLog(@"[Wit] error: %@", [e localizedDescription]);
        return;
    }
    NSDictionary *firstOutcome = [outcomes objectAtIndex:0];
    NSString *intent = [firstOutcome objectForKey:@"intent"];
    
    labelView.text = [NSString stringWithFormat:@"intent = %@", intent];
    
    [self.view addSubview:labelView];
}
```
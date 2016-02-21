
@implementation CDVWitViewController

#pragma viewWillLoad
- (void)viewWillLoad
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

// TODO - implement Witai callback
#pragma witDidGraspIntent
- (void)witDidGraspIntent:(NSArray *)outcomes messageId:(NSString *)messageId customData:(id) customData error:(NSError*)e {
    if (e) {
        NSLog(@"[Wit] error: %@", [e localizedDescription]);
        return;
    }
    NSDictionary *firstOutcome = [outcomes objectAtIndex:0];
    NSString *intent = [firstOutcome objectForKey:@"intent"];
    
    labelView.text = [NSString stringWithFormat:@"intent = %@", intent];
    
    [self.view addSubview:labelView];
    // [CDVWit handleWitResponse:outcomes messageId:messageId customData:customData error:e];
}

@end
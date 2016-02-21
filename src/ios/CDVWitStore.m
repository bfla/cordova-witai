#import "CDVWit.h"

@implementation CDVWitStore

+ (instancetype)sharedWit
{
    static CDVWitStore *sharedStore = nil;
    
    // If sharedStore doesn't exist, then make it
    if (!sharedStore) {
      sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// Configure initializers =============================================================
// If the programmer calls regular old 'init' on BNRItemStore, let them know their mistake
#pragma init
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[CDVWitStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

#pragma initPrivate
// Here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
      _wit = nil;
    }
}

#pragma setWit
-(void)setWit:(CDVWit *)wit
{
  if (!self.wit) {
    self.wit = witInstance;
  }
}
@end
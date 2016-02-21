#import "CDVWit.h"

@interface CDVWitStore ()

@property (nonatomic, copy) CDVWit *privateWit;

@end

@implementation CDVWitStore

+ (instancetype)sharedStore
{
    static CDVWitStore *sharedStore = nil;
    
    // If sharedStore doesn't exist, then make it
    if (!sharedStore) {
      sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// Configure initializers =====================================================
// If the programmer calls regular old 'init' on BNRItemStore, indicate mistake
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
      _privateWit = nil;
    }
}

#pragma setWit
-(void)setWit:(CDVWit *)wit
{
  if (!self.privateWit) {
    self.privateWit = wit;
  }
}

// Getters =====================================================================
- (CDVWit *)wit
{
  return self.privateWit;
}

@end
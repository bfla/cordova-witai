#import <Foundation/Foundation.h>
#import "CDVWit.h"

@interface CDVWitStore : NSObject

@property (nonatomic, copy) CDVWit *wit; // FIXIT - this might require some tweaking

+ (instancetype)sharedStore;
- (void)setWit:(CDVWit *)wit;

@end
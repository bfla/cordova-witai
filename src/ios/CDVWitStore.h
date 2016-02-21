#import <Foundation/Foundation.h>
#import "CDVWit.h"

@interface CDVWitStore : NSObject

@property(nonatomic, copy) CDVWit *wit;

+ (instancetype)sharedWit;
- (void)setWit:(CDVWit *)wit;

@end
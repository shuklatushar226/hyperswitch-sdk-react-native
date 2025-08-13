
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNHyperswitchTurboSpec.h"

@interface HyperswitchTurbo : NSObject <NativeHyperswitchTurboSpec>
#else
#import <React/RCTBridgeModule.h>

@interface HyperswitchTurbo : NSObject <RCTBridgeModule>
#endif

@end

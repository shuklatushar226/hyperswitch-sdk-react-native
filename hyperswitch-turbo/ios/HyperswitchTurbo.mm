#import "HyperswitchTurbo.h"
#import "PaymentSession.swift"

@implementation HyperswitchTurbo
RCT_EXPORT_MODULE()

// Example method
RCT_EXPORT_METHOD(multiply:(double)a
                  b:(double)b
                  callback:(RCTResponseSenderBlock)callback)
{
    double result = a * b;
    callback(@[@(result)]);
}

// Session Management
RCT_EXPORT_METHOD(initPaymentSession:(NSDictionary *)request
                  callback:(RCTResponseSenderBlock)callback)
{
    // Implementation will be added from the original iOS code
    NSLog(@"initPaymentSession called with: %@", request);
    NSDictionary *result = @{
        @"type_": @"",
        @"code": @"",
        @"message": @"initPaymentSession successful",
        @"status": @"success"
    };
    callback(@[result]);
}

// Payment Sheet
RCT_EXPORT_METHOD(presentPaymentSheet:(NSDictionary *)request
                  callback:(RCTResponseSenderBlock)callback)
{
    NSLog(@"presentPaymentSheet called with: %@", request);
    // Implementation will be added from the original iOS code
    callback(@[@"Payment sheet presented"]);
}

// Customer Saved Payment Methods
RCT_EXPORT_METHOD(getCustomerSavedPaymentMethods:(NSDictionary *)request
                  callback:(RCTResponseSenderBlock)callback)
{
    NSLog(@"getCustomerSavedPaymentMethods called");
    NSDictionary *result = @{
        @"type_": @"",
        @"code": @"",
        @"message": @"getCustomerSavedPaymentMethods successful",
        @"status": @"success"
    };
    callback(@[result]);
}

RCT_EXPORT_METHOD(getCustomerDefaultSavedPaymentMethodData:(NSDictionary *)request
                  callback:(RCTResponseSenderBlock)callback)
{
    NSLog(@"getCustomerDefaultSavedPaymentMethodData called");
    // Implementation will be added from the original iOS code
    callback(@[@{}]);
}

RCT_EXPORT_METHOD(getCustomerLastUsedPaymentMethodData:(NSDictionary *)request
                  callback:(RCTResponseSenderBlock)callback)
{
    NSLog(@"getCustomerLastUsedPaymentMethodData called");
    // Implementation will be added from the original iOS code
    callback(@[@{}]);
}

RCT_EXPORT_METHOD(getCustomerSavedPaymentMethodData:(NSDictionary *)request
                  callback:(RCTResponseSenderBlock)callback)
{
    NSLog(@"getCustomerSavedPaymentMethodData called");
    // Implementation will be added from the original iOS code
    callback(@[@{@"paymentMethods": @[]}]);
}

// Headless Payment Confirmations
RCT_EXPORT_METHOD(confirmWithCustomerDefaultPaymentMethod:(NSDictionary *)request
                  cvc:(NSString *)cvc
                  callback:(RCTResponseSenderBlock)callback)
{
    NSLog(@"confirmWithCustomerDefaultPaymentMethod called");
    // Implementation will be added from the original iOS code
    callback(@[@{@"type": @"completed", @"message": @"Payment confirmed"}]);
}

RCT_EXPORT_METHOD(confirmWithCustomerLastUsedPaymentMethod:(NSDictionary *)request
                  cvc:(NSString *)cvc
                  callback:(RCTResponseSenderBlock)callback)
{
    NSLog(@"confirmWithCustomerLastUsedPaymentMethod called");
    // Implementation will be added from the original iOS code
    callback(@[@{@"type": @"completed", @"message": @"Payment confirmed"}]);
}

RCT_EXPORT_METHOD(confirmWithCustomerPaymentToken:(NSDictionary *)request
                  paymentToken:(NSString *)paymentToken
                  cvc:(NSString *)cvc
                  callback:(RCTResponseSenderBlock)callback)
{
    NSLog(@"confirmWithCustomerPaymentToken called");
    // Implementation will be added from the original iOS code
    callback(@[@{@"type": @"completed", @"message": @"Payment confirmed"}]);
}

// Utility Methods
RCT_EXPORT_METHOD(exitPaymentsheet:(double)rootTag
                  paymentResult:(NSString *)paymentResult
                  reset:(BOOL)reset)
{
    NSLog(@"exitPaymentsheet called");
    // Implementation will be added from the original iOS code
}

RCT_EXPORT_METHOD(sendMessageToNative:(NSString *)message)
{
    NSLog(@"Message from React Native: %@", message ?: @"");
}

RCT_EXPORT_METHOD(launchGPay:(NSString *)gPayRequest
                  callback:(RCTResponseSenderBlock)callback)
{
    NSLog(@"launchGPay called (iOS doesn't support Google Pay)");
    NSDictionary *error = @{
        @"type": @"error",
        @"status": @"failed",
        @"message": @"Google Pay is not supported on iOS"
    };
    callback(@[error]);
}

RCT_EXPORT_METHOD(exitCardForm:(NSString *)paymentResult)
{
    NSLog(@"exitCardForm called");
    // Implementation will be added from the original iOS code
}

// Event Listeners
RCT_EXPORT_METHOD(addListener:(NSString *)eventName)
{
    // Required for RCTEventEmitter support
}

RCT_EXPORT_METHOD(removeListeners:(double)count)
{
    // Required for RCTEventEmitter support
}

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeHyperswitchTurboSpecJSI>(params);
}
#endif

@end

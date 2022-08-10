#import "IosToFlutterPlugin.h"
#if __has_include(<ios_to_flutter/ios_to_flutter-Swift.h>)
#import <ios_to_flutter/ios_to_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ios_to_flutter-Swift.h"
#endif

@implementation IosToFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIosToFlutterPlugin registerWithRegistrar:registrar];
}
@end

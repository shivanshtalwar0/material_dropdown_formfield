#import "MaterialdropdownformfieldPlugin.h"
#if __has_include(<materialdropdownformfield/materialdropdownformfield-Swift.h>)
#import <materialdropdownformfield/materialdropdownformfield-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "materialdropdownformfield-Swift.h"
#endif

@implementation MaterialdropdownformfieldPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMaterialdropdownformfieldPlugin registerWithRegistrar:registrar];
}
@end

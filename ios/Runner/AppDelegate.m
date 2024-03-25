#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"


//通信标识
#define ChannelName    @"FI://MethodChannelPlugin"

#define ALIBC_INIT    @"FI://alibc_init"

#define ALIBC_LOGIN    @"FI://alibc_login"
#define ALIBC_LOGOUT    @"FI://alibc_logout"
#define ALIBC_TOP_AUTH    @"FI://alibc_top_auth"
#define ALIBC_OPEN_TB    @"FI://alibc_open_tb"

@implementation AppDelegate{
    FlutterMethodChannel* channel;
}

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
   
    
    
    FlutterViewController* controller =
        (FlutterViewController*)self.window.rootViewController;
    
     channel = [FlutterMethodChannel
        methodChannelWithName:ChannelName
              binaryMessenger:controller.binaryMessenger];
    __weak typeof(self) weakSelf = self;
    [channel setMethodCallHandler:^(FlutterMethodCall* call,
                                           FlutterResult result) {
        NSLog(@"call.method: %@",call.method);
       
    }];
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
 
 

 

@end

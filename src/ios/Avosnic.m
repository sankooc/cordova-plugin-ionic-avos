#import "Avosnic.h"
#import <AVOSCloud/AVOSCloud.h>
#import <AVOSCloudSNS/AVOSCloudSNS.h>
#import <AVOSCloudSNS/AVUser+SNS.h>

@implementation Avosnic


- (void) doLogin:(CDVInvokedUrlCommand *)command;
{
    [AVOSCloudSNS loginWithCallback:^(NSDictionary* object, NSError *error) {
        if (error==nil && object) {
            [AVUser loginWithAuthData:object block:^(AVUser *user, NSError *error) {
                AVInstallation *currentInstallation = [AVInstallation currentInstallation];
                if (currentInstallation.deviceToken) {
                    [currentInstallation setObject:user forKey:@"user"];
                    [currentInstallation saveInBackground];
                }
                CDVPluginResult* result = nil;
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[user dictionaryForObject]];
                [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
            }];
        }else{
            //todo
        }
    } toPlatform:AVOSCloudSNSSinaWeibo];
}
- (void) tencentLogin:(CDVInvokedUrlCommand *)command;
{
    //AVOSCloudSNSQQ
    NSDictionary* options = [command.arguments objectAtIndex:0];

    [AVOSCloudSNS setupPlatform:AVOSCloudSNSQQ withAppKey:options[@"AppKey"] andAppSecret:options[@"AppSecret"] andRedirectURI:options[@"RedirectURI"]];
    [self doLogin:command];

}
- (void) weiboLogin:(CDVInvokedUrlCommand *)command;
{
    NSDictionary* options = [command.arguments objectAtIndex:0];

    [AVOSCloudSNS setupPlatform:AVOSCloudSNSSinaWeibo withAppKey:options[@"AppKey"] andAppSecret:options[@"AppSecret"] andRedirectURI:options[@"RedirectURI"]];
    [self doLogin:command];
}
@end

//
//  SocialMessage.h
//  Copyright (c) 2013 Lee Crossley - http://ilee.co.uk
//

#import <Cordova/CDVPlugin.h>
#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import <AVOSCloudSNS/AVOSCloudSNS.h>

@interface Avosnic : CDVPlugin

- (void) weiboLogin:(CDVInvokedUrlCommand*)command;

- (void) tencentLogin:(CDVInvokedUrlCommand*)command;

@end

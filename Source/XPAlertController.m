//
//  XPAlertController.m
//  XPAlertController
//
//  Created by Xavi R. Pinteño on 08/09/16.
//  Copyright © 2016 Xavi R. Pinteño. All rights reserved.
//

#import "XPAlertController.h"

@interface XPAlertController ()

/**
 *	Dummy UIWindow which will contain a blank UIViewController to present the alert view from 
 */
@property (nonatomic, strong) UIWindow *dummyWindow;

@end


@implementation XPAlertController

#pragma mark - Class methods

+ (void) showAlert:(NSString *)title message:(NSString *)message {
	[[self class] showAlert:title message:message acceptTitle:@"Ok" acceptHandler:nil];
}

+ (void) showAlert:(NSString *)title message:(NSString *)message acceptTitle:(NSString *)acceptTitle {
	[[self class] showAlert:title message:message acceptTitle:acceptTitle acceptHandler:nil];
}

+ (void) showAlert:(NSString *)title message:(NSString *)message acceptTitle:(NSString *)acceptTitle acceptHandler:(void (^)())acceptHandler {
	XPAlertController *alertController = [XPAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:acceptTitle style:UIAlertActionStyleDefault handler:acceptHandler];
	[alertController addAction:acceptAction];

	[alertController showAnimated:YES];
}


#pragma mark - View lifecycle

- (void) viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];

	self.dummyWindow.hidden = YES;
	self.dummyWindow = nil;
}

- (void) showAnimated:(BOOL)animated {
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	UIViewController *dummyViewController = [[UIViewController alloc] init];
	dummyViewController.view.backgroundColor = [UIColor clearColor];

	window.rootViewController = dummyViewController;
	window.backgroundColor = [UIColor clearColor];

	window.windowLevel = UIWindowLevelAlert + 1;

	[window makeKeyAndVisible];
	self.dummyWindow = window;

	[dummyViewController presentViewController:self animated:animated completion:nil];
}

@end

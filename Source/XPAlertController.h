//
//  XPAlertController.h
//  XPAlertController
//
//  Created by Xavi R. Pinteño on 08/09/16.
//  Copyright © 2016 Xavi R. Pinteño. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Subclass to allow displaying an alert view from a non-UI class.
 * Based on:
 *	http://stackoverflow.com/questions/26554894/how-to-present-uialertcontroller-when-not-in-a-view-controller/30941356#30941356
 *
 */
@interface XPAlertController : UIAlertController

#pragma mark - Simple alert methods without options

/**
 * Shows a modal alert view with standard Ok button
 *
 * @param title 
 * @param message
 */
+ (void) showAlert:(NSString * _Nullable)title message:(NSString * _Nullable)message;

/**
 * Shows a modal alert view with custom button title
 *
 * @param title
 * @param message
 * @param acceptTitle
 */
+ (void) showAlert:(NSString * _Nullable)title message:(NSString * _Nullable)message acceptTitle:(NSString * _Nonnull)acceptTitle;

/**
 * Shows a modal alert view with standard Ok button and completionHandler
 *
 * @param title
 * @param message
 * @param acceptTitle
 * @param acceptHandler
 */
+ (void) showAlert:(NSString * _Nullable)title message:(NSString * _Nullable)message acceptTitle:(nonnull NSString *)acceptTitle acceptHandler:(void (^_Nullable)())acceptHandler;

- (void) showAnimated:(BOOL)animated;

@end

//
//  MemHogAppDelegate.h
//  Memory Hog
//
//  Created by Christopher Tilt on 3/23/12.
//  Copyright (c) 2012 Avatron Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MemHogViewController;

@interface MemHogAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MemHogViewController *viewController;

@end

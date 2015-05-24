//
//  Shoot_AroundAppDelegate.h
//  Shoot Around
//
//  Created by Riley on 9/11/09.
//  Copyright Riley Testut 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Shoot_AroundViewController;

@interface Shoot_AroundAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Shoot_AroundViewController *viewController;
	IBOutlet UIView *background;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Shoot_AroundViewController *viewController;
@property (nonatomic, retain) UIView *background;

@end


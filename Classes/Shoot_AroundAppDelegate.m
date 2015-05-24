//
//  Shoot_AroundAppDelegate.m
//  Shoot Around
//
//  Created by Riley on 9/11/09.
//  Copyright Riley Testut 2009. All rights reserved.
//

#import "Shoot_AroundAppDelegate.h"
#import "Shoot_AroundViewController.h"

@implementation Shoot_AroundAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize background;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
    // Override point for customization after app launch 
    [window addSubview:[viewController view]];
	[window makeKeyAndVisible];
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight ||
			interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)dealloc {
    [viewController release];
    [window release];
	[background release];
    [super dealloc];
}


@end

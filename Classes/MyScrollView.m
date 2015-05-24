//
//  MyScrollView.m
//  Shoot Around
//
//  Created by Riley on 9/17/09.
//  Copyright 2009 Riley Testut. All rights reserved.
//

#import "MyScrollView.h"
#import "Shoot_AroundViewController.h"

@implementation MyScrollView
@synthesize rightMissilePhoto, leftMissilePhoto;
@synthesize picture;
@synthesize shoot;
@synthesize fire;
@synthesize target;
@synthesize increase;

-(void)viewDidLoad {
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	if ([touch tapCount] == 2) {
		if (self.zoomScale == 1) {
			self.zoomScale = 2;
		}else {
			self.zoomScale = 1;
		}

	}
	if ([touch tapCount] == 1) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"Laser1" ofType:@"caf"];
		AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &shoot);
		[path release];
		AudioServicesPlaySystemSound(shoot);
		fire.hidden = YES;
		CGPoint location = [touch locationInView:picture];
		if (location.x < target.center.x + 89 + 35) {
			if (location.x > target.center.x + 89 - 35) {
				if (location.y < target.center.y + 14 + 35) {
					if (location.y > target.center.y + 14 - 35) {
						increase.text = @"Increase";
					}
				}
			}
		}
		rightMissilePhoto.hidden = NO;
		leftMissilePhoto.hidden = NO;
		[UIImageView beginAnimations:nil context:NULL];
		[UIImageView setAnimationDuration:.20];
		
		rightMissilePhoto.frame = CGRectMake(location.x -16, location.y, 16, 16); 
		leftMissilePhoto.frame = CGRectMake(location.x -8, location.y, 16, 16);
		fire.frame = CGRectMake(location.x -12, location.y, 25, 25);
		
		
		[NSTimer scheduledTimerWithTimeInterval:.20 target:self selector:@selector(hideMissiles) userInfo:nil repeats:NO];
	}
}

-(void)hideMissiles {
	AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
	fire.hidden = NO;
	leftMissilePhoto.hidden = YES;
	rightMissilePhoto.hidden = YES;
	[UIImageView beginAnimations:nil context:NULL];
	[UIImageView setAnimationDuration:0];
	
	rightMissilePhoto.frame = CGRectMake(0, 304, 16, 16);
	leftMissilePhoto.frame = CGRectMake(464, 304, 16, 16);
	
	[UIView commitAnimations];
	[NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(hideFire) userInfo:nil repeats:NO];
}

-(void)hideFire {
	fire.hidden = YES;
}

-(void)dealloc {
	[super dealloc];
	[rightMissilePhoto release];
	[leftMissilePhoto release];
	[picture release];
	[fire release];
	[target release];
	[increase release];
}
@end

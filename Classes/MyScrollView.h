//
//  MyScrollView.h
//  Shoot Around
//
//  Created by Riley on 9/17/09.
//  Copyright 2009 Riley Testut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "Shoot_AroundViewController.h"

@interface MyScrollView : UIScrollView {

	IBOutlet UIImageView *rightMissilePhoto;
	IBOutlet UIImageView *leftMissilePhoto;
	IBOutlet UIImageView *picture;
	IBOutlet UIImageView *fire;
	IBOutlet UIImageView *target;
	
	IBOutlet UILabel *increase;
	
	SystemSoundID shoot;
	
}
@property (nonatomic, retain) UIImageView *rightMissilePhoto;
@property (nonatomic, retain) UIImageView *leftMissilePhoto;
@property (nonatomic, retain) UIImageView *picture;
@property (readonly) SystemSoundID shoot;
@property (nonatomic, retain) UIImageView *fire;
@property (nonatomic, retain) UIImageView *target;
@property (nonatomic, retain) UILabel *increase;

@end

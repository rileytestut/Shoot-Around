//
//  Animator.h
//  Shoot Around
//
//  Created by Riley on 11/1/09.
//  Copyright 2009 Riley Testut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>


@interface Animator : NSObject {
	
}

+ (CATransition *)transitionWithDuration:(float)duration andType:(NSString *)type andSubtype:(NSString *)subtype toView:(UIView *)view1 fromView:(UIView *)view2;

/*
 * TYPES: 
 * 
 * kCATransitionFade
 * kCATransitionMoveIn
 * kCATransitionPush
 * kCATransitionReveal
 *
 * SUBTYPES:
 *
 * kCATransitionFromRight
 * kCATransitionFromLeft
 * kCATransitionFromTop
 * kCATransitionFromBottom
 *
 */

@end

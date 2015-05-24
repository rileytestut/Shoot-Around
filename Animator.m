//
//  Animator.m
//  Shoot Around
//
//  Created by Riley on 11/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Animator.h"


@implementation Animator

+ (CATransition *)transitionWithDuration:(float)duration andType:(NSString *)type andSubtype:(NSString *)subtype toView:(UIView *)view1 fromView:(UIView *)view2 {
	
	CATransition *transition = [CATransition animation];
	transition.duration = duration;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = type;
	transition.subtype = subtype;
	
	return transition;
}

@end
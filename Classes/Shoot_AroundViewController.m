//
//  Shoot_AroundViewController.m
//  Shoot Around
//
//  Created by Riley on 9/11/09.
//  Copyright Riley Testut 2009. All rights reserved.
//
// Finished September 21, 2009

#import "Shoot_AroundViewController.h"
#import "TwitterRequest.h"
#import <SystemConfiguration/SCNetworkReachability.h>
#import "Reachability.h"
#include <netinet/in.h>
#import <QuartzCore/QuartzCore.h>
#import "Animator.h"

#define kBallSpeedX 10
#define kBallSpeedY 10
#define PicSize 
#define kFilteringFactor   0.1
#define kFilteringFactor 0.1

@implementation Shoot_AroundViewController

@synthesize overlayView;
@synthesize viewController;
@synthesize preview;
@synthesize leftMissile, rightMissile;
@synthesize AButton, BButton;
@synthesize doubleTap;
@synthesize crossHair;
@synthesize picture;
@synthesize stillPicture;
@synthesize scrollView;
@synthesize rightMissilePhoto;
@synthesize leftMissilePhoto;
@synthesize movePicture;
@synthesize fire;
@synthesize shoot;
@synthesize saving;
@synthesize menuBackground;
@synthesize menu;
@synthesize menuText;
@synthesize frame;
@synthesize pictureOrientation;
@synthesize menuButton;
@synthesize choosePhotoButton;
@synthesize cameraButton;
@synthesize testButton;
@synthesize twitterMessageText, updateButton;
@synthesize twitter;
@synthesize shootObject;
@synthesize twitterUsername, twitterPassword;
@synthesize zoomAmount;
@synthesize slider;
@synthesize button;
@synthesize publishButton;
@synthesize shareButton;
@synthesize connectedToNetwork;
@synthesize facebook;
@synthesize twitterButton;
@synthesize facebookButton;
@synthesize shootObjectFacebook;
@synthesize shootFrame, pictureTaken, screenShot;
@synthesize targetButton, backgroundButton;
@synthesize otherBackgroundButton, otherChoosePhotoButton;
@synthesize target;
@synthesize source;
@synthesize a, b, c, d, e, f, g, h, i, j;
@synthesize videoRecording;
@synthesize video;
@synthesize slideNumber;
@synthesize videoArray;
@synthesize target2, targetVelocity;
@synthesize score, timer, increase, moveTarget;
@synthesize targetView;
@synthesize targetViewOptions;
@synthesize backgroundView;

@dynamic targetInt;
@dynamic zoomInt;
@dynamic targetLocation;
@dynamic videoNumber;
@dynamic scoreNumber;
@dynamic timerNumber;
@dynamic choosePhotoNumber;
@dynamic targetX, targetY, targetAverage, targetHeight;

- (NSString *)videoRecorderPath {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	int myNumber;
	myNumber = videoNumber;
	NSString *videoSlide = nil;
	videoSlide = [[NSString alloc] initWithFormat:@"video.data", myNumber];
	return [documentsDirectory stringByAppendingPathComponent:videoSlide];
}

- (NSString *)backgroundPath {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:@"background.png"];
}

- (NSString *)landscapePath {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:kFilename];
}

-(NSString *)didPurchase {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:@"purchase.plist"];
}

#pragma mark -
-(void)viewDidLoad {
	int number;
	number = videoNumber;
	if (number == 14) {
	}
	else {
		[self.view addSubview:menu];
		viewController.view.backgroundColor = [UIColor clearColor];
		CLLocationManager* locManager = [[CLLocationManager alloc] init];
		if (locManager.headingAvailable) {
		}
		else {
			targetButton.hidden = YES;
			backgroundButton.hidden = YES;
			otherBackgroundButton.hidden = NO;
		}
		
		videoNumber = 0;
		
		NSString *filePath = [self didPurchase];
		if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
		}
		else {
			NSMutableArray *array = [[NSMutableArray alloc] init];
			[array writeToFile:[self didPurchase] atomically:YES];
		}
		
		/*session = [[FBSession sessionForApplication:@"f85791c06070109d00fc8429284c59e6" secret:@"f13e229dffd104d0aacb0a6d73573c60" delegate:self] retain];		
		
		fbHelper = [[MOFBHelper alloc] init];
		fbHelper.delegate = self;
		
		button.session = session;*/
		
		zoomInt = 1;
		if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		}
		else {
			cameraButton.hidden = YES;
			choosePhotoButton.hidden = YES;
			otherChoosePhotoButton.hidden = NO;
		}
		NSString *path = [[NSBundle mainBundle] pathForResource:@"Laser1" ofType:@"caf"];
		AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &shoot);
		[path release];
		[UIApplication sharedApplication].idleTimerDisabled = NO;
		
		NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
		NSInteger myInt = [prefs integerForKey:@"integerKey"];
		
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *uniquePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"background.png"];
		UIImage *image = [UIImage imageWithContentsOfFile:uniquePath];
		NSString *background = [self backgroundPath];
		if ([[NSFileManager defaultManager] fileExistsAtPath:background]) {
		}
		else {
			menuBackground.image = image;
			if (myInt == 24) {
				if (image.size.height == 1200) {
					CGRect frame1 = CGRectMake(0, 0, 480, 320);
#define RADIANS(degrees) ((degrees * M_PI) / 180.0)
					
					CGAffineTransform rotateTransform = CGAffineTransformRotate(CGAffineTransformIdentity,
																				RADIANS(90.0));
					menuBackground.transform = rotateTransform;
					backgroundView.frame = frame1;
				}
				else {
					if (image.size.height == 480) {
						CGRect frame1 = CGRectMake(133, 0, 214, 320);
						menuBackground.bounds = frame1;
						
					}
					else {
						if (image.size.height == 800) {
							CGRect frame1 = CGRectMake(120, 0, 240, 320);
							menuBackground.bounds = frame1;
						}
						else {
							if (image.size.height == 1536) {
								CGRect frame1 = CGRectMake(80, 0, 320, 240);
								menuBackground.bounds = frame1;
								CGAffineTransform rotateTransform = CGAffineTransformRotate(CGAffineTransformIdentity,
																							RADIANS(90.0));
								menuBackground.transform = rotateTransform;
							}
						}
					}
				}
			}
		}
	}
	videoNumber = 14;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[session resume];
}

/*#pragma mark Facebook Session Protocol Methods

- (void)session:(FBSession*)session didLogin:(FBUID)uid {
	button.hidden = YES;
	publishButton.hidden = NO;
}

#pragma mark Optional MOFBHelper Protocol Methods

- (void)statusDidUpdate:(MOFBHelper*)helper {
	NSLog(@"status updated");
}

-(void)status:(MOFBHelper*)helper DidFailWithError:(NSError*)error {
	NSLog(@"status update failed: %@", [error description]);
}

- (void)applicationWillTerminate:(NSNotification *)notification {
}*/

# pragma mark Housekeeping

-(IBAction)openPreview:(id)sender {
	if (sender == targetButton) {
		targetInt = 14;
	}
	else {
		targetInt = 56;
	}
	preview = [[UIImagePickerController alloc] init];
	preview.delegate = self;
	preview.sourceType = UIImagePickerControllerSourceTypeCamera;
	preview.showsCameraControls = NO;
	overlayView.backgroundColor = [UIColor clearColor];
	preview.cameraOverlayView = overlayView;
	videoNumber = 0;
	preview.cameraViewTransform = CGAffineTransformScale(preview.cameraViewTransform, 1.13f, 1.13f);
	[self presentModalViewController:preview animated:YES];
	[preview release];
	[UIApplication sharedApplication].idleTimerDisabled = YES;
	doubleTap.text = @"NextZoom";
	
	CGAffineTransform rotateTransform = CGAffineTransformRotate(CGAffineTransformIdentity,
																RADIANS(90.0));
	menuButton.transform = rotateTransform;
	shareButton.transform = rotateTransform;
	twitterButton.transform = rotateTransform;
	facebookButton.transform = rotateTransform;
	
	CGRect frame1;
	
	frame1 = [twitterButton frame];
	
	frame1.origin.x = 220;
	frame1.origin.y = 112.5;
	
	twitterButton.frame = frame1;
	
	CGRect frame2;
	
	frame2 = [facebookButton frame];
	
	frame2.origin.x = 220;
	frame2.origin.y = 272.5;
	
	facebookButton.frame = frame2;
	
	CLLocationManager* locManager = [[CLLocationManager alloc] init];
	if (targetInt == 14) {
		locManager.delegate = self;
		fire.hidden = NO;
		locManager.headingFilter = 1;
		[locManager startUpdatingHeading];
		targetLocation = arc4random() % 270;
	}
	else {
		UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
		targetInt = 14;
		accel.delegate = self;
		accel.updateInterval = 1.0f/45.0f;
		fire.hidden = YES;
		targetHeight = arc4random() % 2;
		if (targetHeight == 1) {
			targetHeight = arc4random() % 5;
			targetHeight = targetHeight/10;
		}
		else {
			targetHeight = arc4random() % 11;
			targetHeight = targetHeight/-10;
		}
	}
}

-(IBAction)openPhotos:(id)sender {
	[UIApplication sharedApplication].idleTimerDisabled = NO;
	UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
	imagePicker.delegate = self;
	imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	imagePicker.allowsEditing = NO;
	[self presentModalViewController:imagePicker animated:YES];
	[imagePicker release];
}

-(IBAction)shoot:(id)sender {
	AudioServicesPlaySystemSound(shoot);
	rightMissile.hidden = NO;
	leftMissile.hidden = NO;
	[UIImageView beginAnimations:nil context:NULL];
	[UIImageView setAnimationDuration:.25];
	
	rightMissile.frame = CGRectMake(0, 0, 320, 464); 
	leftMissile.frame = CGRectMake(0, 0, 320, 496);
	
	// Add other views here
	
	[UIView commitAnimations];
	[NSTimer scheduledTimerWithTimeInterval:.25 target:self selector:@selector(hideMissiles:) userInfo:nil repeats:NO];
}

-(void)hideMissiles:(id)sender {
	if (targetInt == 14) {
		if (fire.center.x < target.center.x + 26) {
			if (fire.center.x > target.center.x - 26) {
				if (fire.center.y < target.center.y + 26) {
					if (fire.center.y > target.center.y - 26) {
						AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
					}
				}
			}
		}
	}
	else {
		AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
	}
	rightMissile.hidden = YES;
	leftMissile.hidden = YES;
	fire.hidden = NO;
	[UIImageView beginAnimations:nil context:NULL];
	[UIImageView setAnimationDuration:0];
	
	rightMissile.frame = CGRectMake(0, 70, 16, 16);
	leftMissile.frame = CGRectMake(0, 394, 16, 16);
	[NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(hideFire) userInfo:nil repeats:NO];
	// Add other views here
}

-(void)hideFire {
	fire.hidden = YES;
}

-(IBAction)rapidFire:(id)sender {
	if ([BButton isHighlighted]) {
		AudioServicesPlaySystemSound(shoot);
		fire.hidden = YES;
		rightMissile.hidden = NO;
		leftMissile.hidden = NO;
		[UIImageView beginAnimations:nil context:NULL];
		[UIImageView setAnimationDuration:.15];
		
		rightMissile.frame = CGRectMake(0, 0, 320, 464); 
		leftMissile.frame = CGRectMake(0, 0, 320, 496);
		// Add other views here
		[UIView commitAnimations];
		
		fire.hidden = YES;
		[NSTimer scheduledTimerWithTimeInterval:.15 target:self selector:@selector(hideMissiles2:) userInfo:nil repeats:NO];

	}
	else {
		fire.hidden = YES;
		rightMissile.hidden = YES;
		leftMissile.hidden = YES;
		[UIImageView beginAnimations:nil context:NULL];
		[UIImageView setAnimationDuration:0];
		
		rightMissile.frame = CGRectMake(0, 70, 16, 16);
		leftMissile.frame = CGRectMake(0, 394, 16, 16);
		[UIView commitAnimations];
	}


}

-(void)hideMissiles2:(id)sender {
	rightMissile.hidden = YES;
	leftMissile.hidden = YES;
	AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
	fire.hidden = NO;
	[UIImageView beginAnimations:nil context:NULL];
	[UIImageView setAnimationDuration:0];
	
	rightMissile.frame = CGRectMake(0, 70, 16, 16);
	leftMissile.frame = CGRectMake(0, 394, 16, 16);
	
	[UIView commitAnimations];
	
	[NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(hideFire:) userInfo:nil repeats:NO];
}

-(void)hideFire:(id)sender {
	fire.hidden = YES;
	if ([BButton isHighlighted]) {
		[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(rapidFire:) userInfo:nil repeats:NO];
	}
}

-(IBAction)screenShot:(id)sender {
	UIGraphicsBeginImageContext(preview.view.bounds.size);
	[preview.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
}

-(void)doubleTap:(id)sender {
	if (doubleTap.text == @"NextZoom") {
		doubleTap.text = @"Zoom";
		[self performSelector:@selector(timeUpZoom:) withObject:nil afterDelay:.4];
	}
	else {
		if (doubleTap.text == @"Zoom") {
			[preview takePicture];
			frame.image = [UIImage imageNamed:@"FrameRed.png"];
			[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(timeUpZoom:) object:nil];
			doubleTap.text = @"NextUnzoom";
			[NSTimer scheduledTimerWithTimeInterval:9 target:self selector:@selector(doneSaving) userInfo:nil repeats:NO];
		}
		else {
			if (doubleTap.text == @"NextUnzoom") {
				doubleTap.text = @"Unzoom";
				[self performSelector:@selector(timeUpUnZoom:) withObject:nil afterDelay:.4];
			}
				else {
					if (doubleTap.text == @"Unzoom") {
						[preview takePicture];
						frame.image = [UIImage imageNamed:@"FrameRed.png"];
						[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(timeUpUnZoom:) object:nil];
						doubleTap.text = @"NextZoom";
						[NSTimer scheduledTimerWithTimeInterval:9 target:self selector:@selector(doneSaving) userInfo:nil repeats:NO];
					}
					else {
						doubleTap.text = @"Zoom";
					}
				}
		}
	}
}

-(IBAction)crossHairShow {
	if ([testButton isHighlighted]) {
	[UIImageView beginAnimations:nil context:NULL];
	[UIImageView setAnimationDuration:1];
	
	preview.cameraViewTransform = CGAffineTransformScale(preview.cameraViewTransform, 1.5f, 1.5f);
	[self performSelector:@selector(crossHairShow) withObject:nil afterDelay:.7];
	}
}

-(void)timeUpZoom:(id)sender {
	doubleTap.text = @"NextZoom";
}

-(void)timeUpUnZoom:(id)sender {
	doubleTap.text = @"NextUnzoom";
}
		
-(IBAction)takePicture:(id)sender {
	if ([AButton isHighlighted]) {
		if ([BButton isHighlighted]) {
			[preview takePicture];
			frame.image = [UIImage imageNamed:@"FrameRed.png"];
			source.text = @"Camera";
			[NSTimer scheduledTimerWithTimeInterval:9 target:self selector:@selector(doneSaving) userInfo:nil repeats:NO];
		}
	}
}

-(void)doneSaving {
	frame.image = [UIImage imageNamed:@"FrameGreen.png"];
	[NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(normalAgain) userInfo:nil repeats:NO];
}

-(void)normalAgain {
	frame.image = [UIImage imageNamed:@"Frame.png"];
}

-(IBAction)mainMenu:(id)sender {
	source.text = @"Shoot Around";
	[self dismissModalViewControllerAnimated:YES];
	picture.image = [UIImage imageNamed:@""];
	crossHair.hidden = YES;
	viewController.view.hidden = YES;
	[self.view addSubview:viewController.view];
	CATransition *transition = [CATransition animation];
	transition.duration = 0.75;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionPush;
	transition.subtype = kCATransitionFromLeft;
	[self.view.layer addAnimation:transition forKey:nil];
	transitioning = YES;
	targetViewOptions.hidden = YES;
	viewController.view.hidden = NO;
	[UIApplication sharedApplication].idleTimerDisabled = NO;
}

-(void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    transitioning = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight ||
			interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)nothing;
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Did it work?" message:@"I think so!" delegate:nil 
										  cancelButtonTitle:@"Awesome"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return targetView;
}

-(IBAction)choosePhoto:(id)sender {
	source.text = @"Choose Photo";
	UIButton *myButton = [[UIButton alloc] init];
	myButton = sender;
	if ([myButton.currentTitle isEqualToString:@"Free Shoot"]) {
		choosePhotoNumber = 13;
	}
	else {
		if ([myButton.currentTitle isEqualToString:@"Moving Target"]) {
			choosePhotoNumber = 14;
		}
	}
	UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
	imagePicker.delegate = self;
	imagePicker.allowsEditing = NO;
	imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	[self presentModalViewController:imagePicker animated:YES];
	[imagePicker release]; 
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // The user canceled -- simply dismiss the image picker.
    [self dismissModalViewControllerAnimated:YES];
	source.text = @"Shoot Around";
}

-(IBAction)changeBackground:(id)sender {
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		UIActionSheet *actionSheet = [[UIActionSheet alloc]
									  initWithTitle:@"From Where?"
									  delegate:self
									  cancelButtonTitle:@"Cancel"
									  destructiveButtonTitle:@"Restore Original Background"
									  otherButtonTitles:@"Photo Library", @"Camera", nil];
		[actionSheet showInView:self.view];
		[actionSheet release];
	}
	else {
		UIActionSheet *actionSheet = [[UIActionSheet alloc]
									  initWithTitle:@"From Where?"
									  delegate:self
									  cancelButtonTitle:@"Cancel"
									  destructiveButtonTitle:@"Restore Original Background"
									  otherButtonTitles:@"Photo Library", nil];
		[actionSheet showInView:self.view];
		[actionSheet release];
	}
}

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex {
	
    if (buttonIndex == 0) {
		CGRect frame1 = CGRectMake(0, 0, 480, 320);
		menuBackground.frame = frame1;
		menuBackground.image = [UIImage imageNamed:@"Shoot Around Title Screen.png"];
		
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		NSString *filename = [documentsDirectory stringByAppendingPathComponent:@"background.png"];
		NSFileManager *fileManager = [NSFileManager defaultManager];
		[fileManager removeItemAtPath:filename error:NULL];
		NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
		[prefs setInteger:13 forKey:@"integerKey"];
    } else if (buttonIndex == 1) {
		UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
		imagePicker.delegate = self;
		imagePicker.allowsEditing = NO;
		imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		[self presentModalViewController:imagePicker animated:YES];
		[imagePicker release];
	} else if (buttonIndex == 2) {
		if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
			source.text = @"Choose Photo";
			UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
			imagePicker.delegate = self;
			imagePicker.allowsEditing = NO;
			imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
			[self presentModalViewController:imagePicker animated:YES];
			[imagePicker release];
		}
	}
}

-(void)postTweet:(id)sender {
	NSString *msg = nil;
	NSString *username = nil;
	NSString *password = nil;
	
	msg = [[NSString alloc] initWithFormat:@"I just shot %@ with my iPhone using Shoot Around. Watch out, you could be my next target!", shootObject.text];
	username = [[NSString alloc] initWithFormat:@"%@", twitterUsername.text];
	password = [[NSString alloc] initWithFormat:@"%@", twitterPassword.text];
	TwitterRequest *t = [[TwitterRequest alloc] init];
	t.username = username;
	t.password = password;
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill in all text fields." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
	
	if (shootObject.text.length == 0) {
		[alert show];
	}
	else {
		if (twitterUsername.text.length == 0) {
			[alert show];
		}
		else {
			if (twitterPassword.text.length == 0) {
				[alert show];
			}
			else {
				if (shootObject.text.length > 53) {
					UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Tweet is too long" message:@"Please shorten your tweet to 140 characters or less." delegate:nil 
														   cancelButtonTitle:@"Dismiss"
														   otherButtonTitles:nil];
					[alert1 show];
					[alert1 release];
				}
				else {
					loadingActionSheet = [[UIActionSheet alloc] initWithTitle:@"Posting to Twitter..." delegate:nil
															cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
					[loadingActionSheet showInView:twitter];
					[t statuses_update:msg delegate:self requestSelector:@selector(status_updateCallback:)];
					[self performSelector:@selector(errorTwitter) withObject:nil afterDelay:20];
				}

			}
		}
	}
	[alert release];
}

-(void)status_updateCallback: (NSData *) content {
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(errorTwitter) object:nil];
	[loadingActionSheet dismissWithClickedButtonIndex:0 animated:YES];
	[loadingActionSheet release];
	NSLog(@"%@", [[NSString alloc] initWithData:content encoding:NSASCIIStringEncoding]);
}

-(IBAction)twitterScreen {
	if (preview.cameraOverlayView == overlayView) {
		twitterButton.hidden = YES;
		facebookButton.hidden = YES;
		[shareButton setTitle:@"Share" forState:UIControlStateNormal];
		twitter.backgroundColor = [UIColor clearColor];
		preview.cameraOverlayView = twitter;
	}
	else {
		overlayView.backgroundColor = [UIColor clearColor];
		preview.cameraOverlayView = overlayView;
	}
}

-(IBAction)facebookScreen {
	if (preview.cameraOverlayView == overlayView) {
		twitterButton.hidden = YES;
		facebookButton.hidden = YES;
		[shareButton setTitle:@"Share" forState:UIControlStateNormal];
		facebook.backgroundColor = [UIColor clearColor];
		preview.cameraOverlayView = facebook;
	}
	else {
		overlayView.backgroundColor = [UIColor clearColor];
		preview.cameraOverlayView = overlayView;
	}
}
	

-(IBAction)share {
	if (twitterButton.hidden == YES) {
		[shareButton setTitle:@"Cancel" forState:UIControlStateNormal];
		twitterButton.hidden = NO;
		facebookButton.hidden = NO;
	}
	else {
		twitterButton.hidden = YES;
		facebookButton.hidden = YES;
		[shareButton setTitle:@"Share" forState:UIControlStateNormal];
	}
}


-(IBAction)hideKeyboard:(id)sender {
	[sender resignFirstResponder];
}

-(IBAction)crossHairToggle {
	if (crossHair.hidden == YES) {
		crossHair.hidden = NO;
	}
	else {
		crossHair.hidden = YES;
	}
}

-(IBAction)sliderChanged:(id)sender {
	float sliderPosition = (slider.value);
	NSString *text = [[NSString alloc] initWithFormat: @"%0.1f", sliderPosition];
	zoomAmount.text = text;
	[text release];
}

/*- (void)askPermission:(id)target {
	FBPermissionDialog* dialog = [[[FBPermissionDialog alloc] init] autorelease];
	dialog.delegate = self;
	dialog.permission = @"status_update";
	[dialog show];
	[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(publishFeed:) userInfo:nil repeats:NO];
}

- (void)publishFeed:(id)target {
	if (shootObjectFacebook.text.length == 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill in all text fields." delegate:nil 
											  cancelButtonTitle:@"Dismiss"
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	else {
		NSString *wallPost = nil;
		wallPost = [[NSString alloc] initWithFormat:@"{\"object\":\"%@\"}", shootObjectFacebook.text];
		FBFeedDialog* dialog = [[[FBFeedDialog alloc] init] autorelease];
		dialog.delegate = self;
		dialog.templateBundleId = 146241571908;
		dialog.templateData = wallPost;
		[dialog show];
	}
}*/

-(IBAction)zoom {
	float sliderPosition = (slider.value);
	preview.cameraViewTransform = CGAffineTransformScale(preview.cameraViewTransform, 1.0f / zoomInt, 1.0f / zoomInt);
	preview.cameraViewTransform = CGAffineTransformScale(preview.cameraViewTransform, sliderPosition, sliderPosition);
	zoomInt = sliderPosition;
}

-(void)errorTwitter {
	[loadingActionSheet dismissWithClickedButtonIndex:0 animated:YES];
	[loadingActionSheet release];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Can not post tweet. Make sure your Username and Password are correct and try again." delegate:nil 
										  cancelButtonTitle:@"Dismiss"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
}

-(IBAction)checkNetwork:(id)sender {
	Reachability *hostReach = [[Reachability reachabilityWithHostName: @"www.apple.com"] retain];
	
	NetworkStatus netStatus = [hostReach currentReachabilityStatus];
	
	if (netStatus == NotReachable)
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Internet Connection Required" message:@"Check that you are connected to the internet and try again." delegate:nil 
											  cancelButtonTitle:@"Dismiss"
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	
	if (netStatus == ReachableViaWiFi)
	{
		if (sender == publishButton) {
			[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(publishFeed:) userInfo:nil repeats:NO];
		}
		else {
			if (sender == button) {
			}
			else {
			[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(postTweet:) userInfo:nil repeats:NO];
			}
		}

	}
	
	if (netStatus == ReachableViaWWAN)
	{
		if (sender == publishButton) {
			[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(publishFeed:) userInfo:nil repeats:NO];	
		}
		else {
			if (sender == button) {
			}
			else {
				[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(postTweet:) userInfo:nil repeats:NO];
			}
		}

	}
}

/*- (void)dialogDidSucceed:(FBDialog*)dialog { 
    button.hidden = YES;
}	*/

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
		[self dismissModalViewControllerAnimated:YES];
		if (source.text == @"Choose Photo") {
			if (choosePhotoNumber == 14) {
				[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(startLoop) userInfo:nil repeats:NO];
				targetVelocity = CGPointMake(kBallSpeedX, kBallSpeedY);
				target.hidden = NO;
			}
			[moveTarget invalidate];
			[stillPicture removeFromSuperview];
			[self.view addSubview:stillPicture];
			scrollView.zoomScale = 1;
			picture.image = image;
			scrollView.contentSize = picture.frame.size;
			scrollView.maximumZoomScale = 4;
			scrollView.minimumZoomScale = 1;
			scrollView.clipsToBounds = NO;
			scrollView.delegate = self; 
			scoreNumber = 0;
			score.text = @"0";
			
			if (image.size.width == 1200) {
				CGRect frame1 = CGRectMake(90, 15, 300, 400);
				targetView.frame = frame1;
			}
			else {
				if (image.size.width == 1600) {
					CGRect frame1 = CGRectMake(40, 15, 400, 300);
					targetView.frame = frame1;
				}
				else {
					if (image.size.width == 320) {
						CGRect frame1 = CGRectMake(80, 15, 320, 480);
						targetView.frame = frame1;
					}
					else {
						if (image.size.width == 800) {
							CGRect frame1 = CGRectMake(40, 15, 400, 300);
							targetView.frame = frame1;
						}
						else {
							if (image.size.width == 600) {
								CGRect frame1 = CGRectMake(90, 15, 300, 400);
								targetView.frame = frame1;
							}
							else {
								if (image.size.width == 480) {
									CGRect frame1 = CGRectMake(0, 15, 480, 320);
									targetView.frame = frame1;
								}
								else {
									if (image.size.width == 2048) {
										CGRect frame1 = CGRectMake(80, 15, 320, 240);
										targetView.frame = frame1;
									}
									else {
										if (image.size.width == 1536) {
											CGRect frame1 = CGRectMake(80, 15, 320, 427);
											targetView.frame = frame1;
										}
										else {
											CGRect frame1 = CGRectMake(0, 15, image.size.width, image.size.height);
											targetView.frame = frame1;
											scrollView.minimumZoomScale = .5;
										}
									}
								}
							}
						}
					}
				}
			}
			targetView.center = scrollView.center;
			target.center = scrollView.center;
		}
		else {
			menuBackground.image = image;
			if (image.size.width == 1200) {
				CGRect frame1 = CGRectMake(120, 0, 240, 320);
				menuBackground.frame = frame1;
				NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
				[prefs setInteger:24 forKey:@"integerKey"];
			}
			else {
				if (image.size.width == 320) {
					CGRect frame1 = CGRectMake(133, 0, 320/1.5, 320);
					menuBackground.frame = frame1;
					NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
					[prefs setInteger:24 forKey:@"integerKey"];
				}
				else {
					if (image.size.width == 600) {
						CGRect frame1 = CGRectMake(120, 0, 240, 320);
						menuBackground.frame = frame1;
						NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
						[prefs setInteger:24 forKey:@"integerKey"];
					}
					else {
						if (image.size.width == 1536) {
							CGRect frame1 = CGRectMake(120, 0, 240, 320);
							menuBackground.frame = frame1;
							NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
							[prefs setInteger:24 forKey:@"integerKey"];
						}
						else {
							CGRect frame1 = CGRectMake(0, 0, 480, 320);
							menuBackground.frame = frame1;
							NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
							[prefs setInteger:42 forKey:@"integerKey"];
						}
						
					}
				}
			}
			[UIImagePNGRepresentation(menuBackground.image) writeToFile:[self backgroundPath] atomically:YES];
		}
	}
	else {
		if (source.text == @"Choose Photo") {
			menuBackground.image = image;
			[menuBackground removeFromSuperview];
			[viewController.view addSubview:menuBackground];
			[self dismissModalViewControllerAnimated:YES];
			if (image.size.width == 1200) {
				CGRect frame1 = CGRectMake(120, 0, 240, 320);
				menuBackground.frame = frame1;
				NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
				[prefs setInteger:24 forKey:@"integerKey"];
			}
			else {
				if (image.size.width == 1536) {
					menuBackground.image = image;
					[self dismissModalViewControllerAnimated:YES];
					CGRect frame1 = CGRectMake(120, 0, 240, 320);
					menuBackground.frame = frame1;
					NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
					[prefs setInteger:24 forKey:@"integerKey"];
				}
				else {
					menuBackground.image = image;
					[self dismissModalViewControllerAnimated:YES];
					CGRect frame1 = CGRectMake(0, 0, 480, 320);
					menuBackground.frame = frame1;
					NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
					[prefs setInteger:42 forKey:@"integerKey"];
				}
				
			}
			source.text = @"Shoot Around";
			menuBackground.image = image;
			[UIImagePNGRepresentation(image) writeToFile:[self backgroundPath] atomically:YES];
		}
		else {
			if (source.text == @"Camera") {
				self.view = screenShot;
				pictureTaken.image = image;
				UIGraphicsBeginImageContext(screenShot.frame.size);
				[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
				UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
				NSData *screenshotPNG = UIImagePNGRepresentation(viewImage);
				UIGraphicsEndImageContext();
				UIImageWriteToSavedPhotosAlbum([UIImage imageWithData:screenshotPNG], nil, nil, nil);
				self.view = menu;
			}
			else {
				UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
			}
		}
	}
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager {
	return YES;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
	if (newHeading.headingAccuracy > 0) {
		if (newHeading.magneticHeading > targetLocation - 1) {
			if (newHeading.magneticHeading < targetLocation + 51) {
				if (targetInt == 14) {
					//changed it from CGRectMake to CGPointMake
					target.center = CGPointMake(targetX, ((targetLocation + 50 - newHeading.magneticHeading)*10.64) - 52);
				}
			}
			else {
				target.frame = CGRectMake(141, -52, 52, 52);
			}
		}
		else {
			target.frame = CGRectMake(141, 480, 52, 52);
		}
	}
	targetY = target.center.x;
}

- (void)locationManager12121:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
	if (newHeading.headingAccuracy > 0) {
		if (newHeading.magneticHeading > 150) {
			if (newHeading.magneticHeading < 200) {
				if (targetInt == 14) {
				}
				else {
					if (newHeading.magneticHeading > targetInt) {
						//move target 12 pixels to the left.
						target.frame = CGRectMake(134, 480 - (160 - newHeading.magneticHeading) * -1 *13.3, 52, 52);
					}
					else {
						target.frame = CGRectMake(134, 480 + (160 - newHeading.magneticHeading) * 1 * 13.3, 52, 52);
					}
				}
			}
		}
	}
	targetInt = newHeading.magneticHeading;
}

- (void)accelerometer:(UIAccelerometer *)acel didAccelerate:(UIAcceleration *)aceler {
	targetHeight = -.3;
	targetY = 240;
	CGFloat z = aceler.z;
	CGFloat roundz = round(z * 100.0) / 100.0;
	float PointX = (160 - (targetAverage + roundz + targetAverage)/3 * (1/(targetHeight + .6)) * 173);
	if (roundz <= -targetHeight + .6) {
		if (roundz >= targetHeight) {
			if (roundz >= targetAverage +0.02) {
				frame.image = [UIImage imageNamed:@"FrameGreen.png"];
				target.center = CGPointMake(PointX, targetY);
			}
			else {
				if (roundz <= targetAverage -0.01) {
					frame.image = [UIImage imageNamed:@"FrameGreen.png"];
					target.center = CGPointMake(PointX, targetY);
				}
			}
		}
		else {
			frame.image = [UIImage imageNamed:@"Frame.png"];
			target.center = CGPointMake(1000, targetY);
		}
	}
	else {
		frame.image = [UIImage imageNamed:@"Frame.png"];
		target.center = CGPointMake(1000, targetY);
	}
	NSString *xstring = [NSString stringWithFormat:
						 @"%f",roundz];
	[pictureOrientation setText:xstring];
	
	targetAverage = roundz;
	targetX = target.center.y;
}

-(IBAction)testingNumber:(id)sender {
	int myRandomNumber;
	myRandomNumber = arc4random() % 320;
	myRandomNumber = targetLocation;
	NSString *text = [[NSString alloc] initWithFormat:@"%d.png", myRandomNumber];
	menuText.text = text;
	[text release];
}

-(IBAction)videoRecording6:(id)sender {
	NSMutableArray *myArray = [[NSMutableArray alloc] init];
	if (videoNumber == -14) {
		[myArray writeToFile:[self videoRecorderPath] atomically:YES];
	}
	else {
		CGImageRef img = UIGetScreenImage();
		UIImage *grabbedImage = [UIImage imageWithCGImage:img];
		// you can now manipulate the grabbedImage;
		videoNumber = videoNumber + 1;
		[myArray addObject:grabbedImage];
		CFRelease(img);
		[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(videoRecording:) userInfo:nil repeats:NO];
	}
}

-(IBAction)videoRecording:(id)sender {
	if (videoNumber < 10) {
		CGImageRef img = UIGetScreenImage();
		UIImage *photo = [UIImage imageWithCGImage:img];
		[videoArray addObject:photo];
		videoNumber = videoNumber + 1;
		[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(videoRecording:) userInfo:nil repeats:NO];
	}
	else {
		[NSKeyedArchiver archiveRootObject:videoArray toFile:[self videoRecorderPath]];
		videoNumber = 0;
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill in all text fields." delegate:nil 
											  cancelButtonTitle:@"Dismiss"
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}

}

-(IBAction)playVideo:(id)sender {
	NSString *filepath = [self videoRecorderPath];
	NSArray *myArray = [[NSArray alloc] initWithContentsOfFile:filepath];
	NSData* data = [NSData dataWithContentsOfFile:[self videoRecorderPath]]; 
	id array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
	video.animationImages = array;
	video.animationDuration = videoNumber/10;
	video.contentMode = UIViewContentModeBottomLeft;
	[video startAnimating];
}

-(IBAction)stopVideo {
	videoNumber = -14;
}

-(IBAction)videoRecording1:(id)sender {
	NSMutableArray *myArray = [[NSMutableArray alloc] init];
	CGImageRef img = UIGetScreenImage();
	UIImage *grabbedImage = [UIImage imageWithCGImage:img];
	UIImage *image = [UIImage imageNamed:@"Target.png"];
	// you can now manipulate the grabbedImage;
	videoNumber = videoNumber + 1;
	if (videoNumber > 10) {
	}
	else {
		[self performSelector:@selector(videoRecording:) withObject:nil afterDelay:0.1];
		if (videoNumber == 1) {
			[UIImageJPEGRepresentation(grabbedImage, 0.0) writeToFile:[self videoRecorderPath] atomically:NO];
			[myArray addObject:[UIImage imageWithCGImage:img]];
		}
		else {
			if (videoNumber == 2) {
				[UIImageJPEGRepresentation(grabbedImage, 0.0) writeToFile:[self videoRecorderPath] atomically:NO];
				[myArray addObject:image];
			}
			else {
				if (videoNumber == 3) {
					[UIImageJPEGRepresentation(grabbedImage, 0.0) writeToFile:[self videoRecorderPath] atomically:NO];
					[myArray addObject:[UIImage imageWithCGImage:img]];
				}
				else {
					if (videoNumber == 4) {
						[UIImageJPEGRepresentation(grabbedImage, 0.0) writeToFile:[self videoRecorderPath] atomically:NO];
						[myArray addObject:[UIImage imageWithCGImage:img]];
					}
					else {
						if (videoNumber == 5) {
							[UIImageJPEGRepresentation(grabbedImage, 0.0) writeToFile:[self videoRecorderPath] atomically:NO];
							[myArray addObject:[UIImage imageWithCGImage:img]];
						}
						else {
							if (videoNumber == 6) {
								[UIImageJPEGRepresentation(grabbedImage, 0.0) writeToFile:[self videoRecorderPath] atomically:NO];
								[myArray addObject:[UIImage imageWithCGImage:img]];
							}
							else {
								if (videoNumber == 7) {
									[UIImageJPEGRepresentation(grabbedImage, 0.0) writeToFile:[self videoRecorderPath] atomically:NO];
									[myArray addObject:[UIImage imageWithCGImage:img]];
								}
								else {
									if (videoNumber == 8) {
										[UIImageJPEGRepresentation(grabbedImage, 0.0) writeToFile:[self videoRecorderPath] atomically:NO];
										[myArray addObject:[UIImage imageWithCGImage:img]];
									}
									else {
										if (videoNumber == 9) {
											[UIImageJPEGRepresentation(grabbedImage, 0.0) writeToFile:[self videoRecorderPath] atomically:NO];
											[myArray addObject:[UIImage imageWithCGImage:img]];
										}
										else {
											if (videoNumber == 10) {
												[UIImageJPEGRepresentation(grabbedImage, 0.0) writeToFile:[self videoRecorderPath] atomically:NO];
												[myArray addObject:[UIImage imageWithCGImage:img]];
												video.animationImages = myArray;
												video.animationDuration = 1;
												video.contentMode = UIViewContentModeBottomLeft;
												[video startAnimating];
											}
											else {
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		CFRelease(img);
	}
}

-(IBAction)playVideo1:(id)sender {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"1.jpeg"];
	NSString *documentsDirectory2 = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"2.jpeg"];
	NSString *documentsDirectory3 = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"3.jpeg"];
	NSString *documentsDirectory4 = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"4.jpeg"];
	NSString *documentsDirectory5 = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"5.jpeg"];
	NSString *documentsDirectory6 = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"6.jpeg"];
	NSString *documentsDirectory7 = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"7.jpeg"];
	NSString *documentsDirectory8 = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"8.jpeg"];
	NSString *documentsDirectory9 = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"9.jpeg"];
	NSString *documentsDirectory10 = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"10.jpeg"];
	NSArray * imageArray  = [[NSArray alloc] initWithObjects:
							 [UIImage imageWithContentsOfFile:documentsDirectory],
							 [UIImage imageWithContentsOfFile:documentsDirectory2],
							 [UIImage imageWithContentsOfFile:documentsDirectory3],
							 [UIImage imageWithContentsOfFile:documentsDirectory4],
							 [UIImage imageWithContentsOfFile:documentsDirectory5],
							 [UIImage imageWithContentsOfFile:documentsDirectory6],
							 [UIImage imageWithContentsOfFile:documentsDirectory7],
							 [UIImage imageWithContentsOfFile:documentsDirectory8],
							 [UIImage imageWithContentsOfFile:documentsDirectory9],
							 [UIImage imageWithContentsOfFile:documentsDirectory10],
							 nil];
	NSArray * myArray = [NSArray arrayWithArray:videoArray];
	video.animationImages = videoArray;
	video.animationDuration = 10;
	video.contentMode = UIViewContentModeBottomLeft;
	[video startAnimating];
	[imageArray release];
}

-(IBAction)saveVideo2 {
	NSMutableArray *array = [[NSMutableArray alloc] init];
	[array addObject:[UIImage imageNamed:@"Target.png"]];
	[array writeToFile:[self videoRecorderPath] atomically:YES];
}

-(IBAction)playVideo2 {
	NSString *filePath = [self videoRecorderPath];
	NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
	video.image = [array objectAtIndex:0];
	[array release];
}

-(void)startLoop {
	moveTarget = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(targetLoop) userInfo:nil repeats:YES];
}

-(void)targetLoop {
	if (increase.text == @"Increase") {
		[moveTarget invalidate];
		moveTarget = nil;
		int scoreNumber2;
		scoreNumber2 = scoreNumber + 1;
		scoreNumber = scoreNumber2;
		score.text = [NSString stringWithFormat:@"%d", scoreNumber2];
		increase.text = @"";
		targetVelocity.x = kBallSpeedX + 1 * scoreNumber;
		targetVelocity.y = kBallSpeedY + 1 * scoreNumber;
		
		[NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(startLoop) userInfo:nil repeats:NO];
	}
	
	target2.center = CGPointMake(target2.center.x + targetVelocity.x, target2.center.y + targetVelocity.y);
	if (target2.center.x > targetView.bounds.size.width || target2.center.x < 0) {
		targetVelocity.x = -targetVelocity.x;
	}
	
	if (target2.center.y > targetView.bounds.size.height || target2.center.y < 0) {
		targetVelocity.y = -targetVelocity.y;
	}
}

-(IBAction)choosePhotoMenu {
	targetViewOptions.hidden = YES;
	[self.view addSubview:targetViewOptions];
	CATransition *transition = [CATransition animation];
	transition.duration = 0.75;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	transition.type = kCATransitionPush;
	transition.subtype = kCATransitionFromRight;
	transitioning = YES;
	[targetViewOptions.layer addAnimation:transition forKey:nil];
	[menu.layer addAnimation:transition forKey:nil];
	menu.hidden = YES;
	targetViewOptions.hidden = NO;
	UIView *tmp = menu;
	menu = targetViewOptions;
	targetViewOptions = tmp;
}

-(IBAction)saveObjects {
	NSMutableArray *array = [NSMutableArray arrayWithObjects:pictureOrientation.text,nil];
	NSMutableData *data = [NSMutableData data];
	NSKeyedArchiver *encode = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
	
	NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [path objectAtIndex:0];
	NSString *file = [docDirectory stringByAppendingPathComponent:@"save.iDK"];
	NSLog(file);
	
	[encode encodeObject:array forKey:@"save"];
	[encode finishEncoding];
	
	[data writeToFile:file atomically:YES];
	[encode release];
}

-(IBAction)loadObjects {
	NSFileManager *manager = [NSFileManager defaultManager];
	
	NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [path objectAtIndex:0];
	NSString *file = [docDirectory stringByAppendingPathComponent:@"save.iDK"];
	
	if([manager fileExistsAtPath:file]) {
		NSLog(@"file located and reading");
		
		NSMutableData *data;
		NSMutableArray *array;
		NSKeyedUnarchiver *decode;
		
		data = [NSData dataWithContentsOfFile:file];
		decode = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
		array = [decode decodeObjectForKey:@"save"];
		[decode finishDecoding];
		[decode release];
		a = [array objectAtIndex:0];
	}
}


- (void)dealloc {
    [super dealloc];
	[overlayView release];
	[viewController release];
	[leftMissile release];
	[rightMissile release];
	[AButton release];
	[BButton release];
	[doubleTap release];
	[crossHair release];
	[preview release];
	[stillPicture release];
	[scrollView release];
	[rightMissilePhoto release];
	[leftMissilePhoto release];
	[movePicture release];
	[fire release];
	[saving release];
	[menuBackground release];
	[menu release];
	[menuText release];
	[frame release];
	[pictureOrientation release];
	[menuButton release];
	[choosePhotoButton release];
	[cameraButton release];
	[twitterMessageText release];
	[updateButton release];
	[twitter release];
	[shootObject release];
	[twitterUsername release];
	[twitterPassword release];
	[zoomAmount release];
	[slider release];
	[button release];
	[publishButton release];
	[shareButton release];
	[facebook release];
	[twitterButton release];
	[facebookButton release];
	[shootObjectFacebook release];
	[shootFrame release];
	[pictureTaken release];
	[screenShot release];
	[targetButton release];
	[backgroundButton release];
	[otherBackgroundButton release];
	[target release];
	[otherChoosePhotoButton release];
	[source release];
	[a release];
	[b release];
	[c release];
	[d release];
	[e release];
	[f release];
	[g release];
	[h release];
	[i release];
	[j release];
	[videoRecording release];
	[video release];
	[slideNumber release];
	[videoArray release];
	[target2 release];
	[moveTarget release];
	[timer release];
	[score release];
	[increase release];
	[targetView release];
	[targetViewOptions release];
	[backgroundView release];
}

@end


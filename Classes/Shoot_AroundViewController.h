//
//  Shoot_AroundViewController.h
//  Shoot Around
//
//  Created by Riley on 9/11/09.
//  Copyright Riley Testut 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreLocation/CoreLocation.h>
#define kFilename @"data.plist"
#define kViewDistance 0.08 
#define kPixelsPerMeter 6400 

@class Shoot_AroundViewController;

@interface Shoot_AroundViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate, UIActionSheetDelegate, CLLocationManagerDelegate, UIAccelerometerDelegate> {
	IBOutlet UIView *overlayView;
	Shoot_AroundViewController *viewController;
	IBOutlet UIView *stillPicture;
	IBOutlet UIView *movePicture;
	IBOutlet UIView *menu;
	IBOutlet UIView *twitter;
	IBOutlet UIView *facebook;
	IBOutlet UIView *screenShot;
	IBOutlet UIView *targetView;
	IBOutlet UIView *targetViewOptions;
	IBOutlet UIView *backgroundView;
	
	IBOutlet UIView *videoRecording;
	
	IBOutlet UIScrollView *scrollView;
	
	IBOutlet UIImagePickerController *preview;
	
	IBOutlet UIImageView *rightMissile;
	IBOutlet UIImageView *leftMissile;
	IBOutlet UIImageView *crossHair;
	IBOutlet UIImageView *picture;
	IBOutlet UIImageView *rightMissilePhoto;
	IBOutlet UIImageView *leftMissilePhoto;
	IBOutlet UIImageView *fire;
	IBOutlet UIImageView *menuBackground;
	IBOutlet UIImageView *frame;
	IBOutlet UIImageView *shootFrame;
	IBOutlet UIImageView *pictureTaken;
	IBOutlet UIImageView *target;
	IBOutlet UIImageView *target2;
	
	IBOutlet UIImageView *a;
	IBOutlet UIImageView *b;
	IBOutlet UIImageView *c;
	IBOutlet UIImageView *d;
	IBOutlet UIImageView *e;
	IBOutlet UIImageView *f;
	IBOutlet UIImageView *g;
	IBOutlet UIImageView *h;
	IBOutlet UIImageView *i;
	IBOutlet UIImageView *j;
	IBOutlet UIImageView *video;
	
	IBOutlet UIButton *AButton, *BButton;
	IBOutlet UIButton *menuButton;
	IBOutlet UIButton *choosePhotoButton;
	IBOutlet UIButton *cameraButton;
	IBOutlet UIButton *testButton;
	IBOutlet UIButton *publishButton;
	IBOutlet UIButton *shareButton;
	IBOutlet UIButton *twitterButton;
	IBOutlet UIButton *facebookButton;
	IBOutlet UIButton *targetButton;
	IBOutlet UIButton *backgroundButton;
	IBOutlet UIButton *otherBackgroundButton;
	IBOutlet UIButton *otherChoosePhotoButton;
	
	IBOutlet UITextField *doubleTap;
	IBOutlet UITextField *shootObject;
	IBOutlet UITextField *twitterUsername;
	IBOutlet UITextField *twitterPassword;
	IBOutlet UITextField *shootObjectFacebook;
	
	IBOutlet UITextView *twitterMessageText;
	IBOutlet UIButton *updateButton;
	
	IBOutlet UIActionSheet *loadingActionSheet;
	
	SystemSoundID *shoot;
	
	IBOutlet UILabel *saving;
	IBOutlet UILabel *menuText;
	IBOutlet UILabel *zoomAmount;
	IBOutlet UILabel *source;
	IBOutlet UILabel *pictureOrientation;
	IBOutlet UILabel *slideNumber;
	IBOutlet UILabel *increase;
	IBOutlet UILabel *timer;
	IBOutlet UILabel *score;
	
	Float32 zoomInt;
	Float32 targetInt;
	Float32 targetLocation;
	Float32 videoNumber;
	Float32 scoreNumber;
	Float32 timerNumber;
	Float32 choosePhotoNumber;
	Float32 targetX;
	Float32 targetY;
	Float32 targetAverage;
	Float32 targetHeight;
	
	IBOutlet UISlider *slider;
	
	id *session;
	id *fbHelper;
	
	IBOutlet id *button;
	
	IBOutlet BOOL connectedToNetwork;
	
	NSMutableArray *videoArray;
	
	CGPoint targetVelocity;
	
	NSTimer *moveTarget;
	
	BOOL transitioning;
	
	UIAccelerationValue rollingX, rollingY, rollingZ;

}
@property (nonatomic, retain) UIView *overlayView;
@property (nonatomic, retain) Shoot_AroundViewController *viewController;
@property (nonatomic, retain) UIImagePickerController *preview;
@property (nonatomic, retain) UIImageView *rightMissile;
@property (nonatomic, retain) UIImageView *leftMissile;
@property (nonatomic, retain) UIButton *AButton, *BButton;
@property (nonatomic, retain) UITextField *doubleTap;
@property (nonatomic, retain) UIImageView *crossHair;
@property (nonatomic, retain) UIImageView *picture;
@property (nonatomic, retain) UIView *stillPicture;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIImageView *rightMissilePhoto;
@property (nonatomic, retain) UIImageView *leftMissilePhoto;
@property (nonatomic, retain) UIView *movePicture;
@property (nonatomic, retain) UIImageView *fire;
@property (nonatomic, retain) UILabel *saving;
@property (readonly) SystemSoundID *shoot;
@property (nonatomic, retain) UIImageView *menuBackground;
@property (nonatomic, retain) UIView *menu;
@property (nonatomic, retain) UILabel *menuText;
@property (nonatomic, retain) UIImageView *frame;
@property (nonatomic, retain) UILabel *pictureOrientation;
@property (nonatomic, retain) UIButton *menuButton;
@property (nonatomic, retain) UIButton *choosePhotoButton;
@property (nonatomic, retain) UIButton *cameraButton;
@property (nonatomic, retain) UIButton *testButton;
@property (nonatomic, retain) UITextView *twitterMessageText;
@property (nonatomic, retain) UIButton *updateButton;
@property (nonatomic, retain) UIView *twitter;
@property (nonatomic, retain) UITextField *shootObject;
@property (nonatomic, retain) UITextField *twitterUsername;
@property (nonatomic, retain) UITextField *twitterPassword;
@property (nonatomic, retain) UILabel *zoomAmount;
@property (nonatomic) Float32 *zoomInt;
@property (nonatomic, retain) UISlider *slider;
@property (nonatomic, retain) id *button;
@property (nonatomic, retain) UIButton *publishButton;
@property (nonatomic, retain) UIButton *shareButton;
@property (nonatomic) BOOL connectedToNetwork;
@property (nonatomic, retain) UIView *facebook;
@property (nonatomic, retain) UIButton *twitterButton;
@property (nonatomic, retain) UIButton *facebookButton;
@property (nonatomic, retain) UITextField *shootObjectFacebook;
@property (nonatomic, retain) UIImageView *shootFrame;
@property (nonatomic, retain) UIImageView *pictureTaken;
@property (nonatomic, retain) UIView *screenShot;
@property (nonatomic, retain) UIButton *targetButton;
@property (nonatomic, retain) UIButton *backgroundButton;
@property (nonatomic) Float32 *targetInt;
@property (nonatomic, retain) UIButton *otherBackgroundButton;
@property (nonatomic, retain) UIImageView *target;
@property (nonatomic) Float32 *targetLocation;
@property (nonatomic, retain) UIButton *otherChoosePhotoButton;
@property (nonatomic, retain) UILabel *source;
@property (nonatomic, retain) UIImageView *a;
@property (nonatomic, retain) UIImageView *b;
@property (nonatomic, retain) UIImageView *c;
@property (nonatomic, retain) UIImageView *d;
@property (nonatomic, retain) UIImageView *e;
@property (nonatomic, retain) UIImageView *f;
@property (nonatomic, retain) UIImageView *g;
@property (nonatomic, retain) UIImageView *h;
@property (nonatomic, retain) UIImageView *i;
@property (nonatomic, retain) UIImageView *j;
@property (nonatomic, retain) UIView *videoRecording;
@property (nonatomic, retain) UIImageView *video;
@property (nonatomic, retain) UILabel *slideNumber;
@property (nonatomic) Float32 *videoNumber;
@property (nonatomic, retain) NSMutableArray *videoArray;
@property (nonatomic) CGPoint targetVelocity;
@property (nonatomic, retain) UIImageView *target2;
@property (nonatomic, retain) UILabel *increase;
@property (nonatomic, retain) UILabel *timer;
@property (nonatomic, retain) UILabel *score;
@property (nonatomic) Float32 *scoreNumber;
@property (nonatomic) Float32 *timerNumber;
@property (nonatomic, retain) NSTimer *moveTarget;
@property (nonatomic, retain) UIView *targetView;
@property (nonatomic, retain) UIView *targetViewOptions;
@property (nonatomic, retain) UIView *backgroundView;
@property (nonatomic) Float32 *choosePhotoNumber;
@property (nonatomic) Float32 *targetX;
@property (nonatomic) Float32 *targetY;
@property (nonatomic) Float32 *targetAverage;
@property (nonatomic) Float32 *targetHeight;

- (NSString *)backgroundPath;
- (NSString *)landscapePath;
-(IBAction)takePicture:(id)sender;
-(IBAction)openPreview:(id)sender;
-(IBAction)zoom;
-(IBAction)mainMenu:(id)sender;
-(IBAction)shoot:(id)sender;
-(IBAction)rapidFire:(id)sender;
-(IBAction)choosePhoto:(id)sender;
-(IBAction)openPhotos:(id)sender;
-(IBAction)screenShot:(id)sender;
-(IBAction)changeBackground:(id)sender;
-(IBAction)crossHairShow;
-(IBAction)hideKeyboard:(id)sender;
-(IBAction)crossHairToggle;
-(IBAction)sliderChanged:(id)sender;
-(IBAction)checkNetwork:(id)sender;
-(IBAction)share;
-(IBAction)twitterScreen;
-(IBAction)facebookScreen;
-(IBAction)testingNumber:(id)sender;
-(IBAction)videoRecording:(id)sender;
-(IBAction)playVideo:(id)sender;
-(IBAction)playVideo2;
-(IBAction)saveVideo2;
-(IBAction)choosePhotoMenu;
-(IBAction)saveObjects;
-(IBAction)loadObjects;

-(BOOL) connectedToNetwork;

- (IBAction)askPermission:(id)target;
- (IBAction)publishFeed:(id)target;

@end


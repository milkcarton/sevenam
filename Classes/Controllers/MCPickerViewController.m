//
//  MCPickerViewController.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCPickerViewController.h"
#import "MCBlend.h"
#import "MCAvailableBlendsViewController.h"

static BOOL accelerationIsShaking(UIAcceleration* last, UIAcceleration* current, double threshold) {
	double deltaX = fabs(last.x - current.x);
	double deltaY = fabs(last.y - current.y);
	double deltaZ = fabs(last.z - current.z);
	return (deltaX > threshold && deltaY > threshold) || (deltaX > threshold && deltaZ > threshold) || (deltaY > threshold && deltaZ > threshold);
}

@implementation MCPickerViewController

@synthesize lastAcceleration;
@synthesize blendController;

#pragma mark Overriden methods

- (void)loadView {
	[super loadView];
	
	pickerView = [[MCPickerView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	pickerView.delegate = self;
	[pickerView viewsHidden:YES];
	
	firstScreenLoad = YES;
	[self loadPreferences];
	
	[self setView:pickerView];
}

- (void)viewWillAppear:(BOOL)animated {
	blends = [blendController yourBlends];
}

- (void)viewDidAppear:(BOOL)animated {
	if (firstScreenLoad) {
		[NSThread detachNewThreadSelector:@selector(postponedRefresh) toTarget:self withObject:nil];
		firstScreenLoad = NO;
	}
}

- (void)dealloc {
	[lastAcceleration dealloc];
	[blends dealloc];
	[pickerView dealloc];
	[super dealloc];
}

#pragma mark Delegate methods for MCPickerView

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if (!histeresisExcited) {
		histeresisExcited = YES;
		[self refresh];
	}
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	histeresisExcited = NO;
}

#pragma mark UIAccelerometerDelegate

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration { 
	if (shakingEnabled) {
		if (self.lastAcceleration) {
			if (!histeresisExcited && accelerationIsShaking(self.lastAcceleration, acceleration, 0.7)) {
				histeresisExcited = YES;
				[self refresh];
			}
		}
		self.lastAcceleration = acceleration;
	}
}

#pragma mark Personal methods

- (void)refresh {
	int number = (arc4random() % [blends count]);
	MCBlend *blend = (MCBlend *) [blends objectAtIndex:number];
	pickerView.blend = blend;
	
	[pickerView viewsHidden:NO];
	[pickerView flipView];
}

- (void)loadBlendSelection {
	MCAvailableBlendsViewController *availableBlendsController = [[[MCAvailableBlendsViewController alloc] init] autorelease];
	availableBlendsController.blendController = blendController;
	UINavigationController *blendsNavigationController = [[UINavigationController alloc] initWithRootViewController:availableBlendsController];
	[self.navigationController presentModalViewController:blendsNavigationController animated:YES];
}

- (void)postponedRefresh {
	NSCondition *condition = [[NSCondition alloc] init];
	[condition waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
	[self refresh];
}

- (void)loadPreferences {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	shakingEnabled = [defaults boolForKey:@"shaking"];
}

@end


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
	blends = [blendController yourBlends];
	
	[super loadView];
	
	pickerView = [[MCPickerView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	pickerView.delegate = self;
	[self setView:pickerView];
}

- (void)dealloc {
	[lastAcceleration dealloc];
	[blends dealloc];
	[pickerView dealloc];
	[super dealloc];
}

#pragma mark Delegate methods for MCPickerView

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[self refresh];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	histeresisExcited = NO;
}

#pragma mark UIAccelerometerDelegate

- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	if (self.lastAcceleration) {
		if (!histeresisExcited && accelerationIsShaking(self.lastAcceleration, acceleration, 0.7)) {
			histeresisExcited = YES;
			[self refresh];
		}
	}
	self.lastAcceleration = acceleration;
}

#pragma mark Personal methods

- (void)refresh {
	int number = (random() % [blends count]);
	MCBlend *blend = (MCBlend *) [blends objectAtIndex:number];
	pickerView.blend = blend;
	
	[pickerView flipView];
}

- (void)loadInfo {
	MCAvailableBlendsViewController *availableBlendsController = [[[MCAvailableBlendsViewController alloc] init] autorelease];
	availableBlendsController.blendController = blendController;
	UINavigationController *blendsNavigationController = [[UINavigationController alloc] initWithRootViewController:availableBlendsController];
	[self.navigationController presentModalViewController:blendsNavigationController animated:YES];
}

@end


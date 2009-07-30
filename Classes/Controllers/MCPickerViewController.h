//
//  MCPickerViewController.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCPickerView.h"
#import "MCBlendController.h"

@interface MCPickerViewController : UIViewController <UIAccelerometerDelegate> {
	MCPickerView *pickerView;
	NSArray *blends;
	
	BOOL histeresisExcited;
	UIAcceleration* lastAcceleration;
	
	MCBlendController *blendController;
}

@property(retain) UIAcceleration* lastAcceleration;
@property(retain) MCBlendController* blendController;

- (void)refresh;
- (void)loadInfo;

@end

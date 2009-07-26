//
//  MCPickerViewController.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCPickerViewController.h"

@implementation MCPickerViewController

#pragma mark Overriden methods

- (void)loadView {
	[super loadView];
	
	pickerView = [[MCPickerView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	pickerView.delegate = self;
	[self setView:pickerView];
}

#pragma mark Delegate methods for MCPickerView

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[self refresh];
}

#pragma mark Personal methods

- (void)refresh {
	
	NSLog(@"random number: %d", (random() % 10) + 1);
	
	[pickerView flipView];
}

@end


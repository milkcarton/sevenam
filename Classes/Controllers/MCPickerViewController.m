//
//  MCPickerViewController.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 18/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCPickerViewController.h"

@implementation MCPickerViewController

@synthesize blendsController;
@synthesize window;

#pragma mark Overridden methods

- (void)loadView {
	[super loadView];
	
	pickerView = [[MCPickerView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	pickerView.controller = self;
	[self setView:pickerView];
}

#pragma mark Button events

- (void)openBlendsView {
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.window cache:YES];
	[UIView setAnimationDuration:1.0];
	[self presentModalViewController:blendsController animated:YES];
	[UIView commitAnimations];

}

@end
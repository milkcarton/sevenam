//
//  MCPickerViewController.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCPickerViewController.h"

@implementation MCPickerViewController

- (void)loadView {
	[super loadView];
	
	pickerView = [[MCPickerView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	[self setView:pickerView];
}

- (void)dealloc {
    [super dealloc];
}

@end


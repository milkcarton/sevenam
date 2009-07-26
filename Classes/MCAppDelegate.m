//
//  MCAppDelegate.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCAppDelegate.h"
#import "MCPickerViewController.h"

@implementation MCAppDelegate

#pragma mark Overridden methods

- (void)dealloc {
    [window release];
    [super dealloc];
}

#pragma mark Delegate methods for UIApplicationDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	MCPickerViewController *pickerController = [[[MCPickerViewController alloc] init] autorelease];
	
    [window addSubview:pickerController.view];
    [window makeKeyAndVisible];
}

@end

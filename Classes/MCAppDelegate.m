//
//  MCAppDelegate.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCAppDelegate.h"
#import "MCPickerViewController.h"
#import "MCBlendController.h"

@implementation MCAppDelegate

#pragma mark Overridden methods

- (void)dealloc {
    [window release];
    [super dealloc];
}

#pragma mark Delegate methods for UIApplicationDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	MCBlendController *blendController = [[[MCBlendController alloc] init] autorelease];
	
	MCPickerViewController *pickerController = [[[MCPickerViewController alloc] init] autorelease];
	pickerController.blendController = blendController;
	[UIAccelerometer sharedAccelerometer].delegate = pickerController;
	
	navigationController = [[UINavigationController alloc] initWithRootViewController:pickerController];
	navigationController.navigationBarHidden = YES;
	
    [window addSubview:navigationController.view];
    [window makeKeyAndVisible];
}

@end

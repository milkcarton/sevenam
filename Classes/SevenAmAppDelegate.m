//
//  SevenAmAppDelegate.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 18/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "SevenAmAppDelegate.h"
#import "MCPickerViewController.h"
#import "MCBlendsViewController.h"

@implementation SevenAmAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	MCPickerViewController *pickerController = [[[MCPickerViewController alloc] init] autorelease];
	pickerController.window = window;
	MCBlendsViewController *blendsController = [[[MCBlendsViewController alloc] init] autorelease];
	blendsController.window = window;
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:blendsController];
	pickerController.blendsController = navigationController;
//	navigationController = [[UINavigationController alloc] initWithRootViewController:pickerController];
	
	// Set the accelerometer delegate
//	[UIAccelerometer sharedAccelerometer].delegate = pickerController;
	
//	[pickerController release];
//	[blendsController release];
	
	// Configure and show the window	
    [window addSubview:pickerController.view];
    [window makeKeyAndVisible];
	
}

- (void)dealloc {
	
  //  [navigationController release];
    [window release];
    [super dealloc];
	
}

@end

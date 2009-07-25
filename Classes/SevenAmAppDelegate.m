//
//  SevenAmAppDelegate.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Copyright milkcarton 2009. All rights reserved.
//

#import "SevenAmAppDelegate.h"
#import "SevenAmViewController.h"

@implementation SevenAmAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

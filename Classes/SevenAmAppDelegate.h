//
//  SevenAmAppDelegate.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Copyright milkcarton 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SevenAmViewController;

@interface SevenAmAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SevenAmViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SevenAmViewController *viewController;

@end


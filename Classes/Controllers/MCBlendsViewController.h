//
//  MCBlendsViewController.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 19/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCBlendsViewController : UITableViewController {
	UIWindow *window;
	NSMutableDictionary *blendsDictionary;
}

@property (retain, readwrite) UIWindow *window;

@end

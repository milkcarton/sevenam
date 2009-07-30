//
//  MCAvailableBlendsViewController.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 30/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCBlendController.h"

@interface MCAvailableBlendsViewController : UITableViewController {
	NSArray *blends;
	
	MCBlendController *blendController;
}

@property(retain) MCBlendController* blendController;

@end

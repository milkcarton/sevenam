//
//  MCPickerViewController.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 18/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCPickerView.h"
#import "MCBlendsViewController.h"

@interface MCPickerViewController : UIViewController <UIAccelerometerDelegate> {
	MCPickerView *pickerView;
	UINavigationController *blendsController;
	UIWindow *window;
}

@property (retain, readwrite) UINavigationController *blendsController;
@property (retain, readwrite) UIWindow *window;

@end

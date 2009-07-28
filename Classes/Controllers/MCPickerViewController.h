//
//  MCPickerViewController.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCPickerView.h"

@interface MCPickerViewController : UIViewController {
	MCPickerView *pickerView;
	NSArray *blends;
}

- (void)refresh;

@end

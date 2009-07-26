//
//  MCPickerView.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>

#import "MCBlendView.h"
#import "MCNameView.h"
#import "MCSizeView.h"
#import "MCStrengthView.h"

@interface MCPickerView : UIView {
	MCBlendView *blendView;
	MCNameView *nameView;
	MCSizeView *sizeView;
	MCStrengthView *strengthView;
	
	id delegate;
}

@property (retain) id delegate;

- (void)flipView;

@end

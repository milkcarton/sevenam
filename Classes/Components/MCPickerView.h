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
#import "MCBlend.h"

@interface MCPickerView : UIView {
	MCBlendView *blendView;
	MCNameView *nameView;
	MCSizeView *sizeView;
	MCStrengthView *strengthView;
	
	id delegate;
	
	MCBlend *blend;
}

@property (retain) id delegate;
@property (retain, readwrite) MCBlend *blend;

- (void)flipView;

@end

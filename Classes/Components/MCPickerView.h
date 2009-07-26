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
	
	int strength;
	NSMutableArray *sizeTypes;
	NSString *name;
}

@property (retain) id delegate;
@property (nonatomic) int strength;
@property (retain, readwrite) NSString *name;

- (void)flipView;
- (void)resetTypes;
- (void)addType:(int)type;

@end

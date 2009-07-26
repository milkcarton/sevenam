//
//  MCStrengthView.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 26/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCStrengthView : UIView {
	int strength;
	UIColor *circleColor;
	UIColor *lineColor;
}

@property (nonatomic) int strength;
@property (retain, readwrite) UIColor *circleColor;
@property (retain, readwrite) UIColor *lineColor;

@end

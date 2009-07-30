//
//  MCBlend.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 28/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCBlend : NSObject {
	NSString *name;
	NSString *imageName;
	NSNumber *strength;
	BOOL selected;
	NSArray *types;
}

@property (retain, readwrite) NSString *name;
@property (retain, readwrite) NSString *imageName;
@property (retain, readwrite) NSNumber *strength;
@property (nonatomic, readwrite) BOOL selected;
@property (retain, readwrite) NSArray *types;

@end

//
//  MCBlend.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 28/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>

enum {
    MCSizeRistretto = 0,
    MCSizeEspresso = 1,
	MCSizeLungo = 2,
	MCSizeCappuccino = 3
};

@interface MCBlend : NSObject {
	NSString *name;
	NSString *imageName;
	NSNumber *strength;
	BOOL selected;
	NSMutableArray *types;
}

@property (retain, readwrite) NSString *name;
@property (retain, readwrite) NSString *imageName;
@property (retain, readwrite) NSNumber *strength;
@property (nonatomic, readwrite) BOOL selected;
@property (retain, readwrite) NSMutableArray *types;

@end

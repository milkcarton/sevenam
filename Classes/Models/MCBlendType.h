//
//  MCBlendType.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 01/08/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCBlendType : NSObject {
	NSString *name;
	NSMutableArray *blends;
}

@property (retain, readwrite) NSString *name;
@property (retain, readwrite) NSMutableArray *blends;

@end

//
//  MCBlendType.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 21/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCBlendType : NSObject {
	NSString *name;
	NSMutableArray *blends;
}

@property (retain, readwrite) NSString *name;
@property (retain, readwrite) NSMutableArray *blends;

@end

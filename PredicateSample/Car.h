//
//  Car.h
//  KVCSample
//
//  Created by zhangsf on 14-4-17.
//  Copyright (c) 2014年 zhangsf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Engine;
@class Tire;

@interface Car : NSObject

@property (nonatomic, copy) Engine *engine;
@property (nonatomic, copy) NSMutableArray *tires;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *make;
@property (nonatomic, copy) NSString *model;
@property (nonatomic, assign) int modelYear;
@property (nonatomic, assign) int numberOfDoors;
@property (nonatomic, assign) float mileage;

- (void)setTire:(Tire*)tire atIndex:(int)index;
@end

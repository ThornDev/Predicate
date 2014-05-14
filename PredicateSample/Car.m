//
//  Car.m
//  KVCSample
//
//  Created by zhangsf on 14-4-17.
//  Copyright (c) 2014年 zhangsf. All rights reserved.
//

#import "Car.h"
#import "Engine.h"
#import "Tire.h"

@implementation Car

- (void) setTire:(Tire *)tire atIndex:(int)index
{
    self.tires[index] = tire;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@,%@,%@,%d,%d,%f,%@", self.name,self.make,
            self.model,self.modelYear,self.numberOfDoors,self.mileage,self.engine];
}
@end

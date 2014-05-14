//
//  Engine.m
//  KVCSample
//
//  Created by zhangsf on 14-4-17.
//  Copyright (c) 2014年 zhangsf. All rights reserved.
//

#import "Engine.h"

@implementation Engine

- (id)copyWithZone:(NSZone *)zone
{
    Engine *cpEngine = [[self class] allocWithZone:zone];
    cpEngine.horsepower = _horsepower;
    
    return cpEngine;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Engine:%ld", self.horsepower];
}
@end

//
//  main.m
//  KVCSample
//
//  Created by zhangsf on 14-4-17.
//  Copyright (c) 2014年 zhangsf. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Car.h"
#import "Tire.h"
#import "Engine.h"
#import "Garage.h"

Car *makeCar (NSString *name, NSString *make, NSString *model, int modelYear, int numberOfDoors,float mileage, int horsepower)
{
    Car *car = [[[Car alloc] init] autorelease];
    car.name = name;
    car.make = make;
    car.model = model;
    car.modelYear = modelYear;
    car.numberOfDoors = numberOfDoors;
    car.mileage = mileage;
    Engine *engine = [[[Engine alloc] init] autorelease];
    [engine setValue: [NSNumber numberWithInt: horsepower]
              forKey: @"horsepower"];
    car.engine = engine;
    // Make some tires.
    for (int i = 0; i < 4; i++)
    {
        Tire * tire= [[[Tire alloc] init] autorelease];
        [car setTire: tire atIndex: i];
    }
    return (car);
} // makeCar


int main(int argc, const char * argv[])
{
    Garage *garage = [[Garage alloc] init];
    garage.name = @"Joe’s Garage";
    
    Car *car; car = makeCar (@"Herbie", @"Honda", @"CRX", 1984, 2, 110000, 58);
    [garage addCar: car];
    
    car = makeCar (@"Badger", @"Acura", @"Integra", 1987, 5, 217036.7, 130);
    [garage addCar: car];
    
    car = makeCar (@"Elvis", @"Acura", @"Legend", 1989, 4, 28123.4, 151);
    [garage addCar: car];
    
    car = makeCar (@"Phoenix", @"Pontiac", @"Firebird", 1969, 2, 85128.3, 345);
    [garage addCar: car];
    
    car = makeCar (@"Streaker", @"Pontiac", @"Silver Streak", 1950, 2, 39100.0, 36);
    [garage addCar: car];
    
    car = makeCar (@"Judge", @"Pontiac", @"GTO", 1969, 2, 45132.2, 370);
    [garage addCar: car];
    
    car = makeCar (@"Paper Car", @"Plymouth", @"Valiant", 1965, 2, 76800, 105);
    [garage addCar: car];
    
    car = makeCar (@"Herbie", @"Honda", @"CRX", 1984, 2, 34000, 58);
    [garage addCar: car];
    
    NSArray *cars = [garage cars];
    
//    [garage print];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == 'Herbie'"];
    BOOL match = [predicate evaluateWithObject:car];
    if (match) {
        NSLog(@"match");
    }else{
        NSLog(@"Not match");
    }
    
    predicate = [NSPredicate predicateWithFormat:@"engine.horsepower > 150"];
    match = [predicate evaluateWithObject:car];
    if (match) {
        NSLog(@"engine.horsepower > 150");
    }else{
        NSLog(@"engine.horsepower <= 150");
    }
    
    NSArray *mycars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",mycars);
    
    predicate = [NSPredicate predicateWithFormat:@"engine.horsepower > %d",100];
    NSArray *myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"the engine'horsepower > 100 :%@",myFavCars);
    
    NSString *carName = @"Herbie";
    predicate = [NSPredicate predicateWithFormat:@"name == %@",carName];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",myFavCars);
    
//    在谓语词里有一个格式说明符叫%K(大写)，用于表示keyPath
    NSString *keyPath = @"name";
    predicate = [NSPredicate predicateWithFormat:@"%K == %@",keyPath,carName];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",myFavCars);
    
//    占位符
    NSPredicate *predicateTampleta = [NSPredicate predicateWithFormat:@"name == $NAME"];
    NSDictionary *virDic = [NSDictionary dictionaryWithObjectsAndKeys:@"Herbie",@"NAME" ,nil];
    predicate = [predicateTampleta predicateWithSubstitutionVariables:virDic];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",myFavCars);
    
    predicateTampleta = [NSPredicate predicateWithFormat:@"engine.horsepower > $POWER"];
    virDic = @{@"POWER": @50};
    predicate = [predicateTampleta predicateWithSubstitutionVariables:virDic];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",myFavCars);
    
    predicate = [NSPredicate predicateWithFormat:@"engine.horsepower > 50 AND engine.horsepower <200"];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",myFavCars);
    
    predicate = [NSPredicate predicateWithFormat:@"name < 'Newton'"];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",myFavCars);
    
    predicate = [NSPredicate predicateWithFormat:@"engine.horsepower BETWEEN {50,200}"];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",myFavCars);
    
    NSArray *range = @[@50,@200];
    predicate = [NSPredicate predicateWithFormat:@"engine.horsepower BETWEEN %@",range];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",myFavCars);
    
    predicateTampleta = [NSPredicate predicateWithFormat:@"engine.horsepower BETWEEN $POWER"];
    virDic = @{@"POWER": @[@50,@200]};
    predicate = [predicateTampleta predicateWithSubstitutionVariables:virDic];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",myFavCars);
    
    
    predicate = [NSPredicate predicateWithFormat:@"name IN {'Herbie','Badger','Elvis','Flag'}"];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"----------%@",myFavCars);
//    {'Judge','Paper Car','Badger','Phoenix'}
    
    predicate = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS %@",@"i"];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",myFavCars);
    
//    predicate = [NSPredicate predicateWithFormat:@"SELF.name LIKE[c] '*VI*'"];
    predicate = [NSPredicate predicateWithFormat:@"SELF.name MATCHES 'H[a-z]*i?'"];
    myFavCars = [cars filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",myFavCars);
    
    return 0;
}


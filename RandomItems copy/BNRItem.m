//
//  BNRItem.m
//  RandomItems
//
//  Created by Tash-had Saqif on 2017-09-02.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

- (void)setItemName:(NSString *)str{
    _itemName = str;
}

- (NSString *)itemName{
    return _itemName;
}

- (void)setSerialNumber:(NSString *)str{
    _serialNumber = str;
}

- (NSString *)serialNumber{
    return _serialNumber;
}

- (void)setValueInDollars:(int)v{
    _valueIndollars = v;
}

- (int)valueInDollars{
    return _valueIndollars;
}

- (NSDate *)dateCreated{
    return _dateCreated;
}

- (NSString *)description{
    
    NSString *descStr = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, Recorded On: %@", self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    return descStr;
}

- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)serialNum valueInDollars:(int)valueInDollars{
    
    self = [super init];
    if (self){
//        self.itemName = name;
//        self.serialNumber = serialNum;
//        self.valueInDollars = valueInDollars;
        _itemName = name;
        _serialNumber = serialNum;
        _valueIndollars = valueInDollars;
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}

- (instancetype)initWithItemName:(NSString *)name{
    return [self initWithItemName:name serialNumber:@"" valueInDollars:0];
}

- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)serialNumber{
    return [self initWithItemName:name serialNumber:serialNumber valueInDollars:0];
}
- (instancetype)init{
    return [self initWithItemName:@"Item"];
}

+ (instancetype)randomItem{
    NSArray *randomAdjList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // Get the index of a random adj/noun from the lists
    
    // rmbr: NSInteger is not an object...just a type def'n for long
    NSInteger adjIndex = arc4random() % [randomAdjList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjList[adjIndex],randomNounList[nounIndex]];
    
    int randomVal = arc4random() % 100;
    NSString *randomSerialNum = [NSString stringWithFormat:@"%c%c%c%c%c", '0' + arc4random() % 10, 'A' + arc4random() % 26, '0' + arc4random() % 10, 'A' + arc4random() % 26, '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName serialNumber:randomSerialNum valueInDollars:randomVal];
    return newItem;
    
}
@end

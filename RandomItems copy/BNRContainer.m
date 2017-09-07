//
//  BNRContainer.m
//  RandomItems
//
//  Created by Tash-had Saqif on 2017-09-02.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (instancetype)initWithContainersAmount:(int)n name:(NSString *)name serialNum:(NSString *)serialNum value:(int)value{
    
    self = [super initWithItemName:name serialNumber:serialNum valueInDollars:value];
    _containerVal = value;
    self.subItems = [[NSMutableArray alloc] init];
    if (self){
        for (int i = 0;i < n; i ++){
            [_subItems addObject:[BNRItem randomItem]];
        }
    }
    return self;
}

- (instancetype)initWithContainersAmount:(int)n name:(NSString *)name{
    return [self initWithContainersAmount:n name:name serialNum:@"" value:0];
}

- (instancetype)init{
    return [self initWithContainersAmount:0 name:@"Container" serialNum:@"" value:0];
}

- (NSMutableArray *)subItems{
    return _subItems;
}

- (void)setSubItems:(NSMutableArray *)subItems{
    _subItems = subItems;
}

// Override valueInDollars .. return sum of container and every item inside it
- (int)valueInDollars{
    int containerVal = _containerVal;
    int totalItemVals = 0;
        for (BNRItem *item in _subItems){
            totalItemVals += item.valueInDollars;
        }
    return containerVal + totalItemVals;
}

- (NSString *)description{
    NSString *containerDesc = [NSString stringWithFormat:@"Container Name: %@, Value: $%d, Items: %@", self.itemName, self.valueInDollars, self.subItems];
    return containerDesc;
}

@end

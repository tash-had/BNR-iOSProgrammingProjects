//
//  BNRItem.h
//  RandomItems
//
//  Created by Tash-had Saqif on 2017-09-02.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueIndollars;
    NSDate *_dateCreated;
}

+ (instancetype)randomItem;


// Designated initializer for BNRItem
- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)serialNum
                  valueInDollars:(int)valueInDollars;
- (instancetype)initWithItemName:(NSString *)name;
- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)serialNumber;
// Instance methods
-(void)setItemName:(NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)v;
- (int)valueInDollars;

- (NSDate *)dateCreated;



@end

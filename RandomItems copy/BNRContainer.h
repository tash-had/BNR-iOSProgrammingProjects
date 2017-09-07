//
//  BNRContainer.h
//  RandomItems
//
//  Created by Tash-had Saqif on 2017-09-02.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSMutableArray *_subItems;
    int _containerVal;
}

- (instancetype)initWithContainersAmount:(int)n
                                    name:(NSString *)name
                               serialNum:(NSString *)serialNum
                                   value:(int)value;
- (instancetype)initWithContainersAmount:(int)n name:(NSString *)name;

- (NSMutableArray *)subItems;
- (void)setSubItems:(NSMutableArray *)subItems;


@end

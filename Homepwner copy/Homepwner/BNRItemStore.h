//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Tash-had Saqif on 2017-09-11.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;
@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;
+ (instancetype)sharedStore;
- (void)createItem;
- (NSArray *)itemsOverUnder50;
@end

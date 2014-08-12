//
//  KardzCardMatchingGame.h
//  Kardz
//
//  Created by Kai-Arne Reiter on 12/08/14.
//  Copyright (c) 2014 Kai-Arne Reiter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KardzDeck.h"

@interface KardzCardMatchingGame : NSObject

// designated initialiser
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(KardzDeck *) deck;


- (void)chooseCardAtIndex:(NSUInteger)index;
- (KardzCard *)cardAtIndex:(NSUInteger)index;


@property (nonatomic, readonly) NSInteger score;




@end

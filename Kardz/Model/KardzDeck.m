//
//  KardzDeck.m
//  Kardz
//
//  Created by Kai-Arne Reiter on 11/08/14.
//  Copyright (c) 2014 Kai-Arne Reiter. All rights reserved.
//

#import "KardzDeck.h"
@interface KardzDeck()
@property (strong, nonatomic) NSMutableArray *cards;


@end

@implementation KardzDeck

- (NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void)addCard:(KardzCard *)card asTop:(BOOL)atTop

{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
    
    
}


-(void)addCard:(KardzCard *)card {
    [self addCard:card asTop:NO];
}

-(KardzCard *)drawRandomCard {
    KardzCard *randomCard = nil;
    if (self.cards.count){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}


@end

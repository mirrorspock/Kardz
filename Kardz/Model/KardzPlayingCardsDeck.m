//
//  KardzPlayingCardsDeck.m
//  Kardz
//
//  Created by Kai-Arne Reiter on 11/08/14.
//  Copyright (c) 2014 Kai-Arne Reiter. All rights reserved.
//

#import "KardzPlayingCardsDeck.h"
#import "KardzPlayingCard.h"

@implementation KardzPlayingCardsDeck
-(instancetype)init
{
    self = [super init];
    if (self){
        for (NSString *suit in [KardzPlayingCard validSuits ]){
            for (NSUInteger rank = 1; rank <= [KardzPlayingCard maxRank];rank++){
                KardzPlayingCard *card = [[KardzPlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}
@end

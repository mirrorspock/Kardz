//
//  KardzCardMatchingGame.m
//  Kardz
//
//  Created by Kai-Arne Reiter on 12/08/14.
//  Copyright (c) 2014 Kai-Arne Reiter. All rights reserved.
//

#import "KardzCardMatchingGame.h"

@interface KardzCardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // on Card


@end

@implementation KardzCardMatchingGame

-(NSMutableArray *) cards
{
    if (!_cards)_cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(KardzDeck *) deck
{
    self = [super init];
    if (self){
        for (int i = 0; i < count; i++)
        {
            KardzCard *card = [ deck drawRandomCard];
            if (card){
                [self.cards addObject:card];
            }
            else
            {
                self = nil;
                break;
            }
            
        }
    }
    return self;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

//works too #define MISMATCH_PENALTY 2


-(void)chooseCardAtIndex:(NSUInteger)index
{
    KardzCard *card = [self cardAtIndex:index];
    
    if (!card.isMatched){
        if (card.isChosen){
            card.chosen = NO;
        } else {
            //match against another card
            for (KardzCard *otherCard in self.cards){
                if (otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];//match card with othercard (array)
                    if (matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -=MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.Chosen = YES;
        }
    }
}


-(KardzCard *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count] ) ? self.cards[index] : nil;
}



@end

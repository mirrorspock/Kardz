//
//  KardzPlayingCard.m
//  Kardz
//
//  Created by Kai-Arne Reiter on 11/08/14.
//  Copyright (c) 2014 Kai-Arne Reiter. All rights reserved.
//

#import "KardzPlayingCard.h"

@implementation KardzPlayingCard

-(int)match:(NSArray *)otherCards
{
        int score = 0;
        if ([otherCards count] == 1)
        {
            KardzPlayingCard *otherCard = [otherCards firstObject];
            if ([self.suit isEqualToString:otherCard.suit])
            {
            score = 1;
        } else if (self.rank == otherCard.rank){
            score = 4;
        }
    }
    
    return score;
}

-(NSString *)contents
{
    NSArray *rankStrings = [KardzPlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+(NSArray *)validSuits
{
    return @[@"♥️",@"♦️",@"♣️",@"♠️"];
}

+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank {return [[self rankStrings] count]-1;}

-(void)setSuit:(NSString *)suit
{
    if ([[KardzPlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [KardzPlayingCard maxRank]){
        _rank = rank;
    }
}

-(NSString *)suit
{
return _suit ? _suit : @"?";
    
}





@end

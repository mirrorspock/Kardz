//
//  KardzCard.m
//  Kardz
//
//  Created by Kai-Arne Reiter on 11/08/14.
//  Copyright (c) 2014 Kai-Arne Reiter. All rights reserved.
//

#import "KardzCard.h"
@interface KardzCard()

@end

@implementation KardzCard

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (KardzCard *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]){
            score =1;
        }
    }
    return score;
}

@end

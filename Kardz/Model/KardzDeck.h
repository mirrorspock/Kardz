//
//  KardzDeck.h
//  Kardz
//
//  Created by Kai-Arne Reiter on 11/08/14.
//  Copyright (c) 2014 Kai-Arne Reiter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KardzCard.h"

@interface KardzDeck : NSObject

-(void)addCard:(KardzCard *)card asTop:(BOOL)atTop;
-(void)addCard:(KardzCard *)card;

-(KardzCard *)drawRandomCard;




@end

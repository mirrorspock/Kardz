//
//  KardzViewController.m
//  Kardz
//
//  Created by Kai-Arne Reiter on 11/08/14.
//  Copyright (c) 2014 Kai-Arne Reiter. All rights reserved.
//

#import "KardzViewController.h"
#import "KardzPlayingCardsDeck.h"
#import "KardzCardMatchingGame.h"

@interface KardzViewController ()

@property (strong,nonatomic) KardzDeck *deck;
@property (nonatomic, strong) KardzCardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation KardzViewController

- (KardzCardMatchingGame *)game
{
    if (!_game) _game = [[KardzCardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(KardzDeck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (KardzDeck *) createDeck
{
    return [[KardzPlayingCardsDeck alloc]init];
}


- (IBAction)touchCardButton:(UIButton *)sender
{
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        KardzCard *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    }
}

- (NSString *)titleForCard:(KardzCard *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(KardzCard *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}


@end

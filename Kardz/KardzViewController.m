//
//  KardzViewController.m
//  Kardz
//
//  Created by Kai-Arne Reiter on 11/08/14.
//  Copyright (c) 2014 Kai-Arne Reiter. All rights reserved.
//

#import "KardzViewController.h"
#import "KardzPlayingCardsDeck.h"

@interface KardzViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong,nonatomic) KardzPlayingCardsDeck *deck;
@property (strong,nonatomic) KardzCard *myCard;

@end

@implementation KardzViewController


- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    NSLog(@"flipcount = %d",self.flipCount);
}


- (IBAction)touchCardButton:(UIButton *)sender
{
    if (!self.deck)
        self.deck = [[KardzPlayingCardsDeck alloc] init];
    if ([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    
    } else {
    [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                      forState:UIControlStateNormal];
    _myCard= self.deck.drawRandomCard;
    [sender setTitle:_myCard.contents forState:UIControlStateNormal];
    self.flipCount++;
    }
    
}


@end

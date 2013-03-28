//
//  GameViewController.m
//  Elian
//
//  Created by Harlan Haskins on 8/18/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "GameViewController.h"
#import "CustomUIButton.h"
#import "ResultsViewController.h"
#import "Game.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) initWithGame:(Game*)game {
    self = [super init];
    if (self) {
        self.currentGame = game;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.currentGame.isElianToEnglish) {
        self.letterLabel.font = [UIFont fontWithName:@"Elian Variant" size:140];
    }
    else {
        self.choice1Label.font = [UIFont fontWithName:@"Elian Variant" size:28];
        self.choice2Label.font = [UIFont fontWithName:@"Elian Variant" size:28];
        self.choice3Label.font = [UIFont fontWithName:@"Elian Variant" size:28];
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [self.timer fire];
    self.alphabet = [self shuffledAlphabet:@"abcdefghijklmnopqrstuvwxyz"];
    [self setUpRound];
}

-(void)updateTime {
    self.currentGame.time = @([self.currentGame.time intValue] + 1);
    int hours = [self.currentGame.time intValue] / 3600;
    int minutes = [self.currentGame.time intValue] / 60 - hours * 60;
    int seconds = [self.currentGame.time intValue] - hours* 3600 - minutes * 60;
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %02d:%02d:%02d", hours, minutes, seconds];
}

- (IBAction)choiceMade:(id)sender {
    CustomUIButton* b = (CustomUIButton*)sender;
    if (b.tag == self.correctChoice) {
        self.currentGame.correctAnswers = @([self.currentGame.correctAnswers intValue] + 1);
        self.correctAnswerLabel.text = [NSString stringWithFormat:@"Correct Answers: %@", self.currentGame.correctAnswers];
    }
    else {
        self.incorrectAnswers++;
        self.incorrectAnswerLabel.text = [NSString stringWithFormat:@"Incorrect Answers: %i", self.incorrectAnswers];
    }
    self.playedRounds++;
    [self setUpRound];
}

-(NSString*) shuffledAlphabet:(NSString*)finalLettersString {
    NSUInteger length = [finalLettersString length];
    
    if (!length) return nil; // nothing to shuffle
    
    unichar *buffer = calloc(length, sizeof (unichar));
    
    [finalLettersString getCharacters:buffer range:NSMakeRange(0, length)];
    
    for(int i = length - 1; i >= 0; i--){
        int j = arc4random() % (i + 1);
        //NSLog(@"%d %d", i, j);
        //swap at positions i and j
        unichar c = buffer[i];
        buffer[i] = buffer[j];
        buffer[j] = c;
    }
    
    NSString *result = [NSString stringWithCharacters:buffer length:length];
    free(buffer);
    
    return result;
}

-(void) setUpRound {
    if (self.playedRounds < [self.currentGame.gameSize intValue]) {
        //Display the first letter in the shuffled alphabet
        NSString* questionString = [NSString stringWithFormat:@"%c", [self.alphabet characterAtIndex:0]];
        self.letterLabel.text = questionString;
        
        //Now remove that letter from the global alphabet so we can continue the game with new letters.
        NSString* tempAlphabet = [NSString stringWithFormat:@"%@", [self.alphabet substringFromIndex:1]];
        self.alphabet = tempAlphabet;
        
        //Create two incorrect choices by generating a random number less than the size of the alphabet as it currently stands.
        int numberOfCharactersFromWhichToChoose = [self.alphabet length] - 1;
        int incorrectChoiceIndex = arc4random_uniform(numberOfCharactersFromWhichToChoose);
        NSString* alphabetWithoutCorrectChoice = [[self shuffledAlphabet:@"abcdefghijklmnopqrstuvwxyz"] stringByReplacingOccurrencesOfString:questionString withString:@""];
        NSString* incorrectChoice1 = [NSString stringWithFormat:@"%c", [alphabetWithoutCorrectChoice characterAtIndex:incorrectChoiceIndex]];
        int incorrectChoiceIndex2 = arc4random_uniform(numberOfCharactersFromWhichToChoose);
        while (incorrectChoiceIndex2 == incorrectChoiceIndex) {
            incorrectChoiceIndex2 = arc4random_uniform(numberOfCharactersFromWhichToChoose);
        }
        alphabetWithoutCorrectChoice = [NSString stringWithFormat:@"%@%@", [alphabetWithoutCorrectChoice substringToIndex:incorrectChoiceIndex2], [alphabetWithoutCorrectChoice substringFromIndex:(incorrectChoiceIndex2 + 1)]];
        NSString* incorrectChoice2 = [NSString stringWithFormat:@"%c", [alphabetWithoutCorrectChoice characterAtIndex:incorrectChoiceIndex2]];
        
        //Now that the incorrect choices are set, pick which button is going to display the correct answer by generating another random number.
        self.correctChoice = arc4random_uniform(3);
        if (self.correctChoice == 0) {
            self.choice1Label.text = self.letterLabel.text;
            self.choice2Label.text = incorrectChoice1;
            self.choice3Label.text = incorrectChoice2;
        }
        else if (self.correctChoice == 1) {
            self.choice1Label.text = incorrectChoice1;
            self.choice2Label.text = self.letterLabel.text;
            self.choice3Label.text = incorrectChoice2;
        }
        else {
            self.choice1Label.text = incorrectChoice1;
            self.choice2Label.text = incorrectChoice2;
            self.choice3Label.text = self.letterLabel.text;
        }
    }
    else {
        [self.timer invalidate];
        [self performSegueWithIdentifier:@"presentResults" sender:self];
        [self performSelector:@selector(moveToFirstVC) withObject:self afterDelay:1.0];
    }
}

-(void) moveToFirstVC {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"presentResults"]) {
        ResultsViewController *rvc = (ResultsViewController*)[segue destinationViewController];
        rvc.currentGame = self.currentGame;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLetterLabel:nil];
    [self setChoice1Label:nil];
    [self setChoice2Label:nil];
    [self setChoice3Label:nil];
    [self setCorrectAnswerLabel:nil];
    [self setIncorrectAnswerLabel:nil];
    [self setTimeLabel:nil];
    [self setBestTimeLabel:nil];
    [super viewDidUnload];
}
@end

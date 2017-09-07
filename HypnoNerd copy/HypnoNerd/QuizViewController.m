//
//  QuizViewController.m
//  Quiz
//
//  Created by Tash-had Saqif on 2017-08-31.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end

@implementation QuizViewController

- (IBAction)showQuestion:(id)sender{
    
    // Step to next q
    self.currentQuestionIndex ++;
    
    // Am i past the last q?
    if (self.currentQuestionIndex == [self.questions count]){
        // Go back to first questoin
        self.currentQuestionIndex = 0;
    }
    // Get the string at that index in the q array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in the question label
    self.questionLabel.text = question;
    
    // Reset the answer label
    
}
- (IBAction)showAnswer:(id)sender{
    // What is the answer to the current q?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // Display it in the answers label
    self.answerLabel.text = answer;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        self.questions = @[@"From what is cognac made?", @"What is 7+7?", @"What is the capitol of Vermont?"];
        self.answers = @[@"Grapes.", @"14", @"Montpelier"];
        self.currentQuestionIndex = 0;
        
        UIImage *image = [UIImage imageNamed:@"quizicon.png"];
        self.tabBarItem.title = @"Quiz";
        self.tabBarItem.image = image;
    }
    return self;
}
@end

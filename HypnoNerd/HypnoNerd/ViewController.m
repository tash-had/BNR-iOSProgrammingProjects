//
//  ViewController.m
//  HypnoNerd
//
//  Created by Tash-had Saqif on 2017-09-05.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import "ViewController.h"
#import "BNRHypnosisView.h"

@interface ViewController ()
// Declare that this view controller conforms to UITextFieldDelegate
<UITextFieldDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"ViewController for HypnosisView loaded its view");    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView{
    // create the view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    

    
    // Add text field
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    // Set borderstyle on textfield
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize Me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    // set it as the view for this controller
    self.view = backgroundView;
    self.view.backgroundColor = [UIColor whiteColor];
    
}

// Override initWithNibName so that you can set the title and image for the tabBar property that's already part of the
// view controller. We want to set this property since we're going to be using the tab bar
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.title = @"Hypnotize";
        self.tabBarItem.image = image;
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self drawHypnoticMessages:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void)drawHypnoticMessages:(NSString *)message{
    for (int i = 0; i < 20; i++){
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        // Resize label relative to displayed text
        [messageLabel sizeToFit];
        
        // random x/y values that fit within the HypnosisView's width/height
        int width = (int)(self.view.bounds.size.width);
        int height = (int)(self.view.bounds.size.height);
        int x = arc4random() % width;
        int y = arc4random() % height;
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        // Add the label to the hierarchy.
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
    }
    
}
@end

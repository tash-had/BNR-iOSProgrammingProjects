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


@end

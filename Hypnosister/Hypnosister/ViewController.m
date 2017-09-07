//
//  ViewController.m
//  Hypnosister
//
//  Created by Tash-had Saqif on 2017-09-04.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import "ViewController.h"
#import "BNRHypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    CGRect firstFrame = CGRectMake(160, 240, 100, 150);
//    CGRect firstFrame = self.view.bounds;

//    BNRHypnosisView *firstView = [[BNRHypnosisView alloc] initWithFrame:firstFrame];
//    firstView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:firstView];

    // Create CGRect for frames
    CGRect screenRect = self.view.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2;
//    bigRect.size.height *= 2;
    
    // Create A screen sized scrollview and add it to window
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    [self.view addSubview:scrollView];
    
    // Create a supersized hypnosis view and add to scrollview
    BNRHypnosisView *hypnosisView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:hypnosisView];

    
    screenRect.origin.x += screenRect.size.width;
    BNRHypnosisView *hypnosisView2 = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:hypnosisView2];
    
    scrollView.pagingEnabled = YES;
    
    // Tell scrollview how big its content area is
    scrollView.contentSize = bigRect.size;
    
//    CGRect secondFrame = CGRectMake(20, 30, 50, 50);
//    BNRHypnosisView *secondView = [[BNRHypnosisView alloc] initWithFrame:secondFrame];
//    secondView.backgroundColor = [UIColor blueColor];
////    [self.view addSubview:secondView];
//    [firstView addSubview:secondView];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

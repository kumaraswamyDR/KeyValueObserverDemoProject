//
//  NewViewController.m
//  KeyValueObserverDemoProject
//
//  Created by Kumaraswamy D R on 30/08/16.
//  Copyright © 2016 TechLeraner. All rights reserved.
//

#import "NewViewController.h"
#import "NewMainView.h"
#import "ViewController.h"

@interface NewViewController ()
@property (nonatomic,strong) NewMainView *mainView;
@end

@implementation NewViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    _mainView = [[NewMainView alloc]init];
    [self.view addSubview:_mainView];
    
    [_mainView.moveToOtherViewController addTarget:self action:@selector(movetonewcontroller) forControlEvents:UIControlEventTouchUpInside];
   
}
-(void)movetonewcontroller
{
    [_mainView removeFromSuperview];
    _mainView = nil;
    ViewController *fitnessViewController = [[ViewController alloc] init];
    [self presentModalViewController:fitnessViewController animated:YES];
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _mainView.frame = self.view.frame;
    
}



@end

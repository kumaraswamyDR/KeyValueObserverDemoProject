//
//  ViewController.m
//  KeyValueObserverDemoProject
//
//  Created by Kumaraswamy D R on 29/08/16.
//  Copyright © 2016 TechLeraner. All rights reserved.
//

#import "ViewController.h"
#import "DataObject.h"
#import "MainView.h"
#import "NewViewController.h"

@interface ViewController ()
@property (nonatomic,strong) MainView *mainView;
@property (nonatomic,strong) DataObject *dataObject;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mainView = [[MainView alloc]init];
    [self.view addSubview:_mainView];
    
    [_mainView.moveToOtherViewController addTarget:self action:@selector(movetonewcontroller) forControlEvents:UIControlEventTouchUpInside];
    
    _dataObject = [DataObject sharedInstance];
    
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"preferenceName"];
    if([savedValue isEqualToString:@"someValue"])
    {
    [self performSelector:@selector(incrementTimer) withObject:nil afterDelay:5];
        NSString *valueToSave = @"someValue1";
        [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"preferenceName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
}

}
-(void)movetonewcontroller
{
    [_mainView removeFromSuperview];
    _mainView = nil;
    NewViewController *fitnessViewController = [[NewViewController alloc] init];
    [self presentViewController:fitnessViewController animated:YES completion:nil];
}
-(void)incrementTimer
{
    _dataObject.objectName = [NSString stringWithFormat:@"%d id",rand()%100];
//     [self.dataObject setValue:[NSString stringWithFormat:@"%d id",rand()%100] forKey:@"objectName"];
    NSLog(@"Value updating");
    [self performSelector:@selector(incrementTimer) withObject:nil afterDelay:1];
    
}
-(void)viewDidLayoutSubviews
{
    _mainView.frame = self.view.frame;
}
-(void)dealloc{
    
}



@end

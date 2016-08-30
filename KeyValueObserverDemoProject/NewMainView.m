//
//  NewMainView.m
//  KeyValueObserverDemoProject
//
//  Created by Kumaraswamy D R on 30/08/16.
//  Copyright © 2016 TechLeraner. All rights reserved.
//

#import "NewMainView.h"
#import "DataObject.h"

@interface NewMainView()
@property (nonatomic,strong) DataObject *dataObject;

@property (nonatomic,strong) UILabel *kvoValueLabel;
@end
@implementation NewMainView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self createViews];
        self.backgroundColor = [UIColor yellowColor];
        [[DataObject sharedInstance] addObserver:self forKeyPath:@"objectName" options:0 context:nil];
    }
    return self;
}
-(void)createViews
{
    _moveToOtherViewController = [[UIButton alloc]init];
    _moveToOtherViewController.backgroundColor = [UIColor blackColor];
    _moveToOtherViewController.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_moveToOtherViewController setTitle:@"Move to next view controller" forState:UIControlStateNormal];
    [self addSubview:_moveToOtherViewController];
    
    _kvoValueLabel = [[UILabel alloc]init];
    _kvoValueLabel.text= @"KVO WILL UPDATE ME";
    _kvoValueLabel.font = [UIFont systemFontOfSize:25];
    _kvoValueLabel.textAlignment = NSTextAlignmentCenter;
    _kvoValueLabel.textColor = [UIColor blackColor];
    [self addSubview:_kvoValueLabel];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"objectName"]) {
        NSString *objectName = [(NSString *)object valueForKey:@"objectName"];
        
        
        _kvoValueLabel.text = [(NSString *)object valueForKey:@"objectName"];
        NSLog(@"RECEIVED KVO! %@",objectName);
    }
    else
    {
        NSLog(@"KP - %@ ",keyPath);
    }
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _kvoValueLabel.frame = CGRectMake(0, self.frame.size.height*0.2, self.frame.size.width, self.frame.size.height*0.3);
    _moveToOtherViewController.frame = CGRectMake(0, self.frame.size.height*0.7, self.frame.size.width, self.frame.size.height*0.2);
}
-(void)dealloc
{
    [[DataObject sharedInstance] removeObserver:self forKeyPath:@"objectName"];
    
    
}

@end

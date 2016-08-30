//
//  DataObject.m
//  KeyValueObserverDemoProject
//
//  Created by Kumaraswamy D R on 29/08/16.
//  Copyright © 2016 TechLeraner. All rights reserved.
//

#import "DataObject.h"

DataObject *dataOb;
@implementation DataObject
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}
+(instancetype)sharedInstance
{
    if(dataOb == nil)
    {
        dataOb = [[DataObject alloc]init];
    }
    return dataOb;
}
@end

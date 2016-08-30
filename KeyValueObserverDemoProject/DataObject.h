//
//  DataObject.h
//  KeyValueObserverDemoProject
//
//  Created by Kumaraswamy D R on 29/08/16.
//  Copyright © 2016 TechLeraner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataObject : NSObject
@property (nonatomic,strong) NSString* objectName;
+(instancetype)sharedInstance;
@end

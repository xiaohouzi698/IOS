//
//  PersonRecordDataFromDataBase.m
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "PersonRecordDataFromDataBase.h"

@implementation PersonRecordDataFromDataBase
+ (PersonRecordDataFromDataBase *)shareFromDataBase
{
    static PersonRecordDataFromDataBase *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (sharedInstance == nil) {
            sharedInstance = [[PersonRecordDataFromDataBase alloc] init];
        }
        
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
         _titleFromClass = @"";
        _txtFromClass = @"";
        
        _createtimeFromClass = @"";
                _titleArrayFromClass = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return self;
}

@end

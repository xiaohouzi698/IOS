//
//  PersonRecordDataFromDataBase.h
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonRecordDataFromDataBase : NSObject
@property(retain,nonatomic) NSString *titleFromClass;
@property(retain,nonatomic) NSString *txtFromClass;

@property(retain,nonatomic)NSString *createtimeFromClass;

@property(retain,nonatomic)NSMutableArray *titleArrayFromClass;

+(PersonRecordDataFromDataBase *)shareFromDataBase;


@end

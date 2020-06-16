//
//  LGSettingItem.m
//  LGSettingViewDemo
//
//  Created by LiGo on 11/16/15.
//  Copyright © 2015 LiGo. All rights reserved.
//

#import "SettingItem.h"
#import "SettingSection.h"

@implementation SettingItem

+ (instancetype)initWithtitle:(NSString *)title {
    
    SettingItem *item = [[SettingItem alloc]init];
    item.title = title;
    item.height = 44;
    item.type = UITableViewCellAccessoryDisclosureIndicator;
    return item;
}

@end

//
//  LGSettingSection.m
//  LGSettingViewDemo
//
//  Created by LiGo on 11/16/15.
//  Copyright © 2015 LiGo. All rights reserved.
//

#import "SettingSection.h"


@implementation SettingSection

+ (instancetype)initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle {
    
    SettingSection *section = [[SettingSection alloc]init];
    section.headerTitle = headerTitle;
    section.footerTitle = footerTitle;
    return section;
}
-(void)addItem:(SettingItem*)item{
    if (!_items) {
        _items = [NSMutableArray array];
}
    [_items addObject:item];

}

-(void)addItemWithTitle:(NSString*)title {
    
    if (!_items) {
        _items = [NSMutableArray array];
 
    }
    SettingItem *item = [SettingItem initWithtitle:title];
    [_items addObject:item];
}

-(void)addItemWithTitle:(NSString*)title Image:(UIImage*)image {
    if (!_items) {
        _items = [NSMutableArray array];
        
    }
    SettingItem *item = [SettingItem initWithtitle:title];
    item.image = image;
    [_items addObject:item];
}
@end

//
//  CViewController.h
//  CacheByMac
//
//  Created by 杨 宏强 on 13-2-21.
//  Copyright (c) 2013年 yanghongqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "CacheShowViewController.h"
@interface ShowDoctorViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{

    UITableView *table;
}
@property(nonatomic,strong)IBOutlet UITableView *table;
@property(nonatomic,strong)CacheShowViewController*cacheView;
@end

//
//  InformationFeedbackViewController.h
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationFeedbackViewController : UITableViewController

@property (nonatomic, strong) NSString *paths;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *txtArray;

@property (nonatomic, strong) NSMutableArray *createtimeArray;

@end

//
//  FriendListViewController.h
//  BRSF
//
//  Created by mac on 16/3/9.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWXMPP_Header.h"
#import "UserInfoViewController.h"
#import "SubscribeViewController.h"
#import "ChatRoomViewController.h"

@interface FriendListViewController : UITableViewController<NSFetchedResultsControllerDelegate>{
    NSFetchedResultsController *fetchedResultsController;
}

@end

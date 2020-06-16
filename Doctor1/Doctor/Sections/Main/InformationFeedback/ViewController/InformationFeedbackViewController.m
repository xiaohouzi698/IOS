//
//  InformationFeedbackViewController.h
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "InformationFeedbackViewController.h"
#import "InformationFeedbackViewCell.h"
#import "XFNotices.h"
#import "PersonRecordDataFromDataBase.h"
#import "FMDatabase.h"
#import "AddInformationFeedbackViewController.h"
#import "InformationFeedbackDetailViewController.h"
#import "FMDatabaseQueue.h"
@interface InformationFeedbackViewController ()

@end

@implementation InformationFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[InformationFeedbackViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem  alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(toAdd)];
    
    
    
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated
{

    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *path = [document stringByAppendingPathComponent:@"DOCTOR.sqlite"];
    self.paths = path;
    //注意以上三句话是获取数据库路径必不可少的，在viewDidload之前就已经准备好了
    self.txtArray = [[NSMutableArray alloc]init];
    self.titleArray = [[NSMutableArray alloc]init];
    self.createtimeArray = [[NSMutableArray alloc]init];
    [self createTable];
    [self getAllDatabase];
    

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
       // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        
    NSLog(@"%@",@"InformationFeedbackDetailViewController执行委托");
    InformationFeedbackDetailViewController *informationFeedbackDetailViewController=[[InformationFeedbackDetailViewController alloc] init];
    [informationFeedbackDetailViewController setHidesBottomBarWhenPushed:YES];
    NSString *title=[self.titleArray objectAtIndex:indexPath.row -1];
    informationFeedbackDetailViewController.title=title;
    [self.navigationController pushViewController:informationFeedbackDetailViewController animated:YES];
    
    
    
    //    DWChatRoomViewController *chatRoomView = [DWChatRoomViewController messagesViewController];
    //    [chatRoomView setFriendJID:user.jid];
    //
    //    [self.navigationController pushViewController:chatRoomView animated:YES];
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count + 1;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return nil;
    }else
    {
        return indexPath;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InformationFeedbackViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"标题";
        cell.createtimeLabel.text = @"创建时间";
            }else
    {
        cell.titleLabel.text = [self.titleArray objectAtIndex:indexPath.row -1];
        cell.createtimeLabel.text = [self.createtimeArray objectAtIndex:indexPath.row - 1];
        
    }

    return cell;
}

- (void)createTable
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:self.paths]) {
        NSLog(@"表不存在，创建表");
        FMDatabase *db =[FMDatabase databaseWithPath:self.paths];
        if ([db open]) {
            NSString *sql = @"CREATE TABLE 'PERSONRECORD'('createtime' VARCHAR(5) PRIMARY KEY NOT NULL,'title' VARCHAR(12), 'txt' VARCHAR(300))    ";//sql语句
            BOOL success = [db executeUpdate:sql];
            if (!success) {
                NSLog(@"error when create table ");
            }else{
                NSLog(@"create table succeed");
            }
            [db close];
        }else{
            NSLog(@"database open error");
        }
    }else{
        NSLog(@"表存在，不创建表");
    }
}

- (void)getAllDatabase//从数据库中获得所有数据
{
    FMDatabase *db = [FMDatabase databaseWithPath:self.paths];
    if ([db open]) {
        NSString *sql = @"SELECT * FROM PERSONRECORD";
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            NSString *createtime = [rs stringForColumn:@"createtime"];
            NSString *title = [rs stringForColumn:@"title"];
            
            [self.createtimeArray addObject:createtime];
            [self.titleArray addObject:title];
            
           
        }
        [[PersonRecordDataFromDataBase shareFromDataBase].titleArrayFromClass arrayByAddingObjectsFromArray:self.titleArray];
        NSLog(@"getAllDatabase.self.titleArray==%@",self.titleArray);
        [db close];
        [self.tableView reloadData];
    }
    
}

-(void)toAdd{
    
       [self.navigationController pushViewController:[[AddInformationFeedbackViewController alloc]init] animated:YES];
    
}

//选中相应的行，进入更新界面，注意这里没有对数据库进行操作
- (void)modifyDatabase
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if (indexPath == nil) {
        
        [XFNotices noticesWithTitle:@"数据更新" Time:1.5 View:self.view Style:(XFNoticesStyleSuccess)];
        
        return;
    }
    else{
        InformationFeedbackDetailViewController *editUser = [[InformationFeedbackDetailViewController alloc]init];
//        AddPersonRecordViewController *addUser = [[AddPersonRecordViewController alloc]init];
      //  editUser.operateType = 1;
        //下面的方法是将选中的行的数据存进单例，再传到另一个类里面
        [PersonRecordDataFromDataBase shareFromDataBase].txtFromClass = [self.txtArray objectAtIndex:(indexPath.row-1)];
        [PersonRecordDataFromDataBase shareFromDataBase].titleFromClass = [self.titleArray objectAtIndex:(indexPath.row-1)];
        [PersonRecordDataFromDataBase shareFromDataBase].createtimeFromClass = [self.createtimeArray objectAtIndex:(indexPath.row-1)];
        
        NSLog(@"datafromdatabase.nameFromClass==%@",[PersonRecordDataFromDataBase shareFromDataBase].txtFromClass);
        //跳转到修改页面
        [self.navigationController pushViewController:editUser animated:YES];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
}



@end

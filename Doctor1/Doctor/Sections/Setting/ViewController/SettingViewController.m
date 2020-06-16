//
//  SettingViewController.m
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingItem.h"
#import "SettingSection.h"
#import "AppDelegate.h"
#import "DoctorSelfViewController.h"

@interface SettingViewController ()
@property (strong, nonatomic) NSMutableArray * groups;
@end

@implementation SettingViewController

/**
 数组懒加载
 */
- (NSMutableArray *)groups
{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (instancetype)init{
    // 设置样式
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"设置"];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0/255.0 green:153/255.0 blue:255/255.0 alpha:0.5]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];

      NSUserDefaults *doctor =[NSUserDefaults standardUserDefaults];
    //添加第一组
    SettingSection *section1 = [SettingSection initWithHeaderTitle:nil footerTitle:nil];
    //添加行
    NSString *title = [[NSString alloc]init];
    title = @"欢迎您  ";
    NSString *name = [[NSString alloc]init];
    
    name=[doctor objectForKey:@"username"];
    title=[title stringByAppendingString:name];
    
    SettingItem *item1 = [SettingItem initWithtitle:title];
    item1.image = [UIImage imageNamed:@"me"];
    item1.height = 64;
    [section1 addItem:item1];
    SettingItem *item2 = [SettingItem initWithtitle:@"每天保持好心情."];

    item2.type = UITableViewCellAccessoryNone;
    [section1 addItem:item2];
    //保存到groups数组
    [self.groups addObject:section1];
    
    //添加第二组
    SettingSection *section2 = [SettingSection initWithHeaderTitle:@"" footerTitle:nil];
    //添加
    [section2 addItemWithTitle:@"设置"];
    //保存到groups数组
    [self.groups addObject:section2];
    
    //添加第三组
    SettingSection *section3 = [SettingSection initWithHeaderTitle:@"" footerTitle:@"© 2016 HongTao"];
    //添加行
    [section3 addItemWithTitle:@"关于我们"];
    [section3 addItemWithTitle:@"切换账号"];
    [section3 addItemWithTitle:@"退出"];
    //保存到groups数组
    [self.groups addObject:section3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
/**
 设置组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}
/**
 设置行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SettingSection *group = self.groups[section];
    return group.items.count;
}

/**
 设置每行内容
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    SettingSection *section = self.groups[indexPath.section];
    SettingItem *item = section.items[indexPath.row];
    // 设置Cell的标题
    cell.textLabel.text = item.title;
    // 设置Cell左边的图标
    cell.imageView.image = item.image;
    // 设置Cell右边的图标
    cell.accessoryType = item.type;
    
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    SettingSection *group = self.groups[section];
    return group.headerTitle;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    SettingSection *group = self.groups[section];
    return group.footerTitle;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingSection *section = self.groups[indexPath.section];
    SettingItem *item = section.items[indexPath.row];
    return item.height;
}

#pragma mark 点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        DoctorSelfViewController *doctorSelfViewController=[[DoctorSelfViewController alloc] init];
        
        [doctorSelfViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:doctorSelfViewController animated:YES];
    }else if(indexPath.section == 2 && indexPath.row == 1){
         [self dismissModalViewControllerAnimated:YES];
    }else if(indexPath.section == 2 && indexPath.row == 2){
        [self exitApplication];
    }
    NSLog(@"点击了第%ld组,第%ld行",(long)indexPath.section,(long)indexPath.row);
}


- (void)exitApplication {
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    UIWindow *window = app.window;
    
    [UIView animateWithDuration:1.0f animations:^{
        window.alpha = 0;
        window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
    } completion:^(BOOL finished) {
        exit(0);
    }];
    
}


/**
 
 */

@end

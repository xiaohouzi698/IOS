//
//  emotionEvaluationViewController.m
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//


#import "EmotionEvaluationViewController.h"
#import "ChartTableViewCell.h"
#import "RKAlertView.h"
@interface EmotionEvaluationViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *chartTableView;

@end

@implementation EmotionEvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"情绪评估"];
    [RKAlertView showAlertPlainTextWithTitle:@"录入心情" message:@"请输入今天的心情：" cancelTitle:@"取消" confirmTitle:@"确认" alertViewStyle:UIAlertViewStylePlainTextInput confrimBlock:^(UIAlertView *alertView) {
        NSLog(@"确认了输入：%@",[alertView textFieldAtIndex:0].text);
          } cancelBlock:^{
        NSLog(@"取消了");
    }];
    NSString *cellName = NSStringFromClass([ChartTableViewCell class]);
    [self.chartTableView registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:cellName];

    
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section?1:1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ChartTableViewCell class])];
    [cell configUI:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , 30);
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:30];
    label.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.3];
    label.text = section ? @"柱状图":@"折线图";
    label.textColor = [UIColor colorWithRed:0.257 green:0.650 blue:0.478 alpha:1.000];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  ChartTableViewCell.m
//  BRSF
//
//  Created by mac on 16/3/11.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "ChartTableViewCell.h"
#import "UUChart.h"

@interface ChartTableViewCell ()<UUChartDataSource>
{
    NSIndexPath *path;
    UUChart *chartView;
}
@end

@implementation ChartTableViewCell

- (void)configUI:(NSIndexPath *)indexPath
{
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    
    path = indexPath;
    
    chartView = [[UUChart alloc]initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width-20, 150)
                                   dataSource:self
                                        style:indexPath.section==1?UUChartStyleBar:UUChartStyleLine];
    [chartView showInView:self.contentView];
}

- (NSArray *)getXTitles:(int)num
{
    NSMutableArray *xTitles = [NSMutableArray array];
    for (int i=1; i<(num+1); i++) {
        NSString * str = [NSString stringWithFormat:@"星期%d",i];
        [xTitles addObject:str];
    }
    return xTitles;
}

#pragma mark - @required
//横坐标标题数组
- (NSArray *)chartConfigAxisXLabel:(UUChart *)chart
{
    
    if (path.section==0) {
        switch (path.row) {
            case 0:
                return [self getXTitles:7];
            default:
                break;
        }
    }else{
        switch (path.row) {
            case 0:
                return [self getXTitles:7];
            default:
                break;
        }
    }
    return [self getXTitles:7];
}
//数值多重数组
- (NSArray *)chartConfigAxisYValue:(UUChart *)chart
{
   
    NSArray *ary2 = @[@"7",@"6",@"8",@"9",@"6",@"9",@"4"];
    NSArray *ary3 = @[@"3",@"12",@"25",@"55",@"52",@"54",@"23"];
    NSArray *ary4 = @[@"23",@"42",@"25",@"15",@"30",@"42",@"32",@"40",@"42",@"25",@"33"];
    
    if (path.section==0) {
        switch (path.row) {
            case 0:
                return @[ary2];
            case 1:
                return @[ary2];
            default:
                return @[ary2];
        }
    }else{
        if (path.row) {
            return @[ary2,ary2];
        }else{
            return @[ary2];
        }
    }
}

#pragma mark - @optional
//颜色数组
- (NSArray *)chartConfigColors:(UUChart *)chart
{
    return @[[UUColor green],[UUColor red],[UUColor brown]];
}
//显示数值范围
- (CGRange)chartRange:(UUChart *)chart
{
    if (path.section==0 && (path.row==0 | path.row==1)) {
        return CGRangeMake(10, 0);
    }
    if (path.section==1 && path.row==0) {
        return CGRangeMake(10, 0);
    }
    if (path.row == 2) {
        return CGRangeMake(10, 0);
    }
    return CGRangeZero;
}

#pragma mark 折线图专享功能

//标记数值区域
- (CGRange)chartHighlightRangeInLine:(UUChart *)chart
{
    if (path.row == 2) {
        return CGRangeMake(25, 75);
    }
    return CGRangeZero;
}

//判断显示横线条
- (BOOL)chart:(UUChart *)chart showHorizonLineAtIndex:(NSInteger)index
{
    return YES;
}

//判断显示最大最小值
- (BOOL)chart:(UUChart *)chart showMaxMinAtIndex:(NSInteger)index
{
    return path.row == 2;
}
@end

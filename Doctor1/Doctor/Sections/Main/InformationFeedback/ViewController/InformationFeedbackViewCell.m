//
//  InformationFeedbackViewCell.h
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "InformationFeedbackViewCell.h"

@implementation InformationFeedbackViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self p_setupView];
    }
    return self;
}

- (void)p_setupView
{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) / 0.6, CGRectGetHeight(self.contentView.frame))];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
    
    self.createtimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.createtimeLabel.frame), 0, CGRectGetWidth(self.contentView.frame) / 1.5, CGRectGetHeight(self.contentView.frame))];
    self.createtimeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_createtimeLabel];
    
    
}


@end

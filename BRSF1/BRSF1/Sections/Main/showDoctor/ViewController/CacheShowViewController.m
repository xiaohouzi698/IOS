//
//  CacheShowViewController.m
//  CacheByMac
//
//  Created by 杨 宏强 on 13-2-21.
//  Copyright (c) 2013年 yanghongqiang. All rights reserved.
//

#import "CacheShowViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CacheShowViewController ()
- (void)configureView;
@end

@implementation CacheShowViewController
@synthesize imageURL = _imageURL;
@synthesize imageView = _imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)setImageURL:(NSURL *)imageURL
{
    if (_imageURL != imageURL)
    {
        _imageURL = imageURL;
        [self configureView];
    }
}

- (void)configureView
{
    if (self.imageURL)
    {
        __block UIActivityIndicatorView *activityIndicator;
        [self.imageView setImageWithURL:self.imageURL placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSUInteger receivedSize, long long expectedSize)
         {
             if (!activityIndicator)
             {
                 [self.imageView addSubview:activityIndicator = [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray]];
                 activityIndicator.center = self.imageView.center;
                 [activityIndicator startAnimating];
             }
         }
                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType)
         {
             [activityIndicator removeFromSuperview];
             activityIndicator = nil;
         }];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

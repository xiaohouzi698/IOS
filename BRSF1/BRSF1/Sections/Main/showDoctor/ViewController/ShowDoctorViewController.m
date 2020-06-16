//
//  CViewController.m
//  CacheByMac
//
//  Created by 杨 宏强 on 13-2-21.
//  Copyright (c) 2013年 yanghongqiang. All rights reserved.
//

#import "ShowDoctorViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ShowDoctorViewController (){
    NSMutableArray *_objects;
}


@end

@implementation ShowDoctorViewController
@synthesize table,cacheView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"医师列表";
	// Do any additional setup after loading the view, typically from a nib.
    _objects = [NSArray arrayWithObjects:
                @"zhao",
                @"qian",
                @"sun",
                @"li",
                @"zhou",
                @"wu",
                @"zheng",
                @"wang",
                                nil];
    
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    tableView.rowHeight = 100;
//    tableView.backgroundColor = [UIColor purpleColor];
//    
//    [self.view addSubview:tableView];
    
    
    
}

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    SDWebImageManager.sharedManager.cacheKeyFilter:^(NSURL *url){
//        url = [[NSURL alloc] initWithScheme:url.scheme host:url.host path:url.path];
//        return [url absoluteString];
//    };
//    
//    
//    // Your app init code...
//    return YES;
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    //[cell.imageView setImage:[UIImage imageNamed:@"4.png"]];
    NSString *name = _objects[indexPath.row];
    cell.textLabel.text = name;
    [cell.imageView setImage:[UIImage imageNamed:@"4"]];
    cell.detailTextLabel.text=@"I am Doc!";
                 //  placeholderImage:[UIImage imageNamed:@"placeholder"]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.cacheView)
    {
        self.cacheView = [[CacheShowViewController alloc] initWithNibName:@"CacheShowViewController" bundle:nil];
        
    }
    NSString *largeImageURL = [[_objects objectAtIndex:indexPath.row] stringByReplacingOccurrencesOfString:@"small" withString:@"source"];
    NSLog(@"%@",largeImageURL);
    self.cacheView.imageURL = [NSURL URLWithString:largeImageURL];
    [self.navigationController pushViewController:self.cacheView animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

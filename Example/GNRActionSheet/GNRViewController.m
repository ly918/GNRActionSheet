//
//  GNRViewController.m
//  GNRActionSheet
//
//  Created by ly918@qq.com on 04/03/2018.
//  Copyright (c) 2018 ly918@qq.com. All rights reserved.
//

#import "GNRViewController.h"
#import <GNRActionSheet/GNRActionSheet.h>

@interface GNRViewController ()

@end

@implementation GNRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg"]];
    imageV.frame = self.view.bounds;
    imageV.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageV];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    GNRActionSheet *sheet = [GNRActionSheet actionTitles:@[@"男",@"女"] cancelTitle:@"取消" actionBlock:^(GNRActionSheet *actionSheet, NSInteger index) {
        NSLog(@"index %d",index);
    } cancelBlock:^(GNRActionSheet *actionSheet) {
        NSLog(@"cancel");
    }];
    sheet.config.cancelTitleColor = [UIColor redColor];
    [sheet showInViewController:self];
}

@end


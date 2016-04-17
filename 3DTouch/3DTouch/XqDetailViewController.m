//
//  XqDetailViewController.m
//  3DTouch
//
//  Created by 弓虽_子 on 15/12/26.
//  Copyright © 2015年 弓虽_子. All rights reserved.
//

#import "XqDetailViewController.h"
#import "XqHeroItem.h"

@interface XqDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation XqDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"gaowei";
    self.imageV.image = self.heroItem.icon;
    self.nameLabel.text = self.heroItem.name;
    self.descLabel.text = self.heroItem.desc;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"gaowei" style:0 target:self action:@selector(click)];
}

- (void)click{
    NSLog(@"asdf");
}

// 设置控制器在弹窗时候,下面输出的数组
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    
    UIPreviewAction *action = [UIPreviewAction actionWithTitle:@"标题1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"点击了我");
    }];
    
   return  @[action];
    
}







@end

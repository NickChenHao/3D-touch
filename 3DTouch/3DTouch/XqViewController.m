//
//  XqViewController.m
//  3DTouch
//
//  Created by 弓虽_子 on 15/12/26.
//  Copyright © 2015年 弓虽_子. All rights reserved.
//

#import "XqViewController.h"
#import "XqHeroItem.h"
#import "XqHeroCell.h"
#import "XqDetailViewController.h"


@interface XqViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSArray *dataArray;


@end

@implementation XqViewController

-(NSArray *)dataArray{
    
    if (_dataArray == nil) {
        NSString *path =   [[NSBundle mainBundle] pathForResource:@"hero.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            XqHeroItem *item = [XqHeroItem itemWithDict:dict];
            [tempArray addObject:item];
        }
        _dataArray = tempArray;
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置数据源代理
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView reloadData];
    //获取TableView的高度
    CGFloat tableH = self.tableView.bounds.size.height;
    //获取所有的cell
    NSArray *allCell = [self.tableView visibleCells];
    //将所有的cee隐藏
    for (UITableViewCell *cell in allCell) {
        cell.transform = CGAffineTransformMakeTranslation(0, tableH);
    }
    
    //动画延时执行时长
    CGFloat delayTime = 0.05;
    //遍历所有cell,顺序执行上移的动画
    for(int i = 0; i < allCell.count;i++){
        
        CGFloat delay = i * delayTime;
        UITableViewCell *cell = allCell[i];
        [UIView animateWithDuration:1 delay:delay options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:nil];
        
    }
    
    
    
    
}

#pragma -mark TableView数据源代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return  self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XqHeroCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    //判断是否支持3DTouch
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        //注册Cell支持3DTouch,并设置代理
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    
    //取出当前行模型
    XqHeroItem *item = self.dataArray[indexPath.row];
    cell.heroItem = item;

    return cell;
    
}



#pragma -mark UIViewControllerPreviewingDelegate
//轻按,中按时调用
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    //获取sourceView
    XqHeroCell *cell = (XqHeroCell *)[previewingContext sourceView];
    //设置弹出预览的位置
    [previewingContext setSourceRect:cell.bounds];
    
    //设置弹框的View.
    XqDetailViewController *detailVC = [[XqDetailViewController alloc] init];
    detailVC.preferredContentSize = CGSizeMake(0, 300);
    detailVC.heroItem = cell.heroItem;
    return detailVC;
}

//弹框出现后, 继续重按时调用
//viewControllerToCommit:就是上面传入的XqDetailViewController的控制器.
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{

    
    //[self.navigationController pushViewController:viewControllerToCommit animated:YES];
    [self showViewController:viewControllerToCommit sender:self];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XqDetailViewController *detailVC = [[XqDetailViewController  alloc] init];
    detailVC.heroItem = self.dataArray[indexPath.row];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}







@end

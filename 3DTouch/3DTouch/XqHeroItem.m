//
//  XqHeroItem.m
//  3DTouch
//
//  Created by 弓虽_子 on 15/12/26.
//  Copyright © 2015年 弓虽_子. All rights reserved.
//

#import "XqHeroItem.h"

@implementation XqHeroItem

+ (instancetype)itemWithDict:(NSDictionary *)dict{
    
    XqHeroItem *item = [[XqHeroItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}


-(void)setIcon:(UIImage *)icon{
    
    NSString *iconName = (NSString *)icon;
    _icon = [UIImage imageNamed:iconName];
}



@end

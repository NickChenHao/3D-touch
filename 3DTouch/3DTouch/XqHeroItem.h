//
//  XqHeroItem.h
//  3DTouch
//
//  Created by 弓虽_子 on 15/12/26.
//  Copyright © 2015年 弓虽_子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XqHeroItem : NSObject

//姓名
@property (nonatomic, strong) NSString *name;
//头像
@property (nonatomic, strong) UIImage *icon;
//描述
@property (nonatomic, strong) NSString *desc;

+ (instancetype)itemWithDict:(NSDictionary *)dict;

@end

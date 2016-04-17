//
//  XqHeroCell.m
//  3DTouch
//
//  Created by 弓虽_子 on 15/12/26.
//  Copyright © 2015年 弓虽_子. All rights reserved.
//

#import "XqHeroCell.h"
#import "XqHeroItem.h"

@interface XqHeroCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;


@end

@implementation XqHeroCell

- (void)awakeFromNib {
    // Initialization code
}


-(void)setHeroItem:(XqHeroItem *)heroItem{
    _heroItem = heroItem;
    
    self.imageV.image = heroItem.icon;
    self.nameLabel.text = heroItem.name;
    self.descLabel.text = heroItem.desc;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

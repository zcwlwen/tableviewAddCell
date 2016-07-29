//
//  barrageCell.m
//  tableviewAddCell
//
//  Created by 张朝伟 on 16/7/29.
//  Copyright © 2016年 amailive. All rights reserved.
//

#import "barrageCell.h"

@implementation barrageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //        self.contentView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.cellBackGroundImage];
        [self.contentView addSubview:self.cellAvatorImage];
        [self.contentView addSubview:self.barrageText];
        
    }
    return self;
}
#pragma mark - 懒加载
//背景图片
-(UIImageView *)cellBackGroundImage{
    if (!_cellBackGroundImage) {
        _cellBackGroundImage = [[UIImageView alloc]init];
    }
    return _cellBackGroundImage;
}
//头像
-(UIImageView *)cellAvatorImage{
    if (!_cellAvatorImage) {
        _cellAvatorImage = [[UIImageView alloc]init];
        
    }
    return _cellAvatorImage;
}
//弹幕内容
-(UILabel *)barrageText{
    if (!_barrageText) {
        _barrageText = [[UILabel alloc]init];
        _barrageText.textColor = [UIColor whiteColor];
        _barrageText.font = [UIFont systemFontOfSize:12];
    }
    return _barrageText;
}
#pragma mark - 布局
- (void)layoutSubviews{
    [super layoutSubviews];
    self.cellBackGroundImage.frame  = CGRectMake(0, 0, self.contentView.frame.size.width,40);
    self.cellAvatorImage.frame = CGRectMake(5, 5, 30, 30);
    self.barrageText.frame = CGRectMake(40, 5, self.contentView.frame.size.width-10, 30);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

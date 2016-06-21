//
//  NewTableViewCell.m
//  网络编程
//
//  Created by DC018 on 16/6/7.
//  Copyright © 2016年 DC018. All rights reserved.
//

#import "NewTableViewCell.h"

@implementation NewTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self= [[[NSBundle mainBundle]loadNibNamed:@"NewTableViewCell" owner:self options:nil] lastObject];;
    }
    return self;
}

@end

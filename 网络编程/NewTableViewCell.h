//
//  NewTableViewCell.h
//  网络编程
//
//  Created by DC018 on 16/6/7.
//  Copyright © 2016年 DC018. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *zan;
@property (weak, nonatomic) IBOutlet UILabel *ping;

@property (weak, nonatomic) IBOutlet UILabel *issuestime;
@end

//
//  Textfield.m
//  网络编程
//
//  Created by DC018 on 16/6/12.
//  Copyright © 2016年 DC018. All rights reserved.
//

#import "Textfield.h"
#import "MBProgressHUD.h"
@implementation Textfield


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSLog(@"sadas");
    self.layer.borderWidth=1;
    self.layer.borderColor=[UIColor cyanColor].CGColor;
    self.delegate=self;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"%@",string);
    if ([string isEqualToString:@"s"]) {
        NSLog(@"%@",string);
        MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].windows lastObject] animated:YES];
        hud.label.text=@"大哥看清点";
        //hud.mode=MBProgressHUDModeText;
        return NO;
    }
    return YES;
}
@end

//
//  DrawingColumns.m
//  XFCrystalKitExample
//
//  Created by 付星 on 16/8/20.
//  Copyright © 2016年 yizzuide. All rights reserved.
//

#import "DrawingColumns.h"
#import "XFCrystalKit.h"

@implementation DrawingColumns

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *paths = [UIBezierPath bezierPath];
    // 左列
    UIBezierPath *leftPath = [UIBezierPath bezierPathWithRect:CGRectMake(8, 8, 145, 200)];
    [paths appendPath:leftPath];
    // 右列
    UIBezierPath *rightPath = [UIBezierPath bezierPathWithRect:CGRectMake(160, 8, 145, 200)];
    
    [paths appendPath:rightPath];
    
    MovePathCenterToPoint(paths, RectGetCenter(rect));
    
    [paths stroke:1 color:[UIColor purpleColor]];
    
    
    // 属性文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
                                                   initWithString:@"Thanks(感谢) to the Core Text framework, all drawing takes place in Quartz space. The CGPath you supply must also be defined in Quartz geometry. That’s why I picked a shape for Figure 8-11 that is not vertically symmetrical. You can handles this drawing issue by copying whatever path you supply and mirroring that copy vertically within the context. Without this step, you end up with the results shown in Figure 8-23: The text still draws top to bottom, but the path uses the Quartz coordinate system."];
    // 设置段落格式
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.firstLineHeadIndent = 8.0f;
    paragraphStyle.lineSpacing = 5.0f;
    //paragraphStyle.paragraphSpacing = 24.0f; // Big!
    
    
    [attributedString setAttributes:@{
                                      NSFontAttributeName:[UIFont fontWithName:@"Futura" size:11.0f],
                                      NSForegroundColorAttributeName:[UIColor whiteColor],
                                      NSParagraphStyleAttributeName:paragraphStyle
                                      } range:NSMakeRange(0, attributedString.length)];

    
    [XFCrystal drawAttributedStringInBezierSubpaths:paths attributedString:attributedString];
}
@end

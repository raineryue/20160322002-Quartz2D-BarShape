//
//  BarShapeView.m
//  20160322002-Quartz2D-BarShape
//
//  Created by Rainer on 16/3/22.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "BarShapeView.h"

@implementation BarShapeView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSArray *barArray = [self arcRandomArray];
    
    CGFloat barX = 0;
    CGFloat barY = 0;
    CGFloat barW = rect.size.width / (barArray.count * 2 - 1);
    CGFloat barH = 0;
    
    for (int i = 0; i < barArray.count; i++) {
        barX = barW * i * 2;
        barH = [barArray[i] doubleValue] / 100 * rect.size.height;
        barY = rect.size.height - barH;
        
        CGRect barFrame = CGRectMake(barX, barY, barW, barH);
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:barFrame];
        
        [[self arcRandomColor] set];
        
        [bezierPath fill];
    }
}

- (UIColor *)arcRandomColor {
    CGFloat colorR = arc4random_uniform(256) / 255.0;
    CGFloat colorG = arc4random_uniform(256) / 255.0;
    CGFloat colorB = arc4random_uniform(256) / 255.0;
    
    UIColor *arcRandomColor = [UIColor colorWithRed:colorR green:colorG blue:colorB alpha:1];
    
    return arcRandomColor;
}

- (NSArray *)arcRandomArray {
    NSMutableArray *arcRandomArray = [NSMutableArray array];
    
    int count = 100;
    
    CGFloat temp = 0;
    
    for (int i = 0; i < 3; i++) {
        temp = arc4random_uniform(count) + 1;
        
        [arcRandomArray addObject:@(temp)];
        
        if (temp == count) break;
        
        count -= temp;
    }
    
    return arcRandomArray;
}

@end

//
//  LBOCTools.h
//  LBArk
//
//  Created by 李斌 on 2018/8/10.
//  Copyright © 2018年 com.njyl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LBOCTools : NSObject

- (NSString *)phoneStringDealReplace:(NSString *)str;

- (UIViewController *)lbCurrentPresentingVC;

+ (NSString * )lbGetCurrentTimes;

- (NSMutableDictionary *)getURLParameters:(NSString *)lbstr;

- (UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
@end

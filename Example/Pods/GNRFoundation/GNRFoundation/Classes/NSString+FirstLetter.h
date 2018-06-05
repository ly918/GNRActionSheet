//
//  NSString+FirstLetter.h
//  TKBaseModule
//
//  Created by Luca on 2018/3/5.
//  Copyright © 2018年 TicTalk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FirstLetter)
//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
//汉子/英文 其他特殊字符原样返回
- (NSString *)firstLetter;
- (BOOL)isCapitalizedString;//大写
- (BOOL)isLowercaseString;//小写
- (BOOL)isRemoteUrl;
@end

@interface NSString (Attributed)
/**
 *  单纯改变一句话中的某些字的颜色
 *
 *  @param color    需要改变成的颜色
 *  @param totalStr 总的字符串
 *  @param subArray 需要改变颜色的文字数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)t_changeCorlorWithColor:(UIColor *)color TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray ;

/**
 *  单纯改变句子的字间距（需要 <CoreText/CoreText.h>）
 *
 *  @param totalString 需要更改的字符串
 *  @param space       字间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)t_changeSpaceWithTotalString:(NSString *)totalString Space:(CGFloat)space ;

/**
 *  单纯改变段落的行间距
 *
 *  @param totalString 需要更改的字符串
 *  @param lineSpace   行间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)t_changeLineSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace;

/**
 *  同时更改行间距和字间距
 *
 *  @param totalString 需要改变的字符串
 *  @param lineSpace   行间距
 *  @param textSpace   字间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)t_changeLineAndTextSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace ;
/**
 *  改变某些文字的颜色 并单独设置其字体
 *
 *  @param font        设置的字体
 *  @param color       颜色
 *  @param totalString 总的字符串
 *  @param subArray    想要变色的字符数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)t_changeFontAndColor:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray;

@end

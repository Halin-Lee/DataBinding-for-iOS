//
//  DataBinding.h
//  TestApp
//
//  Created by Halin on 11/10/15.
//  Copyright (c) 2015 me.halin. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Singleton.h"
//TODO:1.双向绑定   2.表达式

@protocol IdentifierModel <NSObject>
@required
- (NSString *)identifier;

@end


@interface DataBindingUtil : NSObject
//SINGLETON_FOR_HEADER(DataBindingUtil)
+ (DataBindingUtil *)dataBindingUtil;


/**将model绑定到指定的view*/
- (void)addBindingField:(NSString *)field bindingMethod:(NSString *)method forView:(UIView *)view ;

/**为view绑定指定的binding类型*/
- (void)addModelType:(NSString *)modelType forView:(UIView *)view;

/**为view绑定identifier*/
- (void)addModelIdentifier:(NSString *)identifier forView:(UIView *)view;

/**添加bind的view*/
- (void)bindModel:(id)model forView:(UIView *)view;

/**从view中获得绑定的model*/
- (id)getModel:(UIView *)view;

/**移除绑定*/
- (void)unbindModel:(id)model;

@end
